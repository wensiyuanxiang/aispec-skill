# [Project Name] Java Backend AI Agent Collaboration Guide

You are a senior software engineer proficient in Java and the Spring ecosystem, familiar with cloud-native development and software engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Java 21+ (LTS); prefer virtual threads and modern APIs
- **Framework**: Spring Boot 3.x, Spring Framework 6.x
- **Build**: Maven or Gradle (Gradle Kotlin DSL preferred); dependency and plugin versions in build files
- **Database & storage**:
  - **Primary**: PostgreSQL 15+ or MySQL 8+; ORM Spring Data JPA / Hibernate 6, or MyBatis-Plus per project
  - **Cache**: Redis; session and distributed locks as needed
  - **Migrations**: Flyway or Liquibase
- **Config**: Spring Cloud Config optional; local/container env vars and application-{profile}.yml; never hardcode secrets
- **Observability**: SLF4J + Logback structured (JSON) logs; MDC for traceId, userId, etc.; optional Micrometer + Prometheus
- **Tests & quality**:
  - **Tests**: JUnit 5, Mockito; Spring Boot Test for integration; coverage target >= 80%
  - **Style**: Checkstyle or Spotless; SpotBugs or NullAway
  - **Docs**: SpringDoc OpenAPI 3 (Swagger), in sync with APIs

---

## 2. Architecture & Code Style

- **Project structure**: Layered: controller / service / repository / domain / config; core business in domain and service, avoid anemic models; infra and adapters in adapter/ or infrastructure/.
- **Error handling**: **[Required]** Unified handling with @ControllerAdvice + @ExceptionHandler; custom business exceptions map to HTTP status, error code, and message; do not swallow exceptions in controllers.
- **Logging**: **[Required]** Log key flows and exceptions; never log passwords, tokens, full card numbers, etc.; use MDC for request-scoped context.
- **Transactions & concurrency**: **[Required]** Clear transaction boundaries; read-only operations with @Transactional(readOnly = true); document lock strategy (optimistic/pessimistic/distributed) when concurrency is involved.
- **Dependencies & interfaces**: Program to interfaces; inject core capabilities; avoid circular dependencies; split large services into smaller services or domain services.
- **Copy & output**: No emoji in code, comments, docs, or logs.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer Spring and stdlib**: When the Spring ecosystem has a mature solution, use it; avoid third-party libraries that overlap or conflict with Spring.
- **[Process] Review first**: When asked to implement a feature, read relevant Controller, Service, Repository, and config, understand layering and conventions, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Test first**: Unit tests for core business; integration tests for main API and DB; mock external dependencies.
- **[Practice] Security**: Use Spring Security for auth; validate and authorize on server; parameterized SQL only, no concatenation.
- **[Output] Explain**: After generating complex logic or config, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/java-spring.md`
