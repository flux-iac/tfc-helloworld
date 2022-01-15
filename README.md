# tfc-helloworld

Encode your Terraform TFRC fle which contains your Terraform Cloud or Terraform Enterprise token.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: tfc-cli-config
  namespace: flux-system
data:
  terraform.tfrc: <redacted>
```


Bootstrap snippet

```yaml
cat <<EOF | kubectl apply -f -
---
apiVersion: source.toolkit.fluxcd.io/v1beta1
kind: GitRepository
metadata:
  name: tfc-helloworld
  namespace: flux-system
spec:
  interval: 30s
  url: https://github.com/tf-controller/tfc-helloworld
  ref:
    branch: main
---
apiVersion: kustomize.toolkit.fluxcd.io/v1beta2
kind: Kustomization
metadata:
  name: tfc-helloworld
  namespace: flux-system
spec:
  prune: true
  interval: 2m
  path: "./infra"
  sourceRef:
    kind: GitRepository
    name: tfc-helloworld
  timeout: 3m
  healthChecks:
  - apiVersion: infra.contrib.fluxcd.io/v1alpha1
    kind: Terraform
    name: tfc-helloworld
    namespace: flux-system
EOF
```
