package com.mockleetcode.judge.harness;

import com.mockleetcode.common.dto.GeneratedHarness;
import com.mockleetcode.common.dto.ProblemMeta;
import com.mockleetcode.common.enums.Language;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        String functionName = meta.functionName();
        String prelude = buildJavaPrelude(meta);
        String args = buildJavaArgs(meta);
        String returnExpr = ReturnBindingSupport.javaReturnExpression(meta);

        String mainSource = """
                public class Main {
                    public static void main(String[] args) throws Exception {
                        com.google.gson.JsonObject input = JsonRuntime.readInput();
                        Solution solution = new Solution();
                        %sObject result = solution.%s(%s);
                        System.out.println(%s);
                    }
                }
                """.formatted(prelude, functionName, args, returnExpr);

        Map<String, String> extraFiles = buildJavaExtraFiles(meta);
        return GeneratedHarness.withExtras(
                mainSource,
                JsonRuntimeTemplate.source(),
                JsonRuntimeTemplate.CLASSPATH_ENTRY,
                "",
                extraFiles
        );
    }

    private GeneratedHarness generateJavaScript(ProblemMeta meta) {
        return buildNodeHarness(meta, buildJsExportSuffix(meta.functionName()));
    }

    private GeneratedHarness generateTypeScript(ProblemMeta meta) {
        return buildNodeHarness(meta, buildTsExportSuffix(meta.functionName()));
    }

    private GeneratedHarness buildNodeHarness(ProblemMeta meta, String exportSuffix) {
        String functionName = meta.functionName();
        String prelude = buildJsPrelude(meta);
        String args = buildJsArgs(meta);
        String returnExpr = ReturnBindingSupport.jsReturnExpression(meta);

        Map<String, String> extraFiles = new HashMap<>();
        if (ParamBindingSupport.needsNodeRuntime(meta)) {
            extraFiles.put("runtime.js", NodeRuntimeTemplate.source());
        }

        String runtimeRequire = ParamBindingSupport.needsNodeRuntime(meta)
                ? "const Runtime = require('./runtime');\n"
                : "";

        String mainSource = runtimeRequire + """
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
                %sconst result = solution.%s(%s);
                console.log(%s);
                """.formatted(prelude, functionName, args, returnExpr);

        return GeneratedHarness.withExtras(mainSource, "", "", exportSuffix, extraFiles);
    }

    private Map<String, String> buildJavaExtraFiles(ProblemMeta meta) {
        Map<String, String> extraFiles = new HashMap<>();
        if (ParamBindingSupport.needsListNodeClass(meta)) {
            extraFiles.put("ListNode.java", NodeTemplates.LIST_NODE);
        }
        if (ParamBindingSupport.needsTreeNodeClass(meta)) {
            extraFiles.put("TreeNode.java", NodeTemplates.TREE_NODE);
        }
        if (ParamBindingSupport.needsRandomNodeClass(meta)) {
            extraFiles.put("Node.java", NodeTemplates.RANDOM_NODE);
        }
        return extraFiles;
    }

    private String buildJavaPrelude(ProblemMeta meta) {
        if ("lowestCommonAncestor".equals(meta.functionName())) {
            return """
                    TreeNode root = JsonRuntime.asTreeNode(input, "root", 3);
                    TreeNode p = JsonRuntime.findTreeNodeByVal(root, JsonRuntime.asInt(input, "p", 3));
                    TreeNode q = JsonRuntime.findTreeNodeByVal(root, JsonRuntime.asInt(input, "q", 3));
                    """;
        }
        return "";
    }

    private String buildJsPrelude(ProblemMeta meta) {
        if ("lowestCommonAncestor".equals(meta.functionName())) {
            return """
                    const root = Runtime.asTreeNode(input, 'root', 3);
                    const p = Runtime.findTreeNodeByVal(root, getParam(input, 'p', 3));
                    const q = Runtime.findTreeNodeByVal(root, getParam(input, 'q', 3));
                    """;
        }
        return "";
    }

    private String buildJavaArgs(ProblemMeta meta) {
        if ("lowestCommonAncestor".equals(meta.functionName())) {
            return "root, p, q";
        }
        return effectiveParamExpressions(meta, ParamBindingSupport::javaParseExpression);
    }

    private String buildJsArgs(ProblemMeta meta) {
        if ("lowestCommonAncestor".equals(meta.functionName())) {
            return "root, p, q";
        }
        return effectiveParamExpressions(meta, ParamBindingSupport::jsParseExpression);
    }

    private String effectiveParamExpressions(
            ProblemMeta meta,
            ParamExpressionBuilder builder
    ) {
        List<ProblemMeta.ParamDef> params = ParamBindingSupport.effectiveParams(meta);
        int paramCount = meta.params() == null ? 0 : meta.params().size();
        return params.stream()
                .map(param -> builder.build(meta, param, paramCount))
                .collect(Collectors.joining(", "));
    }

    private String buildJsExportSuffix(String functionName) {
        return "\n\nmodule.exports = { " + functionName + " };\n";
    }

    private String buildTsExportSuffix(String functionName) {
        return "\n\nexport { " + functionName + " };\n";
    }

    @FunctionalInterface
    private interface ParamExpressionBuilder {
        String build(ProblemMeta meta, ProblemMeta.ParamDef param, int paramCount);
    }
}
