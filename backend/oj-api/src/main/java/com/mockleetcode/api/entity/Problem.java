package com.mockleetcode.api.entity;

import com.mockleetcode.common.enums.Difficulty;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "problem")
@Getter
@Setter
public class Problem {

    @Id
    private Long id;

    private String title;

    @Column(unique = true)
    private String slug;

    @Enumerated(EnumType.STRING)
    private Difficulty difficulty;

    @Column(name = "description_md", columnDefinition = "TEXT")
    private String descriptionMd;

    @Column(name = "time_limit_ms")
    private Integer timeLimitMs;

    @Column(name = "memory_limit_mb")
    private Integer memoryLimitMb;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
