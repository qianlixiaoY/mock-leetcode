package com.mockleetcode.api.entity;

import com.mockleetcode.common.enums.Language;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "code_draft")
@Getter
@Setter
public class CodeDraft {

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

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
