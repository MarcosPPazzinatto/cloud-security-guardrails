# Cloud Security Guardrails

Practical guardrails for Cloud and Kubernetes: automated security scanning, IaC checks, SBOM generation, and opinionated defaults.

## What’s inside
- CI pipeline: secrets scan (Gitleaks), SAST (Semgrep), dependency/container scan (Trivy), IaC scan (Checkov), SBOM (Syft/Anchore).
- Pre-commit hooks: basic hygiene + secret scanning locally.
- Stubs for policies (OPA/Gatekeeper), Kubernetes hardening, Terraform baselines, and WAF rules.

## Quick start
1. Install pre-commit and enable hooks:
   ```
   pipx install pre-commit || pip3 install pre-commit
   pre-commit install
   ```

2. Run local scans:
```
./scripts/scan_local.sh
```

## CI

On every push/PR to main, the workflow runs:

- Gitleaks (secrets)
- Semgrep (SAST)
- Trivy (filesystem / dependencies)
- Checkov (Terraform)
- SBOM export (SPDX)
See .github/workflows/security.yml.

## Folders

- policies/ OPA/Gatekeeper templates and constraints.
- kubernetes/ Hardening guides, Falco rules, PodSecurity standards, example manifests.
- terraform/ Security baselines (org policies, least-privilege samples).
- waf/ Cloud Armor / Akamai WAF rule examples.

### LICENSE

```
MIT License

Copyright (c) 2025 Marcos Paulo Pazzinatto

Permission is hereby granted, free of charge, to any person obtaining a copy
```


