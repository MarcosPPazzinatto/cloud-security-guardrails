#!/usr/bin/env bash
set -euo pipefail

# Local one-shot scans using dockerized tools if available, else skip gracefully.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[*] Running Gitleaks (secrets)..."
if command -v docker >/dev/null 2>&1; then
  docker run --rm -v "$PWD:/repo" zricethezav/gitleaks:latest detect -s /repo -v
else
  echo "docker not found, skipping gitleaks local run"
fi

echo "[*] Running Trivy (filesystem)..."
if command -v docker >/dev/null 2>&1; then
  docker run --rm -v "$PWD:/src" aquasec/trivy:latest fs --exit-code 0 --severity CRITICAL,HIGH /src || true
else
  echo "docker not found, skipping trivy local run"
fi

echo "[*] Running Checkov (Terraform)..."
if command -v docker >/dev/null 2>&1; then
  docker run --rm -v "$PWD:/tf" bridgecrew/checkov:latest -d /tf/terraform || true
else
  echo "docker not found, skipping checkov local run"
fi

echo "[*] Done."

