package com.mockleetcode.api.repository;

import com.mockleetcode.api.entity.Submission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SubmissionRepository extends JpaRepository<Submission, Long> {

    List<Submission> findByProblemIdAndUserIdOrderByCreatedAtDesc(Long problemId, Long userId);
}
