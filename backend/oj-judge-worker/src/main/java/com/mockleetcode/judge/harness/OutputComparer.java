package com.mockleetcode.judge.harness;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public final class OutputComparer {

    private static final ObjectMapper MAPPER = new ObjectMapper();

    private OutputComparer() {
    }

    public static boolean matches(String actual, String expected) {
        if (expected == null || expected.isBlank()) {
            return true;
        }

        String actualText = actual == null ? "" : actual.trim();
        String expectedText = expected.trim();
        try {
            JsonNode actualNode = MAPPER.readTree(actualText);
            JsonNode expectedNode = MAPPER.readTree(expectedText);
            return actualNode.equals(expectedNode);
        } catch (Exception ignored) {
            return actualText.equals(expectedText);
        }
    }
}
