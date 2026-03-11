---
name: aispec-best-practices
description: 检测项目类型并注入最佳实践规约。触发词："添加最佳实践"、"初始化项目规约"、"制定项目规范" 等。
---

# AISpec 技能

检测项目技术栈，将对应的最佳实践规约写入项目。无需脚本 — AI 读取本文件即可执行。

## 触发词

- "帮我添加最佳实践"
- "初始化项目规约"
- "帮我制定项目规范"
- "根据技术栈生成规范"
- 初始化场景："新建 Next.js 项目，先加规约"、"空项目，先定规范再写代码"

## 工作流

### 1. 检测技术栈

检查 `package.json`、`pyproject.toml`、`Cargo.toml`、`pubspec.yaml`、`CMakeLists.txt`、`go.mod`、`pom.xml`、`build.gradle`，以及 `src-tauri/`、`qml/` 等目录。

**空目录？** 问用户 1-2 个问题：项目类型 + 具体框架，然后从下表中选择。

### 2. 选择规约

规约位于 `best-practices/zh/`（中文）和 `best-practices/en/`（英文）。根据用户消息语言选择。

| 技术栈 | 路径（`best-practices/{lang}/` 下） |
|--------|--------------------------------------|
| Next.js / React 全栈 | `frontend/nextjs-vercel-reference.md` |
| Vue / Nuxt 3 | `frontend/vue-nuxt-reference.md` |
| React Native / Expo | `frontend/react-native-reference.md` |
| Flutter | `frontend/flutter-app-reference.md` |
| 小程序（微信/Taro/uni-app） | `miniapp/miniapp-reference.md` |
| Tauri（Rust+React）桌面 | `desktop/tauri-rust-react-desktop-reference.md` |
| Qt（C++/QML）桌面 | `desktop/qt-desktop-reference.md` |
| Python Qt（PySide6/PyQt6） | `desktop/python-qt-desktop-reference.md` |
| Go 后端 | `backend/go-project-reference.md` |
| Java / Spring Boot | `backend/java-backend-reference.md` |
| Python / FastAPI | `backend/python-backend-reference.md` |
| Node.js / Fastify / NestJS | `backend/nodejs-backend-reference.md` |
| Rust 系统服务 | `system-tools/rust-system-service-reference.md` |
| CLI（Rust/Go/Python/Node） | `system-tools/cli-tool-reference.md` |
| 技能开发 | `system-tools/skill-development-reference.md` |
| AI Agent / LLM / RAG | `ai-and-data/ai-agent-llm-reference.md` |
| 数据 / ML 工程 | `ai-and-data/data-ml-project-reference.md` |

前端/桌面项目还可参考 `frontend/ui-style-and-icons-reference.md`。

### 3. 写入项目

读取规约文件，将 `[项目名]` 替换为实际项目名，然后写入：

| 编辑器 | 写入路径 | 说明 |
|--------|----------|------|
| **Cursor** | `.cursor/rules/project-spec.mdc` | 一条规则一个文件，含 frontmatter |
| **Claude Code** | `.claude/CLAUDE.md` 或 `.claude/rules/project-spec.md` | 追加或新建；主规约 + 模块化规则均可 |
| **OpenClaw** | 见下方 OpenClaw 说明 | 默认从 workspace 读，非项目根；可写项目根以随仓版本管理 |
| **Codex** | `AGENTS.md` 或 `.codex/rules/` | 按 Codex 文档配置 |
| **Antigravity** (Google) | `.antigravity/rules.md` 或 `.agent/rules/project-spec.md` | 项目规则自动加载 |
| **Trae**（字节） | `.trae/project_rules.md` 或 `.trae/rules/project-spec.md` | Markdown 格式 |
| **Code Buddy**（腾讯云） | `.codebuddy/rules/project-spec/RULE.mdc` 或根目录 `AGENTS.md` | 每条规则一个子目录含 `RULE.mdc` |

若无法判断编辑器，默认按 Cursor 格式写入。

**OpenClaw 说明**：写代码时**默认以 Claude Code 为执行方**（如在 OpenClaw 中调起 Claude Code 写代码）。OpenClaw 从 **workspace**（配置项 `agent.workspace`，常见为 `~/.openclaw/workspace`）读取 `AGENTS.md`、`SOUL.md` 等，**不是**从“当前项目根目录”读。本技能仍建议在**当前项目根目录**生成 `AGENTS.md`（及可选 `SOUL.md`），以便规约随仓库版本管理、团队共享；用户若希望 OpenClaw 使用该规约，可：(1) 将 OpenClaw 的 workspace 指向项目根，或 (2) 把项目根下的 `AGENTS.md` 复制/链接到自己的 workspace。规约文件都写在当前项目根，不写到 `~/.openclaw/` 或其它项目。

### 4. 确认

列出检测到的技术栈、选择的规约及输出路径。建议用户查看 `best-practices/{lang}/README.md` 了解更多可用规约。

## 规则

- 只使用 `best-practices/` 中的内容，不可自行编造。
- 生成的规约中不使用 emoji。
- **先规约后代码**：未先创建或安装项目规约前，不编写业务/功能代码。若用户同时要求「加规约」和「写代码」，先完成规约写入并简要确认，再根据规约写代码。空项目或新项目也须先有规约（或用户明确说「先写代码、规约稍后」）再动代码。
- 若 AI 无法读取 `best-practices/`（技能不在上下文中），提示用户克隆仓库或运行 `aispec-skill/scripts/install.sh`。
