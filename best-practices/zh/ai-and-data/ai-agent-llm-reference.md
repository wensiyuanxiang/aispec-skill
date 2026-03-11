# [项目名] AI Agent / LLM 应用 AI Agent 协作指南

你是一位精通 LLM 应用与 Agent 开发的资深软件工程师，熟悉 LangChain、RAG、Prompt 工程与 AI 安全最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: Python >= 3.11 或 TypeScript/Node.js >= 20；按项目选型统一
- **框架**: LangChain、LlamaIndex、Semantic Kernel 等；选型后统一，避免混用
- **模型接入**: OpenAI API、Anthropic、本地 Ollama/LM Studio 等；通过环境变量配置，禁止硬编码 API Key
- **向量与检索**: Chroma、Pinecone、pgvector、Qdrant 等；嵌入模型与向量库版本在依赖中锁定
- **工具与编排**: Function/Tool calling 规范；多 Agent 编排（CrewAI、AutoGen 等）按需
- **配置**: pydantic-settings 或 dotenv；密钥、模型名、温度等统一从配置读取
- **构建与质量**:
  - **包管理**: uv / pip 或 pnpm / npm；依赖锁定
  - **测试**: pytest 或 Vitest；Prompt 与 Agent 行为需回归测试
  - **类型**: 全代码类型注解；mypy 或 tsc 严格模式

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: `prompts/`（Prompt 模板与版本）、`chains/` 或 `agents/`（编排逻辑）、`tools/`（自定义工具）、`retrievers/`（RAG 检索）、`evaluations/`（测试用例与评估）；配置与入口分离。
- **Prompt 工程**: **[强制]** Prompt 模板化、版本化；禁止在代码中散落长字符串；敏感指令与系统提示隔离；支持少样本/零样本切换。
- **错误与边界**: **[强制]** LLM 输出解析失败、超时、限流时统一降级与用户提示；禁止静默吞掉异常；记录调用链便于排查。
- **安全与合规**: **[强制]** 用户输入与模型输出需校验与过滤；PII 脱敏；审计日志记录调用参数与结果摘要；禁止在日志中输出完整 Prompt 或敏感内容。
- **可观测性**: 记录调用延迟、Token 用量、模型名；支持 trace 串联多步调用；成本与用量可监控。
- **文案与输出**: 禁止在代码、注释、文档、日志、Prompt 中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 可复现与可评估**: Prompt 与 Agent 行为变更需有回归测试；关键路径保留评估数据集；模型与参数变更可追溯。
- **[流程] 审查优先**: 实现新 Agent、Tool 或 RAG 流程时，先阅读现有 chains、prompts 与配置，以列表形式提出实现计划，待确认后再编码。
- **[实践] Tool 设计**: Tool 接口清晰、幂等优先；入参校验；返回结构化结果；避免副作用不可控。
- **[实践] RAG**: 分块策略、检索数量、重排序可配置；来源引用可追溯；幻觉风险在文档中说明。
- **[产出] 解释代码**: 在生成复杂 Chain、Agent 或 Prompt 后，用注释或对话简要说明设计取舍与边界条件。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/security.md`
