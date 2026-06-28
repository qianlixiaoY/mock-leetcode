package com.mockleetcode.api.auth;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "oj.jwt")
public record JwtProperties(String secret, long expirationMs) {
}
