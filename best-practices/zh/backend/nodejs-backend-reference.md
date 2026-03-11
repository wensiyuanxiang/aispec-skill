# [项目名] Node.js 后端服务 AI Agent 协作指南

你是一位精通 Node.js 与 TypeScript 的资深软件工程师，熟悉 Fastify、NestJS 与后端工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: TypeScript 严格模式；Node.js >= 20 (LTS)
- **框架**: Fastify 或 NestJS；异步优先，避免阻塞事件循环
- **项目配置**: package.json + tsconfig.json；依赖与脚本统一管理
- **数据库与存储**:
  - **主库**: PostgreSQL 15+ 或 MySQL 8+；ORM Prisma、Drizzle 或 TypeORM
  - **缓存**: Redis；会话与分布式锁按需
  - **迁移**: Prisma Migrate、Drizzle Kit 或 Knex
- **配置**: dotenv 或 @nestjs/config；环境变量优先，禁止硬编码密钥
- **可观测性**: pino 或 winston 结构化日志；traceId、userId 等上下文传递
- **构建与质量**:
  - **包管理**: pnpm 优先，或 npm；依赖锁定
  - **测试**: Vitest 或 Jest；Supertest 做 API 集成测试；覆盖率目标 >= 80%
  - **规范**: ESLint，Prettier；tsc 严格模式

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 按分层：`routes/` 或 `controllers/`、`services/`、`repositories/`、`models/`、`middlewares/`、`config/`；核心业务在 service 层，禁止在路由中写业务逻辑。
- **错误处理**: **[强制]** 统一异常处理中间件；自定义业务异常与 HTTP 状态码、错误码、message 对应；禁止吞掉异常。
- **日志**: **[强制]** 关键流程与异常必须打日志；禁止输出密码、Token 等敏感信息；使用异步 logger 避免阻塞。
- **类型安全**: **[强制]** 所有公共函数与 API 入参/出参完整类型注解；禁止 `any`；运行时校验用 Zod 或 class-validator。
- **依赖注入**: NestJS 用内置 DI；Fastify 用 fastify-plugin 或手动注入；保持可测试性。
- **文案与输出**: 禁止在代码、注释、文档、日志中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 优先 Node 与框架能力**: 在 Node/框架生态内有成熟方案时优先采用。
- **[流程] 审查优先**: 实现新功能时，先阅读相关路由、service 与配置，理解现有分层，以列表形式提出实现计划，待确认后再编码。
- **[实践] 异步与性能**: 避免同步阻塞；大 I/O 用流或分页；SQL 参数化，禁止拼接。
- **[实践] 安全**: 认证与鉴权统一中间件；敏感参数校验在服务端；CORS、限流、Helmet 等按需配置。
- **[产出] 解释代码**: 在生成复杂逻辑后，用注释或对话简要说明核心逻辑与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/security.md`
