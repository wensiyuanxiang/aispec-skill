# 开发规约索引（中文）

本目录为中文最佳实践规约，按技术栈与场景分类，供 AI Agent 与开发者参考。使用前将 `[项目名]` 替换为实际项目名称。

---

## 前端 / 客户端

| 规约 | 文件 | 适用场景 |
|------|------|----------|
| Next.js + Vercel | `frontend/nextjs-vercel-reference.md` | 现代 React 全栈、Vercel 部署 |
| Vue / Nuxt | `frontend/vue-nuxt-reference.md` | Vue 3、Nuxt 3、SSR/SSG |
| React Native | `frontend/react-native-reference.md` | 跨平台移动端、Expo |
| Flutter | `frontend/flutter-app-reference.md` | Flutter 移动端、Material/Cupertino |
| 小程序 | `miniapp/miniapp-reference.md` | 微信小程序、Taro、uni-app 多端 |

---

## 后端服务

| 规约 | 文件 | 适用场景 |
|------|------|----------|
| Go | `backend/go-project-reference.md` | Go HTTP 服务、云原生 |
| Java | `backend/java-backend-reference.md` | Spring Boot、企业级后端 |
| Python | `backend/python-backend-reference.md` | FastAPI、异步 Python 后端 |
| Node.js | `backend/nodejs-backend-reference.md` | Fastify、NestJS、TypeScript 后端 |

---

## 桌面端

| 规约 | 文件 | 适用场景 |
|------|------|----------|
| Tauri (Rust + React) | `desktop/tauri-rust-react-desktop-reference.md` | 跨平台桌面应用、Rust 壳 + 前端 |
| Qt (C++/QML) | `desktop/qt-desktop-reference.md` | Qt 6 桌面应用、C++/QML 原生 UI |
| Python Qt (PySide6/PyQt6) | `desktop/python-qt-desktop-reference.md` | Python 桌面应用、PySide6/PyQt6 |

---

## 系统与工具

| 规约 | 文件 | 适用场景 |
|------|------|----------|
| Rust 系统/服务 | `system-tools/rust-system-service-reference.md` | Rust 后端、高性能服务 |
| CLI 工具 | `system-tools/cli-tool-reference.md` | 命令行工具、多语言 CLI |
| 技能开发（Skill 开发） | `system-tools/skill-development-reference.md` | 开发 Cursor/Claude 等编辑器用 Skill；可与 create-skill 配合 |

---

## AI 与数据

| 规约 | 文件 | 适用场景 |
|------|------|----------|
| AI Agent / LLM 应用 | `ai-and-data/ai-agent-llm-reference.md` | LangChain、RAG、Agent、Prompt 工程 |
| 数据 / ML 工程 | `ai-and-data/data-ml-project-reference.md` | ETL、特征工程、MLOps、数据管道 |

---

## 样式与图标库参考

| 文档 | 说明 |
|------|------|
| 样式库与图标库参考（`frontend/ui-style-and-icons-reference.md`） | Web / 桌面 / App / 小程序 的样式方案、UI 组件库与图标库选型表，含推荐链接与各规约对应关系 |

---

## 通用约定

- **Git**: 所有规约统一要求 Conventional Commits
- **国际化**: 前端与客户端项目强制支持 i18n
- **界面与图标**: 优先使用成熟组件库与图标库，禁止 emoji
- **文案与输出**: 禁止在代码、注释、文档、日志中使用 emoji
