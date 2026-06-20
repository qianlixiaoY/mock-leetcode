package com.mockleetcode.api.controller;

import com.mockleetcode.api.dto.ApiResponse;
import com.mockleetcode.api.dto.ProblemDetailDto;
import com.mockleetcode.api.dto.ProblemSummaryDto;
import com.mockleetcode.api.dto.SaveDraftRequest;
import com.mockleetcode.api.service.DraftService;
import com.mockleetcode.api.service.ProblemService;
import com.mockleetcode.common.enums.Language;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/problems")
public class ProblemController {

    private final ProblemService problemService;
    private final DraftService draftService;

    public ProblemController(ProblemService problemService, DraftService draftService) {
        this.problemService = problemService;
        this.draftService = draftService;
    }

    @GetMapping
    public ApiResponse<List<ProblemSummaryDto>> listProblems() {
        return ApiResponse.ok(problemService.listProblems());
    }

    @GetMapping("/{id}")
    public ApiResponse<ProblemDetailDto> getProblem(@PathVariable Long id) {
        return ApiResponse.ok(problemService.getProblem(id));
    }

    @GetMapping("/{id}/draft")
    public ApiResponse<Map<String, String>> getDraft(@PathVariable Long id, @RequestParam Language language) {
        String code = draftService.getDraft(id, language);
        return ApiResponse.ok(Map.of("code", code == null ? "" : code));
    }

    @PutMapping("/{id}/draft")
    public ApiResponse<Void> saveDraft(@PathVariable Long id, @Valid @RequestBody SaveDraftRequest request) {
        draftService.saveDraft(id, request);
        return ApiResponse.ok(null);
    }
}
