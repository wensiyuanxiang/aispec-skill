# AISpec Skill — 安装与使用说明 | Installation & Usage

本文档说明如何安装 AISpec Skill，以及在 Cursor、Claude Code、OpenClaw 等工具中如何通过对话完成「添加最佳实践」「制定项目规范」的初始化。

This document describes how to install AISpec Skill and how to use it in Cursor, Claude Code, OpenClaw, etc., to add best practices and set up project norms via conversation.

---

## 两个脚本分别做什么？| What do the two scripts do?

| 脚本 | 作用 | 何时用 |
|------|------|--------|
| **`install-skill.sh`**（仓库根目录） | **把技能安装到编辑器**：把仓库内的 `aispec-skill/` 目录（含 `SKILL.md` 与 `best-practices/`）链接/复制到 Cursor、Claude Code、OpenClaw、Codex 的「技能目录」（全局或项目本地），这样 AI 才能读到技能内容。 | 下载仓库后**执行一次**（全局或某项目）。 |
| **`aispec-skill/scripts/install.sh`** | **把规约写入某个项目**：根据项目技术栈检测，将对应 best-practice 文件写到该项目的 `.cursor/rules/` 或 `.claude/CLAUDE.md`。不安装技能本身。 | 仅当 AI 拿不到本仓库时，在目标项目根目录手动执行。 |

| Script | Purpose | When to use |
|--------|----------|-------------|
| **`install-skill.sh`** (repo root) | **Install the skill into your editor**: link/copy the repo’s `aispec-skill/` directory (SKILL.md + best-practices/) into Cursor, Claude Code, OpenClaw, Codex skill dirs (global or project-local) so the AI can read the skill. | Run **once** after cloning (global or per project). |
| **`aispec-skill/scripts/install.sh`** | **Write the spec into a project**: detect stack and write the matching best-practice file to that project’s `.cursor/rules/` or `.claude/CLAUDE.md`. Does not install the skill. | Only when the AI cannot access this repo; run from the target project root. |

---

## 技能是否必须配合脚本？| Does the skill need a script?

**不需要。** 技能**仅靠 SKILL 文件即可工作**：AI 读取 `aispec-skill/SKILL.md` 的步骤说明，在技能已安装或可用 `@` 引用本仓库时，自动完成「检测项目 → 选择规约 → 写入」全流程，无需执行任何脚本。

**No.** The skill **works with the SKILL file alone**: the AI follows the steps in `aispec-skill/SKILL.md` and, when the skill is installed or the repo is referenced with `@`, runs the full flow (detect → choose spec → write) without any script.

只有在 AI **拿不到**本仓库内容时，才需要**可选**的脚本：在目标项目根目录执行 `aispec-skill/scripts/install.sh`，由脚本把规约写入该项目。注意：该脚本是「**把规约装进项目**」用的，**不是**在编辑器里安装技能，也**不是**给技能调度的——技能不会调用它，AI 按 SKILL 自己就能完成同样步骤。

The **optional** script is only for when the AI **cannot** read this repo: run `aispec-skill/scripts/install.sh` from your project root to **write the spec into that project**. Note: the script **installs the spec into the project**; it does **not** install the skill into your editor, and the skill does **not** invoke it—the AI does the same steps by following SKILL.md.

---

## 一、安装 | Installation

### 1. 获取本仓库 | Get the repo

```bash
git clone https://github.com/wensiyuanxiang/aispec-skill.git
cd aispec-skill
# 或 fork 后使用你的仓库地址
```

### 2. 安装技能到编辑器（推荐：用根目录脚本）| Install skill into editor (recommended: use root script)

在仓库根目录执行（一次性）：

```bash
./install-skill.sh --tool all --scope global
```

会向以下路径安装（默认符号链接，可用 `--method copy` 改为复制）：

- **Cursor** 全局：`~/.cursor/skills/aispec-skill`
- **Claude Code** 全局：`~/.claude/skills/aispec-skill`
- **OpenClaw** 全局：`~/.openclaw/skills/aispec-skill`
- **Codex** 全局：`~/.codex/skills/aispec-skill`

仅安装到某一工具或仅当前项目：`--tool cursor --scope global` 或 `--scope local --target /path/to/project`。详见 `./install-skill.sh --help`。

### 3. Cursor 用户（若未用上面脚本）| For Cursor (if not using script above)

- **方式 A（项目内）**：将仓库中的 **`aispec-skill/`** 目录复制到你的项目下，例如 `your-project/.cursor/skills/aispec-skill/`，确保该目录内有 `SKILL.md` 和 `best-practices/`。
- **方式 B（全局）**：运行 `install-skill.sh --tool cursor --scope global`，或手动将 **`aispec-skill/`** 目录放到 `~/.cursor/skills/aispec-skill/`。
- **方式 C（手动引用）**：在对话中用 `@` 引用本仓库或 `aispec-skill/SKILL.md`，让 AI 按技能说明执行。

