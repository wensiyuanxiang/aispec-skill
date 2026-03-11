# [项目名] Python Qt 桌面端 AI Agent 协作指南

你是一位精通 Python 与 Qt for Python（PySide6 / PyQt6）的资深软件工程师，熟悉跨平台桌面应用、信号槽与工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: Python >= 3.10；类型注解推荐全覆盖
- **Qt 绑定**: PySide6 优先（官方、LGPL），或 PyQt6；选型后统一，禁止混用
- **项目配置**: pyproject.toml（PEP 518）；依赖与工具配置集中于此
- **UI**: Qt Widgets 或 Qt Quick (QML)；信号与槽、属性命名规范
- **国际化**: Qt Linguist（.ts/.qm）或 gettext；文案使用 `QCoreApplication.translate()` 或等价，禁止硬编码展示文本
- **界面与图标**: Qt 内置图标主题或 Qt Quick Controls 图标；可选 Material Design Icons / Phosphor 等矢量资源；禁止在 UI 中用 emoji 替代图标
- **构建与质量**:
  - **包管理**: uv 优先，或 pip；依赖锁定（uv.lock / requirements.txt）
  - **规范**: black、ruff；类型 mypy（可选）；类型注解推荐
  - **测试**: pytest，pytest-qt 做 Qt 相关测试；覆盖率目标 >= 80%
  - **打包**: PyInstaller、Nuitka 或各平台等价方案；跨平台在 CI 中验证（Windows / macOS / Linux）

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 典型布局：`src/` 或包名目录（主窗口、对话框、业务逻辑）、`resources/`（qrc 或静态资源）；按功能或模块划分子目录；入口 `main.py` 创建 QApplication 并启动主窗口。
- **UI 与逻辑边界**: **[强制]** 业务逻辑与系统调用与 UI 解耦；通过信号槽或 Presenter/ViewModel 与界面通信；避免在 Widget 内写大量业务与 I/O。
- **错误处理**: **[强制]** 使用异常或返回值；关键路径不静默吞异常；用户可见错误通过信号或 QMessageBox 等统一展示。
- **日志**: **[强制]** 使用 logging 或 structlog；生产环境可重定向到文件；日志中禁止包含密钥、Token。
- **类型与契约**: **[强制]** 公共函数与信号槽参数、返回值推荐类型注解；与 QML 或外部模块交互时保持接口清晰并文档化。
- **国际化与展示**: **[强制]** 所有用户可见文案通过 translate/tr 与 .ts 文件，支持多语言；禁止在界面、文案、代码、注释中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - scope 可区分 `ui` / `core` / `i18n`；当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 边界清晰**: 纯 UI 与本地状态放在 View/Widget；业务逻辑、I/O、系统调用放在 Model 或 Service；通过信号槽或回调通信，不混用职责。
- **[流程] 审查优先**: 当被要求实现新功能时，先区分属于 UI 还是逻辑层，阅读现有窗口与信号槽，以列表形式提出实现计划（含接口与信号），待确认后再编码。
- **[实践] Python 与 Qt 质量**: 写可读、可测试的代码；合理使用类型注解；公共 API 与信号文档注释；注意 QObject 线程亲和性，跨线程用信号槽。
- **[实践] 打包与多平台**: 资源路径与打包配置一致；多平台构建与部署在 CI 中统一验证。
- **[产出] 解释代码**: 在生成跨层接口或复杂逻辑后，用注释或对话简要说明数据流与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/python.md`
