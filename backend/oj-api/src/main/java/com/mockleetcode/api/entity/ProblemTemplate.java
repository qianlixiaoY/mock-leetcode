package com.mockleetcode.api.entity;

import com.mockleetcode.common.enums.Language;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "problem_template")
@Getter
@Setter
public class ProblemTemplate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "problem_id")
    private Long problemId;

    @Enumerated(EnumType.STRING)
    private Language language;

    @Column(name = "template_code", columnDefinition = "TEXT")
    private String templateCode;
}
