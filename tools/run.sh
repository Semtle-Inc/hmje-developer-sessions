#!/bin/sh
# Single-file CLI examples. Intentional compile errors return a nonzero status.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
SOURCE=${1:?소스 파일이 필요합니다}
ARTIFACT=$(basename "$SOURCE" .hmje)
"$ROOT/tools/build.sh" "$SOURCE" "$ARTIFACT"
shift
if [ -f "${SOURCE%.hmje}.stdin" ]; then
    "$ROOT/build/$ARTIFACT" "$@" < "${SOURCE%.hmje}.stdin"
else
    "$ROOT/build/$ARTIFACT" "$@"
fi
