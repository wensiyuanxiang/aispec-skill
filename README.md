# AISpec Skill

**中文 | [简体中文](README.zh-CN.md)**

**Version:** [1.0.0](VERSION) · [Changelog](CHANGELOG.md)

---

**One spec, every editor. One prompt, project-ready.**

AISpec Skill is a **universal AI coding-assistant skill**: the **same** best-practice content is used to generate and install **project-level specs** in different AI editors (Cursor, Claude Code, OpenClaw, Codex, etc.). In any project, ask the AI to "add best practices" or "set up project norms"—it will detect the stack and write the right spec files.

---

## Why It Matters

| Value | Description |
|-------|-------------|
| **Consistency** | Same norms across editors for teams and individuals; less drift and duplicate work. |
| **Discoverability** | New members or projects get a full set of dev specs in one shot instead of writing from scratch. |
| **Maintainability** | Specs live in a single place; update once and re-run the skill to sync into projects. |
| **Multi-editor** | One best-practice set outputs to Cursor, Claude, Codex, etc., without rewriting per tool. |

---

## Use Cases

- **New or empty project**: In an **empty** directory, say e.g. "先帮我加一份 Next.js 项目规约" or "Add project norms for a Go backend before I scaffold." The AI will ask for project type if needed, then write the spec so you have norms from the first commit. No need to init code first.
- **New project (after scaffold)**: In a freshly initialized repo, ask the AI to "initialize best practices for this stack"; it detects the stack and writes the spec.
- **Existing project**: In an existing codebase, ask to "set up project norms"; the AI detects the stack and adds or updates spec files.
- **Polyglot / monorepo**: For separate frontend/backend or monorepos, inject the right spec per subproject or path.
- **Team standard**: Use this repo (or a fork) as the team standard and install specs into each project with one prompt.

---

## Supported AI Editors

Project-level spec paths (in-repo only; user/global paths omitted):

| Tool | Project spec path | Notes |
|------|-------------------|-------|
| **Cursor** | `.cursor/rules/` | One `.mdc` or `.md` per rule (with frontmatter) |
| **Claude Code** | `.claude/CLAUDE.md` or `.claude/rules/*.md` | Main spec + optional modular rules |
| **Codex / OpenClaw** | `AGENTS.md`, `.codex/rules/*.rules`, skills dir, etc. | Per-tool docs |
| **Antigravity** (Google) | `.antigravity/rules.md`, `.agent/rules/` | Project rules auto-loaded |
| **Trae** (ByteDance) | `.trae/project_rules.md` or `.trae/rules` | Markdown |
| **Code Buddy** (Tencent) | `.codebuddy/rules/`, root `CODEBUDDY.md` or `AGENTS.md` | One `RULE.mdc` per rule in subdirs |

---

## Install & Use

The skill works **without any script**: the AI reads `aispec-skill/SKILL.md` and, when you ask to add best practices, detects your project and writes the right spec. Skill content (SKILL.md + best-practices) lives in the **`aispec-skill/`** directory.

### Install the skill into your editor (one-time)

After cloning this repo, run from the **repo root**:

```bash
./install-skill.sh --tool all --scope global
```

This installs the skill for Cursor, Claude Code, OpenClaw, and Codex in your user directory (`~/.cursor/skills/`, `~/.claude/skills/`, etc.). Options:

- `--tool cursor|claude|openclaw|codex|all` (default: all)
- `--scope global|local` (default: global). Use `local` to install only for one project.
- `--target DIR` (for `--scope local`: project root, default: current dir)
- `--method link|copy` (default: link). Use `copy` if your OS or editor does not follow symlinks.

Examples:

```bash
./install-skill.sh --tool cursor --scope global
./install-skill.sh --tool all --scope local --target /path/to/my/project
./install-skill.sh --help
```

### Option A: AI only (no script for spec writing)

- **Cursor**: After running `install-skill.sh` (or manually copying the `aispec-skill/` directory to `.cursor/skills/aispec-skill/` in your project or `~/.cursor/skills/aispec-skill/`), the AI can read `SKILL.md` and add best practices when you ask.
- **Claude Code / others**: After install, or by cloning and referencing this repo with `@` in chat, the AI follows the skill flow (detect → pick spec → write to your project).

### Option B: Install script (optional — installs the spec into a project only)

The script **writes the spec into your project** (e.g. `.cursor/rules/`, `.claude/CLAUDE.md`). It is **not** for installing the skill into your editor, and the skill does **not** call it (the AI does the same by following SKILL.md). Use the script only when the AI cannot access this repo.

From your **project root** (where you want the spec written):

```bash
AISPEC_ROOT=/path/to/aispec-skill-repo bash /path/to/aispec-skill-repo/aispec-skill/scripts/install.sh
```

Or install into another project:

```bash
./aispec-skill/scripts/install.sh /path/to/other/project
```

Env: `AISPEC_LANG=en` (default `zh`), `AISPEC_EDITOR=claude` (default `cursor`). The script detects stack from `package.json`, `pyproject.toml`, `Cargo.toml`, etc., and writes to `.cursor/rules/project-spec.mdc` or `.claude/CLAUDE.md`.

### How to Use

In **your project** (any language/framework), open the AI chat and say for example:

- "Add best practices for this project."
- "Set up project norms / coding standards for this project."
- "Initialize project specs based on the current stack."

The AI will:

1. **Detect** project type (language, framework, web/desktop/app/backend/CLI/AI, etc.).
2. **Choose** the matching best-practice file from this repo (`aispec-skill/best-practices/zh/` or `aispec-skill/best-practices/en/`).
3. **Write** it to your project’s spec path (e.g. `.cursor/rules/`, `.claude/CLAUDE.md`) and replace `[Project Name]` with your project name.

No hand-written specs and no need to remember each editor’s paths.

---

## Spec Index

- [aispec-skill/best-practices/en/README.md](aispec-skill/best-practices/en/README.md) — Index by frontend, backend, desktop, miniprogram, system tools, AI & data.
- [aispec-skill/best-practices/zh/README.md](aispec-skill/best-practices/zh/README.md) — 中文规约索引。

Covers: Next.js, Vue/Nuxt, React Native, Flutter, miniprogram, Tauri, Qt, Python Qt, Go, Java, Python, Node.js, Rust services, CLI, AI Agent/LLM, data/ML, and more.

---

## Documentation

- [Installation & usage (detailed)](docs/20260311-install-and-use.md) — Install steps, per-editor config, FAQ.

---

## Repo layout

- **README.md** / **README.zh-CN.md** — Project intro and usage (this file).
- **VERSION** — Current skill/spec version (e.g. 1.0.0).
- **CHANGELOG.md** — Version history and changes; see it when upgrading.
- **install-skill.sh** — Install the skill into your editor (run once after clone).
- **aispec-skill/scripts/install.sh** — Optional: write a spec into a project when the AI cannot access this repo.
- **aispec-skill/** — Skill content: **SKILL.md**, **best-practices/** (zh/ and en/), and **scripts/**. This directory is what gets linked/copied into `~/.cursor/skills/aispec-skill` etc. by `install-skill.sh`.
- **docs/** — Detailed install and usage docs.

---

## Repo & Contributing

- **Repo**: <https://github.com/wensiyuanxiang/aispec-skill>
- Issues and Pull Requests welcome.
