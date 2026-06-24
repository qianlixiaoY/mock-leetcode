package com.mockleetcode.common.dto;

public record GeneratedHarness(
        String mainSource,
        String runtimeHelperSource,
        String runtimeClasspathEntry,
        String userCodeSuffix
) {
    public static GeneratedHarness of(String mainSource, String runtimeHelperSource, String classpathEntry) {
        return new GeneratedHarness(mainSource, runtimeHelperSource, classpathEntry, "");
    }

    public static GeneratedHarness withSuffix(
            String mainSource,
            String runtimeHelperSource,
            String classpathEntry,
            String userCodeSuffix
    ) {
        return new GeneratedHarness(mainSource, runtimeHelperSource, classpathEntry, userCodeSuffix);
    }
}
