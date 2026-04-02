#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

git config core.hooksPath .githooks
chmod +x "${ROOT_DIR}/.githooks/pre-commit"
chmod +x "${ROOT_DIR}/scripts/install-git-hooks.sh"

echo "git hooks installed from .githooks"