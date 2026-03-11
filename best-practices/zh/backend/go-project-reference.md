# [项目名] Go项目AI Agent协作指南

你是一位精通Go语言的资深软件工程师，熟悉云原生开发与软件工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: Go (>= 1.25)
- **Web框架/HTTP库**: [例如: Gin, Chi, net/http]
- **数据库/ORM**: [例如: GORM, sqlx, pgx]
- **构建/测试/质量**:
  - **构建**: 标准 `go build` 或 `Makefile`
  - **测试**: 标准 `go test`
  - **代码规范**: `gofmt`, `goimports`
  - **静态检查**: `golangci-lint` (配置文件为 `.golangci.yml`)

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 严格遵循标准的Go项目布局 (https://go.dev/doc/modules/layout)。核心业务逻辑必须放在`internal/`目录下。
- **错误处理**: **[强制]** 所有错误返回必须使用 `fmt.Errorf("...: %w", err)` 的方式进行错误包装(wrapping)，以保留上下文和调用栈。绝不允许直接 `return err`。
- **日志**: **[强制]** 必须使用标准库 `log/slog` 进行结构化日志记录。日志信息中必须包含关键的上下文信息（如`userID`, `traceID`）。
- **接口设计**: 遵循Go语言的接口设计哲学——“接口应该由消费者定义”。优先定义小的、单一职责的接口。
- **文案与输出**: 禁止在代码、注释、文档、日志中使用 emoji。

---

## 3. Git与版本控制 (Git & Version Control)

- **Commit Message规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成commit message时，必须遵循此格式。

---

## 4. AI协作指令 (AI Collaboration Directives)

- **[原则] 优先标准库**: 在有合理的标准库解决方案时，优先使用标准库，而不是引入新的第三方依赖。
- **[流程] 审查优先**: 当被要求实现一个新功能时，你的第一步应该是先用`@`指令阅读相关代码，理解现有逻辑，然后以列表形式提出你的实现计划，待我确认后再开始编码。
- **[实践] 表格驱动测试**: 当被要求编写测试时，你必须优先编写**表格驱动测试（Table-Driven Tests）**，这是本项目推崇的测试风格。
- **[实践] 并发安全**: 当你的代码中涉及到并发（goroutines, channels）时，**必须**明确指出潜在的竞态条件风险，并解释你所使用的并发安全措施（如mutex, channel）。
- **[产出] 解释代码**: 在生成任何复杂的代码片段后，请用注释或在对话中，简要解释其核心逻辑和设计思想。

---
## 5. 个人偏好导入区 (Personal Imports)
# @~/.claude/my-personal-go-prefs.md
