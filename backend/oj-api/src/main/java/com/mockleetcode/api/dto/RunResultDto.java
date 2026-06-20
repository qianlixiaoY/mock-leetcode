package com.mockleetcode.api.dto;

import com.mockleetcode.common.enums.JudgeStatus;

public record RunResultDto(
        JudgeStatus status,
        String stdout,
        String stderr,
        String expectedOutput,
        Integer runtimeMs
) {
}
