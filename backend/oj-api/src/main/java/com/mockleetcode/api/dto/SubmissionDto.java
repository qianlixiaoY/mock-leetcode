package com.mockleetcode.api.dto;

import com.mockleetcode.common.enums.JudgeStatus;
import com.mockleetcode.common.enums.Language;

import java.time.LocalDateTime;

public record SubmissionDto(
        Long id,
        Long problemId,
        Language language,
        JudgeStatus status,
        Integer runtimeMs,
        Integer memoryKb,
        Integer passedCases,
        Integer totalCases,
        String errorMessage,
        String stdout,
        String stderr,
        LocalDateTime createdAt
) {
}
