# AISpec Skill

**English | [English](README.md)**

**版本：[1.0.0](VERSION) · [更新说明](CHANGELOG.md)**

---

**一句初始化，规约随栈走。**

通用型 AI 编码助手技能：一份规约、多端落地；一句话初始化，项目即规范。用**同一套**最佳实践内容，在 Cursor、Claude Code、OpenClaw、Codex 等编辑器中生成并落地**项目级规约**。在任意项目里对 AI 说「帮我添加一下最佳实践」或「帮我制定当前项目规范」，AI 会自动识别技术栈并写入对应规约文件。

---

## 为什么有用

| 价值 | 说明 |
|------|------|
| **一致性** | 团队与个人在不同编辑器间使用同一套规范，减少风格漂移与重复劳动。 |
| **可发现** | 新成员或新项目一键获得成体系的开发规约，而不是从零编写。 |
| **可维护** | 规约集中在仓库中维护，更新后可再次运行技能同步到项目。 |
| **多端一致** | 同一份最佳实践可输出到 Cursor、Claude、Codex 等，无需为每个工具各写一份。 |

---

## 应用场景

- **新建 / 空项目**：在**空目录**下可说「先帮我加一份 Next.js 项目规约」或「在搭脚手架前先加一份 Go 后端规约」。AI 会通过 1～2 个问题确认类型后写入规约，无需先初始化代码。
- **新项目（已脚手架）**：在刚初始化的仓库中，让 AI「根据当前技术栈初始化最佳实践」，自动生成并写入规约。
- **老项目规范化**：在已有代码库中「帮我制定当前项目规范」，AI 识别栈并追加或更新规约文件。
- **多技术栈项目**：前后端分离、Monorepo 等，可针对不同子路径或子项目分别注入对应规约。
- **团队统一规范**：将本仓库或精选规约作为团队标准，通过技能在各自项目中一键安装。

---

## 支持的 AI 编辑器

项目级规约路径（仅列工程内，不含用户全局）：

| 工具 | 项目规约路径 | 说明 |
|------|--------------|------|
| **Cursor** | `.cursor/rules/` | 每条规则一个 `.mdc` 或 `.md`（含 frontmatter） |
| **Claude Code** | `.claude/CLAUDE.md` 或 `.claude/rules/*.md` | 主规约 + 可选模块化规则 |
| **Codex / OpenClaw** | `AGENTS.md`、`.codex/rules/*.rules`、技能目录等 | 按各工具文档配置 |
| **Antigravity** (Google) | `.antigravity/rules.md`、`.agent/rules/` | 项目规则自动加载 |
| **Trae**（字节） | `.trae/project_rules.md` 或 `.trae/rules` | Markdown |
| **Code Buddy**（腾讯云） | `.codebuddy/rules/`、根目录 `CODEBUDDY.md` 或 `AGENTS.md` | 每条规则子目录 `RULE.mdc` |

---

## 安装与使用

**技能不依赖脚本即可工作**：AI 阅读 `aispec-skill/SKILL.md`，在你说「添加最佳实践」时自动检测项目并写入对应规约。技能本体（SKILL.md + 最佳实践）在 **`aispec-skill/`** 目录下。

### 把技能安装到编辑器（一次性）

克隆本仓库后，在**仓库根目录**执行：

```bash
./install-skill.sh --tool all --scope global
```

会在用户目录下为 Cursor、Claude Code、OpenClaw、Codex 安装技能（`~/.cursor/skills/`、`~/.claude/skills/` 等）。参数说明：

- `--tool cursor|claude|openclaw|codex|all`（默认 all）
- `--scope global|local`（默认 global）。选 `local` 则只对指定项目生效。
- `--target DIR`（在 `--scope local` 时：项目根目录，默认当前目录）
- `--method link|copy`（默认 link。若系统或编辑器不认符号链接，可改为 copy）

示例：

```bash
./install-skill.sh --tool cursor --scope global
./install-skill.sh --tool all --scope local --target /path/to/我的项目
./install-skill.sh --help
```

### 方式一：仅靠 AI（写规约无需脚本）

- **Cursor**：执行上述 `install-skill.sh` 或手动将 **`aispec-skill/`** 目录放到项目的 `.cursor/skills/aispec-skill/` 或用户目录 `~/.cursor/skills/aispec-skill/` 后，AI 即可读取 `SKILL.md` 并在你提出「添加最佳实践」时写入规约。
- **Claude Code / 其他**：安装后，或在对话中用 `@` 引用本仓库，AI 会按技能流程执行「检测项目 → 选择规约 → 写入」。

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
