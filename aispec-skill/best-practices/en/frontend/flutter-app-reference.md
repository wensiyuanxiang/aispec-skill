# [Project Name] Flutter App AI Agent Collaboration Guide

You are a senior software engineer proficient in Flutter and Dart, familiar with cross-platform UI, state management, and mobile engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Language**: Dart 3+; null safety and static typing throughout
- **Framework**: Flutter 3.x; Material 3 or Cupertino per design guidelines
- **State**: Riverpod preferred; complex forms and multi-step flows may use flutter_hooks; avoid setState for complex state
- **Network & data**: dio or http with unified interceptors; JSON via json_serializable + freezed; local persistence hive / shared_preferences / drift as needed
- **Routing**: go_router; deep links and guards in one config
- **i18n**: flutter_localizations + ARB; all copy via context.l10n or equivalent, no hardcoded text
- **Icons**: Mature icon sets (Material Icons, Cupertino Icons, etc.); do not use emoji in place of icons
- **Build & quality**:
  - **Package manager**: pub; lock or range versions in pubspec.yaml
  - **Style**: dart format, strict analysis_options.yaml; flutter_lints or custom_lint
  - **Tests**: Unit (test/), Widget tests, integration (integration_test/); coverage target >= 80%

---

## 2. Architecture & Code Style

- **Project structure**: By feature or module: under lib/ use core/ (constants, theme, routing), features/ or screens/ (by domain), shared/ (shared widgets, utils, extensions); per module may have data/, domain/, presentation/ or equivalent layers.
- **State vs UI**: **[Required]** Business logic and state in Provider/Notifier or ViewModel; widgets only present and forward events; avoid large business and async logic inside widgets.
- **Errors & loading**: **[Required]** Unified error handling and user feedback for network and async; lists and detail have loading/empty/error states; no unhandled exceptions leading to blank or crash.
- **i18n**: **[Required]** All user-visible copy via flutter_localizations + ARB, using context.l10n or equivalent; no hardcoded text; support multi-language.
- **UI & icons**: **[Required]** Prefer Material / Cupertino components; use Material Icons, Cupertino Icons, etc.; no emoji in place of icons; no emoji in UI, copy, code, or comments.
- **Accessibility**: Consider semantics and a11y for key interactions.
- **Security**: Do not log sensitive data; use flutter_secure_storage for tokens; HTTPS and certificate validation.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer official and community conventions**: When Flutter/Dart has an official or widely adopted approach, use it; avoid libraries that conflict with framework philosophy.
- **[Process] Review first**: When asked to implement a feature, read relevant pages, Providers, and routing config, understand state and navigation, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Responsive layout**: Consider multiple screens and orientation; use LayoutBuilder, MediaQuery, Breakpoint, etc.; avoid hardcoded sizes.
- **[Practice] Performance**: Use ListView.builder or list_view_builder for long lists; image caching and sizing; use const and key where appropriate.
- **[Output] Explain**: After generating complex widgets or state logic, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/flutter.md`
