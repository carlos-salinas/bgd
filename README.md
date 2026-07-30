# bgd

Small demo web app for OpenShift GitOps / CI–CD labs.

It runs nginx (UBI9) and serves a single page whose background color, message, and version come from environment variables — useful to show image or config changes after a pipeline push and Argo CD sync.

| Variable | Default | Purpose |
| -------- | ------- | ------- |
| `BG_COLOR` | `steelblue` | Page background |
| `MESSAGE` | `GitOps Demo` | Headline text |
| `APP_VERSION` | `1.0.0` | Shown as version |
| `GIT_COMMIT` | `unknown` | Optional commit SHA |

## Build and run locally

```bash
podman build -t bgd:local .
podman run --rm -p 8080:8080 \
  -e BG_COLOR=green -e MESSAGE='Hello GitOps' -e APP_VERSION=1.1.0 \
  bgd:local
```

Open http://localhost:8080.

## Files

| File | Role |
| ---- | ---- |
| `Dockerfile` | UBI nginx image, non-root user |
| `entrypoint.sh` | Writes `index.html` from env, then starts nginx |

Deploy manifests for this app live in the GitOps repo (e.g. `my-app-gitops` → `bgd/base`), not in this repository.
