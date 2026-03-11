#!/usr/bin/env bash
# Install AISpec Skill into a tool's skill directory (global or project-local).
# Run from the repo root after cloning. This makes the skill available to
# Cursor / Claude Code / OpenClaw / Codex so the AI can read SKILL.md and
# best-practices/ when you ask to add best practices.
#
# Usage:
#   ./install-skill.sh --tool cursor --scope global
#   ./install-skill.sh --tool cursor --scope local --target /path/to/your/project
#   ./install-skill.sh --tool all --scope global
#
# Options:
#   --tool   cursor|claude|openclaw|codex|all  (default: all)
#   --scope global|local                       (default: global)
#   --target DIR                               (for local: project root; default: .)
#   --method link|copy                         (default: link)
#   --lang   en|zh                             (SKILL.md language; default: interactive prompt)

set -e

TOOL=""
SCOPE="global"
TARGET=""
METHOD="link"
LANG_CHOICE=""

# Repo root = directory containing this script; skill content = aispec-skill/ (SKILL.md + best-practices/)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SKILL_SRC="$REPO_ROOT/aispec-skill"
SKILL_NAME="aispec-skill"

usage() {
  echo "Usage: $0 [--tool TOOL|all] [--scope global|local] [--target DIR] [--method link|copy] [--lang en|zh]"
  echo ""
  echo "  --tool   cursor|claude|openclaw|codex|antigravity|trae|codebuddy|all (default: all)"
  echo "  --scope  global = user-wide, local = project-only (default: global)"
  echo "  --target For local scope: project root (default: current dir)"
  echo "  --method link = symlink repo, copy = copy files (default: link)"
  echo "  --lang   SKILL.md language: zh (Chinese, default) or en (English)"
  echo "           If omitted, the script will ask interactively."
  echo ""
  echo "Paths used:"
  echo "  Cursor global:       ~/.cursor/skills/$SKILL_NAME"
  echo "  Cursor local:        <target>/.cursor/skills/$SKILL_NAME"
  echo "  Claude global:       ~/.claude/skills/$SKILL_NAME"
  echo "  Claude local:        <target>/.claude/skills/$SKILL_NAME"
  echo "  OpenClaw global:     ~/.openclaw/skills/$SKILL_NAME"
  echo "  OpenClaw local:      <target>/.openclaw/skills/$SKILL_NAME"
  echo "  Codex global:        ~/.codex/skills/$SKILL_NAME"
  echo "  Codex local:         <target>/.codex/skills/$SKILL_NAME"
  echo "  Antigravity global:  ~/.antigravity/skills/$SKILL_NAME"
  echo "  Antigravity local:   <target>/.antigravity/skills/$SKILL_NAME"
  echo "  Trae global:         ~/.trae/skills/$SKILL_NAME"
  echo "  Trae local:          <target>/.trae/skills/$SKILL_NAME"
  echo "  Code Buddy global:   ~/.codebuddy/skills/$SKILL_NAME"
  echo "  Code Buddy local:    <target>/.codebuddy/skills/$SKILL_NAME"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool)   TOOL="$2";   shift 2 ;;
    --scope)  SCOPE="$2";  shift 2 ;;
    --target) TARGET="$2"; shift 2 ;;
    --method) METHOD="$2"; shift 2 ;;
    --lang)   LANG_CHOICE="$2"; shift 2 ;;
    -h|--help) usage ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$TOOL" ]]; then
  TOOL="all"
fi

# Interactive language prompt if --lang not specified
if [[ -z "$LANG_CHOICE" ]]; then
  echo "Select SKILL.md language / 选择技能文件语言:"
  echo "  1) 中文 Chinese (default / 默认)"
  echo "  2) English"
  printf "Enter 1 or 2 [1]: "
  read -r lang_input
  case "$lang_input" in
    2|en|EN|english) LANG_CHOICE="en" ;;
    *) LANG_CHOICE="zh" ;;
  esac
fi

if [[ "$LANG_CHOICE" == "en" ]]; then
  METHOD="copy"
fi

if [[ "$SCOPE" == "local" ]]; then
  TARGET="${TARGET:-.}"
  TARGET="$(cd "$TARGET" && pwd)"
