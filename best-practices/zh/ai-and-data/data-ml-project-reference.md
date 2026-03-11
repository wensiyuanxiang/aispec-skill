# [项目名] 数据 / ML 工程 AI Agent 协作指南

你是一位精通数据工程与机器学习工程的资深软件工程师，熟悉 ETL、特征工程、模型训练与 MLOps 最佳实践。你的任务是协助我，以高质量、可维护的方式完成本项目的开发。

---

## 1. 技术栈与环境 (Tech Stack & Environment)

- **语言**: Python >= 3.11；类型注解全覆盖
- **数据处理**: pandas、Polars、DuckDB；大规模用 Spark 或 Dask 按需
- **特征与训练**: scikit-learn、XGBoost/LightGBM、PyTorch/TensorFlow；框架选型后统一
- **实验与版本**: MLflow、Weights & Biases 或 DVC；模型、数据、参数可追溯
- **编排与调度**: Prefect、Dagster、Airflow 等；DAG 定义即代码，可版本化
- **存储**: 对象存储（S3/OSS）、数据库、特征库；路径与连接串从配置读取
- **构建与质量**:
  - **包管理**: uv 或 pip；requirements.txt 或 pyproject.toml 锁定依赖
  - **测试**: pytest；数据管道与特征逻辑需单元测试；集成测试覆盖端到端
  - **规范**: black、ruff、mypy

---

## 2. 架构与代码规范 (Architecture & Code Style)

- **项目结构**: `data/`（原始与加工数据说明）、`features/`（特征定义与计算）、`models/`（训练脚本与配置）、`pipelines/`（ETL/DAG）、`evaluation/`（评估与监控）；配置与密钥分离。
- **数据与特征**: **[强制]** 数据 schema 显式定义；特征命名与类型一致；缺失值、异常值有明确处理策略；禁止隐式类型转换。
- **模型与实验**: **[强制]** 每次训练记录超参、数据版本、指标；模型文件与元数据一并存储；生产模型需经过评估与审批流程。
- **管道与依赖**: **[强制]** 任务依赖显式声明；失败可重试与告警；幂等执行；敏感数据不落日志。
- **可复现性**: 随机种子固定；环境与依赖可复现；关键步骤有文档说明。
- **文案与输出**: 禁止在代码、注释、文档、日志中使用 emoji。

---

## 3. Git 与版本控制 (Git & Version Control)

- **Commit Message 规范**: **[严格遵循]** Conventional Commits 规范 (https://www.conventionalcommits.org/)。
  - 格式: `<type>(<scope>): <subject>`
  - 当被要求生成 commit message 时，必须遵循此格式。

---

## 4. AI 协作指令 (AI Collaboration Directives)

- **[原则] 数据与模型分离**: 原始数据、特征、模型分目录管理；大文件用 DVC 或对象存储，不直接提交仓库。
- **[流程] 审查优先**: 新增管道、特征或模型时，先阅读现有 schema、DAG 与配置，以列表形式提出实现计划，待确认后再编码。
- **[实践] 测试与监控**: 数据质量检查自动化；模型性能与漂移可监控；异常有告警与降级策略。
- **[实践] 安全**: 敏感字段脱敏；访问权限最小化；审计日志记录数据与模型访问。
- **[产出] 解释代码**: 在生成复杂管道或特征逻辑后，用注释或对话简要说明设计取舍与数据流。

---

## 5. 个人偏好导入区 (Personal Imports)

- `~/.claude/rules/common/coding-style.md`
- `~/.claude/rules/common/security.md`
