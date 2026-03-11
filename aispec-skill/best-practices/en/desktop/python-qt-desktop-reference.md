# [Project Name] Python Qt Desktop AI Agent Collaboration Guide

You are a senior software engineer proficient in Python and Qt for Python (PySide6 / PyQt6), familiar with cross-platform desktop applications, signals/slots, and engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Python >= 3.10; type hints recommended throughout
- **Qt bindings**: PySide6 preferred (official, LGPL), or PyQt6; unify after choice, do not mix
- **Project config**: pyproject.toml (PEP 518); dependencies and tools configured there
- **UI**: Qt Widgets or Qt Quick (QML); signals and slots, property naming conventions
- **i18n**: Qt Linguist (.ts/.qm) or gettext; use `QCoreApplication.translate()` or equivalent for all user-facing text; no hardcoded display strings
- **UI & icons**: Qt built-in icon theme or Qt Quick Controls icons; optional Material Design Icons / Phosphor vector assets; do not use emoji in place of icons in the UI
- **Build & quality**:
  - **Package manager**: uv preferred, or pip; lock deps (uv.lock / requirements.txt)
  - **Style**: black, ruff; optional mypy; type hints recommended
  - **Tests**: pytest, pytest-qt for Qt-related tests; coverage target >= 80%
  - **Packaging**: PyInstaller, Nuitka, or platform-equivalent; validate cross-platform in CI (Windows / macOS / Linux)

---

## 2. Architecture & Code Style

- **Project structure**: Typical layout: `src/` or package dir (main window, dialogs, business logic), `resources/` (qrc or static assets); subdirs by feature or module; entry `main.py` creates QApplication and starts main window.
- **UI vs logic boundary**: **[Required]** Decouple business logic and system calls from UI; communicate via signals/slots or Presenter/ViewModel; avoid large business and I/O logic inside widgets.
- **Error handling**: **[Required]** Use exceptions or return values; do not silently swallow exceptions on critical paths; surface user-visible errors via signals or QMessageBox etc. consistently.
- **Logging**: **[Required]** Use logging or structlog; redirect to file in production if needed; never log keys, tokens, or secrets.
- **Types & contracts**: **[Required]** Type hints recommended for public functions and signal/slot parameters and return values; keep interfaces clear and documented when interacting with QML or external modules.
- **i18n & display**: **[Required]** All user-visible strings via translate/tr and .ts files with multi-language support; no emoji in UI, copy, code, or comments.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - Scope may be `ui` / `core` / `i18n`; when asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Clear boundaries**: Keep pure UI and local state in View/Widget; business logic, I/O, and system calls in Model or Service; communicate via signals/slots or callbacks; do not mix responsibilities.
- **[Process] Review first**: When asked to implement a feature, decide whether it belongs in UI or logic layer, read existing windows and signals/slots, then propose an implementation plan (including interfaces and signals) as a list; code only after confirmation.
- **[Practice] Python & Qt quality**: Write readable, testable code; use type hints appropriately; document public APIs and signals; respect QObject thread affinity; use signals/slots for cross-thread communication.
- **[Practice] Packaging & multi-platform**: Keep resource paths and packaging config consistent; validate multi-platform build and deployment in CI.
- **[Output] Explain**: After generating cross-layer interfaces or complex logic, briefly explain data flow and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/python.md`
