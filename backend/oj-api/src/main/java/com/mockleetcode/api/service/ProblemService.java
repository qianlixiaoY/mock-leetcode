package com.mockleetcode.api.service;

import com.mockleetcode.api.dto.*;
import com.mockleetcode.api.entity.Problem;
import com.mockleetcode.api.entity.ProblemTemplate;
import com.mockleetcode.api.entity.TestCase;
import com.mockleetcode.api.repository.ProblemRepository;
import com.mockleetcode.api.repository.ProblemTemplateRepository;
import com.mockleetcode.api.repository.TestCaseRepository;
import com.mockleetcode.api.support.ProblemMetaParser;
import com.mockleetcode.common.dto.ProblemMeta;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ProblemService {

    private final ProblemRepository problemRepository;
    private final ProblemTemplateRepository templateRepository;
    private final TestCaseRepository testCaseRepository;
    private final ProblemMetaParser problemMetaParser;

    public ProblemService(ProblemRepository problemRepository,
                          ProblemTemplateRepository templateRepository,
                          TestCaseRepository testCaseRepository,
                          ProblemMetaParser problemMetaParser) {
        this.problemRepository = problemRepository;
        this.templateRepository = templateRepository;
        this.testCaseRepository = testCaseRepository;
        this.problemMetaParser = problemMetaParser;
    }

    public List<ProblemSummaryDto> listProblems() {
        return problemRepository.findAll().stream()
                .map(this::toSummary)
                .toList();
    }

    public ProblemDetailDto getProblem(Long id) {
        Problem problem = problemRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Problem not found"));

        List<TestCaseViewDto> samples = testCaseRepository
                .findByProblemIdAndIsSampleTrueOrderBySortOrderAsc(id)
                .stream()
                .map(this::toTestCaseView)
                .toList();

        Map<Language, String> templates = templateRepository.findByProblemId(id).stream()
                .collect(Collectors.toMap(ProblemTemplate::getLanguage, ProblemTemplate::getTemplateCode));

        ProblemMeta meta = problemMetaParser.parse(problem);

        return new ProblemDetailDto(
                problem.getId(),
                problem.getTitle(),
                problem.getSlug(),
                problem.getDifficulty(),
                problem.getDescriptionMd(),
                problem.getTimeLimitMs(),
                problem.getMemoryLimitMb(),
                samples,
                templates,
                meta
        );
    }

    private ProblemSummaryDto toSummary(Problem problem) {
        return new ProblemSummaryDto(
                problem.getId(),
                problem.getTitle(),
                problem.getSlug(),
                problem.getDifficulty()
        );
    }

    private TestCaseViewDto toTestCaseView(TestCase testCase) {
        return new TestCaseViewDto(testCase.getId(), testCase.getInput(), testCase.getExpectedOutput());
    }
}
