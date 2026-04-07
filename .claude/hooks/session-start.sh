#!/bin/bash
set -euo pipefail

# Only run in remote (web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install GitHub CLI (gh) if not already installed
if ! command -v gh &> /dev/null; then
  GH_VERSION="2.65.0"
  ARCH="$(dpkg --print-architecture 2>/dev/null || echo amd64)"
  curl -fsSL "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${ARCH}.deb" -o /tmp/gh.deb
  sudo dpkg -i /tmp/gh.deb > /dev/null 2>&1
  rm -f /tmp/gh.deb
fi
