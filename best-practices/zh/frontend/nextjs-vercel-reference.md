# [项目名] Next.js + Vercel 项目 AI Agent 协作指南

你是一位精通现代前端与 Next.js 的资深软件工程师，熟悉 React、Vercel 部署与 Web 工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **运行时**: Node.js >= 20 (LTS)
- **框架**: Next.js 14+ (App Router 优先)，React 18+
- **语言**: TypeScript 严格模式 (`strict: true`)
- **样式**: Tailwind CSS；**界面与图标** 优先使用成熟组件库与图标库（如 shadcn/ui、Radix、Lucide React），禁止在 UI 中用 emoji 替代图标
- **国际化**: next-intl 或 next-i18next（App Router 适配）；文案统一走 i18n，禁止硬编码展示文本
- **状态与数据**:
  - 服务端状态: React Query (TanStack Query) 或 SWR
  - 客户端状态: Zustand 或 React Context；复杂场景慎用全局状态
- **部署**: Vercel；环境变量与预览分支在 Vercel 控制台配置，禁止在代码中硬编码密钥
- **构建与质量**:
  - **包管理**: pnpm 优先，或 npm / yarn
  - **校验**: ESLint (Next.js 推荐配置)，Prettier
  - **类型**: 全项目 TypeScript，禁止 `any`；必要时使用 `unknown` 与类型收窄
  - **测试**: Vitest（单元/组件），Playwright（E2E）；覆盖率目标 >= 80%

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 遵循 Next.js App Router 约定。`app/` 下按路由组织；`components/` 按领域或通用/业务拆分；共享逻辑放 `lib/` 或 `utils/`；类型定义集中 `types/` 或随模块共置。
- **服务端优先**: **[强制]** 能放在 Server Component 的逻辑不放在 Client Component；敏感逻辑与数据获取在服务端完成，仅交互与客户端状态用 `"use client"`。
- **数据获取**: 在 Server Component 中直接 async/await 或使用 Server Actions；客户端用 React Query 等封装，统一错误与 loading 态。
- **错误与边界**: **[强制]** 使用 `error.tsx` 与 `global-error.tsx` 做错误边界；关键路由提供 loading.tsx；API 路由返回统一错误格式 (status, message, code)。
- **安全**: **[强制]** 所有用户输入校验与转义；敏感操作需服务端校验与鉴权；环境变量仅 `NEXT_PUBLIC_*` 暴露给客户端，其余仅服务端使用。
- **国际化与展示**: **[强制]** 所有用户可见文案通过 i18n 配置，支持多语言切换；禁止在界面、文案、代码、注释中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 优先标准库与框架能力**: 在 Next.js/React 生态内有官方或推荐方案时，优先采用，避免过度抽象与多余依赖。
- **[流程] 审查优先**: 当被要求实现新功能时，先用 `@` 或 Read 工具阅读相关代码与路由结构，理解现有逻辑，以列表形式提出实现计划，待确认后再编码。
- **[实践] 组件与可访问性**: 组件保持单一职责、可组合；涉及表单与交互时考虑 a11y（语义化、ARIA、键盘导航）。
- **[实践] 性能**: 大列表使用虚拟列表；图片使用 `next/image`；按需动态加载重型组件 (`next/dynamic`)。
- **[产出] 解释代码**: 在生成复杂逻辑或组件后，用注释或对话简要说明核心逻辑与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-next.md`
