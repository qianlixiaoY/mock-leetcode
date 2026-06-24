package com.mockleetcode.api.support;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mockleetcode.api.entity.Problem;
import com.mockleetcode.common.dto.ProblemMeta;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

@Component
public class ProblemMetaParser {

    private final ObjectMapper objectMapper;

    public ProblemMetaParser(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    public ProblemMeta parse(Problem problem) {
        try {
            return objectMapper.readValue(problem.getMetaData(), ProblemMeta.class);
        } catch (Exception ex) {
            throw new ResponseStatusException(
                    HttpStatus.INTERNAL_SERVER_ERROR,
                    "Invalid meta_data for problem " + problem.getId() + ": " + ex.getMessage()
            );
        }
    }
}
