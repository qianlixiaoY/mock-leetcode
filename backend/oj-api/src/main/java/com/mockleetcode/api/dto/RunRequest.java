package com.mockleetcode.api.dto;

import com.mockleetcode.common.enums.Language;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record RunRequest(
        @NotNull Long problemId,
        @NotNull Language language,
        @NotBlank String code,
        @NotBlank String input
) {
}
