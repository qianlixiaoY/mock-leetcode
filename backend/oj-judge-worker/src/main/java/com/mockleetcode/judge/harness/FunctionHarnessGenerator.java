package com.mockleetcode.judge.harness;

import com.mockleetcode.common.dto.GeneratedHarness;
import com.mockleetcode.common.dto.ProblemMeta;
import com.mockleetcode.common.enums.Language;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class FunctionHarnessGenerator {

    public GeneratedHarness generate(Language language, ProblemMeta meta) {
        TypeSupport.ensureSupported(meta);

        return switch (language) {
            case JAVA -> generateJava(meta);
            case JAVASCRIPT -> generateJavaScript(meta);
            case TYPESCRIPT -> generateTypeScript(meta);
            default -> throw new UnsupportedMetaException("Unsupported language: " + language);
        };
    }

    private GeneratedHarness generateJava(ProblemMeta meta) {
        int paramCount = meta.params() == null ? 0 : meta.params().size();
        String functionName = meta.functionName();
        String args = meta.params() == null ? "" : meta.params().stream()
                .map(param -> TypeSupport.javaParseExpression(param.name(), param.type(), paramCount))
                .collect(Collectors.joining(", "));

        String mainSource = """
                public class Main {
                    public static void main(String[] args) throws Exception {
                        com.google.gson.JsonObject input = JsonRuntime.readInput();
                        Solution solution = new Solution();
                        Object result = solution.%s(%s);
                        System.out.println(JsonRuntime.toJson(result));
                    }
                }
                """.formatted(functionName, args);

        return GeneratedHarness.of(
                mainSource,
                JsonRuntimeTemplate.source(),
                JsonRuntimeTemplate.CLASSPATH_ENTRY
        );
    }

    private GeneratedHarness generateJavaScript(ProblemMeta meta) {
        return GeneratedHarness.withSuffix(
                buildNodeMain(meta),
                "",
                "",
                buildJsExportSuffix(meta.functionName())
        );
    }

    private GeneratedHarness generateTypeScript(ProblemMeta meta) {
        return GeneratedHarness.withSuffix(
                buildNodeMain(meta),
                "",
                "",
                buildTsExportSuffix(meta.functionName())
        );
    }

    private String buildNodeMain(ProblemMeta meta) {
        int paramCount = meta.params() == null ? 0 : meta.params().size();
        String functionName = meta.functionName();
        String args = meta.params() == null ? "" : meta.params().stream()
                .map(param -> TypeSupport.jsParamExpression(param.name(), paramCount))
                .collect(Collectors.joining(", "));

        return """
                const fs = require('fs');
                const solution = require('./solution');

                function getParam(input, name, totalParams) {
                    if (Object.prototype.hasOwnProperty.call(input, name)) {
                        return input[name];
                    }
                    if (totalParams === 1 && Object.prototype.hasOwnProperty.call(input, 'input')) {
                        return input.input;
                    }
                    throw new Error('Missing param: ' + name);
                }

                const input = JSON.parse(fs.readFileSync('input.json', 'utf-8'));
                const result = solution.%s(%s);
                console.log(JSON.stringify(result));
                """.formatted(functionName, args);
    }

    private String buildJsExportSuffix(String functionName) {
        return "\n\nmodule.exports = { " + functionName + " };\n";
    }

    private String buildTsExportSuffix(String functionName) {
        return "\n\nexport { " + functionName + " };\n";
    }
}
