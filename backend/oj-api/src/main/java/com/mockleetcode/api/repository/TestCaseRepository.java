package com.mockleetcode.api.repository;

import com.mockleetcode.api.entity.TestCase;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TestCaseRepository extends JpaRepository<TestCase, Long> {

    List<TestCase> findByProblemIdAndIsSampleTrueOrderBySortOrderAsc(Long problemId);

    List<TestCase> findByProblemIdOrderBySortOrderAsc(Long problemId);
}
