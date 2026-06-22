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

    private static final Set<Language> SUPPORTED_LANGUAGES =
            EnumSet.of(Language.JAVA, Language.JAVASCRIPT, Language.TYPESCRIPT);
    /** Extra wall-clock budget for TypeScript compile + container startup (ms). */
    private static final long TYPESCRIPT_STARTUP_BUDGET_MS = 30_000L;
    /** Extra wall-clock budget for Node.js container startup (ms). */
    private static final long NODE_STARTUP_BUDGET_MS = 10_000L;

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

    /** Plain JS harness shared by JavaScript and TypeScript (reads input.txt, calls maxProfit). */
    private static final String NODE_MAIN_JS = """
            const fs = require('fs');
            const { maxProfit } = require('./solution');

            const input = fs.readFileSync('input.txt', 'utf-8').trim();
            const prices = JSON.parse(input);
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
              },
              "include": ["solution.ts"]
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
                    "Only Java, JavaScript and TypeScript are supported in this demo");
        }

        List<TestCaseDto> testCases = request.testCases();
        if (testCases.isEmpty()) {
            return errorResult(request.submissionId(), JudgeStatus.SYSTEM_ERROR, "No test cases");
        }

        Function<ExecutionContext, ExecutionResult> executor = switch (request.language()) {
            case JAVA -> this::executeJava;
            case JAVASCRIPT -> this::executeJavaScript;
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

            long wallClockMs = ctx.timeLimitMs() + 5_000L;
            return runProcess(workspace, wallClockMs, ctx.memoryLimitMb(), javaImage, shell, this::classifyJavaError);
        } catch (IOException ex) {
            return ExecutionResult.of(JudgeStatus.SYSTEM_ERROR, "", "", ex.getMessage());
        } finally {
            deleteDirectory(workspace);
        }
    }

    private ExecutionResult executeJavaScript(ExecutionContext ctx) {
        Path workspace = null;
        try {
            workspace = Files.createTempDirectory("oj-judge-");
            Files.writeString(workspace.resolve("solution.js"), normalizeJavaScriptCode(ctx.userCode()), StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("main.js"), NODE_MAIN_JS, StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("input.txt"), ctx.input(), StandardCharsets.UTF_8);

            String shell = "cd /workspace && NODE_OPTIONS=--max-old-space-size="
                    + ctx.memoryLimitMb() + " node --check solution.js 2>&1 && node main.js";

            long wallClockMs = ctx.timeLimitMs() + NODE_STARTUP_BUDGET_MS + 5_000L;
            return runProcess(workspace, wallClockMs, ctx.memoryLimitMb(), typescriptImage, shell, this::classifyNodeError);
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
            Files.writeString(workspace.resolve("main.js"), NODE_MAIN_JS, StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("tsconfig.json"), TYPESCRIPT_TSCONFIG, StandardCharsets.UTF_8);
            Files.writeString(workspace.resolve("input.txt"), ctx.input(), StandardCharsets.UTF_8);

            String shell = "cd /workspace && tsc 2>&1 && NODE_OPTIONS=--max-old-space-size="
                    + ctx.memoryLimitMb() + " node main.js";

            long wallClockMs = ctx.timeLimitMs() + TYPESCRIPT_STARTUP_BUDGET_MS + 5_000L;
            return runProcess(workspace, wallClockMs, ctx.memoryLimitMb(), typescriptImage, shell, this::classifyNodeError);
        } catch (IOException ex) {
            return ExecutionResult.of(JudgeStatus.SYSTEM_ERROR, "", "", ex.getMessage());
        } finally {
            deleteDirectory(workspace);
        }
    }

    private ExecutionResult runProcess(Path workspace,
                                       long wallClockMs,
                                       int memoryLimitMb,
                                       String dockerImage,
                                       String shell,
                                       Function<String, JudgeStatus> errorClassifier) {
        try {
            List<String> command = buildDockerCommand(workspace, memoryLimitMb, dockerImage, shell);
            ProcessBuilder builder = new ProcessBuilder(command);
            builder.redirectErrorStream(false);

            Process process = builder.start();
            boolean finished = process.waitFor(wallClockMs, TimeUnit.MILLISECONDS);
            if (!finished) {
                process.destroyForcibly();
                return ExecutionResult.of(JudgeStatus.TIME_LIMIT_EXCEEDED, "", "",
                        "Time limit exceeded (wall clock " + wallClockMs + "ms)");
            }

            String stdout = new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            String stderr = new String(process.getErrorStream().readAllBytes(), StandardCharsets.UTF_8);
            int exitCode = process.exitValue();

            if (exitCode != 0) {
                String combined = (stdout + "\n" + stderr).trim();
                JudgeStatus status = classifyInfrastructureError(combined, dockerImage);
                if (status == null) {
                    status = errorClassifier.apply(combined);
                }
                return ExecutionResult.of(status, stdout, stderr, combined.isBlank() ? "Runtime error" : combined);
            }

            return ExecutionResult.of(JudgeStatus.ACCEPTED, stdout, stderr, null);
        } catch (IOException | InterruptedException ex) {
            Thread.currentThread().interrupt();
            return ExecutionResult.of(JudgeStatus.SYSTEM_ERROR, "", "", ex.getMessage());
        }
    }

    private JudgeStatus classifyInfrastructureError(String output, String dockerImage) {
        if (output.contains("Unable to find image") || output.contains("pull access denied")
                || output.contains("Error response from daemon")) {
            return JudgeStatus.SYSTEM_ERROR;
        }
        return null;
    }

    private JudgeStatus classifyJavaError(String output) {
        if (output.contains("error:") || output.contains("cannot find symbol")) {
            return JudgeStatus.COMPILE_ERROR;
        }
        return JudgeStatus.RUNTIME_ERROR;
    }

    private JudgeStatus classifyNodeError(String output) {
        if (output.contains("error TS") || output.contains("TSError")
                || output.contains("SyntaxError") || output.contains("Syntax Error")) {
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
            command.add("--pull=never");
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

    private String normalizeJavaScriptCode(String code) {
        String trimmed = code.trim();
        if (!trimmed.contains("module.exports") && !trimmed.contains("exports.")) {
            return trimmed + "\n\nmodule.exports = { maxProfit };\n";
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
