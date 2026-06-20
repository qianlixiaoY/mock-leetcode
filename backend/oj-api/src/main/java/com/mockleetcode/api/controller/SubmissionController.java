package com.mockleetcode.api.controller;

import com.mockleetcode.api.dto.*;
import com.mockleetcode.api.service.SubmissionService;
import com.mockleetcode.common.dto.JudgeResult;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/submissions")
public class SubmissionController {

    private final SubmissionService submissionService;

    public SubmissionController(SubmissionService submissionService) {
        this.submissionService = submissionService;
    }

    @PostMapping("/run")
    public ApiResponse<RunResultDto> run(@Valid @RequestBody RunRequest request) {
        return ApiResponse.ok(submissionService.run(request));
    }

    @PostMapping
    public ApiResponse<SubmissionDto> submit(@Valid @RequestBody SubmitRequest request) {
        return ApiResponse.ok(submissionService.submit(request));
    }

    @GetMapping("/{id}")
    public ApiResponse<SubmissionDto> getSubmission(@PathVariable Long id) {
        return ApiResponse.ok(submissionService.getSubmission(id));
    }

    @GetMapping
    public ApiResponse<List<SubmissionDto>> listSubmissions(@RequestParam Long problemId) {
        return ApiResponse.ok(submissionService.listSubmissions(problemId));
    }

    @PostMapping("/callback")
    public ApiResponse<Void> callback(@RequestBody JudgeResult result) {
        submissionService.applyJudgeResult(result);
        return ApiResponse.ok(null);
    }
}
