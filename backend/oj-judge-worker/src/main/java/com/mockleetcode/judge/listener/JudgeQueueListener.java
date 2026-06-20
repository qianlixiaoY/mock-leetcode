package com.mockleetcode.judge.listener;

import com.mockleetcode.common.dto.JudgeRequest;
import com.mockleetcode.common.dto.JudgeResult;
import com.mockleetcode.common.enums.JudgeStatus;
import com.mockleetcode.judge.judge.DockerJudgeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class JudgeQueueListener {

    private static final Logger log = LoggerFactory.getLogger(JudgeQueueListener.class);

    private final DockerJudgeService dockerJudgeService;
    private final RestTemplate restTemplate;

    @Value("${oj.judge.api-callback-url}")
    private String callbackUrl;

    public JudgeQueueListener(DockerJudgeService dockerJudgeService, RestTemplate restTemplate) {
        this.dockerJudgeService = dockerJudgeService;
        this.restTemplate = restTemplate;
    }

    @RabbitListener(queues = "${oj.judge.queue}")
    public void onJudgeRequest(JudgeRequest request) {
        log.info("Received judge request for submission {}", request.submissionId());
        try {
            JudgeResult judging = new JudgeResult(
                    request.submissionId(),
                    JudgeStatus.JUDGING,
                    null,
                    null,
                    null,
                    request.testCases().size(),
                    null,
                    null,
                    null
            );
            restTemplate.postForObject(callbackUrl, judging, Void.class);

            JudgeResult result = dockerJudgeService.judge(request);
            restTemplate.postForObject(callbackUrl, result, Void.class);
            log.info("Submission {} judged as {}", request.submissionId(), result.status());
        } catch (Exception ex) {
            log.error("Failed to judge submission {}", request.submissionId(), ex);
            JudgeResult error = new JudgeResult(
                    request.submissionId(),
                    JudgeStatus.SYSTEM_ERROR,
                    0,
                    0,
                    0,
                    request.testCases().size(),
                    ex.getMessage(),
                    "",
                    ""
            );
            restTemplate.postForObject(callbackUrl, error, Void.class);
        }
    }
}
