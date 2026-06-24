package com.mockleetcode.judge.harness;

public final class JsonRuntimeTemplate {

    public static final String CLASSPATH_ENTRY = "/opt/gson.jar";

    private static final String SOURCE = """
            import com.google.gson.*;
            import java.nio.file.*;
            import java.util.*;

            public class JsonRuntime {
                private static final Gson GSON = new Gson();

                public static JsonObject readInput() throws Exception {
                    String json = Files.readString(Path.of("input.json"));
                    return JsonParser.parseString(json).getAsJsonObject();
                }

                public static JsonElement getParam(JsonObject input, String paramName, int totalParams) {
                    if (input.has(paramName)) {
                        return input.get(paramName);
                    }
                    if (totalParams == 1 && input.has("input")) {
                        return input.get("input");
                    }
                    throw new IllegalArgumentException("Missing param: " + paramName);
                }

                public static int asInt(JsonObject input, String paramName, int totalParams) {
                    return getParam(input, paramName, totalParams).getAsInt();
                }

                public static int[] asIntArray(JsonObject input, String paramName, int totalParams) {
                    JsonArray array = getParam(input, paramName, totalParams).getAsJsonArray();
                    int[] result = new int[array.size()];
                    for (int i = 0; i < array.size(); i++) {
                        result[i] = array.get(i).getAsInt();
                    }
                    return result;
                }

                public static String asString(JsonObject input, String paramName, int totalParams) {
                    JsonElement value = getParam(input, paramName, totalParams);
                    if (value.isJsonNull()) {
                        return null;
                    }
                    return value.getAsString();
                }

                public static boolean asBoolean(JsonObject input, String paramName, int totalParams) {
                    return getParam(input, paramName, totalParams).getAsBoolean();
                }

                public static int[][] asIntMatrix(JsonObject input, String paramName, int totalParams) {
                    JsonArray rows = getParam(input, paramName, totalParams).getAsJsonArray();
                    int[][] result = new int[rows.size()][];
                    for (int i = 0; i < rows.size(); i++) {
                        JsonArray row = rows.get(i).getAsJsonArray();
                        result[i] = new int[row.size()];
                        for (int j = 0; j < row.size(); j++) {
                            result[i][j] = row.get(j).getAsInt();
                        }
                    }
                    return result;
                }

                public static String toJson(Object value) {
                    return GSON.toJson(value);
                }
            }
            """;

    private JsonRuntimeTemplate() {
    }

    public static String source() {
        return SOURCE;
    }
}
