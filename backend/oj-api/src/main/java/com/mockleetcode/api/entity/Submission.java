package com.mockleetcode.api.entity;

import com.mockleetcode.common.enums.JudgeStatus;
import com.mockleetcode.common.enums.Language;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "submission")
@Getter
@Setter
public class Submission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "problem_id")
    private Long problemId;

    @Enumerated(EnumType.STRING)
    private Language language;

    @Column(columnDefinition = "TEXT")
    private String code;

    @Enumerated(EnumType.STRING)
    private JudgeStatus status;

    @Column(name = "runtime_ms")
    private Integer runtimeMs;

    @Column(name = "memory_kb")
    private Integer memoryKb;

    @Column(name = "passed_cases")
    private Integer passedCases;

    @Column(name = "total_cases")
    private Integer totalCases;

    @Column(name = "error_message", columnDefinition = "TEXT")
    private String errorMessage;

    @Column(columnDefinition = "TEXT")
    private String stdout;

    @Column(columnDefinition = "TEXT")
    private String stderr;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
