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

- **Cursor**：`.cursor/rules/project-spec.mdc`
- **Claude Code**：`.claude/CLAUDE.md`（追加或新建）或 `.claude/rules/project-spec.md`
- **Codex / OpenClaw**：`AGENTS.md` 或 `.codex/rules/`
- 若无法判断编辑器，默认按 Cursor 格式写入。

### 4. 确认

列出检测到的技术栈、选择的规约及输出路径。建议用户查看 `best-practices/{lang}/README.md` 了解更多可用规约。

## 规则

- 只使用 `best-practices/` 中的内容，不可自行编造。
- 生成的规约中不使用 emoji。
- 若 AI 无法读取 `best-practices/`（技能不在上下文中），提示用户克隆仓库或运行 `aispec-skill/scripts/install.sh`。
