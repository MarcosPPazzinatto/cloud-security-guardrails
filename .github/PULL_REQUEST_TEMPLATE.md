## Title
<!-- Keep it concise and action-oriented -->

## What Changed
- Bootstrap security CI (Gitleaks, Semgrep, Trivy, Checkov)
- Add pre-commit hooks
- Add SBOM generation
- Add docs stubs

## Why
- Establish baseline security guardrails and shift-left scanning

## How to Test
- Push a branch and open a PR; verify workflow status and SARIF uploads

## Risks
- False positives; initial soft-fail enabled for IaC

## Checklist
- [ ] CI passes
- [ ] Docs updated
- [ ] Secrets not committed

