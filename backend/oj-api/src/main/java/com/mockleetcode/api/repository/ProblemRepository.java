package com.mockleetcode.api.repository;

import com.mockleetcode.api.entity.Problem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProblemRepository extends JpaRepository<Problem, Long> {
}
