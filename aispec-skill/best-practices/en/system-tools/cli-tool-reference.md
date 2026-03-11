# [Project Name] CLI Tool AI Agent Collaboration Guide

You are a senior software engineer proficient in CLI development, familiar with clap, argparse, UX, and cross-platform compatibility best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Rust (clap), Go (cobra/urfave/cli), Python (click/typer), or Node.js (commander/yargs); unify per project
- **Parsing & help**: Use a mature CLI framework; auto-generate --help; clear docs for subcommands and args
- **Output**: Separate stdout/stderr; configurable verbose/quiet; optional structured (JSON) output
- **Config**: Clear precedence for env vars, config file, and CLI args; never hardcode paths or secrets
- **Build & quality**:
  - **Build**: Standard tooling per language; prefer single binary (Rust/Go); Python may use PyInstaller
  - **Tests**: Unit tests for core logic; integration tests for main commands and exit codes
  - **Style**: Standard formatter and linter per language

---

## 2. Architecture & Code Style

- **Project structure**: cmd/ or src/ organized by subcommand; internal/ or lib/ for reusable logic; config and error types centralized.
- **UX**: **[Required]** Consistent naming for commands and args (kebab-case or snake_case); clear, actionable error messages; exit codes per convention (0 success, non-zero failure).
- **Output & logging**: **[Required]** User-facing info to stdout; errors and debug to stderr; support --verbose; never print secrets in default output.
- **Cross-platform**: Use path or filepath; consider line endings and encoding; avoid platform-specific assumptions.
- **Testability**: Separate core logic from I/O; support injecting stdin/stdout/stderr for tests.
- **Copy & output**: No emoji in help text, errors, code, or comments.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer stdlib and mature CLI frameworks**: When the chosen language has a mature CLI library, use it.
- **[Process] Review first**: When adding subcommands or args, read existing command structure and help text, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Docs & examples**: Short description per command; examples for complex args; README with install and usage.
- **[Practice] Security**: Sensitive operations require confirmation or --force; do not log secrets; safe config file permissions and paths.
- **[Output] Explain**: After generating complex command logic, briefly explain design tradeoffs and user flow in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
