CREATE TABLE IF NOT EXISTS problem (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    difficulty VARCHAR(20) NOT NULL,
    description_md TEXT NOT NULL,
    time_limit_ms INT NOT NULL DEFAULT 2000,
    memory_limit_mb INT NOT NULL DEFAULT 256,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS problem_template (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    problem_id BIGINT NOT NULL,
    language VARCHAR(20) NOT NULL,
    template_code TEXT NOT NULL,
    UNIQUE KEY uk_problem_language (problem_id, language),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE IF NOT EXISTS test_case (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    problem_id BIGINT NOT NULL,
    input TEXT NOT NULL,
    expected_output TEXT NOT NULL,
    is_sample BOOLEAN NOT NULL DEFAULT FALSE,
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE KEY uk_problem_sort_order (problem_id, sort_order),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE IF NOT EXISTS submission (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL DEFAULT 1,
    problem_id BIGINT NOT NULL,
    language VARCHAR(20) NOT NULL,
    code TEXT NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'PENDING',
    runtime_ms INT,
    memory_kb INT,
    passed_cases INT,
    total_cases INT,
    error_message TEXT,
    stdout TEXT,
    stderr TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE IF NOT EXISTS code_draft (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL DEFAULT 1,
    problem_id BIGINT NOT NULL,
    language VARCHAR(20) NOT NULL,
    code TEXT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_problem_language (user_id, problem_id, language),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);
