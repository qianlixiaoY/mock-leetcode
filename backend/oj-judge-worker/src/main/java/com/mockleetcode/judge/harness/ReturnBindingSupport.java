package com.mockleetcode.judge.harness;

import com.mockleetcode.common.dto.ProblemMeta;

public final class ReturnBindingSupport {

    private ReturnBindingSupport() {
    }

    public static String javaReturnExpression(ProblemMeta meta) {
        if (meta.returnType() == null) {
            return "JsonRuntime.toJson(result)";
        }
        return switch (meta.returnType().type()) {
            case "ListNode" -> switch (meta.functionName()) {
                case "getIntersectionNode", "detectCycle" -> "JsonRuntime.listNodeRefToJson(result)";
                case "copyRandomList" -> "JsonRuntime.randomListToJson(result)";
                default -> "JsonRuntime.listNodeToJson(result)";
            };
            case "TreeNode" -> switch (meta.functionName()) {
                case "lowestCommonAncestor" -> "JsonRuntime.treeNodeRefToJson(result)";
                default -> "JsonRuntime.treeNodeToJson(result)";
            };
            default -> "JsonRuntime.toJson(result)";
        };
    }

    public static String jsReturnExpression(ProblemMeta meta) {
        if (meta.returnType() == null) {
            return "JSON.stringify(result)";
        }
        return switch (meta.returnType().type()) {
            case "ListNode" -> switch (meta.functionName()) {
                case "getIntersectionNode", "detectCycle" -> "Runtime.listNodeRefToJson(result)";
                case "copyRandomList" -> "Runtime.randomListToJson(result)";
                default -> "Runtime.listNodeToJson(result)";
            };
            case "TreeNode" -> switch (meta.functionName()) {
                case "lowestCommonAncestor" -> "Runtime.treeNodeRefToJson(result)";
                default -> "Runtime.treeNodeToJson(result)";
            };
            default -> "JSON.stringify(result)";
        };
    }
}
