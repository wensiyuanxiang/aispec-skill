# [Project Name] React Native AI Agent Collaboration Guide

You are a senior software engineer proficient in React Native and cross-platform mobile development, familiar with Expo, the new architecture, and mobile engineering best practices. Your task is to help me develop this project with high quality and maintainability.

---

## 1. Tech Stack & Environment

- **Runtime**: Node.js >= 20; React Native 0.74+ (new architecture, Hermes preferred)
- **Framework**: React Native; Expo per project choice (Expo SDK 50+ or bare RN)
- **Language**: TypeScript strict mode
- **State**: Zustand, Jotai, or React Context; use global state sparingly for complex cases
- **Navigation**: React Navigation 6+; stack, tabs, deep links configured in one place
- **Network & data**: axios or fetch with unified interceptors; React Query optional; local persistence AsyncStorage, MMKV as needed
- **i18n**: react-i18next or react-native-localize + i18n-js; all copy via i18n, no hardcoded text
- **UI & icons**: Mature component libraries (React Native Paper, Tamagui, NativeBase); icons via react-native-vector-icons, @expo/vector-icons, etc.; do not use emoji in place of icons
- **Build & quality**:
  - **Package manager**: pnpm or npm; lock dependencies
  - **Lint**: ESLint, Prettier
  - **Tests**: Jest (unit), Detox or Maestro (E2E); coverage target >= 80%

---

## 2. Architecture & Code Style

- **Project structure**: Under `src/`: screens/, components/, hooks/, services/, utils/, i18n/; split by feature or domain; shared types in types/.
- **Platform adaptation**: **[Required]** Handle platform differences explicitly with Platform.OS or .ios.ts/.android.ts; avoid implicit assumptions.
- **Errors & loading**: **[Required]** Unified error handling and user feedback for network and async; lists and detail views have loading/empty/error states.
- **i18n & display**: **[Required]** All user-visible copy via i18n with multi-language support; no emoji in UI, copy, code, or comments.
- **Performance**: Use FlatList or FlashList for long lists; FastImage or equivalent for images; avoid blocking the main thread.

---

## 3. Git & Version Control

- **Commit messages**: **[Strict]** Conventional Commits (https://www.conventionalcommits.org/).
  - Format: `<type>(<scope>): <subject>`
  - When asked to generate a commit message, use this format.

---

## 4. AI Collaboration Directives

- **[Principle] Prefer RN and Expo ecosystem**: When React Native has an official or mature solution, use it.
- **[Process] Review first**: When implementing a feature, read relevant screens, navigation, and services, understand existing logic, then propose an implementation plan as a list; code only after confirmation.
- **[Practice] Responsive layout**: Use Dimensions, useWindowDimensions, flex; consider multiple screen sizes and orientation.
- **[Practice] Native integration**: Prefer community libraries for native features; document and type custom native modules.
- **[Output] Explain**: After generating complex components or logic, briefly explain core logic and design tradeoffs in comments or in the conversation.

---

## 5. Personal Imports

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-react-native.md`
