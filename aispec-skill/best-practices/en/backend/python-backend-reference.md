# [Project Name] Python Backend AI Agent Collaboration Guide

You are a senior software engineer proficient in Python, familiar with FastAPI, cloud-native development, and software engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Python >= 3.11
- **Project config**: pyproject.toml (PEP 518); dependencies and tools configured there
- **Web framework**: FastAPI; async-first (async/await)
- **Config**: pydantic-settings (v2); env vars first, .env support; never hardcode secrets
- **Database & storage**:
  - **Primary**: PostgreSQL 15+, driver asyncpg; ORM SQLAlchemy 2.0+ async (AsyncSession)
  - **Cache/session**: Redis 7+
  - **Migrations**: Alembic
- **Validation & models**: Pydantic v2; keep field and naming conventions consistent when sharing with frontend/clients
- **Auth & security**: JWT (PyJWT or python-jose[cryptography]); passwords with passlib[bcrypt]
- **Observability**: structlog with request_id / trace_id / user_id etc.
- **Build, test & quality**:
  - **Package manager**: uv preferred, else pip; lock deps (uv.lock / requirements.txt)
  - **Tests**: pytest, pytest-asyncio; coverage target >= 80%
  - **Format & style**: black, isort; or unified ruff (format + lint)
  - **Static**: ruff (lint), mypy (types); must pass in CI
  - **Types**: Full type annotations; mypy strict mode passing

---

## 2. Architecture & Code Style

- **Project structure**: Strict layering: core/ (config, security, DB connection), domain/ (models, repo interfaces, domain services), infrastructure/ (repo implementations, external services), api/ (routes, DI, request/response DTOs); main.py mounts FastAPI, lifecycle, and global exception handling.
- **Immutability**: **[Required]** Domain models immutable: Pydantic use model_copy(update={...}), dataclass frozen=True; no in-place mutation.
- **Error handling**: **[Required]** Custom exception types + global exception middleware; consistent error response shape (HTTP status, code, message).
- **Logging**: **[Required]** structlog with context on each log; never log keys, tokens, or passwords.
- **Type safety**: **[Required]** Full type annotations on all public functions and API in/out; mypy strict mode.
- **Repository pattern**: **[Required]** Data access only through Repository abstraction; no direct SQLAlchemy Session or raw SQL in business logic.
- **DI**: Use FastAPI Depends() for Repository, config, and services; keeps tests and swapping easy.
- **Copy & output**: No emoji in code, comments, docs, or logs.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer stdlib**: When the standard library has a reasonable solution, use it; avoid unnecessary third-party deps.
- **[Process] Review first**: When asked to implement a feature, read relevant code and routes, understand existing logic, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] TDD first**: Write tests before implementation; coverage >= 80%.
- **[Practice] Async first**: All I/O (DB, network) async/await; parameterized SQL only, no concatenation; always validate user input.
- **[Practice] Docs as code**: OpenAPI from FastAPI; version via path prefix (e.g. /v1/) if needed.
- **[Output] Explain**: After generating complex logic, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/testing.md`
- `~/.claude/rules/common/security.md`
