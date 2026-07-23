#!/usr/bin/env bash

REPO_DIR="/home/zyk3l/git/co2-work-companion"
VENV_COMPANION="$REPO_DIR/.venv/bin/companion"

if [[ ! -x "$VENV_COMPANION" ]]; then
    exit 0
fi

cd "$REPO_DIR" || exit 0
"$VENV_COMPANION" daemon start >/dev/null 2>&1 || true
