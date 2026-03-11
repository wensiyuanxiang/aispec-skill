# [Project Name] Rust System / Service AI Agent Collaboration Guide

You are a senior software engineer proficient in Rust, familiar with async runtimes, systems programming, and high-performance service development best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Rust 2024 edition; stable toolchain
- **Web/HTTP**: axum, actix-web, or warp; async runtime tokio
- **Database**: sqlx, Diesel, or SeaORM; connection pool deadpool or bb8
- **Serialization**: serde, serde_json; config toml, config, or dotenvy
- **Logging & tracing**: tracing, tracing-subscriber; optional OpenTelemetry
- **Build & quality**:
  - **Build**: cargo; optional Makefile or just
  - **Tests**: cargo test; integration in tests/
  - **Style**: rustfmt, clippy (strict); no unsafe unless necessary and documented
  - **Dependencies**: Lock versions in Cargo.toml; regular cargo audit

---

## 2. Architecture & Code Style

- **Project structure**: Follow Cargo conventions. Under src/ split by module (e.g. api/, service/, repository/, error.rs, config.rs); separate binary and lib; integration tests in tests/.
- **Error handling**: **[Required]** Use thiserror + anyhow or custom Error type; errors must carry context; propagate with ?; no unwrap on production paths.
- **Logging**: **[Required]** Use tracing; spans for request-scoped context; never log keys or tokens.
- **Memory & concurrency**: **[Required]** Avoid unnecessary clone; consider Arc for large structures; when using Mutex/RwLock/channel, state boundaries clearly; document safety invariants for unsafe.
- **Types & contracts**: Explicit types for API in/out; when sharing with frontend/clients use OpenAPI or equivalent.
- **Copy & output**: No emoji in code, comments, docs, or logs.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer stdlib and mainstream crates**: When crates.io has a mature crate, use it; avoid unmaintained or niche dependencies.
- **[Process] Review first**: When implementing a feature, read existing modules and error types, understand architecture, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Tests & docs**: Document public APIs; unit tests for key logic; integration tests for main HTTP paths.
- **[Practice] Performance & security**: Avoid allocation hotspots; parameterized SQL; input validation; regular cargo audit.
- **[Output] Explain**: After generating complex logic or unsafe blocks, briefly explain design tradeoffs and safety assumptions in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/rust.md`
