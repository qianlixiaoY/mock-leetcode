package com.mockleetcode.common.dto;

import java.util.Collections;
import java.util.Map;

public record GeneratedHarness(
        String mainSource,
        String runtimeHelperSource,
        String runtimeClasspathEntry,
        String userCodeSuffix,
        Map<String, String> extraWorkspaceFiles
) {
    public GeneratedHarness {
        extraWorkspaceFiles = extraWorkspaceFiles == null
                ? Collections.emptyMap()
                : Map.copyOf(extraWorkspaceFiles);
    }

    public static GeneratedHarness of(String mainSource, String runtimeHelperSource, String classpathEntry) {
        return new GeneratedHarness(mainSource, runtimeHelperSource, classpathEntry, "", Map.of());
    }

    public static GeneratedHarness withSuffix(
            String mainSource,
            String runtimeHelperSource,
            String classpathEntry,
            String userCodeSuffix
    ) {
        return new GeneratedHarness(mainSource, runtimeHelperSource, classpathEntry, userCodeSuffix, Map.of());
    }

    public static GeneratedHarness withExtras(
            String mainSource,
            String runtimeHelperSource,
            String classpathEntry,
            String userCodeSuffix,
            Map<String, String> extraWorkspaceFiles
    ) {
        return new GeneratedHarness(mainSource, runtimeHelperSource, classpathEntry, userCodeSuffix, extraWorkspaceFiles);
    }
}
