package com.mockleetcode.judge.harness;

import com.mockleetcode.common.dto.ProblemMeta;

import java.util.Set;

public final class TypeSupport {

    private static final Set<String> SUPPORTED_TYPES = Set.of(
            "integer",
            "integer[]",
            "string",
            "boolean",
            "integer[][]",
            "ListNode",
            "TreeNode"
    );

    private TypeSupport() {
    }

    public static void ensureSupported(ProblemMeta meta) {
        if (meta.isSystemDesign()) {
            throw new UnsupportedMetaException("System design problems are not supported yet");
        }
        if (meta.params() != null) {
            for (ProblemMeta.ParamDef param : meta.params()) {
                ensureType(param.type());
            }
        }
        if (meta.returnType() != null) {
            ensureType(meta.returnType().type());
        }
    }

    private static void ensureType(String type) {
        if (type == null || !SUPPORTED_TYPES.contains(type)) {
            throw new UnsupportedMetaException("Type not supported yet: " + type);
        }
    }

    public static String javaParseExpression(String paramName, String type, int paramCount) {
        return switch (type) {
            case "integer" -> "JsonRuntime.asInt(input, \"" + paramName + "\", " + paramCount + ")";
            case "integer[]" -> "JsonRuntime.asIntArray(input, \"" + paramName + "\", " + paramCount + ")";
            case "string" -> "JsonRuntime.asString(input, \"" + paramName + "\", " + paramCount + ")";
            case "boolean" -> "JsonRuntime.asBoolean(input, \"" + paramName + "\", " + paramCount + ")";
            case "integer[][]" -> "JsonRuntime.asIntMatrix(input, \"" + paramName + "\", " + paramCount + ")";
            default -> throw new UnsupportedMetaException("Type not supported yet: " + type);
        };
    }

    public static String jsParamExpression(String paramName, int paramCount) {
        return "getParam(input, \"" + paramName + "\", " + paramCount + ")";
    }
}
