#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Runs all the scripts
for script in [0-9][0-9]-*.sh; do
    echo "::group::Running ${script}"
    bash "./${script}"
    echo "::endgroup::"
done
