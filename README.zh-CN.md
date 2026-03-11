# AISpec Skill

**English | [English](README.md)**

**版本：[1.0.0](VERSION) · [更新说明](CHANGELOG.md)**

---

**一句初始化，规约随栈走。**

AISpec Skill 汇集**主流开发系统与框架**（Next.js、Vue/Nuxt、Flutter、Go、Java、Python、Node、Rust、Tauri、Qt、CLI、AI/LLM 等）的**项目级最佳实践规约**，让代码符合**大厂级软件架构与工程规范**，同时便于**不同成员与团队**的项目管理与协同——**新手也能从一开始就拥有顶级架构**，无需资深架构师手把手搭架子。**完整支持 OpenClaw、Claude Code、Cursor、Codex** — 任选其一，一句话即可把对应规约写入项目；OpenClaw 与 Claude Code 用户与 Cursor 一样安装技能即可使用。

---

## 为什么有用

| 价值 | 说明 |
|------|------|
| **主流栈 + 大厂级规范** | 规约覆盖主流技术栈，对齐成熟代码库常用架构与约定，项目「说同一种语言」。 |
| **团队协同** | 多编辑器、多仓库统一规范，成员与团队对齐，减少风格漂移，便于评审与交接。 |
| **新手友好** | 新成员、新项目一键获得完整、经过验证的规约，无需从零摸索「我们怎么写」或重复造轮子。 |
| **可维护** | 规约集中维护，更新后重新运行技能即可同步到各项目。 |
| **多端一致** | 同一套最佳实践可输出到 **OpenClaw**、**Claude Code**、Cursor、Codex 等，无需按工具各写一份。 |

---

## 痛点与解决

| 痛点 | AISpec Skill 如何解决 |
|------|------------------------|
| **代码一眼像 AI 写的** | 规约约束输出：代码与注释不用 emoji、避免「AI 味」的通用样式，让产出更像成熟团队的代码，而不是生硬的模型输出。 |
| **不同 AI 编程工具间规范难统一** | 同一套规约可在 **OpenClaw**、**Claude Code**、**Cursor**、**Codex** 等间复用；换编辑器或协作时规范一致，无需按工具各搞一套。 |
| **不熟悉编码的人写不出生产级规范代码** | 通过一句话注入最佳实践规约，结构、风格与模式由规约给出；小白也能从一开始就写出符合生产级规范的代码。 |

---

## 应用场景

- **新建 / 空项目**：在**空目录**下可说「先帮我加一份 Next.js 项目规约」或「在搭脚手架前先加一份 Go 后端规约」。AI 会通过 1～2 个问题确认类型后写入规约，无需先初始化代码。
- **新项目（已脚手架）**：在刚初始化的仓库中，让 AI「根据当前技术栈初始化最佳实践」，自动生成并写入规约。
- **老项目规范化**：在已有代码库中「帮我制定当前项目规范」，AI 识别栈并追加或更新规约文件。
- **多技术栈项目**：前后端分离、Monorepo 等，可针对不同子路径或子项目分别注入对应规约。
- **团队统一规范**：将本仓库或精选规约作为团队标准，通过技能在各自项目中一键安装。

---

## 支持的 AI 编辑器

**完整支持：OpenClaw、Claude Code、Cursor、Codex** — 安装一次，在任选编辑器中使用。项目级规约路径（仅列工程内，不含用户全局）：

| 工具 | 项目规约路径 | 说明 |
|------|--------------|------|
| **OpenClaw** | 根目录 `AGENTS.md`（技能写此处便于随仓版本管理）；OpenClaw 默认从 workspace 加载 | 将 `agent.workspace` 指向项目根，或将根目录 `AGENTS.md` 复制到 workspace |
| **Claude Code** | `.claude/CLAUDE.md` 或 `.claude/rules/*.md` | 主规约 + 可选模块化规则 |
| **Cursor** | `.cursor/rules/` | 每条规则一个 `.mdc` 或 `.md`（含 frontmatter） |
| **Codex** | `AGENTS.md`、`.codex/rules/*.rules`、技能目录等 | 按各工具文档配置 |
| **Antigravity** (Google) | `.antigravity/rules.md`、`.agent/rules/` | 项目规则自动加载 |
| **Trae**（字节） | `.trae/project_rules.md` 或 `.trae/rules` | Markdown |
| **Code Buddy**（腾讯云） | `.codebuddy/rules/`、根目录 `CODEBUDDY.md` 或 `AGENTS.md` | 每条规则子目录 `RULE.mdc` |

---

## 在 GitHub 上如何标注本仓库

本仓库是 **AI 编程技能**（面向 AI 编辑器的项目最佳实践规约），不是 Shell 脚本项目。在 GitHub 上建议这样标注：

1. **简介**（仓库名下方）：例如 *「AISpec Skill – Unified Best Practices & Rules for AI Code Editors. OpenClaw, Claude Code, Cursor, Codex.」*（About 中可突出 OpenClaw、Claude Code、Cursor）。
2. **Topics（标签）**：在仓库页添加例如 `skill` `ai-editor` `best-practices` `cursor` `openclaw` `claude-code` `codex` `coding-standards` `project-spec` `aispec`，便于被归为「skill / ai-editor」而非「Shell」。

仓库内已通过 `.gitattributes` 让语言统计以 Markdown（技能/文档）为主，而非 Shell（安装脚本）。

---

## 安装与使用

**技能不依赖脚本即可工作**：AI 阅读 `aispec-skill/SKILL.md`，在你说「添加最佳实践」时自动检测项目并写入对应规约。技能本体（SKILL.md + 最佳实践）在 **`aispec-skill/`** 目录下。

