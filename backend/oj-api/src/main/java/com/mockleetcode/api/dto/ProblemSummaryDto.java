package com.mockleetcode.api.dto;

import com.mockleetcode.common.enums.Difficulty;

public record ProblemSummaryDto(
        Long id,
        String title,
        String slug,
        Difficulty difficulty
) {
}
