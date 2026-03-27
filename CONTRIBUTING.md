# Contributing to discovery-modules

Thank you for your interest in contributing. This document explains how to propose changes and what we expect from pull requests.

## Code of conduct

Participation is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By contributing, you agree to uphold it.

## How to contribute

1. **Issues** — Open an issue to discuss significant changes, new modules, or ambiguous behavior before investing in a large patch.
2. **Pull requests** — Fork the repository (if required by your workflow), create a branch from `main`, and submit a PR with a clear description of the change and motivation.
3. **Small fixes** — Typos, obvious bugs, and documentation improvements are welcome without a prior issue when the scope is clear.

## Module structure

Each module directory should include:

- **Terraform** — `.tf` (and related) files defining the module’s resources, data sources, and variables.
- **StackGen metadata** — `.stackgen/stackgen.yaml` aligned with Terraform variables and the intended UX in StackGen.

When you add or change inputs/outputs in Terraform, update **`stackgen.yaml`** so labels, descriptions, and controls stay accurate.

## Validation

- Use **`tools/stackgen_yaml_schema.json`** to validate `.stackgen/stackgen.yaml` (schema-aware editors or JSON Schema validators).
- Run **`terraform fmt`** on changed Terraform files before submitting.
- Run **`terraform validate`** in the module directory when you can (appropriate backend/provider credentials may be required for some setups).
- **Module tests** — For new modules or when module inputs/outputs or core resources change in a way worth guarding, add or update **`basic.tftest.hcl`** in the module directory (same pattern as other modules in this repo). Use a top-level **`variables`** block with representative values and at least one **`run`** block; prefer **`command = plan`** plus **`assert`** blocks on important attributes or outputs. Run **`terraform test`** from that module directory before submitting. Plan-only tests usually need no cloud credentials; runs that **`apply`** require a configured provider and account.

## Versioning and releases

Versioning is documented in the [README](README.md#versioning-and-provider-compatibility). In summary:

- **Provider and Terraform compatibility** belong in each module’s **`versions.tf`** (`required_version`, `required_providers`).
- **Repository releases** use **semantic version tags** on the whole monorepo (`vMAJOR.MINOR.PATCH`). Breaking provider baselines or incompatible module APIs should coincide with a **major** tag bump when maintainers cut releases.
- **Older provider baselines** — If an older line must keep receiving fixes, maintainers can use a long-lived branch (for example `release/aws-provider-5`) and tag releases from it. Duplicating the whole module tree under parallel paths (for example `aws/v5/...` and `aws/v6/...`) is a last resort when two incompatible implementations must be supported long term.

When maintainers tag a release, they should update **[CHANGELOG.md](CHANGELOG.md)** (move items from `[Unreleased]` under a dated `vX.Y.Z` heading, or add the section for that tag).

Maintainers may adjust tagging and release cadence; contributors do not need to create tags unless maintainers ask. For changes that are worth mentioning in the next release, a short note under `[Unreleased]` in `CHANGELOG.md` in the same PR is welcome.

## Pull request checklist

- [ ] Terraform and `.stackgen/stackgen.yaml` stay consistent.
- [ ] `versions.tf` reflects any intentional change to supported Terraform or provider versions.
- [ ] `basic.tftest.hcl` added or updated when the module is new or when tests should cover the change; **`terraform test`** passes for that module.
- [ ] No unnecessary drive-by refactors unrelated to the change.
- [ ] Documentation (README or module-level notes) updated if behavior or usage changed in a user-visible way.

## Questions

If something in this guide is unclear, open an issue and mention `@` maintainers or the project owners as your repository’s policy allows.
