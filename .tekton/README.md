# Tekton / Pipelines as Code

`build-bgd.yaml` runs on **push** and **pull_request** to `main`:

1. **git-clone** — checkout the commit that triggered the event
2. **buildah** — build and push `quay.io/csalinas/bgd:<sha>`
3. **openshift-client** — apply `k8s/` manifests to **`pac-sample`** (Deployment, Service, Route)

Cluster setup (Repository CR, secrets, RBAC in `pac-sample`): configure PaC with `tkn pac bootstrap`, then apply the `Repository` CR and secrets in the `pac-sample` namespace.

After a successful run:

```bash
oc get route bgd -n pac-sample
```
