#!/usr/bin/env bash
# Check Kubernetes manifests against their schemas (standard objects and CRDs).
# Used by the pre-commit hook and by CI, so both check exactly the same files.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

# Skip Helm values, Kustomize/KSOPS files and encrypted secrets: not cluster objects.
find platform apps bootstrap -name '*.yaml' \
  ! -name values.yaml ! -name '*.sops.yaml' \
  ! -name kustomization.yaml ! -name secret-generator.yaml -print0 \
  | sort -z \
  | xargs -0 kubeconform -strict -summary -output text \
      -schema-location default \
      -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json'
