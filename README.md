# AISpec Skill

**中文 | [简体中文](README.zh-CN.md)**

**Version:** [1.0.0](VERSION) · [Changelog](CHANGELOG.md)

---

**One spec, every editor. One prompt, project-ready.**

AISpec Skill bundles **best-practice project specs** for **mainstream stacks and frameworks** (Next.js, Vue/Nuxt, Flutter, Go, Java, Python, Node, Rust, Tauri, Qt, CLI, AI/LLM, and more). It helps your code follow **enterprise-grade architecture and conventions**—the kind used at scale—while making **team collaboration** and **project onboarding** straightforward. **Newcomers get top-tier structure from day one** without needing to be senior architects. Fully supports **OpenClaw**, **Claude Code**, **Cursor**, and **Codex**—one prompt in any of these editors and the right spec is written into your project. OpenClaw and Claude Code users can install the skill the same way as Cursor.

---

## Why It Matters

| Value | Description |
|-------|-------------|
| **Mainstream + enterprise-grade** | Specs align with widely adopted frameworks and big-tech software architecture best practices; your project speaks the same language as mature codebases. |
| **Team alignment** | Same norms across editors and repos; different members and teams stay in sync, with less drift and easier code review and handoff. |
| **Newcomer-friendly** | New joiners and new projects get a full, battle-tested spec in one shot—no need to reverse-engineer “how we do things here” or reinvent structure. |
| **Maintainability** | Specs live in one place; update once and re-run the skill to refresh projects. |
| **Multi-editor** | One best-practice set works in **OpenClaw**, **Claude Code**, Cursor, Codex, and more—no rewriting per tool. |

---

## Use Cases

- **New or empty project**: In an **empty** directory, say e.g. "先帮我加一份 Next.js 项目规约" or "Add project norms for a Go backend before I scaffold." The AI will ask for project type if needed, then write the spec so you have norms from the first commit. No need to init code first.
- **New project (after scaffold)**: In a freshly initialized repo, ask the AI to "initialize best practices for this stack"; it detects the stack and writes the spec.
- **Existing project**: In an existing codebase, ask to "set up project norms"; the AI detects the stack and adds or updates spec files.
- **Polyglot / monorepo**: For separate frontend/backend or monorepos, inject the right spec per subproject or path.
- **Team standard**: Use this repo (or a fork) as the team standard and install specs into each project with one prompt.

---

## Supported AI Editors

**Fully supported:** **OpenClaw**, **Claude Code**, **Cursor**, **Codex** — install the skill once, use in any of them. Project-level spec paths (in-repo only; user/global paths omitted):

| Tool | Project spec path | Notes |
|------|-------------------|-------|
| **OpenClaw** | `AGENTS.md`, `.codex/rules/*.rules`, skills dir | Same skill/rules model as Codex |
| **Claude Code** | `.claude/CLAUDE.md` or `.claude/rules/*.md` | Main spec + optional modular rules |
| **Cursor** | `.cursor/rules/` | One `.mdc` or `.md` per rule (with frontmatter) |
| **Codex** | `AGENTS.md`, `.codex/rules/*.rules`, skills dir | Per-tool docs |
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
./install-skill.sh --tool openclaw --scope global    # OpenClaw only
./install-skill.sh --tool claude --scope global      # Claude Code only
./install-skill.sh --tool all --scope local --target /path/to/my/project
./install-skill.sh --help
```

### Option A: AI only (no script for spec writing)

- **Cursor**: After running `install-skill.sh` (or manually copying the `aispec-skill/` directory to `.cursor/skills/aispec-skill/` in your project or `~/.cursor/skills/aispec-skill/`), the AI can read `SKILL.md` and add best practices when you ask.
- **OpenClaw / Claude Code**: Same as Cursor—run `install-skill.sh` for your editor, or clone and reference this repo with `@` in chat; the AI follows the skill flow (detect → pick spec → write to your project).

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
