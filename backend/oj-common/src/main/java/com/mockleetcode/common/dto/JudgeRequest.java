package com.mockleetcode.common.dto;

import com.mockleetcode.common.enums.Language;

import java.util.List;

public record JudgeRequest(
        Long submissionId,
        Long problemId,
        Language language,
        String code,
        List<TestCaseDto> testCases,
        int timeLimitMs,
        int memoryLimitMb
) {
}
