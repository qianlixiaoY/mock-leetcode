package com.mockleetcode.judge.harness;

import com.mockleetcode.common.dto.ProblemMeta;

import java.util.List;
import java.util.Set;

public final class ParamBindingSupport {

    private static final Set<String> SETUP_ONLY_PARAMS = Set.of("pos", "skipa", "skipb", "intersectval");

    private ParamBindingSupport() {
    }

    public static List<ProblemMeta.ParamDef> effectiveParams(ProblemMeta meta) {
        if (meta.params() == null) {
            return List.of();
        }
        return switch (meta.functionName()) {
            case "hasCycle", "detectCycle" -> meta.params().stream()
                    .filter(param -> !isSetupOnly(param.name()))
                    .toList();
            case "getIntersectionNode" -> List.of(
                    new ProblemMeta.ParamDef("headA", "ListNode"),
                    new ProblemMeta.ParamDef("headB", "ListNode")
            );
            default -> meta.params().stream()
                    .filter(param -> !isSetupOnly(param.name()))
                    .filter(param -> !isIntersectionSetup(param.name(), meta.functionName()))
                    .toList();
        };
    }

    public static String javaParseExpression(ProblemMeta meta, ProblemMeta.ParamDef param, int paramCount) {
        return switch (meta.functionName()) {
            case "hasCycle", "detectCycle" -> "JsonRuntime.asListNodeWithCycle(input, \"head\", \"pos\")";
            case "getIntersectionNode" -> switch (param.name()) {
                case "headA" -> "JsonRuntime.buildIntersectionHeadA(input)";
                case "headB" -> "JsonRuntime.buildIntersectionHeadB(input)";
                default -> throw new UnsupportedMetaException("Unexpected param: " + param.name());
            };
            case "copyRandomList" -> "JsonRuntime.asRandomListNode(input, \"" + param.name() + "\", " + paramCount + ")";
            case "lowestCommonAncestor" -> switch (param.type()) {
                case "TreeNode" -> "JsonRuntime.asTreeNode(input, \"" + param.name() + "\", " + paramCount + ")";
                case "integer" -> "JsonRuntime.findTreeNodeByVal(root, JsonRuntime.asInt(input, \""
                        + param.name() + "\", " + paramCount + "))";
                default -> TypeSupport.javaParseExpression(param.name(), param.type(), paramCount);
            };
            default -> switch (param.type()) {
                case "ListNode" -> usesRandomListFormat(meta)
                        ? "JsonRuntime.asRandomListNode(input, \"" + param.name() + "\", " + paramCount + ")"
                        : "JsonRuntime.asListNode(input, \"" + param.name() + "\", " + paramCount + ")";
                case "TreeNode" -> "JsonRuntime.asTreeNode(input, \"" + param.name() + "\", " + paramCount + ")";
                default -> TypeSupport.javaParseExpression(param.name(), param.type(), paramCount);
            };
        };
    }

    public static String jsParseExpression(ProblemMeta meta, ProblemMeta.ParamDef param, int paramCount) {
        return switch (meta.functionName()) {
            case "hasCycle", "detectCycle" -> "Runtime.asListNodeWithCycle(input, 'head', 'pos')";
            case "getIntersectionNode" -> switch (param.name()) {
                case "headA" -> "Runtime.buildIntersectionHeadA(input)";
                case "headB" -> "Runtime.buildIntersectionHeadB(input)";
                default -> throw new UnsupportedMetaException("Unexpected param: " + param.name());
            };
            case "copyRandomList" -> "Runtime.asRandomListNode(input, '" + param.name() + "', " + paramCount + ")";
            case "lowestCommonAncestor" -> switch (param.type()) {
                case "TreeNode" -> "Runtime.asTreeNode(input, '" + param.name() + "', " + paramCount + ")";
                case "integer" -> "Runtime.findTreeNodeByVal(root, Runtime.asInt(input, '"
                        + param.name() + "', " + paramCount + "))";
                default -> TypeSupport.jsParamExpression(param.name(), paramCount);
            };
            default -> switch (param.type()) {
                case "ListNode" -> usesRandomListFormat(meta)
                        ? "Runtime.asRandomListNode(input, '" + param.name() + "', " + paramCount + ")"
                        : "Runtime.asListNode(input, '" + param.name() + "', " + paramCount + ")";
                case "TreeNode" -> "Runtime.asTreeNode(input, '" + param.name() + "', " + paramCount + ")";
                default -> TypeSupport.jsParamExpression(param.name(), paramCount);
            };
        };
    }

    public static boolean needsListNodeClass(ProblemMeta meta) {
        return usesType(meta, "ListNode") && !usesRandomListFormat(meta);
    }

    public static boolean needsTreeNodeClass(ProblemMeta meta) {
        return usesType(meta, "TreeNode");
    }

    public static boolean needsRandomNodeClass(ProblemMeta meta) {
        return usesRandomListFormat(meta);
    }

    public static boolean needsNodeRuntime(ProblemMeta meta) {
        return needsListNodeClass(meta) || needsTreeNodeClass(meta) || needsRandomNodeClass(meta)
                || "lowestCommonAncestor".equals(meta.functionName())
                || "getIntersectionNode".equals(meta.functionName())
                || "hasCycle".equals(meta.functionName())
                || "detectCycle".equals(meta.functionName());
    }

    private static boolean usesRandomListFormat(ProblemMeta meta) {
        return "copyRandomList".equals(meta.functionName());
    }

    private static boolean usesType(ProblemMeta meta, String type) {
        if (meta.params() != null) {
            for (ProblemMeta.ParamDef param : meta.params()) {
                if (type.equals(param.type())) {
                    return true;
                }
            }
        }
        return meta.returnType() != null && type.equals(meta.returnType().type());
    }

    private static boolean isSetupOnly(String name) {
        return SETUP_ONLY_PARAMS.contains(name.toLowerCase());
    }

    private static boolean isIntersectionSetup(String name, String functionName) {
        return "getIntersectionNode".equals(functionName)
                && Set.of("intersectVal", "listA", "listB", "skipA", "skipB").contains(name);
    }
}
