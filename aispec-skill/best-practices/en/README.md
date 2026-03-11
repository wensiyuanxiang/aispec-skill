# Best Practices Index (English)

This directory contains English best-practice specs, organized by tech stack and scenario for AI agents and developers. Replace `[Project Name]` with your actual project name before use.

---

## Frontend / Client

| Spec | File | Use case |
|------|------|----------|
| Next.js + Vercel | `frontend/nextjs-vercel-reference.md` | Modern React full-stack, Vercel deploy |
| Vue / Nuxt | `frontend/vue-nuxt-reference.md` | Vue 3, Nuxt 3, SSR/SSG |
| React Native | `frontend/react-native-reference.md` | Cross-platform mobile, Expo |
| Flutter | `frontend/flutter-app-reference.md` | Flutter mobile, Material/Cupertino |
| Miniprogram | `miniapp/miniapp-reference.md` | WeChat miniprogram, Taro, uni-app multi-end |

---

## Backend

| Spec | File | Use case |
|------|------|----------|
| Go | `backend/go-project-reference.md` | Go HTTP services, cloud-native |
| Java | `backend/java-backend-reference.md` | Spring Boot, enterprise backend |
| Python | `backend/python-backend-reference.md` | FastAPI, async Python backend |
| Node.js | `backend/nodejs-backend-reference.md` | Fastify, NestJS, TypeScript backend |

---

## Desktop

| Spec | File | Use case |
|------|------|----------|
| Tauri (Rust + React) | `desktop/tauri-rust-react-desktop-reference.md` | Cross-platform desktop, Rust shell + frontend |
| Qt (C++/QML) | `desktop/qt-desktop-reference.md` | Qt 6 desktop, C++/QML native UI |
| Python Qt (PySide6/PyQt6) | `desktop/python-qt-desktop-reference.md` | Python desktop, PySide6/PyQt6 |

---

## System & Tools

| Spec | File | Use case |
|------|------|----------|
| Rust system/service | `system-tools/rust-system-service-reference.md` | Rust backend, high-perf services |
| CLI tool | `system-tools/cli-tool-reference.md` | Command-line tools, multi-language CLI |

---

## AI & Data

| Spec | File | Use case |
|------|------|----------|
| AI Agent / LLM | `ai-and-data/ai-agent-llm-reference.md` | LangChain, RAG, Agent, prompt engineering |
| Data / ML | `ai-and-data/data-ml-project-reference.md` | ETL, feature engineering, MLOps, pipelines |

---

## UI Style & Icons Reference

| Document | Description |
|----------|-------------|
| UI style & icons reference (`frontend/ui-style-and-icons-reference.md`) | Styling, UI component libs, and icon libs for Web / desktop / App / miniprogram, with links and spec mapping |

---

## Common Conventions

- **Git**: All specs require Conventional Commits.
- **i18n**: Frontend and client projects must support i18n.
- **UI & icons**: Prefer mature component and icon libraries; no emoji in place of icons.
- **Copy & output**: No emoji in code, comments, docs, or logs.
