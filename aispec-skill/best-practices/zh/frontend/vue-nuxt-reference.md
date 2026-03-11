# [项目名] Vue / Nuxt 项目 AI Agent 协作指南

你是一位精通 Vue 与 Nuxt 的资深软件工程师，熟悉 Vue 3、Composition API、Nuxt 3 与 Web 工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **运行时**: Node.js >= 20 (LTS)
- **框架**: Nuxt 3+，Vue 3+，Composition API 优先
- **语言**: TypeScript 严格模式 (`strict: true`)
- **样式**: Tailwind CSS；**界面与图标** 优先使用成熟组件库与图标库（如 Naive UI、Element Plus、Vuetify、Iconify），禁止在 UI 中用 emoji 替代图标
- **国际化**: vue-i18n 或 @nuxtjs/i18n；文案统一走 i18n，禁止硬编码展示文本
- **状态与数据**: Pinia；服务端状态用 useFetch / useAsyncData；客户端请求用 ofetch 或 axios 封装
- **部署**: Vercel、Netlify 或 Node 服务；环境变量从平台配置，禁止硬编码密钥
- **构建与质量**:
  - **包管理**: pnpm 优先，或 npm / yarn
  - **校验**: ESLint (Vue 推荐)、Prettier
  - **类型**: 全项目 TypeScript，禁止 `any`
  - **测试**: Vitest（单元/组件），Playwright（E2E）；覆盖率目标 >= 80%

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 遵循 Nuxt 3 约定。`pages/` 按路由；`components/` 按领域或通用/业务拆分；`composables/` 放可复用逻辑；`stores/` 放 Pinia；类型集中 `types/` 或随模块共置。
- **服务端优先**: **[强制]** 能放在 Server 的逻辑不放在 Client；数据获取优先 useFetch/useAsyncData；仅交互与客户端状态用 Client。
- **错误与边界**: **[强制]** 使用 `error.vue` 做错误边界；关键路由提供 loading；API 调用统一错误处理与用户提示。
- **国际化与展示**: **[强制]** 所有用户可见文案通过 i18n 配置，支持多语言切换；禁止在界面、文案、代码、注释中使用 emoji。
- **安全**: **[强制]** 用户输入校验与转义；敏感操作需服务端校验；环境变量仅需暴露的加前缀，其余仅服务端使用。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 优先 Vue/Nuxt 生态**: 在 Vue/Nuxt 生态内有官方或推荐方案时优先采用，避免过度抽象。
- **[流程] 审查优先**: 实现新功能时，先阅读相关页面、组件与 composables，理解现有逻辑，以列表形式提出实现计划，待确认后再编码。
- **[实践] 组件与可访问性**: 组件单一职责、可组合；表单与交互考虑 a11y。
- **[实践] 性能**: 大列表虚拟化；图片懒加载；按需动态导入重型组件。
- **[产出] 解释代码**: 在生成复杂逻辑或组件后，用注释或对话简要说明核心逻辑与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-vue.md`
