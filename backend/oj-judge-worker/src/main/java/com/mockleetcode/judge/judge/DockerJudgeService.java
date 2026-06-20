package com.mockleetcode.judge.judge;

import com.mockleetcode.common.dto.JudgeRequest;
import com.mockleetcode.common.dto.JudgeResult;
import com.mockleetcode.common.dto.TestCaseDto;
import com.mockleetcode.common.enums.JudgeStatus;
import com.mockleetcode.common.enums.Language;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

@Service
public class DockerJudgeService {

    private static final Set<Language> SUPPORTED_LANGUAGES = EnumSet.of(Language.JAVA, Language.TYPESCRIPT);

    private static final String JAVA_MAIN_TEMPLATE = """
            import java.util.*;
            public class Main {
                public static void main(String[] args) throws Exception {
                    String input = new String(System.in.readAllBytes()).trim();
                    int[] prices = parseIntArray(input);
                    Solution solution = new Solution();
                    System.out.println(solution.maxProfit(prices));
                }

                private static int[] parseIntArray(String json) {
                    json = json.trim();
                    if (json.startsWith("[")) {
                        json = json.substring(1, json.length() - 1).trim();
                    }
                    if (json.isEmpty()) {
                        return new int[0];
                    }
                    String[] parts = json.split(",");
                    int[] result = new int[parts.length];
                    for (int i = 0; i < parts.length; i++) {
                        result[i] = Integer.parseInt(parts[i].trim());
                    }
                    return result;
                }
            }
            """;

    private static final String TYPESCRIPT_MAIN_TEMPLATE = """
            import * as fs from 'fs';
            import { maxProfit } from './solution';

            const input = fs.readFileSync(0, 'utf-8').trim();
            const prices: number[] = JSON.parse(input);
            console.log(maxProfit(prices));
            """;

    private static final String TYPESCRIPT_TSCONFIG = """
            {
              "compilerOptions": {
                "target": "ES2020",
                "module": "CommonJS",
                "strict": false,
                "esModuleInterop": true,
                "skipLibCheck": true
              }
            }
            """;

    @Value("${oj.docker.java-image}")
    private String javaImage;

    @Value("${oj.docker.typescript-image}")
    private String typescriptImage;

    @Value("${oj.docker.enabled:true}")
    private boolean dockerEnabled;

    public JudgeResult judge(JudgeRequest request) {
        if (!SUPPORTED_LANGUAGES.contains(request.language())) {
            return errorResult(request.submissionId(), JudgeStatus.SYSTEM_ERROR,
                    "Only Java and TypeScript are supported in this demo");
        }

        List<TestCaseDto> testCases = request.testCases();
        if (testCases.isEmpty()) {
            return errorResult(request.submissionId(), JudgeStatus.SYSTEM_ERROR, "No test cases");
        }

        Function<ExecutionContext, ExecutionResult> executor = switch (request.language()) {
            case JAVA -> this::executeJava;
            case TYPESCRIPT -> this::executeTypeScript;
            default -> ctx -> ExecutionResult.of(
                    JudgeStatus.SYSTEM_ERROR, "", "", "Unsupported language");
        };

        long start = System.currentTimeMillis();
        int passed = 0;
        String lastStdout = "";
        String lastStderr = "";

        for (TestCaseDto testCase : testCases) {
            ExecutionResult execution = executor.apply(
                    new ExecutionContext(request.code(), testCase.input(), request.timeLimitMs(), request.memoryLimitMb())
            );

            lastStdout = execution.stdout();
            lastStderr = execution.stderr();

            if (execution.status() != JudgeStatus.ACCEPTED) {
                return buildResult(
                        request.submissionId(),
                        execution.status(),
                        (int) (System.currentTimeMillis() - start),
                        passed,
                        testCases.size(),
                        execution.errorMessage(),
                        lastStdout,
                        lastStderr
                );
            }

            String actual = execution.stdout().trim();
            String expected = testCase.expectedOutput();
            if (expected != null && !expected.isBlank() && !actual.equals(expected.trim())) {
                return buildResult(
                        request.submissionId(),
                        JudgeStatus.WRONG_ANSWER,
                        (int) (System.currentTimeMillis() - start),
                        passed,
                        testCases.size(),
                        "Expected " + expected + " but got " + actual,
                        actual,
                        lastStderr
                );
            }

            passed++;
        }

        return buildResult(
                request.submissionId(),
                JudgeStatus.ACCEPTED,
                (int) (System.currentTimeMillis() - start),
                passed,
                testCases.size(),
                null,
                lastStdout,
                lastStderr
        );
    }

    private ExecutionResult executeJava(ExecutionContext ctx) {
        Path workspace = null;
        try {
            workspace = Files.createTempDirectory("oj-judge-");
            Files.writeString(workspace.resolve("Solution.java"), normalizeJavaCode(ctx.userCode()), StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("Main.java"), JAVA_MAIN_TEMPLATE, StandardCharsets.UTF_8);

            String shell = "cd /workspace && javac Main.java Solution.java 2>&1 && echo '" + escapeShell(ctx.input())
                    + "' | java -Xmx" + ctx.memoryLimitMb() + "m Main";

            return runProcess(workspace, ctx.timeLimitMs(), ctx.memoryLimitMb(), javaImage, shell, this::classifyJavaError);
        } catch (IOException ex) {
            return ExecutionResult.of(JudgeStatus.SYSTEM_ERROR, "", "", ex.getMessage());
        } finally {
            deleteDirectory(workspace);
        }
    }