fi

install_one() {
  local dest="$1"
  local kind="$2"
  if [[ -z "$dest" ]]; then return; fi
  if [[ ! -d "$SKILL_SRC" ]] || [[ ! -f "$SKILL_SRC/SKILL.md" ]]; then
    echo "  $kind: skip (skill dir not found: $SKILL_SRC)" >&2
    return
  fi
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" ]]; then
    if [[ -L "$dest" ]] && [[ "$(readlink "$dest")" == "$SKILL_SRC" ]]; then
      echo "  $kind: already linked ($dest)"
    else
      echo "  $kind: already exists ($dest), skip"
    fi
    return
  fi
  if [[ "$METHOD" == "copy" ]]; then
    cp -R "$SKILL_SRC" "$dest"
    echo "  $kind: copied to $dest"
  else
    ln -s "$SKILL_SRC" "$dest"
    echo "  $kind: linked at $dest"
  fi
}

# After install, if --lang en, overwrite SKILL.md with English version.
# Default SKILL.md is Chinese; SKILL.en.md is the English alternative.
apply_lang() {
  local dest="$1"
  if [[ "$LANG_CHOICE" != "en" ]]; then return; fi
  if [[ ! -d "$dest" ]]; then return; fi
  local en_src="$dest/SKILL.en.md"
  local target="$dest/SKILL.md"
  if [[ -f "$en_src" ]]; then
    cp "$en_src" "$target"
    echo "  -> SKILL.md replaced with English version"
  fi
}

