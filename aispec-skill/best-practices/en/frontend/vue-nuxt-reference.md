# [Project Name] Vue / Nuxt AI Agent Collaboration Guide

You are a senior software engineer proficient in Vue and Nuxt, familiar with Vue 3, Composition API, Nuxt 3, and web engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Runtime**: Node.js >= 20 (LTS)
- **Framework**: Nuxt 3+, Vue 3+, Composition API preferred
- **Language**: TypeScript strict mode (`strict: true`)
- **Styling**: Tailwind CSS; **UI & icons**: prefer mature component and icon libraries (e.g. Naive UI, Element Plus, Vuetify, Iconify); do not use emoji in place of icons in the UI
- **i18n**: vue-i18n or @nuxtjs/i18n; all copy via i18n, no hardcoded display text
- **State & data**: Pinia; server state via useFetch / useAsyncData; client requests via ofetch or axios wrapper
- **Deployment**: Vercel, Netlify, or Node server; env vars from platform config; never hardcode secrets
- **Build & quality**:
  - **Package manager**: pnpm preferred, or npm / yarn
  - **Lint**: ESLint (Vue recommended), Prettier
  - **Types**: Full TypeScript; no `any`
  - **Tests**: Vitest (unit/component), Playwright (E2E); coverage target >= 80%

---

## 2. Architecture & Code Style

- **Project structure**: Follow Nuxt 3 conventions. `pages/` by route; `components/` by domain or shared/business; `composables/` for reusable logic; `stores/` for Pinia; types in `types/` or co-located.
- **Server-first**: **[Required]** Prefer server over client; data fetching via useFetch/useAsyncData; use client only for interactivity and client state.
- **Errors & boundaries**: **[Required]** Use error.vue for error boundary; loading for key routes; unified error handling and user feedback for API calls.
- **i18n & display**: **[Required]** All user-visible copy via i18n with multi-language support; no emoji in UI, copy, code, or comments.
- **Security**: **[Required]** Validate and escape user input; sensitive operations require server-side validation; expose only needed env vars to client.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer Vue/Nuxt ecosystem**: When Vue/Nuxt has an official or recommended approach, use it; avoid over-abstraction.
- **[Process] Review first**: When implementing a feature, read relevant pages, components, and composables, understand existing logic, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Components & a11y**: Single responsibility and composable components; consider a11y for forms and interaction.
- **[Practice] Performance**: Virtualize long lists; lazy-load images; dynamically import heavy components when appropriate.
- **[Output] Explain**: After generating complex logic, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-vue.md`
