package com.mockleetcode.api.repository;

import com.mockleetcode.api.entity.ProblemTemplate;
import com.mockleetcode.common.enums.Language;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProblemTemplateRepository extends JpaRepository<ProblemTemplate, Long> {

    List<ProblemTemplate> findByProblemId(Long problemId);

    Optional<ProblemTemplate> findByProblemIdAndLanguage(Long problemId, Language language);
}
