package com.mockleetcode.api.service;

import com.mockleetcode.api.dto.RunRequest;
import com.mockleetcode.api.dto.RunResultDto;
import com.mockleetcode.api.dto.SubmissionDto;
import com.mockleetcode.api.dto.SubmitRequest;
import com.mockleetcode.api.entity.Problem;
import com.mockleetcode.api.entity.Submission;
import com.mockleetcode.api.entity.TestCase;
import com.mockleetcode.api.repository.ProblemRepository;
import com.mockleetcode.api.repository.SubmissionRepository;
import com.mockleetcode.api.repository.TestCaseRepository;
import com.mockleetcode.common.dto.JudgeRequest;
import com.mockleetcode.common.dto.JudgeResult;
import com.mockleetcode.common.dto.TestCaseDto;
import com.mockleetcode.common.enums.JudgeStatus;
import com.mockleetcode.common.enums.Language;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

@Service
public class SubmissionService {

    private static final Long DEFAULT_USER_ID = 1L;
    private static final Set<Language> SUPPORTED_LANGUAGES = EnumSet.of(Language.JAVA, Language.TYPESCRIPT);

    private final SubmissionRepository submissionRepository;
    private final ProblemRepository problemRepository;
    private final TestCaseRepository testCaseRepository;
    private final RabbitTemplate rabbitTemplate;
    private final RestTemplate restTemplate;

    @Value("${oj.judge.exchange}")
    private String judgeExchange;

    @Value("${oj.judge.routing-key}")
    private String judgeRoutingKey;

    @Value("${oj.judge.worker-url}")
    private String judgeWorkerUrl;

    public SubmissionService(SubmissionRepository submissionRepository,
                             ProblemRepository problemRepository,
                             TestCaseRepository testCaseRepository,
                             RabbitTemplate rabbitTemplate,
                             RestTemplate restTemplate) {
        this.submissionRepository = submissionRepository;
        this.problemRepository = problemRepository;
        this.testCaseRepository = testCaseRepository;
        this.rabbitTemplate = rabbitTemplate;
        this.restTemplate = restTemplate;
    }

    public RunResultDto run(RunRequest request) {
        ensureSupportedLanguage(request.language());

        Problem problem = getProblem(request.problemId());
        TestCaseDto testCase = new TestCaseDto(null, request.input(), null);

        JudgeRequest judgeRequest = new JudgeRequest(
                null,
                problem.getId(),
                request.language(),
                request.code(),
                List.of(testCase),
                problem.getTimeLimitMs(),
                problem.getMemoryLimitMb()
        );

        JudgeResult result = restTemplate.postForObject(
                judgeWorkerUrl + "/api/judge/run",
                judgeRequest,
                JudgeResult.class
        );

        if (result == null) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Judge worker unavailable");
        }

        return new RunResultDto(
                result.status(),
                result.stdout(),
                result.stderr(),
                null,
                result.runtimeMs()
        );
    }

    @Transactional
    public SubmissionDto submit(SubmitRequest request) {
        ensureSupportedLanguage(request.language());

        Problem problem = getProblem(request.problemId());
        List<TestCase> testCases = testCaseRepository.findByProblemIdOrderBySortOrderAsc(problem.getId());

        Submission submission = new Submission();
        submission.setUserId(DEFAULT_USER_ID);
        submission.setProblemId(problem.getId());
        submission.setLanguage(request.language());
        submission.setCode(request.code());
        submission.setStatus(JudgeStatus.PENDING);
        submission.setTotalCases(testCases.size());
        submission.setCreatedAt(LocalDateTime.now());
        submission = submissionRepository.save(submission);

        List<TestCaseDto> caseDtos = testCases.stream()
                .map(tc -> new TestCaseDto(tc.getId(), tc.getInput(), tc.getExpectedOutput()))
                .toList();

        JudgeRequest judgeRequest = new JudgeRequest(
                submission.getId(),
                problem.getId(),
                request.language(),
                request.code(),
                caseDtos,
                problem.getTimeLimitMs(),
                problem.getMemoryLimitMb()
        );

        rabbitTemplate.convertAndSend(judgeExchange, judgeRoutingKey, judgeRequest);
        return toDto(submission);
    }

    public SubmissionDto getSubmission(Long id) {
        Submission submission = submissionRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Submission not found"));
        return toDto(submission);
    }

    public List<SubmissionDto> listSubmissions(Long problemId) {
        return submissionRepository.findByProblemIdAndUserIdOrderByCreatedAtDesc(problemId, DEFAULT_USER_ID)
                .stream()
                .map(this::toDto)
                .toList();
    }

    @Transactional
    public void applyJudgeResult(JudgeResult result) {
        Submission submission = submissionRepository.findById(result.submissionId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Submission not found"));

        submission.setStatus(result.status());
        submission.setRuntimeMs(result.runtimeMs());
        submission.setMemoryKb(result.memoryKb());
        submission.setPassedCases(result.passedCases());
        submission.setTotalCases(result.totalCases());
        submission.setErrorMessage(result.errorMessage());
        submission.setStdout(result.stdout());
        submission.setStderr(result.stderr());
        submissionRepository.save(submission);
    }

    private void ensureSupportedLanguage(Language language) {
        if (!SUPPORTED_LANGUAGES.contains(language)) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Run/Submit demo currently supports Java and TypeScript only");
        }
    }

    private Problem getProblem(Long problemId) {
        return problemRepository.findById(problemId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Problem not found"));
    }

    private SubmissionDto toDto(Submission submission) {
        return new SubmissionDto(
                submission.getId(),
                submission.getProblemId(),
                submission.getLanguage(),
                submission.getStatus(),
                submission.getRuntimeMs(),
                submission.getMemoryKb(),
                submission.getPassedCases(),
                submission.getTotalCases(),
                submission.getErrorMessage(),
                submission.getStdout(),
                submission.getStderr(),
                submission.getCreatedAt()
        );
    }
}
