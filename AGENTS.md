# Code review guidelines

When reviewing pull requests:

## Correctness
- Look for behavioral regressions.
- Check error handling and edge cases.
- Check concurrency and race conditions.
- Verify Kubernetes API semantics.

## API compatibility
- Flag breaking API changes.
- Check CRD/schema changes for backwards compatibility.
- Check deprecated APIs.

## Kubernetes
- Check reconciliation behavior.
- Look for excessive API calls.
- Check owner references and finalizers.
- Verify RBAC changes follow least privilege.

## Testing
- Require unit tests for new behavior.
- Identify important missing negative tests.
- Check that tests validate behavior rather than implementation.

## Security
- Look for injection vulnerabilities.
- Check untrusted inputs.
- Flag privilege escalation possibilities.

## Review style
Only report actionable findings.
Avoid stylistic comments already covered by linters.
Prioritize findings as critical, high, medium, or low.