### 把技能安装到编辑器（一次性）

克隆本仓库后，在**仓库根目录**执行：

```bash
./install-skill.sh --tool all --scope global
```

会在用户目录下为 Cursor、Claude Code、OpenClaw、Codex 安装技能（`~/.cursor/skills/`、`~/.claude/skills/` 等）。对于 **Claude Code**，脚本会在 `~/.claude/CLAUDE.md`（全局）中追加技能加载段，或在 `.claude/rules/aispec-skill.md`（本地）创建规则加载器，使 Claude Code 能发现此技能（Claude Code 全局只读 `CLAUDE.md`，不扫描 `skills/`）。参数说明：

- `--tool cursor|claude|openclaw|codex|antigravity|trae|codebuddy|all`（默认 all）
- `--scope global|local`（默认 global）。选 `local` 则只对指定项目生效。
- `--target DIR`（在 `--scope local` 时：项目根目录，默认当前目录）
- `--method link|copy`（默认 link。若系统或编辑器不认符号链接，可改为 copy）
- `--lang en|zh`（SKILL.md 语言：英文或中文）。不指定则交互式询问。选 `zh` 时自动切换为 copy 模式，将 SKILL.md 替换为中文版。

示例：

```bash
./install-skill.sh                                   # 交互式：询问工具 + 语言
./install-skill.sh --tool cursor --scope global      # 英文（默认）
./install-skill.sh --tool all --lang zh              # 所有工具 + 中文 SKILL.md
./install-skill.sh --tool openclaw --scope global    # 仅 OpenClaw
./install-skill.sh --tool claude --lang zh           # Claude Code + 中文
./install-skill.sh --tool all --scope local --target /path/to/我的项目
./install-skill.sh --help
```

### 方式一：仅靠 AI（写规约无需脚本）

- **OpenClaw / Claude Code / Cursor**：执行 `install-skill.sh` 选择对应工具（如 `--tool openclaw` 或 `--tool claude`），或手动将 **`aispec-skill/`** 放到各编辑器技能目录（如 `~/.openclaw/skills/aispec-skill`、`~/.claude/skills/aispec-skill`、`~/.cursor/skills/aispec-skill`）；安装后 AI 即可在对话中按技能流程执行「检测项目 → 选择规约 → 写入」。

### 方式二：安装脚本（可选，仅用于「把规约装进项目」）

脚本作用：**把规约写入当前项目**（如 `.cursor/rules/`、`.claude/CLAUDE.md`），不是用来在编辑器中「安装技能」的，也不是给 AI 调度的——AI 按 SKILL 文件自己就能完成同样的事。只有在 AI 拿不到本仓库时，才需要你本地跑这个脚本。

在**要写入规约的项目根目录**下执行：

```bash
AISPEC_ROOT=/path/to/aispec-skill-repo bash /path/to/aispec-skill-repo/aispec-skill/scripts/install.sh
```

或为其他项目安装：

```bash
./aispec-skill/scripts/install.sh /path/to/其他项目
```

环境变量：`AISPEC_LANG=en`（默认 `zh`），`AISPEC_EDITOR=claude`（默认 `cursor`）。脚本根据 `package.json`、`pyproject.toml`、`Cargo.toml` 等检测技术栈，并写入 `.cursor/rules/project-spec.mdc` 或 `.claude/CLAUDE.md`。

### 使用方式

在**你的项目**（任意语言/框架）中打开 AI 对话，说例如：

- 「帮我添加一下最佳实践」
- 「帮我制定一下当前项目规范」
- 「根据当前技术栈初始化开发规约」

AI 将：

1. **检测**项目类型（语言、框架、Web/桌面/App/后端/CLI/AI 等）；
2. **选择**本仓库中对应的最佳实践文件（中文 `aispec-skill/best-practices/zh/` 或英文 `aispec-skill/best-practices/en/`）；
3. **写入**到你项目中的规约路径（如 `.cursor/rules/`、`.claude/CLAUDE.md` 等），并替换 `[项目名]` 为实际项目名。

无需手写规约，也无需记住各编辑器的路径差异。

---

## 规约索引

- [aispec-skill/best-practices/zh/README.md](aispec-skill/best-practices/zh/README.md) — 前端、后端、桌面、小程序、系统工具、AI 与数据等分类索引。
- [aispec-skill/best-practices/en/README.md](aispec-skill/best-practices/en/README.md) — English spec index.

涵盖：Next.js、Vue/Nuxt、React Native、Flutter、小程序、Tauri、Qt、Python Qt、Go、Java、Python、Node.js、Rust 服务、CLI、AI Agent/LLM、数据/ML 等。

---

## 文档

- [安装与使用说明（详细）](docs/20260311-install-and-use.md) — 安装步骤、各编辑器配置、常见问题。

---

## 仓库结构

- **README.md** / **README.zh-CN.md** — 项目说明与使用方式（本文件）。
- **VERSION** — 当前技能/规约版本（如 1.0.0）。
- **CHANGELOG.md** — 版本与变更记录；升级时可查看。
- **install-skill.sh** — 把技能安装到编辑器（克隆后执行一次）。
- **aispec-skill/scripts/install.sh** — 可选：在 AI 拿不到本仓库时，把规约写入项目。
- **aispec-skill/** — 技能本体：**SKILL.md**、**best-practices/**（zh/、en/）与 **scripts/**。`install-skill.sh` 会将该目录链接/复制到 `~/.cursor/skills/aispec-skill` 等路径。
- **docs/** — 安装与使用说明。

---

## 仓库与贡献

- **仓库**：<https://github.com/wensiyuanxiang/aispec-skill>
- 欢迎 Issue 与 Pull Request。
