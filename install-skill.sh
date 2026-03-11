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

set -e

TOOL=""
SCOPE="global"
TARGET=""
METHOD="link"

# Repo root = directory containing this script; skill content = aispec-skill/ (SKILL.md + best-practices/)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SKILL_SRC="$REPO_ROOT/aispec-skill"
SKILL_NAME="aispec-skill"

usage() {
  echo "Usage: $0 [--tool cursor|claude|openclaw|codex|all] [--scope global|local] [--target DIR] [--method link|copy]"
  echo ""
  echo "  --tool   Tool(s) to install for (default: all)"
  echo "  --scope  global = user-wide, local = project-only (default: global)"
  echo "  --target For local scope: project root (default: current dir)"
  echo "  --method link = symlink repo, copy = copy files (default: link)"
  echo ""
  echo "Paths used:"
  echo "  Cursor global:    ~/.cursor/skills/$SKILL_NAME"
  echo "  Cursor local:     <target>/.cursor/skills/$SKILL_NAME"
  echo "  Claude global:    ~/.claude/skills/$SKILL_NAME"
  echo "  Claude local:     <target>/.claude/skills/$SKILL_NAME"
  echo "  OpenClaw global:  ~/.openclaw/skills/$SKILL_NAME"
  echo "  OpenClaw local:   <target>/.openclaw/skills/$SKILL_NAME"
  echo "  Codex global:     ~/.codex/skills/$SKILL_NAME"
  echo "  Codex local:      <target>/.codex/skills/$SKILL_NAME"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool)   TOOL="$2";   shift 2 ;;
    --scope)  SCOPE="$2";  shift 2 ;;
    --target) TARGET="$2"; shift 2 ;;
    --method) METHOD="$2"; shift 2 ;;
    -h|--help) usage ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$TOOL" ]]; then
  TOOL="all"
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

echo "AISpec Skill install (tool=$TOOL scope=$SCOPE method=$METHOD)"
echo "  Repo: $REPO_ROOT"
if [[ "$SCOPE" == "local" ]]; then
  echo "  Target project: $TARGET"
fi
echo ""

if [[ "$SCOPE" == "global" ]]; then
  case "$TOOL" in
    cursor)
      install_one "$HOME/.cursor/skills/$SKILL_NAME" "Cursor (global)"
      ;;
    claude)
      install_one "$HOME/.claude/skills/$SKILL_NAME" "Claude Code (global)"
      ;;
    openclaw)
      install_one "$HOME/.openclaw/skills/$SKILL_NAME" "OpenClaw (global)"
      ;;
    codex)
      install_one "$HOME/.codex/skills/$SKILL_NAME" "Codex (global)"
      ;;
    all)
      install_one "$HOME/.cursor/skills/$SKILL_NAME" "Cursor (global)"
      install_one "$HOME/.claude/skills/$SKILL_NAME" "Claude Code (global)"
      install_one "$HOME/.openclaw/skills/$SKILL_NAME" "OpenClaw (global)"
      install_one "$HOME/.codex/skills/$SKILL_NAME" "Codex (global)"
      ;;
    *)
      echo "Unknown tool: $TOOL" >&2
      exit 1
      ;;
  esac
else
  case "$TOOL" in
    cursor)
      install_one "$TARGET/.cursor/skills/$SKILL_NAME" "Cursor (local)"
      ;;
    claude)
      install_one "$TARGET/.claude/skills/$SKILL_NAME" "Claude Code (local)"
      ;;
    openclaw)
      install_one "$TARGET/.openclaw/skills/$SKILL_NAME" "OpenClaw (local)"
      ;;
    codex)
      install_one "$TARGET/.codex/skills/$SKILL_NAME" "Codex (local)"
      ;;
    all)
      install_one "$TARGET/.cursor/skills/$SKILL_NAME" "Cursor (local)"
      install_one "$TARGET/.claude/skills/$SKILL_NAME" "Claude Code (local)"
      install_one "$TARGET/.openclaw/skills/$SKILL_NAME" "OpenClaw (local)"
      install_one "$TARGET/.codex/skills/$SKILL_NAME" "Codex (local)"
      ;;
    *)
      echo "Unknown tool: $TOOL" >&2
      exit 1
      ;;
  esac
fi

echo ""
echo "Done. Restart the editor if needed; then ask the AI to 'add best practices' in any project."
