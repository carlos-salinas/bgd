#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BG_COLOR="${BG_COLOR:-steelblue}"
MESSAGE="${MESSAGE:-GitOps Demo}"
APP_VERSION="${APP_VERSION:-1.0.0}"
GIT_COMMIT="${GIT_COMMIT:-unknown}"

# shellcheck source=lib/validate-env.sh
source "${SCRIPT_DIR}/lib/validate-env.sh"
# shellcheck source=lib/render-html.sh
source "${SCRIPT_DIR}/lib/render-html.sh"

validate_runtime_env
render_index_html /opt/app-root/src/index.html

exec nginx -g "daemon off;"
