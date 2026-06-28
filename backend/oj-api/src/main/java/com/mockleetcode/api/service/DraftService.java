package com.mockleetcode.api.service;

import com.mockleetcode.api.dto.SaveDraftRequest;
import com.mockleetcode.api.entity.CodeDraft;
import com.mockleetcode.api.repository.CodeDraftRepository;
import com.mockleetcode.api.support.CurrentUser;
import com.mockleetcode.common.enums.Language;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
public class DraftService {

    private final CodeDraftRepository draftRepository;

    public DraftService(CodeDraftRepository draftRepository) {
        this.draftRepository = draftRepository;
    }

    public String getDraft(Long problemId, Language language) {
        Long userId = CurrentUser.requireUserId();
        return draftRepository.findByUserIdAndProblemIdAndLanguage(userId, problemId, language)
                .map(CodeDraft::getCode)
                .orElse(null);
    }

    @Transactional
    public void saveDraft(Long problemId, SaveDraftRequest request) {
        Long userId = CurrentUser.requireUserId();
        CodeDraft draft = draftRepository
                .findByUserIdAndProblemIdAndLanguage(userId, problemId, request.language())
                .orElseGet(CodeDraft::new);

        draft.setUserId(userId);
        draft.setProblemId(problemId);
        draft.setLanguage(request.language());
        draft.setCode(request.code());
        draft.setUpdatedAt(LocalDateTime.now());
        draftRepository.save(draft);
    }
}
