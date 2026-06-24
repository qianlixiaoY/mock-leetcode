package com.mockleetcode.common.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public record ProblemMeta(
        String name,
        String classname,
        @JsonProperty("systemdesign") Boolean systemDesign,
        List<ParamDef> params,
        @JsonProperty("return") ReturnDef returnType,
        ConstructorDef constructor,
        List<MethodDef> methods
) {
    @JsonIgnoreProperties(ignoreUnknown = true)
    public record ParamDef(String name, String type) {
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record ReturnDef(String type, Integer size) {
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record ConstructorDef(List<ParamDef> params) {
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record MethodDef(
            String name,
            List<ParamDef> params,
            ReturnDef returnType
    ) {
    }

    public boolean isSystemDesign() {
        return Boolean.TRUE.equals(systemDesign);
    }

    public String functionName() {
        return name;
    }
}
