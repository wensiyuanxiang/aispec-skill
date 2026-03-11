# [项目名] Java 后端服务 AI Agent 协作指南

你是一位精通 Java 与 Spring 生态的资深软件工程师，熟悉云原生开发与软件工程最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: Java 21+ (LTS)，优先使用虚拟线程与现代 API
- **框架**: Spring Boot 3.x，Spring Framework 6.x
- **构建**: Maven 或 Gradle (推荐 Gradle Kotlin DSL)；依赖与插件版本在构建文件中统一管理
- **数据库与存储**:
  - **主库**: PostgreSQL 15+ 或 MySQL 8+；ORM 使用 Spring Data JPA / Hibernate 6，或 MyBatis-Plus（按项目选型）
  - **缓存**: Redis；会话与分布式锁按需
  - **迁移**: Flyway 或 Liquibase
- **配置**: Spring Cloud Config 可选；本地/容器环境变量与 `application-{profile}.yml`，禁止硬编码密钥
- **可观测性**: SLF4J + Logback 结构化日志 (JSON)，MDC 传递 traceId、userId 等；指标可选 Micrometer + Prometheus
- **测试与质量**:
  - **测试**: JUnit 5，Mockito；Spring Boot Test 做集成测试；覆盖率目标 >= 80%
  - **规范**: Checkstyle 或 Spotless；SpotBugs 或 NullAway
  - **文档**: SpringDoc OpenAPI 3 (Swagger)，与接口同步

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: 按分层组织：`controller` / `service` / `repository` / `domain` / `config`；核心业务在 `domain` 与 `service`，避免贫血模型；基础设施与适配器可置于 `adapter` 或 `infrastructure`。
- **错误处理**: **[强制]** 使用 `@ControllerAdvice` + `@ExceptionHandler` 统一异常处理；自定义业务异常与 HTTP 状态码、错误码、message 一一对应；禁止在 Controller 中吞掉异常。
- **日志**: **[强制]** 关键业务流程与异常必须打日志；日志中禁止输出密码、Token、完整卡号等敏感信息；使用 MDC 传递请求级上下文。
- **事务与并发**: **[强制]** 事务边界清晰，只读操作标注 `@Transactional(readOnly = true)`；涉及并发时明确锁策略（乐观锁/悲观锁/分布式锁）并注释说明。
- **依赖与接口**: 面向接口编程，核心能力通过接口注入；避免循环依赖；大服务可拆为多个小 Service 或领域服务。
- **文案与输出**: 禁止在代码、注释、文档、日志中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 优先 Spring 与标准库**: 在 Spring 生态内有成熟方案时优先采用；避免引入与 Spring 重叠或冲突的第三方库。
- **[流程] 审查优先**: 当被要求实现新功能时，先阅读相关 Controller、Service、Repository 与配置，理解现有分层与约定，以列表形式提出实现计划，待确认后再编码。
- **[实践] 测试先行**: 核心业务逻辑先写单元测试；集成测试覆盖主要 API 与数据库交互；Mock 外部依赖。
- **[实践] 安全**: 认证与鉴权使用 Spring Security；敏感参数校验与权限校验在服务端完成；SQL 使用参数化，禁止拼接。
- **[产出] 解释代码**: 在生成复杂逻辑或配置后，用注释或对话简要说明核心逻辑与设计取舍。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/java-spring.md`
