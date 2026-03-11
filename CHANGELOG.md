# Changelog

All notable changes to AISpec Skill (skill content, best-practices, and tooling) are documented here. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Version numbers follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-03-11

### Added

- **Skill and best-practices**
  - `aispec-skill/` directory: SKILL.md and best-practices (zh/ and en/) for Cursor, Claude Code, OpenClaw, Codex.
  - Coverage: Next.js, Vue/Nuxt, React Native, Flutter, miniprogram, Tauri, Qt, Python Qt, Go, Java, Python, Node.js backend, Rust service, CLI, AI Agent/LLM, Data/ML.
  - UI style and icons reference (frontend/desktop/app/miniprogram).
- **Empty and new project**
  - When the project directory is empty or has no detectable stack, the skill asks 1–2 questions (project type, optional framework) and selects the spec by user choice, so norms can be added before scaffolding.
  - Init-time trigger phrases documented (e.g. "先定规范再写代码", "Add project norms before I scaffold").
- **Proactive suggestion**
  - When the directory is empty or the user says they are starting a new project, the AI may suggest adding a spec first (once per context, no spam).
- **Installation**
  - Root script `install-skill.sh`: install skill into editor (global or local) for Cursor, Claude Code, OpenClaw, Codex.
  - `aispec-skill/scripts/install.sh`: optional script to write a spec into a project when the AI cannot access the repo.
- **Docs**
  - README.md / README.zh-CN.md (repo layout, install, use cases).
  - docs/: installation and usage, slogan and promotion.

### Changed

- N/A (initial release).

### Fixed

- README duplicate sentence removed.

---

## Version and upgrading

- **Current version:** see [VERSION](VERSION).
- **Upgrading:** Re-run `./install-skill.sh --tool <cursor|claude|...> --scope global` (or pull the repo and re-link). Projects that already have a copied spec will not auto-update; re-run the skill or `aispec-skill/scripts/install.sh` in that project to overwrite with the latest spec if desired.