# Claude Code: global reads only ~/.claude/CLAUDE.md; project-level reads .claude/rules/.
# For global: append skill loader to CLAUDE.md.
# For local: create .claude/rules/aispec-skill.md (project-level rules are scanned).
install_claude_loader() {
  local skill_path="$1"
  local kind="$2"

  if [[ "$SCOPE" == "global" ]]; then
    local claude_md="$HOME/.claude/CLAUDE.md"
    if [[ -f "$claude_md" ]] && grep -q "aispec-skill/SKILL.md" "$claude_md" 2>/dev/null; then
      echo "  $kind CLAUDE.md loader: already present"
      return
    fi
    mkdir -p "$HOME/.claude"
    cat >> "$claude_md" <<CLEOF

---

## AISpec Skill

When the user asks to add best practices, set up project norms, initialize specs, or generate coding guidelines (e.g. "帮我添加最佳实践", "Add best practices", "初始化项目规约", "帮我制定项目规范"), read and follow the skill file at:

\`\`\`
$skill_path/SKILL.md
\`\`\`

That file contains the full workflow: detect project type, select the right spec, and write it into the user's project.
CLEOF
    echo "  $kind CLAUDE.md loader: appended to $claude_md"
  else
    local rules_dir="$TARGET/.claude/rules"
    local loader="$rules_dir/aispec-skill.md"
    mkdir -p "$rules_dir"
    if [[ -f "$loader" ]]; then
      echo "  $kind rule loader: already exists ($loader)"
      return
    fi
    cat > "$loader" <<RULEEOF
# AISpec Skill Loader

When the user asks to add best practices, set up project norms, initialize specs, or generate coding guidelines (e.g. "帮我添加最佳实践", "Add best practices", "初始化项目规约", "帮我制定项目规范"), read and follow the skill file at:

\`\`\`
$skill_path/SKILL.md
\`\`\`

That file contains the full workflow: detect project type, select the right spec, and write it into the user's project.
RULEEOF
    echo "  $kind rule loader: created ($loader)"
  fi
}

echo "AISpec Skill install (tool=$TOOL scope=$SCOPE method=$METHOD lang=$LANG_CHOICE)"
echo "  Repo: $REPO_ROOT"
if [[ "$SCOPE" == "local" ]]; then
  echo "  Target project: $TARGET"
fi
echo ""

install_for() {
  local tool_name="$1"
  local dest="$2"
  local kind="$3"
  install_one "$dest" "$kind"
  apply_lang "$dest"
  if [[ "$tool_name" == "claude" ]]; then
    install_claude_loader "$dest" "$kind"
  fi
}

if [[ "$SCOPE" == "global" ]]; then
  case "$TOOL" in
    cursor)       install_for cursor       "$HOME/.cursor/skills/$SKILL_NAME"       "Cursor (global)" ;;
    claude)       install_for claude       "$HOME/.claude/skills/$SKILL_NAME"       "Claude Code (global)" ;;
    openclaw)     install_for openclaw     "$HOME/.openclaw/skills/$SKILL_NAME"     "OpenClaw (global)" ;;
    codex)        install_for codex        "$HOME/.codex/skills/$SKILL_NAME"        "Codex (global)" ;;
    antigravity)  install_for antigravity  "$HOME/.antigravity/skills/$SKILL_NAME"  "Antigravity (global)" ;;
    trae)         install_for trae         "$HOME/.trae/skills/$SKILL_NAME"         "Trae (global)" ;;
    codebuddy)    install_for codebuddy    "$HOME/.codebuddy/skills/$SKILL_NAME"    "Code Buddy (global)" ;;
    all)
      install_for cursor       "$HOME/.cursor/skills/$SKILL_NAME"       "Cursor (global)"
      install_for claude       "$HOME/.claude/skills/$SKILL_NAME"       "Claude Code (global)"
      install_for openclaw     "$HOME/.openclaw/skills/$SKILL_NAME"     "OpenClaw (global)"
      install_for codex        "$HOME/.codex/skills/$SKILL_NAME"        "Codex (global)"
      install_for antigravity  "$HOME/.antigravity/skills/$SKILL_NAME"  "Antigravity (global)"
      install_for trae         "$HOME/.trae/skills/$SKILL_NAME"         "Trae (global)"
      install_for codebuddy    "$HOME/.codebuddy/skills/$SKILL_NAME"    "Code Buddy (global)"
      ;;
    *)
      echo "Unknown tool: $TOOL" >&2
      exit 1
      ;;
  esac
else
  case "$TOOL" in
    cursor)       install_for cursor       "$TARGET/.cursor/skills/$SKILL_NAME"       "Cursor (local)" ;;
    claude)       install_for claude       "$TARGET/.claude/skills/$SKILL_NAME"       "Claude Code (local)" ;;
    openclaw)     install_for openclaw     "$TARGET/.openclaw/skills/$SKILL_NAME"     "OpenClaw (local)" ;;
    codex)        install_for codex        "$TARGET/.codex/skills/$SKILL_NAME"        "Codex (local)" ;;
    antigravity)  install_for antigravity  "$TARGET/.antigravity/skills/$SKILL_NAME"  "Antigravity (local)" ;;
    trae)         install_for trae         "$TARGET/.trae/skills/$SKILL_NAME"         "Trae (local)" ;;
    codebuddy)    install_for codebuddy    "$TARGET/.codebuddy/skills/$SKILL_NAME"    "Code Buddy (local)" ;;
    all)
      install_for cursor       "$TARGET/.cursor/skills/$SKILL_NAME"       "Cursor (local)"
      install_for claude       "$TARGET/.claude/skills/$SKILL_NAME"       "Claude Code (local)"
      install_for openclaw     "$TARGET/.openclaw/skills/$SKILL_NAME"     "OpenClaw (local)"
      install_for codex        "$TARGET/.codex/skills/$SKILL_NAME"        "Codex (local)"
      install_for antigravity  "$TARGET/.antigravity/skills/$SKILL_NAME"  "Antigravity (local)"
      install_for trae         "$TARGET/.trae/skills/$SKILL_NAME"         "Trae (local)"
      install_for codebuddy    "$TARGET/.codebuddy/skills/$SKILL_NAME"    "Code Buddy (local)"
      ;;
    *)
      echo "Unknown tool: $TOOL" >&2
      exit 1
      ;;
  esac
fi

echo ""
if [[ "$LANG_CHOICE" == "zh" ]]; then
  echo "完成。如需要请重启编辑器，然后在任意项目中对 AI 说「帮我添加最佳实践」即可。"
else
  echo "Done. Restart the editor if needed; then ask the AI to 'add best practices' in any project."
fi
