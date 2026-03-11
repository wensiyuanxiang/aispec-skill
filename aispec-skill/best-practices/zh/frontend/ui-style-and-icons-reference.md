# 前端样式库与图标库参考（Web / 桌面 / App）

本文档为 AISpec Skill 最佳实践的一部分，汇总 **Web、桌面端、移动 App、小程序** 的样式方案、UI 组件库与图标库推荐，便于选型与 AI 协作时引用。生成界面与图标时优先使用下表所列成熟方案，**禁止在 UI 中用 emoji 替代图标**。

---

## 1. Web（React / Next.js / Vite）

| 类型 | 推荐方案 | 说明与参考 |
|------|----------|------------|
| **样式** | Tailwind CSS | 原子化 CSS，与组件库搭配；[tailwindcss.com](https://tailwindcss.com) |
| **组件库** | shadcn/ui | 基于 Radix，复制组件入仓、可定制；[ui.shadcn.com](https://ui.shadcn.com) |
| **组件库** | Radix UI | 无样式、无障碍的 Primitives；[radix-ui.com](https://www.radix-ui.com) |
| **组件库** | MUI (Material UI) | 完整 Material Design 组件；[mui.com](https://mui.com) |
| **组件库** | Chakra UI | 可访问性友好、主题化；[chakra-ui.com](https://chakra-ui.com) |
| **图标** | Lucide React | 统一风格、Tree-shake；[lucide.dev](https://lucide.dev) |
| **图标** | Heroicons | Tailwind 团队维护；[heroicons.com](https://heroicons.com) |
| **图标** | Phosphor Icons | 多种字重与风格；[phosphoricons.com](https://phosphoricons.com) |
| **图标** | Iconify | 聚合多套图标集，按需加载；[iconify.design](https://iconify.design) |

**规约约定**：Next.js/Vercel、Tauri+React 等规约中已统一写「Tailwind CSS + shadcn/ui、Radix、Lucide React」，与上表一致。

---

## 2. Web（Vue / Nuxt）

| 类型 | 推荐方案 | 说明与参考 |
|------|----------|------------|
| **样式** | Tailwind CSS | 与 Vue 3 组合式 API 搭配；[tailwindcss.com](https://tailwindcss.com) |
| **组件库** | Naive UI | Vue 3、TypeScript、主题丰富；[naive-ui.com](https://www.naive-ui.com) |
| **组件库** | Element Plus | 企业级、中文友好；[element-plus.org](https://element-plus.org) |
| **组件库** | Vuetify | Material Design for Vue 3；[vuetifyjs.com](https://vuetifyjs.com) |
| **组件库** | PrimeVue | 组件多、主题多；[primevue.org](https://primevue.org) |
| **图标** | Iconify | Vue 插件可用，聚合多套图标；[iconify.design](https://iconify.design) |
| **图标** | @iconify/vue | Iconify 官方 Vue 集成；按集按需引入 |

**规约约定**：Vue/Nuxt 规约中已写「Naive UI、Element Plus、Vuetify、Iconify」，与上表一致。

---

## 3. 桌面端（Tauri / Electron + React 或 Vue）

桌面端通常与 Web 技术栈一致，壳层为 Tauri 或 Electron，前端沿用对应 Web 方案。

| 场景 | 推荐方案 |
|------|----------|
| **Tauri + React** | Tailwind CSS；shadcn/ui、Radix、Lucide React（与 Next.js 规约一致） |
| **Tauri + Vue** | Tailwind CSS；Naive UI / Element Plus；Iconify |
| **Electron + React** | 同 Web React（Tailwind + shadcn/ui 或 MUI + Lucide） |
| **Electron + Vue** | 同 Web Vue（Tailwind + Naive UI / Element Plus + Iconify） |

**注意**：桌面端需考虑系统字体与高 DPI；图标与组件库与 Web 共用时可保持同一套以降低维护成本。

---

## 4. 移动 App（Flutter）

| 类型 | 推荐方案 | 说明与参考 |
|------|----------|------------|
| **设计体系** | Material 3 | `MaterialApp` + Material 组件；[m3.material.io](https://m3.material.io) |
| **设计体系** | Cupertino | iOS 风格；`CupertinoApp` 与 Cupertino 组件 |
| **组件** | Flutter Material / Cupertino | 官方组件库，随 SDK 更新 |
| **图标** | material_symbols_icons / Material Icons | Material 图标；[fonts.google.com/icons](https://fonts.google.com/icons) |
| **图标** | cupertino_icons | iOS 风格图标；[pub.dev/packages/cupertino_icons](https://pub.dev/packages/cupertino_icons) |
| **图标** | font_awesome_flutter | Font Awesome；[pub.dev/packages/font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) |
| **图标** | phosphor_flutter | Phosphor 风格；[pub.dev/packages/phosphor_flutter](https://pub.dev/packages/phosphor_flutter) |

**规约约定**：Flutter 规约中已写「Material 3 或 Cupertino」「Material Icons、Cupertino Icons」，与上表一致。

---

## 5. 移动 App（React Native / Expo）

| 类型 | 推荐方案 | 说明与参考 |
|------|----------|------------|
| **组件库** | React Native Paper | Material Design 3；[callstack.github.io/react-native-paper](https://callstack.github.io/react-native-paper) |
| **组件库** | Tamagui | 跨平台、性能优化、主题；[tamagui.dev](https://tamagui.dev) |
| **组件库** | NativeBase | 可定制主题与组件；[nativebase.io](https://nativebase.io) |
| **图标** | @expo/vector-icons | Expo 内置，含 Material、Ionicons、FontAwesome 等 |
| **图标** | react-native-vector-icons | 多套图标（MaterialCommunityIcons 等）；[github.com/oblador/react-native-vector-icons](https://github.com/oblador/react-native-vector-icons) |
| **图标** | phosphor-react-native | Phosphor 风格；[phosphoricons.com](https://phosphoricons.com) |

**规约约定**：React Native 规约中已写「React Native Paper、Tamagui、NativeBase」「react-native-vector-icons、@expo/vector-icons」，与上表一致。

---

## 6. 小程序（微信 / Taro / uni-app）

| 类型 | 推荐方案 | 说明与参考 |
|------|----------|------------|
| **组件库** | Vant Weapp | 有赞，轻量；[vant-contrib.gitee.io/vant-weapp](https://vant-contrib.gitee.io/vant-weapp) |
| **组件库** | NutUI | 京东；[nutui.jd.com](https://nutui.jd.com) |
| **组件库** | TDesign 小程序 | 腾讯；[tdesign.tencent.com/miniprogram](https://tdesign.tencent.com/miniprogram) |
| **图标** | 组件库内置 icon | Vant / NutUI / TDesign 均提供 icon 组件 |
| **图标** | iconfont (阿里巴巴) | 选图后生成字体或 SVG；[iconfont.cn](https://www.iconfont.cn) |

**规约约定**：小程序规约中已写「Vant Weapp、NutUI、TDesign」「内置 icon 或 iconfont」，与上表一致。

---

## 7. 通用原则

- **一致性**：同一产品内尽量统一一套组件库与一套图标风格（如统一用 Lucide 或 Phosphor）。
- **可访问性**：图标需配合 `aria-label` / `semanticsLabel` 等，或作为装饰时对屏幕阅读器隐藏。
- **体积**：Web 端图标优先按需引入（Lucide、Heroicons、Iconify 均支持 Tree-shake 或按集加载）。
- **禁止 emoji**：所有规约统一要求不在 UI 中用 emoji 替代图标；文案、代码、注释中也不使用 emoji。

---

## 8. 与各规约的对应关系

| 规约文件 | 样式 / 组件 / 图标 |
|----------|--------------------|
| `frontend/nextjs-vercel-reference.md` | Tailwind；shadcn/ui、Radix、Lucide React |
| `frontend/vue-nuxt-reference.md` | Tailwind；Naive UI、Element Plus、Vuetify、Iconify |
| `desktop/tauri-rust-react-desktop-reference.md` | Tailwind；shadcn/ui、Radix、Lucide React |
| `desktop/qt-desktop-reference.md` | Qt 内置 / Quick Controls；可选 Material/Phosphor |
| `desktop/python-qt-desktop-reference.md` | Qt 内置 / Quick Controls；可选 Material/Phosphor |
| `frontend/flutter-app-reference.md` | Material 3 / Cupertino；Material Icons、Cupertino Icons |
| `frontend/react-native-reference.md` | React Native Paper、Tamagui、NativeBase；react-native-vector-icons、@expo/vector-icons |
| `miniapp/miniapp-reference.md` | Vant Weapp、NutUI、TDesign；内置 icon、iconfont |

本文档与上述规约保持一致，选型或生成代码时可直接引用本参考与对应规约文件。
