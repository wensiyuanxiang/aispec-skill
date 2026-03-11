#!/usr/bin/env bash
# This script INSTALLS THE SPEC INTO A PROJECT (writes best-practice file to
# .cursor/rules/ or .claude/CLAUDE.md). It is NOT for installing the skill
# into your editor, and the skill does NOT call this script — the AI does the
# same job by following SKILL.md. Run this script only when the AI cannot
# access this repo (e.g. you are in another project and the skill is not loaded).
#
# Usage (from your project root):
#   AISPEC_ROOT=/path/to/aispec-skill-repo bash /path/to/aispec-skill/scripts/install.sh
#   # or from inside installed skill dir:
#   ~/.cursor/skills/aispec-skill/scripts/install.sh
#
# Env: AISPEC_ROOT (repo root or skill dir; default: parent of scripts/ = aispec-skill dir)
#      AISPEC_TARGET (project root to write into, default: cwd or first arg)
#      AISPEC_LANG (zh|en, default: zh)
#      AISPEC_EDITOR (cursor|claude, default: cursor)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
# Root = repo root or installed skill dir (parent of scripts/)
ROOT="${AISPEC_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
if [[ -d "$ROOT/aispec-skill/best-practices" ]]; then
  BEST="$ROOT/aispec-skill/best-practices"
else
  BEST="$ROOT/best-practices"
fi
TARGET_ROOT="${AISPEC_TARGET:-${1:-.}}"
TARGET_ROOT="$(cd "$TARGET_ROOT" && pwd)"
LANG="${AISPEC_LANG:-zh}"
EDITOR="${AISPEC_EDITOR:-cursor}"

if [[ "$LANG" == "en" ]]; then
  SPEC_DIR="$BEST/en"
else
  SPEC_DIR="$BEST/zh"
fi

if [[ ! -d "$SPEC_DIR" ]]; then
  echo "Error: Spec dir not found: $SPEC_DIR (root=$ROOT)" >&2
  exit 1
fi

# Detect project type and choose spec file
SPEC_FILE=""
PROJECT_NAME="$(basename "$TARGET_ROOT")"

detect() {
  if [[ -f "$TARGET_ROOT/package.json" ]]; then
    if grep -q '"next"' "$TARGET_ROOT/package.json" 2>/dev/null || grep -q '"nextjs"' "$TARGET_ROOT/package.json" 2>/dev/null; then
      echo "frontend/nextjs-vercel-reference.md"
      return
    fi
    if grep -q '"nuxt"' "$TARGET_ROOT/package.json" 2>/dev/null; then
      echo "frontend/vue-nuxt-reference.md"
      return
    fi
    if grep -q '"react-native"' "$TARGET_ROOT/package.json" 2>/dev/null || grep -q '"expo"' "$TARGET_ROOT/package.json" 2>/dev/null; then
      echo "frontend/react-native-reference.md"
      return
    fi
    # Node backend
    if grep -q '"fastify"\|"nestjs"' "$TARGET_ROOT/package.json" 2>/dev/null; then
      echo "backend/nodejs-backend-reference.md"
      return
    fi
    echo "frontend/nextjs-vercel-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/pyproject.toml" ]]; then
    if grep -q 'PySide6\|PyQt6' "$TARGET_ROOT/pyproject.toml" 2>/dev/null; then
      echo "desktop/python-qt-desktop-reference.md"
      return
    fi
    echo "backend/python-backend-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/Cargo.toml" ]]; then
    if [[ -d "$TARGET_ROOT/src-tauri" ]]; then
      echo "desktop/tauri-rust-react-desktop-reference.md"
      return
    fi
    echo "system-tools/rust-system-service-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/pubspec.yaml" ]]; then
    echo "frontend/flutter-app-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/go.mod" ]]; then
    echo "backend/go-project-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/pom.xml" ]] || [[ -f "$TARGET_ROOT/build.gradle" ]] || [[ -f "$TARGET_ROOT/build.gradle.kts" ]]; then
    echo "backend/java-backend-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/CMakeLists.txt" ]] && grep -q "Qt" "$TARGET_ROOT/CMakeLists.txt" 2>/dev/null; then
    echo "desktop/qt-desktop-reference.md"
    return
  fi
  if [[ -f "$TARGET_ROOT/project.config.json" ]] || [[ -f "$TARGET_ROOT/app.json" ]] && grep -q "miniprogram\|weixin" "$TARGET_ROOT/app.json" 2>/dev/null; then
    echo "miniapp/miniapp-reference.md"
    return
  fi
  echo ""
}

REL_SPEC="$(detect)"
if [[ -z "$REL_SPEC" ]]; then
  echo "Could not detect project type. Set spec manually, e.g.:" >&2
  echo "  cp $SPEC_DIR/frontend/nextjs-vercel-reference.md ..." >&2
  exit 1
fi

SPEC_FILE="$SPEC_DIR/$REL_SPEC"
if [[ ! -f "$SPEC_FILE" ]]; then
  echo "Spec file not found: $SPEC_FILE" >&2
  exit 1
fi

echo "Detected: $REL_SPEC -> installing for $EDITOR (lang=$LANG)"

CONTENT="$(sed "s/\[项目名\]/$PROJECT_NAME/g; s/\[Project Name\]/$PROJECT_NAME/g" "$SPEC_FILE")"

if [[ "$EDITOR" == "claude" ]]; then
  mkdir -p "$TARGET_ROOT/.claude"
  echo "$CONTENT" > "$TARGET_ROOT/.claude/CLAUDE.md"
  echo "Wrote $TARGET_ROOT/.claude/CLAUDE.md"
else
  mkdir -p "$TARGET_ROOT/.cursor/rules"
  RULE_FILE="$TARGET_ROOT/.cursor/rules/project-spec.mdc"
  {
    echo "---"
    echo "description: Project best practices (AISpec Skill)"
    echo "globs: **/*"
    echo "---"
    echo ""
    echo "$CONTENT"
  } > "$RULE_FILE"
  echo "Wrote $RULE_FILE"
fi
