package com.mockleetcode.api.dto;

public record TestCaseViewDto(
        Long id,
        String input,
        String expectedOutput
) {
}
