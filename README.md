# homelab

Hands-on lab for practicing Kubernetes: everything declarative, stored in Git, and checked before it reaches the cluster.

## What runs here

- **Cluster:** k3s on three machines: RPi4 (DNS server), HAL (main server) and NUC (media server), all control plane with embedded etcd
- **Provisioning:** Ansible playbooks prepare the machines and install k3s
- **GitOps:** Argo CD keeps the cluster in sync with this repo (app of apps)
- **Platform:** MetalLB, Traefik, cert-manager (Let's Encrypt), Longhorn, kube-vip
- **Secrets:** encrypted in Git with SOPS and age
- **Checks:** yamllint, ansible-lint, kubeconform and gitleaks, before every commit and in GitHub Actions

Everything is reachable on the home network only; nothing is exposed to the internet.

## Status

- [x] Machines provisioned with Ansible
- [x] Three-node k3s cluster
- [x] Platform deployed through Argo CD
- [x] CI checks on every push
- [ ] Move home services from Docker to the cluster, one by one
