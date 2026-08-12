#!/usr/bin/env bash
# Validate runtime environment variables before rendering the page.

validate_bg_color() {
  local color="${1:-}"
  if [[ -z "${color}" ]]; then
    echo "BG_COLOR must not be empty" >&2
    return 1
  fi
  if [[ ! "${color}" =~ ^#?[a-zA-Z0-9_-]+$ ]]; then
    echo "BG_COLOR has invalid characters: ${color}" >&2
    return 1
  fi
}

validate_app_version() {
  local version="${1:-}"
  if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.]+)?$ ]]; then
    echo "APP_VERSION must be semver-like: ${version}" >&2
    return 1
  fi
}

validate_git_commit() {
  local commit="${1:-}"
  # Accept any non-empty printable string (intentionally permissive for short SHAs and tags).
  if [[ ! "${commit}" =~ ^.+$ ]]; then
    echo "GIT_COMMIT must not be empty" >&2
    return 1
  fi
}

validate_runtime_env() {
  validate_bg_color "${BG_COLOR:-}"
  validate_app_version "${APP_VERSION:-}"
  validate_git_commit "${GIT_COMMIT:-}"
}
