#!/bin/sh
# Usage: tools/build.sh <source.hmje|project-directory> [artifact] [target]
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
HMJEC=${HMJEC:-hmjec}
SOURCE=${1:?소스 파일 또는 프로젝트 폴더가 필요합니다}
ARTIFACT=${2:-$(basename "$SOURCE" .hmje)}
TARGET=${3:-posix-host-exe}
OUT="$ROOT/build/$ARTIFACT"
case "$TARGET" in macos-app|ios-sim-app|ios-app) OUT="$OUT.app";; windows-exe) OUT="$OUT.exe";; esac
mkdir -p "$ROOT/build"
if [ -d "$SOURCE" ]; then
    "$HMJEC" --project "$SOURCE" --artifact "$ARTIFACT" --target "$TARGET" -o "$OUT"
else
    "$HMJEC" --target "$TARGET" "$SOURCE" -o "$OUT"
fi
printf '\n출력: %s\n' "$OUT"
