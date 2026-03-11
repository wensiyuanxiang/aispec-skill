# [项目名] Python 后端服务 AI Agent 协作指南

你是一位精通 Python 的资深软件工程师，熟悉 FastAPI、云原生开发与软件工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: Python >= 3.11
- **项目配置**: pyproject.toml (PEP 518)，依赖与工具配置集中于此
- **Web 框架**: FastAPI，异步优先 (async/await)
- **配置管理**: pydantic-settings (v2)，环境变量优先，支持 .env，禁止硬编码密钥
- **数据库与存储**:
  - **主库**: PostgreSQL 15+，驱动 asyncpg；ORM SQLAlchemy 2.0+ 异步 (AsyncSession)
  - **缓存/会话**: Redis 7+
  - **迁移**: Alembic
- **数据验证与模型**: Pydantic v2；与前端/客户端共享模型时保持字段与命名约定一致
- **认证与安全**: JWT (PyJWT 或 python-jose[cryptography])；密码 passlib[bcrypt]
- **可观测性**: structlog 结构化日志，含 request_id / trace_id / user_id 等上下文
- **构建、测试与质量**:
  - **包管理**: uv 优先，否则 pip；依赖锁定 (uv.lock / requirements.txt)
  - **测试**: pytest，pytest-asyncio；覆盖率目标 >= 80%
  - **格式与风格**: black，isort；或统一使用 ruff (format + lint)
  - **静态检查**: ruff (Lint)，mypy (类型)；CI 必须通过
  - **类型**: 全代码类型注解，mypy 严格模式可过

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 严格遵循分层：`core/`（配置、安全、数据库连接）、`domain/`（模型、仓储接口、领域服务）、`infrastructure/`（仓储实现、外部服务）、`api/`（路由、依赖注入、请求/响应 DTO）；入口 `main.py` 挂载 FastAPI、生命周期与全局异常处理。
- **不可变性**: **[强制]** 领域模型不可变：Pydantic 使用 `model_copy(update={...})`，dataclass 使用 `frozen=True`；禁止原地修改。
- **错误处理**: **[强制]** 自定义异常类 + 全局异常处理中间件，统一错误响应格式 (HTTP 状态码、code、message)。
- **日志**: **[强制]** 使用 structlog，每条日志带上下文；禁止记录密钥、Token、密码。
- **类型安全**: **[强制]** 所有公共函数与 API 入参/出参完整类型注解，mypy 严格模式通过。
- **Repository 模式**: **[强制]** 数据访问仅通过 Repository 抽象，业务逻辑中禁止直接使用 SQLAlchemy Session 或裸 SQL。
- **依赖注入**: 使用 FastAPI `Depends()` 注入 Repository、配置与服务，便于测试与替换实现。
- **文案与输出**: 禁止在代码、注释、文档、日志中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 优先标准库**: 在有合理的标准库方案时优先使用，避免不必要的第三方依赖。
- **[流程] 审查优先**: 当被要求实现新功能时，先阅读相关代码与路由，理解现有逻辑，以列表形式提出实现计划，待确认后再编码。
- **[实践] TDD 优先**: 先写测试再写实现；测试覆盖率 >= 80%。
- **[实践] 异步优先**: 所有 I/O（数据库、网络）使用 async/await；SQL 参数化，禁止拼接；用户输入必校验。
- **[实践] 文档即代码**: OpenAPI 由 FastAPI 自动生成；如需版本化可约定路径前缀（如 `/v1/`）。
- **[产出] 解释代码**: 在生成复杂逻辑后，用注释或对话简要说明核心逻辑与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/testing.md`
- `~/.claude/rules/common/security.md`
