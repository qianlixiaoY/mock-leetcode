package com.mockleetcode.common.dto;

public record TestCaseDto(
        Long id,
        String input,
        String expectedOutput
) {
}
