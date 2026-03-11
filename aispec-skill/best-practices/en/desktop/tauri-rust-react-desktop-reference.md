# [Project Name] Tauri (Rust + React) Desktop AI Agent Collaboration Guide

You are a senior software engineer proficient in Tauri, Rust, and frontend (React/TypeScript), familiar with cross-platform desktop applications and security-boundary design. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Desktop shell**: Tauri 2.x; Rust handles system APIs, security, and performance-sensitive logic; frontend handles UI and interaction
- **Rust**: 2024 edition; tokio for async if needed; dependencies in Cargo.toml, no unnecessary crates
- **Frontend**: React 18+, TypeScript strict mode; build via Vite (Tauri default); styling with Tailwind CSS; **UI & icons**: prefer mature component and icon libraries (e.g. shadcn/ui, Radix, Lucide React); do not use emoji in place of icons in the UI
- **i18n**: react-i18next or equivalent; all copy via i18n, no hardcoded display text
- **Bridge**: Tauri Commands (Rust APIs exposed to frontend); Invoke; events and two-way communication follow Tauri security model
- **Build & quality**:
  - **Rust**: `cargo build` / `cargo test`; clippy and fmt (rustfmt); no unsafe unless necessary and documented
  - **Frontend**: ESLint, Prettier; full TypeScript typing
  - **Tests**: Rust unit/integration; frontend Vitest; E2E optional Tauri test or Playwright
  - **Packaging**: Tauri build produces platform installers; configure signing and notarization per release requirements

---

## 2. Architecture & Code Style

- **Project structure**: Tauri default layout: `src-tauri/` (Rust: src/lib.rs, main.rs, commands, plugins), `src/` (frontend React app); Rust split by module (e.g. commands/, services/, error.rs); frontend organized per common React/Next habits.
- **Security boundary**: **[Required]** Only call Rust via Tauri Command and explicitly allowed invoke; validate all inputs and permissions on Rust side; never store or handle secrets in frontend—sensitive operations go through Rust Commands.
- **Error handling**: **[Required]** Rust uses Result and custom error types, serialized via serde to frontend; frontend handles errors and retries uniformly; do not swallow errors at the boundary.
- **Logging**: **[Required]** Rust uses log + env_logger or tracing; frontend may log in dev, not in production; never log keys or tokens.
- **Types & contracts**: **[Required]** Command inputs and return values have matching type definitions on both Rust and TypeScript; prefer shared types or codegen to avoid drift.
- **i18n & display**: **[Required]** All user-visible copy via i18n with multi-language support; no emoji in UI, copy, code, or comments.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - Scope may be `rust` / `frontend` / `tauri`; when asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Clear boundaries**: Keep pure UI and local state in frontend; system resources, files, network, crypto, or cross-process work in Tauri/Rust; do not mix responsibilities.
- **[Process] Review first**: When asked to implement a feature, decide whether it belongs in frontend or Rust, read existing commands and frontend usage, then propose an implementation plan (including API contract) as a list; code only after confirmation.
- **[Practice] Rust quality**: Write readable, testable Rust; avoid unnecessary unsafe; propagate errors with ? and custom types; document public APIs.
- **[Practice] Frontend & packaging**: Frontend build output is served by Tauri; resource paths and CSP follow Tauri config; validate multi-platform build in CI.
- **[Output] Explain**: After generating cross-boundary calls or complex Commands, briefly explain data flow, security assumptions, and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/rust.md`
- `~/.claude/rules/common/frontend-react.md`
