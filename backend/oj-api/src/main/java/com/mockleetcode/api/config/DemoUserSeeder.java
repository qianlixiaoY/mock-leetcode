package com.mockleetcode.api.config;

import com.mockleetcode.api.auth.JwtProperties;
import com.mockleetcode.api.entity.User;
import com.mockleetcode.api.repository.UserRepository;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class DemoUserSeeder implements ApplicationRunner {

    private static final String DEMO_USERNAME = "demo";
    private static final String DEMO_PASSWORD = "demo123";

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public DemoUserSeeder(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(ApplicationArguments args) {
        if (userRepository.count() > 0) {
            return;
        }

        User demo = new User();
        demo.setUsername(DEMO_USERNAME);
        demo.setPasswordHash(passwordEncoder.encode(DEMO_PASSWORD));
        demo.setCreatedAt(LocalDateTime.now());
        userRepository.save(demo);
    }
}
