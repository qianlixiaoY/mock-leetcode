package com.mockleetcode.api.dto;

import com.mockleetcode.common.enums.Language;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record SaveDraftRequest(
        @NotNull Language language,
        @NotBlank String code
) {
}
