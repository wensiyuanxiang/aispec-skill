---
name: aispec-best-practices
description: Detect project type and install or generate project best-practice specs for Claude Code, OpenClaw, Cursor, and other AI editors. Use when creating or initializing a new project (including empty dir), or when the user asks to add best practices, set up project norms, initialize specs, or get project-specific coding guidelines.
---

# AISpec Skill — Best-Practice Setup

You help users **initialize or update project best-practice specs** by detecting the project type and installing the right reference(s) from this repo. Support both **Chinese** (`best-practices/zh/`) and **English** (`best-practices/en/`) content.

## How This Skill Works (No Script Required)

This skill works **by the AI following this SKILL.md**: when the user asks to add best practices or set up project norms, the AI (Cursor / Claude Code / etc.) reads this file, detects the project from the repo contents, picks the right spec from `best-practices/`, and writes it into the user's project. **No separate script is required** as long as the AI has access to this repo (e.g. skill installed or referenced with `@`). If the AI cannot read `best-practices/` (e.g. user is in another project and the skill repo is not in context), the repo also provides an optional **install script** so the user can run it locally; see the "Script (optional)" section in the root README.

---

## When to Use This Skill

Apply this skill when the user says things like:

- "帮我添加一下最佳实践" / "Add best practices for this project"
- "帮我制定一下当前项目规范" / "Set up project norms / coding standards"
- "初始化项目规约" / "Initialize project specs"
- "根据当前技术栈生成开发规范" / "Generate dev guidelines for this stack"
- "给这个项目配一套 AI 协作规范" / "Configure AI collaboration rules for this project"
- **Init-time (new or empty project):** "我要新建一个 Next.js 项目，先帮我加规约" / "Before I start coding, add project norms for a Go backend" / "新建项目，先定规范再写代码" / "Empty project — set up specs for Vue/Nuxt first"

### Proactive suggestion

When the **project directory is empty or has no detectable stack** (no `package.json`, `pyproject.toml`, `Cargo.toml`, etc.), or when the user says they are **starting a new project**, you may briefly suggest:

- **中文**：当前目录暂无技术栈特征。需要我根据 AISpec Skill 先为这个项目加一份规约吗？请告诉我要做的项目类型（如 Next.js / Go 后端 / Flutter / 小程序 等），我会写入对应最佳实践，之后你再初始化代码即可。
- **English**: This directory has no detectable stack yet. Should I add a project spec first via AISpec Skill? Tell me the project type (e.g. Next.js / Go backend / Flutter / miniprogram), and I’ll write the matching best practices before you scaffold the code.

Do not repeat the suggestion every turn; once is enough unless the user asks again.

---

## Workflow

### 1. Detect Project Type (or Ask When Empty)

Inspect the repository to infer:

- **Language(s)**: Go, Java, Python, Node/TS, Rust, C++/Qt, Dart (Flutter), etc.
- **Framework / platform**: Next.js, Nuxt, React Native, Flutter, Tauri, Qt, FastAPI, Spring Boot, etc.
- **Target**: Web, desktop, mobile app, miniprogram, backend, CLI, AI/LLM, data/ML

Use file presence and content: `package.json`, `pyproject.toml`, `Cargo.toml`, `pubspec.yaml`, `CMakeLists.txt`, `go.mod`, `pom.xml` / `build.gradle`, directory layout (`app/`, `src-tauri/`, `qml/`, etc.).

**If the project is empty or has no detectable stack:** do not skip the skill. Ask the user (1–2 questions max):

1. **项目类型 / Project type:** 前端 Web（React/Vue/Next/Nuxt）、后端（Go/Java/Python/Node）、桌面（Tauri/Qt/Python Qt）、移动（Flutter/React Native）、小程序、CLI、AI/LLM、数据/ML 等。
2. **具体技术栈（若类型仍不唯一）:** 如 "Next.js"、"FastAPI"、"Flutter"。

Then **select the spec by user choice** using the same mapping table below (e.g. user says "Next.js" → use nextjs-vercel-reference). This way the user can get the spec **before** running `create-next-app` or any scaffold, so the project has norms from the first commit.

### 2. Ask Minimal Clarifying Questions (If Needed)

Only ask when detection is ambiguous, for example:

- "检测到同时存在 React 与 Vue，请确认以哪个为主？" / "Both React and Vue detected; which is primary?"
- "项目是 Next.js 全栈还是仅前端？" / "Is this a Next.js full-stack or frontend-only?"
- "需要生成中文还是英文规约？" / "Should the specs be in Chinese or English?"

Default to **one** primary stack and **user's language** (from message or locale) for spec language.

### 3. Select Spec File(s)

Map to the spec files in this repo (paths relative to repo root):

