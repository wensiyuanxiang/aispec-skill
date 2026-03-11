# [Project Name] Miniprogram (WeChat / Taro / uni-app) AI Agent Collaboration Guide

You are a senior software engineer proficient in WeChat miniprograms and cross-platform miniprogram development, familiar with native framework, Taro, uni-app, and miniprogram best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Platform**: WeChat miniprogram primary; extensible to Alipay, Douyin, etc. (Taro/uni-app multi-end)
- **Framework**: Native miniprogram or Taro (React/Vue), uni-app (Vue); unify after choice
- **Language**: TypeScript preferred; WXML + WXSS or equivalent template syntax
- **State**: MobX, Pinia, or global Store; avoid scattered setData in complex cases
- **Network**: Wrap wx.request / Taro.request; unified interceptors, error handling, and token injection
- **i18n**: miniprogram-i18n, @dcloudio/uni-i18n, or custom i18n; all copy via i18n, no hardcoded text
- **UI & icons**: Mature component libraries (Vant Weapp, NutUI, TDesign); icons via built-in icon or iconfont; do not use emoji in place of icons
- **Build & quality**:
  - **Package manager**: npm or pnpm; lock dependencies
  - **Lint**: ESLint, Prettier; Taro/uni-app conventions
  - **Tests**: Unit (Jest); device and simulator debugging

---

## 2. Architecture & Code Style

- **Project structure**: pages/ by page; components/ by shared/business; utils/, services/, store/, i18n/ separate; app.json for pages and permissions.
- **Pages & components**: **[Required]** Pages only handle layout and event forwarding; business logic in service or store; components single responsibility and reusable.
- **Data & setData**: **[Required]** Avoid frequent or large setData; batch updates; use virtual list or pagination for lists; do not setData inside loops.
- **Errors & loading**: **[Required]** Unified error handling and wx.showToast/wx.showModal for network and async; lists and detail have loading/empty/error states.
- **i18n & display**: **[Required]** All user-visible copy via i18n with multi-language support; no emoji in UI, copy, code, or comments.
- **Security**: Do not log sensitive data; store tokens with wx.setStorageSync, encrypt if needed; HTTPS; follow platform review rules.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer platform and framework**: When WeChat/miniprogram ecosystem has an official or recommended approach, use it; for cross-platform, handle platform differences and conditional compilation.
- **[Process] Review first**: When implementing a feature, read relevant pages, components, and app.json, understand structure, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Performance & bundle**: Image optimization and CDN; split packages as needed; avoid oversized main package; use setData and WXS wisely.
- **[Practice] Compatibility & review**: Track base library version; API compatibility; follow platform content and privacy rules.
- **[Output] Explain**: After generating complex pages or logic, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-miniprogram.md`