### 4. Claude Code 用户 | For Claude Code

- 将本仓库克隆到本地；在需要初始化规约的项目中，通过 `@` 引用本仓库或 `aispec-skill/best-practices/zh/README.md`、`aispec-skill/best-practices/en/README.md`。
- 对 AI 说：「请根据 AISpec Skill 的 aispec-skill/SKILL.md 流程，检测当前项目技术栈，并把我需要的规约写入 `.claude/CLAUDE.md` 或 `.claude/rules/`。」
- AI 会按 aispec-skill/SKILL.md 中的步骤：检测 → 选择对应规约文件 → 替换项目名 → 写入到你指定的路径。

### 5. OpenClaw / Codex / 其他 | For OpenClaw, Codex, others

- 克隆本仓库；在对话中引用本仓库或 `aispec-skill/SKILL.md`。
- 说明你使用的编辑器及规约路径（例如 Codex 的 `AGENTS.md`、`.codex/rules/`），请 AI 按技能流程检测项目并写入对应格式与路径。

---

## 二、使用方式 | How to Use

### 触发语 | Trigger phrases

在**你的项目**（要注入规约的项目）里打开 AI 对话，使用例如：

- 「帮我添加一下最佳实践」
- 「帮我制定一下当前项目规范」
- 「根据当前技术栈初始化开发规约 / 项目规约」
- "Add best practices for this project."
- "Set up project norms (or coding standards) for this project."
- "Initialize project specs based on the current stack."

### 流程说明 | What the AI does

1. **检测**：根据 `package.json`、`pyproject.toml`、`Cargo.toml`、`pubspec.yaml`、目录结构等判断语言与框架（如 Next.js、FastAPI、Flutter、Tauri、Qt 等）。
2. **选择规约**：从 `aispec-skill/best-practices/zh/` 或 `aispec-skill/best-practices/en/` 中选取对应的 reference 文件（见 aispec-skill/SKILL.md 中的映射表）。
3. **写入**：将规约内容中的 `[项目名]` / `[Project Name]` 替换为实际项目名，并写入到你项目中的规约路径：
   - Cursor：`.cursor/rules/` 下新建 `.mdc` 或 `.md`
   - Claude Code：`.claude/CLAUDE.md` 或 `.claude/rules/*.md`
   - 其他：按该工具文档的项目规约路径

若未指定编辑器，技能默认按 Cursor 的 `.cursor/rules/` 写入，并提示你其他编辑器可复用同一内容到对应路径。

---

## 三、规约内容从哪里来 | Where Specs Come From

- 所有规约原文位于本仓库的 **`aispec-skill/`** 目录下：
  - 中文：`aispec-skill/best-practices/zh/`，索引见 [aispec-skill/best-practices/zh/README.md](../aispec-skill/best-practices/zh/README.md)
  - 英文：`aispec-skill/best-practices/en/`，索引见 [aispec-skill/best-practices/en/README.md](../aispec-skill/best-practices/en/README.md)
- 技能**不会**捏造规约，只会从上述路径读取并做「项目名替换 + 写入目标路径」。

---

## 四、常见问题 | FAQ

**Q: 检测错了技术栈怎么办？**  
A: 在对话中明确说明「本项目是 Next.js」或「以 Go 为主」，让 AI 按你的指定选择规约并重新写入。

**Q: 可以同时装多份规约吗（例如前端 + 后端）？**  
A: 可以。说「请为当前项目添加 Next.js 和 Go 两份最佳实践」，AI 会选取两个 reference 并分别写入（可用不同文件名或子目录区分）。

**Q: 想用英文规约**  
A: 说「请用英文版规约」或 "Use the English spec from aispec-skill/best-practices/en/"，AI 会从 `aispec-skill/best-practices/en/` 取对应文件。

**Q: 本仓库不在本地，AI 读不到 aispec-skill 目录怎么办？**  
A: 技能会退化为「说明流程 + 请你粘贴规约内容或克隆仓库后重试」。建议将本仓库克隆到本地并运行 `install-skill.sh`，或通过 Cursor 技能/引用让 AI 能访问到 `aispec-skill/SKILL.md` 与 `aispec-skill/best-practices/`。

---

## 五、宣传语（可复用）| Slogan (reusable)

- **中文**：**一句初始化，规约随栈走。** AISpec Skill —— 让 AI 按你的技术栈，一键注入最佳实践。
- **English**: **One prompt, project-ready.** AISpec Skill — one prompt to inject best practices for your stack.
