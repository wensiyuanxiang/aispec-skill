# AISpec Skill (aispec-skill)

通用型 AI 编码助手技能：统一管理、自动生成、格式转换主流 AI 编辑器的开发规约、编码规范与最佳实践。

---

## 项目定位

AISpec Skill 是一套**通用型 AI 编码助手技能**，用于：

- **统一管理**：一份配置管理多工具规约
- **自动生成**：根据项目语言、技术栈、架构自动生成中英文双语最佳实践与开发规范
- **格式转换**：将规约转换为各 AI 编辑器支持的官方格式，并在项目根目录创建对应规范文件

## 支持的 AI 编辑器

每个工具在**项目根目录**下读取的规约文件/目录如下（仅列项目级，不含用户全局路径）：

| 工具 | 项目规约路径（工程内） | 说明 |
|------|------------------------|------|
| **Claude Code** | `.claude/CLAUDE.md` | 主规约文件；可配合 `.claude/rules/` 下多份 `.md` 做模块化 |
| **Cursor** | `.cursor/rules/` | 目录下每条规则一个 `.mdc` 或 `.md`（含 frontmatter）；旧版单文件 `.cursorrules` 已废弃 |
| **Codex** | 项目约定：根目录 `AGENTS.md`<br>命令规则：`.codex/rules/*.rules`<br>技能：`.agents/skills/` | 规约与说明用 `AGENTS.md`；沙箱外命令用 `.codex/rules/`；技能为独立目录 |
| **Antigravity**（Google） | `.antigravity/rules.md`<br>工作空间规则：`.agent/rules/` | 项目级规则自动加载；工作流在 `.agent/workflows/` |
| **Trae**（国内，字节） | `.trae/project_rules.md` 或 `.trae/rules` | Markdown；项目规则优先于用户规则 `~/.trae/user_rules.md` |
| **Code Buddy**（国内，腾讯云） | `.codebuddy/rules/`<br>项目说明：根目录 `CODEBUDDY.md`（或 `AGENTS.md`） | 每条规则为子目录下的 `RULE.mdc`；无 `CODEBUDDY.md` 时回退到 `AGENTS.md` |

## 核心能力

1. **自动识别**：项目语言、技术栈、架构类型
2. **双语规范**：自动生成中英文最佳实践与开发规范
3. **多格式输出**：转换为各 AI 编辑器官方格式
4. **一键落地**：在项目根目录自动创建 `.claude/CLAUDE.md`、`.cursor/rules/`、`.trae/project_rules.md`、`.codebuddy/rules/` 等规约文件
5. **统一规则引擎**：一份配置生成所有工具的规约
6. **团队与工程化**：支持团队共享、工程化落地、一键初始化规范

## 仓库与贡献

- **仓库**：<https://github.com/wensiyuanxiang/aispec-skill>
- 欢迎提 Issue 与 Pull Request。

---

# AISpec Skill (aispec-skill)

A universal AI coding assistant skill for managing, auto-generating, and converting development rules, coding standards, and best practices for mainstream AI editors.

---

## Purpose

AISpec Skill is a **universal AI coding assistant skill** that:

- **Unifies** rule management across tools with a single config
- **Auto-generates** bilingual (EN/ZH) best practices and development guidelines from project language, stack, and architecture
- **Converts** rules into each AI editor’s official format and creates the corresponding spec files in the project root

## Supported AI Editors

Per-editor **project-level** spec paths (under project root only; user/global paths omitted):

| Tool | Project spec path (in repo) | Notes |
|------|-----------------------------|--------|
| **Claude Code** | `.claude/CLAUDE.md` | Main spec; optional modular rules in `.claude/rules/*.md` |
| **Cursor** | `.cursor/rules/` | One `.mdc` or `.md` per rule (with frontmatter); legacy `.cursorrules` deprecated |
| **Codex** | Project: root `AGENTS.md`<br>Command rules: `.codex/rules/*.rules`<br>Skills: `.agents/skills/` | Spec text in `AGENTS.md`; sandbox rules in `.codex/rules/`; skills in `.agents/skills/` |
| **Antigravity** (Google) | `.antigravity/rules.md`<br>Workspace: `.agent/rules/` | Project rules auto-loaded; workflows in `.agent/workflows/` |
| **Trae** (CN, ByteDance) | `.trae/project_rules.md` or `.trae/rules` | Markdown; overrides user rules at `~/.trae/user_rules.md` |
| **Code Buddy** (CN, Tencent) | `.codebuddy/rules/`<br>Overview: root `CODEBUDDY.md` or `AGENTS.md` | One `RULE.mdc` per rule in subdirs; falls back to `AGENTS.md` if no `CODEBUDDY.md` |

## Core Features

1. **Auto-detect** project language, tech stack, and architecture
2. **Bilingual specs** auto-generated in English and Chinese
3. **Multi-format output** for each editor’s official format
4. **One-shot setup** creating `.claude/CLAUDE.md`, `.cursor/rules/`, `.trae/project_rules.md`, `.codebuddy/rules/`, etc. in the project root
5. **Unified rule engine** so one config generates specs for all tools
6. **Team & CI** support for shared rules and one-command spec initialization

## Repo & Contributing

- **Repo**: <https://github.com/wensiyuanxiang/aispec-skill>
- Issues and Pull Requests welcome.
