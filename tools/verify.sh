#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
HMJEC=${HMJEC:-hmjec}
mkdir -p build
"$HMJEC" --project tools --artifact 세션검증 --target posix-host-exe -o build/세션검증
export HMJE_SESSIONS_ROOT="$ROOT"
exec "$ROOT/build/세션검증" "$@"
