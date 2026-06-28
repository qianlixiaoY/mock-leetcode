package com.mockleetcode.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import com.mockleetcode.api.auth.JwtProperties;

@SpringBootApplication
@EnableConfigurationProperties(JwtProperties.class)
public class OjApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(OjApiApplication.class, args);
    }
}
