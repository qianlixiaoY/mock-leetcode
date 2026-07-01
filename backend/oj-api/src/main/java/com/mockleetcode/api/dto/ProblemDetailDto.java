package com.mockleetcode.api.dto;

import com.mockleetcode.common.dto.ProblemMeta;
import com.mockleetcode.common.enums.Difficulty;
import com.mockleetcode.common.enums.Language;

import java.util.List;
import java.util.Map;

public record ProblemDetailDto(
        Long id,
        String title,
        String slug,
        Difficulty difficulty,
        String descriptionMd,
        Integer timeLimitMs,
        Integer memoryLimitMb,
        List<TestCaseViewDto> sampleTestCases,
        Map<Language, String> templates,
        ProblemMeta meta
) {
}
