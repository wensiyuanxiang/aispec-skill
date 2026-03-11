---
name: aispec-best-practices
description: Detect project type and inject best-practice specs. Triggers on "添加最佳实践", "Add best practices", "初始化项目规约", "制定项目规范", etc.
---

# AISpec Skill

Inject project best-practice specs by detecting the stack and writing the right reference into the user's project. No script required — AI reads this file and acts.

## Triggers

- "帮我添加最佳实践" / "Add best practices"
- "初始化项目规约" / "Initialize project specs"
- "帮我制定项目规范" / "Set up project norms"
- "根据技术栈生成规范" / "Generate dev guidelines for this stack"
- Init-time: "新建 Next.js 项目，先加规约" / "Empty project — set up specs first"

## Workflow

### 1. Detect stack

Check `package.json`, `pyproject.toml`, `Cargo.toml`, `pubspec.yaml`, `CMakeLists.txt`, `go.mod`, `pom.xml`, `build.gradle`, dirs like `src-tauri/`, `qml/`.

**Empty dir?** Ask 1-2 questions: project type + specific framework, then select from the table below.

### 2. Select spec

Specs are under `best-practices/zh/` (Chinese) and `best-practices/en/` (English). Choose language by user's message language.

| Stack | Path (under `best-practices/{lang}/`) |
|-------|----------------------------------------|
| Next.js / React full-stack | `frontend/nextjs-vercel-reference.md` |
| Vue / Nuxt 3 | `frontend/vue-nuxt-reference.md` |
| React Native / Expo | `frontend/react-native-reference.md` |
| Flutter | `frontend/flutter-app-reference.md` |
| Miniprogram (WeChat/Taro/uni-app) | `miniapp/miniapp-reference.md` |
| Tauri (Rust+React) desktop | `desktop/tauri-rust-react-desktop-reference.md` |
| Qt (C++/QML) desktop | `desktop/qt-desktop-reference.md` |
| Python Qt (PySide6/PyQt6) | `desktop/python-qt-desktop-reference.md` |
| Go backend | `backend/go-project-reference.md` |
| Java / Spring Boot | `backend/java-backend-reference.md` |
| Python / FastAPI | `backend/python-backend-reference.md` |
| Node.js / Fastify / NestJS | `backend/nodejs-backend-reference.md` |
| Rust system/service | `system-tools/rust-system-service-reference.md` |
| CLI (Rust/Go/Python/Node) | `system-tools/cli-tool-reference.md` |
| Skill development | `system-tools/skill-development-reference.md` |
| AI Agent / LLM / RAG | `ai-and-data/ai-agent-llm-reference.md` |
| Data / ML engineering | `ai-and-data/data-ml-project-reference.md` |

Frontend/desktop projects may also benefit from `frontend/ui-style-and-icons-reference.md`.

### 3. Write to project

Read the spec, replace `[项目名]` / `[Project Name]` with actual name, then write:

| Editor | Write path | Notes |
|--------|------------|-------|
| **Cursor** | `.cursor/rules/project-spec.mdc` | One rule per file with frontmatter |
| **Claude Code** | `.claude/CLAUDE.md` or `.claude/rules/project-spec.md` | Append or create; main spec + modular rules |
| **OpenClaw** | See OpenClaw note below | Reads from workspace by default, not project root; can write to project root for version control |
| **Codex** | `AGENTS.md` or `.codex/rules/` | Per Codex docs |
| **Antigravity** (Google) | `.antigravity/rules.md` or `.agent/rules/project-spec.md` | Project rules auto-loaded |
| **Trae** (ByteDance) | `.trae/project_rules.md` or `.trae/rules/project-spec.md` | Markdown format |
| **Code Buddy** (Tencent) | `.codebuddy/rules/project-spec/RULE.mdc` or root `AGENTS.md` | One subdir per rule with `RULE.mdc` |

Default to Cursor format if editor unknown.

**OpenClaw**: By default **Claude Code is the code-writing agent** (e.g. OpenClaw invokes Claude Code to write code). OpenClaw loads `AGENTS.md` and `SOUL.md` from the **workspace** (config `agent.workspace`, often `~/.openclaw/workspace`), not from the current project root. This skill still writes **project-root** `AGENTS.md` (and optional `SOUL.md`) so the spec is versioned with the repo and shareable; the user can then point OpenClaw's workspace at the project root or copy/link project-root `AGENTS.md` into their workspace. Write the spec under the current project root only, not under `~/.openclaw/` or another project.

### 4. Confirm

List detected stack, spec chosen, and output path. Suggest checking `best-practices/{lang}/README.md` for more specs.

## Rules

- Only use content from `best-practices/` files; do not invent.
- No emoji in generated specs.
- **Spec before code**: Do not write application/feature code until project spec has been created or installed. If the user asks for both "add spec" and "write code", complete the spec first and confirm briefly, then write code according to the spec. For empty or new projects, require spec first (or explicit user request to "write code first, spec later") before writing code.
- If the AI cannot read `best-practices/` (skill not in context), tell the user to clone the repo or run `aispec-skill/scripts/install.sh`.
