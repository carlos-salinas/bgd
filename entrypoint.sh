#!/usr/bin/env bash
set -Eeuo pipefail

BG_COLOR="${BG_COLOR:-steelblue}"
MESSAGE="${MESSAGE:-GitOps Demo}"
APP_VERSION="${APP_VERSION:-1.0.0}"
GIT_COMMIT="${GIT_COMMIT:-unknown}"

cat > /opt/app-root/src/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>${MESSAGE}</title>

  <style>
    body {
      margin: 0;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: ${BG_COLOR};
      color: white;
      font-family: Arial, Helvetica, sans-serif;
    }

    .card {
      padding: 3rem;
      text-align: center;
      background: rgba(0, 0, 0, 0.18);
      border-radius: 1rem;
    }

    h1 {
      margin: 0 0 1rem;
      font-size: 4rem;
    }

    p {
      font-size: 1.25rem;
    }
  </style>
</head>

<body>
  <main class="card">
    <h1>${MESSAGE}</h1>
    <p>Version: ${APP_VERSION}</p>
    <p>Git commit: ${GIT_COMMIT}</p>
    <p>Pod hostname: $(hostname)</p>
  </main>
</body>
</html>
EOF

exec nginx -g "daemon off;"
