package com.mockleetcode.common.dto;

import com.mockleetcode.common.enums.JudgeStatus;

public record JudgeResult(
        Long submissionId,
        JudgeStatus status,
        Integer runtimeMs,
        Integer memoryKb,
        Integer passedCases,
        Integer totalCases,
        String errorMessage,
        String stdout,
        String stderr
) {
}
