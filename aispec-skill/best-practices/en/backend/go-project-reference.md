# [Project Name] Go Project AI Agent Collaboration Guide

You are a senior software engineer proficient in Go, familiar with cloud-native development and software engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Go (>= 1.25)
- **Web/HTTP**: [e.g. Gin, Chi, net/http]
- **Database/ORM**: [e.g. GORM, sqlx, pgx]
- **Build / test / quality**:
  - **Build**: Standard `go build` or Makefile
  - **Tests**: Standard `go test`
  - **Style**: gofmt, goimports
  - **Static analysis**: golangci-lint (config .golangci.yml)

---

## 2. Architecture & Code Style

- **Project structure**: Follow standard Go project layout (https://go.dev/doc/modules/layout). Core business logic must live under `internal/`.
- **Error handling**: **[Required]** Wrap all returned errors with `fmt.Errorf("...: %w", err)` to preserve context and stack; never `return err` directly.
- **Logging**: **[Required]** Use stdlib `log/slog` for structured logging; include key context (e.g. userID, traceID) in log entries.
- **Interfaces**: Follow Go interface philosophy—interfaces defined by the consumer; prefer small, single-responsibility interfaces.
- **Copy & output**: No emoji in code, comments, docs, or logs.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer stdlib**: When the standard library has a reasonable solution, use it instead of adding a new dependency.
- **[Process] Review first**: When asked to implement a feature, first read relevant code with @, understand existing logic, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Table-driven tests**: When asked to write tests, prefer **table-driven tests**; this project favors that style.
- **[Practice] Concurrency safety**: When code uses concurrency (goroutines, channels), clearly state potential race risks and the concurrency-safety measures used (e.g. mutex, channel).
- **[Output] Explain**: After generating non-trivial code, briefly explain core logic and design in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/my-personal-go-prefs.md`
