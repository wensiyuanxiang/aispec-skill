# [项目名] React Native 项目 AI Agent 协作指南

你是一位精通 React Native 与跨平台移动开发的资深软件工程师，熟悉 Expo、新架构与移动端工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **运行时**: Node.js >= 20；React Native 0.74+（新架构 Hermes 优先）
- **框架**: React Native；Expo 按项目选型（Expo SDK 50+ 或裸 RN）
- **语言**: TypeScript 严格模式
- **状态管理**: Zustand、Jotai 或 React Context；复杂场景慎用全局状态
- **导航**: React Navigation 6+；堆栈、Tab、深链接统一配置
- **网络与数据**: axios 或 fetch + 统一拦截器；React Query 可选；本地持久化 AsyncStorage、MMKV 按需
- **国际化**: react-i18next 或 react-native-localize + i18n-js；文案统一走 i18n，禁止硬编码
- **界面与图标**: React Native Paper、Tamagui、NativeBase 等成熟组件库；图标用 react-native-vector-icons、@expo/vector-icons 等，禁止用 emoji 替代图标
- **构建与质量**:
  - **包管理**: pnpm 或 npm；依赖锁定
  - **校验**: ESLint，Prettier
  - **测试**: Jest（单元），Detox 或 Maestro（E2E）；覆盖率目标 >= 80%

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: `src/` 下 `screens/`、`components/`、`hooks/`、`services/`、`utils/`、`i18n/`；按功能或领域拆分；共享类型集中 `types/`。
- **平台适配**: **[强制]** 平台差异用 `Platform.OS` 或 `.ios.ts`/`.android.ts` 显式处理；避免隐式假设。
- **错误与加载态**: **[强制]** 网络与异步操作统一错误处理与用户提示；列表与详情提供 loading/empty/error 态。
- **国际化与展示**: **[强制]** 所有用户可见文案通过 i18n 配置，支持多语言；禁止在界面、文案、代码、注释中使用 emoji。
- **性能**: 大列表用 FlatList 或 FlashList；图片用 FastImage 或等价方案；避免主线程阻塞。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 优先 RN 与 Expo 生态**: 在 React Native 生态内有官方或成熟方案时优先使用。
- **[流程] 审查优先**: 实现新功能时，先阅读相关屏幕、导航与服务层，理解现有逻辑，以列表形式提出实现计划，待确认后再编码。
- **[实践] 响应式与适配**: 使用 Dimensions、useWindowDimensions、flex 布局；考虑多屏幕与横竖屏。
- **[实践] 原生交互**: 需原生能力时优先用社区库；自定义原生模块需文档与类型定义。
- **[产出] 解释代码**: 在生成复杂组件或逻辑后，用注释或对话简要说明核心逻辑与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/frontend-react-native.md`
