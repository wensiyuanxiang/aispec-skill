# [Project Name] Qt Desktop AI Agent Collaboration Guide

You are a senior software engineer proficient in Qt (C++/QML), familiar with cross-platform desktop applications, native UI, and engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Framework**: Qt 6.x preferred (or Qt 5.15+); C++17 or later; QML for declarative UI, C++ for logic and performance-sensitive parts
- **Build**: CMake 3.16+; include Qt modules as needed (Core, Gui, Widgets, Qml, Quick, etc.); do not pull unused modules
- **Language**: C++ follows project code style; QML uses Qt Quick Controls 2/3; properties and signals/slots follow naming conventions
- **i18n**: Qt Linguist (.ts/.qm); use `tr()` for all user-facing text; no hardcoded display strings
- **UI & Icons**: Qt built-in icon theme or Qt Quick Controls icons; optional Material Design Icons / Phosphor vector assets; do not use emoji in place of icons in the UI
- **Build & Quality**:
  - **Build**: CMake + Ninja/Make; validate cross-platform in CI (Windows / macOS / Linux)
  - **Style**: clang-format; optional clang-tidy; do not hand-edit MOC-generated code
  - **Tests**: Qt Test (unit); optional Squish / Qt Test for UI automation; coverage target >= 80%
  - **Packaging**: Platform installers (windeployqt on Windows; macdeployqt on macOS; linuxdeployqt or equivalent on Linux)

---

## 2. Architecture & Code Style

- **Project structure**: Typical layout: `src/` (C++ sources and headers), `qml/` or `resources/qml/` (QML and resources); subdirs by feature or module; resources via Qt Resource System (.qrc).
- **C++/QML boundary**: **[Required]** Business logic and system calls live in C++; expose to QML via Q_PROPERTY, Q_INVOKABLE, and signals/slots; QML is for presentation and user interaction only—no complex logic.
- **Error handling**: **[Required]** Use return values, std::optional, or custom error types on the C++ side; do not swallow exceptions on critical paths; propagate error state to QML via signals and present consistently.
- **Logging**: **[Required]** Use qDebug/qInfo/qWarning/qCritical or a unified wrapper; redirect to file in production if needed; never log keys, tokens, or secrets.
- **Types & contracts**: **[Required]** Document interfaces exposed to QML; keep property and signal names consistent; enums/constants shared between QML and C++ have a single source of truth.
- **i18n & display**: **[Required]** All user-visible strings go through tr() and .ts files with multi-language support; no emoji in UI, copy, code, or comments.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Follow Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - Scope may be `cpp` / `qml` / `cmake`; when asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Clear boundaries**: Keep pure UI and local state in QML; system resources, files, network, hardware, or cross-thread work go in C++; do not mix responsibilities.
- **[Process] Review first**: When asked to implement a feature, first decide whether it belongs in QML or C++, read existing QML and C++ APIs, then propose an implementation plan (including interfaces and signals/slots) as a list; code only after confirmation.
- **[Practice] C++ quality**: Write readable, testable C++; use const and smart pointers appropriately; document public APIs; respect thread affinity of QObjects.
- **[Practice] QML & packaging**: Keep resource paths and .qrc config consistent; validate multi-platform build and deployment in CI.
- **[Output] Explain**: After generating cross-boundary APIs or complex logic, briefly explain data flow and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/cpp-qt.md`