| Detected stack | Chinese spec | English spec |
|----------------|--------------|--------------|
| Next.js, Vercel, React full-stack | `best-practices/zh/frontend/nextjs-vercel-reference.md` | `best-practices/en/frontend/nextjs-vercel-reference.md` |
| Vue, Nuxt 3 | `best-practices/zh/frontend/vue-nuxt-reference.md` | `best-practices/en/frontend/vue-nuxt-reference.md` |
| React Native, Expo | `best-practices/zh/frontend/react-native-reference.md` | `best-practices/en/frontend/react-native-reference.md` |
| Flutter | `best-practices/zh/frontend/flutter-app-reference.md` | `best-practices/en/frontend/flutter-app-reference.md` |
| WeChat miniprogram, Taro, uni-app | `best-practices/zh/miniapp/miniapp-reference.md` | `best-practices/en/miniapp/miniapp-reference.md` |
| Tauri (Rust + React) desktop | `best-practices/zh/desktop/tauri-rust-react-desktop-reference.md` | `best-practices/en/desktop/tauri-rust-react-desktop-reference.md` |
| Qt (C++/QML) desktop | `best-practices/zh/desktop/qt-desktop-reference.md` | `best-practices/en/desktop/qt-desktop-reference.md` |
| Python Qt (PySide6/PyQt6) desktop | `best-practices/zh/desktop/python-qt-desktop-reference.md` | `best-practices/en/desktop/python-qt-desktop-reference.md` |
| Go backend | `best-practices/zh/backend/go-project-reference.md` | `best-practices/en/backend/go-project-reference.md` |
| Java, Spring Boot | `best-practices/zh/backend/java-backend-reference.md` | `best-practices/en/backend/java-backend-reference.md` |
| Python, FastAPI | `best-practices/zh/backend/python-backend-reference.md` | `best-practices/en/backend/python-backend-reference.md` |
| Node.js, Fastify/NestJS | `best-practices/zh/backend/nodejs-backend-reference.md` | `best-practices/en/backend/nodejs-backend-reference.md` |
| Rust system/service | `best-practices/zh/system-tools/rust-system-service-reference.md` | `best-practices/en/system-tools/rust-system-service-reference.md` |
| CLI (Rust/Go/Python/Node) | `best-practices/zh/system-tools/cli-tool-reference.md` | `best-practices/en/system-tools/cli-tool-reference.md` |
| Skill development (Cursor/Claude skills) | `best-practices/zh/system-tools/skill-development-reference.md` | `best-practices/en/system-tools/skill-development-reference.md` |
| AI Agent, LLM, RAG | `best-practices/zh/ai-and-data/ai-agent-llm-reference.md` | `best-practices/en/ai-and-data/ai-agent-llm-reference.md` |
| Data / ML engineering | `best-practices/zh/ai-and-data/data-ml-project-reference.md` | `best-practices/en/ai-and-data/data-ml-project-reference.md` |

If multiple apply (e.g. monorepo with Next.js + Go), select the most relevant or offer to install more than one. Optionally include **UI/style reference**: `best-practices/zh/frontend/ui-style-and-icons-reference.md` or `best-practices/en/frontend/ui-style-and-icons-reference.md` for frontend/desktop projects.

### 4. Install Into the User's Project

- **Read** the chosen spec file(s) from this repo (or from the path where the skill is installed).
- **Replace** `[项目名]` / `[Project Name]` with the actual project name (from repo name or user input).
- **Write** the content to the user's project in the format expected by their AI editor:
  - **Cursor**: Create or update a rule file under `.cursor/rules/` (e.g. `project-spec.mdc` or `best-practices.mdc`). One rule file per spec; use frontmatter as required by Cursor.
  - **Claude Code**: Create or update `.claude/CLAUDE.md` or add a file under `.claude/rules/` (e.g. `project-spec.md`).
  - **Codex / OpenClaw / other**: Create or update the project-level spec file they use (e.g. `AGENTS.md`, `.codex/rules/`, etc.) as documented in the main README.
- If the user did not specify an editor, default to **Cursor** (`.cursor/rules/`) and mention that the same content can be used for Claude/Codex by copying to the right paths.

### 5. Confirm and Summarize

- List what was detected (language, framework, target).
- List the spec file(s) chosen and where they were written.
- Optionally suggest: "You can add more specs from `best-practices/zh/README.md` or `best-practices/en/README.md` if you add other stacks."

---

## Rules

- **Do not** invent spec content; only use or adapt the content from the `best-practices/zh/` and `best-practices/en/` files in this repo.
- **Do not** add emoji to the generated spec files; the specs themselves forbid emoji in UI and copy.
- **Personal Imports** (e.g. `~/.claude/rules/common/...`) in the spec are optional; leave them as-is unless the user asks to remove or change them.
- If the repo is not the aispec-skill repo, you may not have direct read access to `best-practices/`; in that case, **output the workflow** (detect → choose spec → install path) and ask the user to paste the spec content or clone the repo and run from there.

---

## Index Reference

- **Chinese index**: `best-practices/zh/README.md`
- **English index**: `best-practices/en/README.md`
- **Root README**: Installation and usage for this skill; supported editors and spec paths.