    private ExecutionResult executeTypeScript(ExecutionContext ctx) {
        Path workspace = null;
        try {
            workspace = Files.createTempDirectory("oj-judge-");
            Files.writeString(workspace.resolve("solution.ts"), normalizeTypeScriptCode(ctx.userCode()), StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("main.ts"), TYPESCRIPT_MAIN_TEMPLATE, StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("tsconfig.json"), TYPESCRIPT_TSCONFIG, StandardCharsets.UTF_8);

            String shell = "cd /workspace && echo '" + escapeShell(ctx.input())
                    + "' | NODE_OPTIONS=--max-old-space-size=" + ctx.memoryLimitMb()
                    + " ts-node --transpile-only main.ts 2>&1";

            return runProcess(workspace, ctx.timeLimitMs(), ctx.memoryLimitMb(), typescriptImage, shell, this::classifyTypeScriptError);
        } catch (IOException ex) {
            return ExecutionResult.of(JudgeStatus.SYSTEM_ERROR, "", "", ex.getMessage());
        } finally {
            deleteDirectory(workspace);
        }
    }

    private ExecutionResult runProcess(Path workspace,
                                       int timeLimitMs,
                                       int memoryLimitMb,
                                       String dockerImage,
                                       String shell,
                                       Function<String, JudgeStatus> errorClassifier) {
        try {
            List<String> command = buildDockerCommand(workspace, memoryLimitMb, dockerImage, shell);
            ProcessBuilder builder = new ProcessBuilder(command);
            builder.redirectErrorStream(false);

            Process process = builder.start();
            boolean finished = process.waitFor(timeLimitMs + 5000L, TimeUnit.MILLISECONDS);
            if (!finished) {
                process.destroyForcibly();
                return ExecutionResult.of(JudgeStatus.TIME_LIMIT_EXCEEDED, "", "", "Time limit exceeded");
            }

            String stdout = new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            String stderr = new String(process.getErrorStream().readAllBytes(), StandardCharsets.UTF_8);
            int exitCode = process.exitValue();

            if (exitCode != 0) {
                String combined = (stdout + "\n" + stderr).trim();
                JudgeStatus status = errorClassifier.apply(combined);
                return ExecutionResult.of(status, stdout, stderr, combined.isBlank() ? "Runtime error" : combined);
            }

            return ExecutionResult.of(JudgeStatus.ACCEPTED, stdout, stderr, null);
        } catch (IOException | InterruptedException ex) {
            Thread.currentThread().interrupt();
            return ExecutionResult.of(JudgeStatus.SYSTEM_ERROR, "", "", ex.getMessage());
        }
    }

    private JudgeStatus classifyJavaError(String output) {
        if (output.contains("error:") || output.contains("cannot find symbol")) {
            return JudgeStatus.COMPILE_ERROR;
        }
        return JudgeStatus.RUNTIME_ERROR;
    }

    private JudgeStatus classifyTypeScriptError(String output) {
        if (output.contains("error TS") || output.contains("TSError") || output.contains("SyntaxError")) {
            return JudgeStatus.COMPILE_ERROR;
        }
        return JudgeStatus.RUNTIME_ERROR;
    }

    private List<String> buildDockerCommand(Path workspace, int memoryLimitMb, String dockerImage, String shell) {
        String mountPath = workspace.toAbsolutePath().toString();

        List<String> command = new ArrayList<>();
        if (dockerEnabled) {
            command.add("docker");
            command.add("run");
            command.add("--rm");
            command.add("--network");
            command.add("none");
            command.add("--memory=" + memoryLimitMb + "m");
            command.add("--cpus=1");
            command.add("--pids-limit=64");
            command.add("-v");
            command.add(mountPath + ":/workspace");
            command.add("-w");
            command.add("/workspace");
            command.add(dockerImage);
            command.add("bash");
            command.add("-lc");
            command.add(shell);
        } else {
            command.add("bash");
            command.add("-lc");
            command.add("cd '" + mountPath.replace("'", "'\\''") + "' && " + shell);
        }
        return command;
    }

    private String normalizeJavaCode(String code) {
        String trimmed = code.trim();
        if (!trimmed.contains("class Solution")) {
            return "class Solution {\n" + trimmed + "\n}";
        }
        return trimmed;
    }

    private String normalizeTypeScriptCode(String code) {
        String trimmed = code.trim();
        if (!trimmed.contains("export")) {
            return trimmed + "\n\nexport { maxProfit };\n";
        }
        return trimmed;
    }

    private String escapeShell(String input) {
        return input.replace("'", "'\\''");
    }

    private void deleteDirectory(Path path) {
        if (path == null) {
            return;
        }
        try (var walk = Files.walk(path)) {
            walk.sorted((a, b) -> b.compareTo(a)).forEach(p -> {
                try {
                    Files.deleteIfExists(p);
                } catch (IOException ignored) {
                }
            });
        } catch (IOException ignored) {
        }
    }

    private JudgeResult errorResult(Long submissionId, JudgeStatus status, String message) {
        return buildResult(submissionId, status, 0, 0, 0, message, "", "");
    }

    private JudgeResult buildResult(Long submissionId,
                                    JudgeStatus status,
                                    int runtimeMs,
                                    int passed,
                                    int total,
                                    String errorMessage,
                                    String stdout,
                                    String stderr) {
        return new JudgeResult(
                submissionId,
                status,
                runtimeMs,
                0,
                passed,
                total,
                errorMessage,
                stdout,
                stderr
        );
    }

    private record ExecutionContext(String userCode, String input, int timeLimitMs, int memoryLimitMb) {
    }

    private record ExecutionResult(JudgeStatus status, String stdout, String stderr, String errorMessage) {
        static ExecutionResult of(JudgeStatus status, String stdout, String stderr, String errorMessage) {
            return new ExecutionResult(status, stdout, stderr, errorMessage);
        }
    }
}
