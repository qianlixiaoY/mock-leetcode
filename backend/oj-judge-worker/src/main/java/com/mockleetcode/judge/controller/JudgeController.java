package com.mockleetcode.judge.controller;

import com.mockleetcode.common.dto.JudgeRequest;
import com.mockleetcode.common.dto.JudgeResult;
import com.mockleetcode.judge.judge.DockerJudgeService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/judge")
public class JudgeController {

    private final DockerJudgeService dockerJudgeService;

    public JudgeController(DockerJudgeService dockerJudgeService) {
        this.dockerJudgeService = dockerJudgeService;
    }

    @PostMapping("/run")
    public JudgeResult run(@RequestBody JudgeRequest request) {
        return dockerJudgeService.judge(request);
    }
}
