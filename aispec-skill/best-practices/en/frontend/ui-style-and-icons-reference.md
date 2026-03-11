# UI Style & Icon Libraries Reference (Web / Desktop / App)

This document is part of AISpec Skill best practices. It summarizes **styling, UI component libraries, and icon libraries** for Web, desktop, mobile App, and miniprograms, for easier selection and AI-assisted reference. Prefer the mature options in the tables below for UI and icons; **do not use emoji in place of icons in the UI**.

---

## 1. Web (React / Next.js / Vite)

| Type | Recommendation | Notes & links |
|------|----------------|---------------|
| **Styling** | Tailwind CSS | Utility-first CSS; pairs with component libs; [tailwindcss.com](https://tailwindcss.com) |
| **Components** | shadcn/ui | Radix-based, copy components into repo, customizable; [ui.shadcn.com](https://ui.shadcn.com) |
| **Components** | Radix UI | Unstyled, accessible primitives; [radix-ui.com](https://www.radix-ui.com) |
| **Components** | MUI (Material UI) | Full Material Design; [mui.com](https://mui.com) |
| **Components** | Chakra UI | A11y-friendly, theming; [chakra-ui.com](https://chakra-ui.com) |
| **Icons** | Lucide React | Consistent style, tree-shakeable; [lucide.dev](https://lucide.dev) |
| **Icons** | Heroicons | Maintained by Tailwind team; [heroicons.com](https://heroicons.com) |
| **Icons** | Phosphor Icons | Multiple weights and styles; [phosphoricons.com](https://phosphoricons.com) |
| **Icons** | Iconify | Aggregates many icon sets, on-demand load; [iconify.design](https://iconify.design) |

Spec alignment: Next.js/Vercel and Tauri+React specs already say "Tailwind CSS + shadcn/ui, Radix, Lucide React"; consistent with table above.

---

## 2. Web (Vue / Nuxt)

| Type | Recommendation | Notes & links |
|------|----------------|---------------|
| **Styling** | Tailwind CSS | Pairs with Vue 3 Composition API; [tailwindcss.com](https://tailwindcss.com) |
| **Components** | Naive UI | Vue 3, TypeScript, rich themes; [naive-ui.com](https://www.naive-ui.com) |
| **Components** | Element Plus | Enterprise, i18n-friendly; [element-plus.org](https://element-plus.org) |
| **Components** | Vuetify | Material Design for Vue 3; [vuetifyjs.com](https://vuetifyjs.com) |
| **Components** | PrimeVue | Many components and themes; [primevue.org](https://primevue.org) |
| **Icons** | Iconify | Vue plugin; many icon sets; [iconify.design](https://iconify.design) |
| **Icons** | @iconify/vue | Official Iconify Vue integration; import sets as needed |

Spec alignment: Vue/Nuxt spec already lists Naive UI, Element Plus, Vuetify, Iconify; consistent with table above.

---

## 3. Desktop (Tauri / Electron + React or Vue)

Desktop usually matches Web stack; shell is Tauri or Electron; frontend reuses the same Web choices.

| Scenario | Recommendation |
|----------|----------------|
| **Tauri + React** | Tailwind CSS; shadcn/ui, Radix, Lucide React (same as Next.js spec) |
| **Tauri + Vue** | Tailwind CSS; Naive UI / Element Plus; Iconify |
| **Electron + React** | Same as Web React (Tailwind + shadcn/ui or MUI + Lucide) |
| **Electron + Vue** | Same as Web Vue (Tailwind + Naive UI / Element Plus + Iconify) |

Note: Consider system fonts and HiDPI on desktop; reusing the same component/icon set as Web reduces maintenance.

---

## 4. Mobile App (Flutter)

| Type | Recommendation | Notes & links |
|------|----------------|---------------|
| **Design** | Material 3 | MaterialApp + Material widgets; [m3.material.io](https://m3.material.io) |
| **Design** | Cupertino | iOS look; CupertinoApp and Cupertino widgets |
| **Components** | Flutter Material / Cupertino | Official, shipped with SDK |
| **Icons** | material_symbols_icons / Material Icons | [fonts.google.com/icons](https://fonts.google.com/icons) |
| **Icons** | cupertino_icons | [pub.dev/packages/cupertino_icons](https://pub.dev/packages/cupertino_icons) |
| **Icons** | font_awesome_flutter | [pub.dev/packages/font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) |
| **Icons** | phosphor_flutter | [pub.dev/packages/phosphor_flutter](https://pub.dev/packages/phosphor_flutter) |

Spec alignment: Flutter spec already says "Material 3 or Cupertino" and "Material Icons, Cupertino Icons"; consistent with table above.

---

## 5. Mobile App (React Native / Expo)

| Type | Recommendation | Notes & links |
|------|----------------|---------------|
| **Components** | React Native Paper | Material Design 3; [callstack.github.io/react-native-paper](https://callstack.github.io/react-native-paper) |
| **Components** | Tamagui | Cross-platform, perf, theming; [tamagui.dev](https://tamagui.dev) |
| **Components** | NativeBase | Customizable theme and components; [nativebase.io](https://nativebase.io) |
| **Icons** | @expo/vector-icons | Expo built-in (Material, Ionicons, FontAwesome, etc.) |
| **Icons** | react-native-vector-icons | [github.com/oblador/react-native-vector-icons](https://github.com/oblador/react-native-vector-icons) |
| **Icons** | phosphor-react-native | [phosphoricons.com](https://phosphoricons.com) |

Spec alignment: React Native spec already lists React Native Paper, Tamagui, NativeBase and react-native-vector-icons, @expo/vector-icons; consistent with table above.

---

## 6. Miniprogram (WeChat / Taro / uni-app)

| Type | Recommendation | Notes & links |
|------|----------------|---------------|
| **Components** | Vant Weapp | Lightweight; [vant-contrib.gitee.io/vant-weapp](https://vant-contrib.gitee.io/vant-weapp) |
| **Components** | NutUI | [nutui.jd.com](https://nutui.jd.com) |
| **Components** | TDesign Miniprogram | [tdesign.tencent.com/miniprogram](https://tdesign.tencent.com/miniprogram) |
| **Icons** | Built-in icon | Vant / NutUI / TDesign all provide icon components |
| **Icons** | iconfont (Alibaba) | Pick icons, generate font or SVG; [iconfont.cn](https://www.iconfont.cn) |

Spec alignment: Miniprogram spec already says "Vant Weapp, NutUI, TDesign" and "built-in icon or iconfont"; consistent with table above.

---

## 7. General Principles

- **Consistency**: Prefer one component library and one icon style per product (e.g. Lucide or Phosphor throughout).
- **Accessibility**: Pair icons with aria-label / semanticsLabel, or hide from screen readers when decorative.
- **Bundle size**: Prefer tree-shakeable or set-based loading for Web icons (Lucide, Heroicons, Iconify support this).
- **No emoji**: All specs require no emoji in place of icons in the UI; no emoji in copy, code, or comments.

---

## 8. Mapping to Spec Files

| Spec file | Style / components / icons |
|-----------|----------------------------|
| frontend/nextjs-vercel-reference.md | Tailwind; shadcn/ui, Radix, Lucide React |
| frontend/vue-nuxt-reference.md | Tailwind; Naive UI, Element Plus, Vuetify, Iconify |
| desktop/tauri-rust-react-desktop-reference.md | Tailwind; shadcn/ui, Radix, Lucide React |
| desktop/qt-desktop-reference.md | Qt built-in / Quick Controls; optional Material/Phosphor |
| desktop/python-qt-desktop-reference.md | Qt built-in / Quick Controls; optional Material/Phosphor |
| frontend/flutter-app-reference.md | Material 3 / Cupertino; Material Icons, Cupertino Icons |
| frontend/react-native-reference.md | React Native Paper, Tamagui, NativeBase; react-native-vector-icons, @expo/vector-icons |
| miniapp/miniapp-reference.md | Vant Weapp, NutUI, TDesign; built-in icon, iconfont |

This document stays aligned with the specs above; use it together with the corresponding spec file when selecting or generating UI and icons.
