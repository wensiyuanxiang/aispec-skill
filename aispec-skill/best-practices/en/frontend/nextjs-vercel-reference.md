# [Project Name] Next.js + Vercel AI Agent Collaboration Guide

You are a senior software engineer proficient in modern frontend and Next.js, familiar with React, Vercel deployment, and web engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Runtime**: Node.js >= 20 (LTS)
- **Framework**: Next.js 14+ (App Router preferred), React 18+
- **Language**: TypeScript strict mode (`strict: true`)
- **Styling**: Tailwind CSS; **UI & icons**: prefer mature component and icon libraries (e.g. shadcn/ui, Radix, Lucide React); do not use emoji in place of icons in the UI
- **i18n**: next-intl or next-i18next (App Router compatible); all copy via i18n, no hardcoded display text
- **State & data**:
  - Server state: React Query (TanStack Query) or SWR
  - Client state: Zustand or React Context; use global state sparingly for complex cases
- **Deployment**: Vercel; env vars and preview branches in Vercel dashboard; never hardcode secrets in code
- **Build & quality**:
  - **Package manager**: pnpm preferred, or npm / yarn
  - **Lint**: ESLint (Next.js recommended config), Prettier
  - **Types**: Full TypeScript; no `any`; use `unknown` and type narrowing when needed
  - **Tests**: Vitest (unit/component), Playwright (E2E); coverage target >= 80%

---

## 2. Architecture & Code Style

- **Project structure**: Follow Next.js App Router conventions. Organize `app/` by route; `components/` by domain or shared/business; shared logic in `lib/` or `utils/`; types in `types/` or co-located.
- **Server-first**: **[Required]** Prefer Server Components; keep sensitive logic and data fetching on the server; use `"use client"` only for interactivity and client state.
- **Data fetching**: Direct async/await in Server Components or Server Actions; client-side with React Query etc., with unified error and loading handling.
- **Errors & boundaries**: **[Required]** Use `error.tsx` and `global-error.tsx`; provide loading.tsx for key routes; API routes return a consistent error shape (status, message, code).
- **Security**: **[Required]** Validate and escape all user input; sensitive operations require server-side validation and auth; only `NEXT_PUBLIC_*` env vars are exposed to the client.
- **i18n & display**: **[Required]** All user-visible copy via i18n with multi-language support; no emoji in UI, copy, code, or comments.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer stdlib and framework**: When the Next.js/React ecosystem has an official or recommended approach, use it; avoid over-abstraction and extra dependencies.
- **[Process] Review first**: When asked to implement a feature, read relevant code and route structure with @ or Read, understand existing logic, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Components & a11y**: Keep components single-responsibility and composable; consider a11y (semantics, ARIA, keyboard) for forms and interaction.
- **[Practice] Performance**: Use virtual lists for long lists; next/image for images; dynamic import heavy components with next/dynamic when appropriate.
- **[Output] Explain**: After generating complex logic or components, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-next.md`
