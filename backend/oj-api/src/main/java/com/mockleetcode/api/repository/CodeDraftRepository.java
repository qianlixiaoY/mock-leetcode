package com.mockleetcode.api.repository;

import com.mockleetcode.api.entity.CodeDraft;
import com.mockleetcode.common.enums.Language;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CodeDraftRepository extends JpaRepository<CodeDraft, Long> {

    Optional<CodeDraft> findByUserIdAndProblemIdAndLanguage(Long userId, Long problemId, Language language);
}
