#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

usage() {
	cat <<'EOF'
Usage: remote.sh <host> <user> [ansible-playbook args...]

Runs main.yml against a single remote macOS host without editing inventory.
EOF
}

if [[ $# -lt 2 ]]; then
	usage
	exit 1
fi

HOST="$1"
USER="$2"
shift 2

if ! command -v ansible-playbook >/dev/null 2>&1; then
	echo "error: ansible-playbook is not installed or not on PATH" >&2
	exit 1
fi

cd "$REPO_ROOT"

INVENTORY_SPEC="${HOST},"
ANSIBLE_CMD=(ansible-playbook main.yml -i "$INVENTORY_SPEC" -u "$USER" --ask-become-pass)

if [[ $# -gt 0 ]]; then
	ANSIBLE_CMD+=("$@")
fi

echo "Running: ${ANSIBLE_CMD[*]}"
"${ANSIBLE_CMD[@]}"

