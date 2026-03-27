# Changelog

All notable changes to this repository are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) for **Git tags** on the monorepo (`vMAJOR.MINOR.PATCH`). See [README.md](README.md#versioning-and-provider-compatibility) for how tags relate to module paths and `versions.tf`.

## [Unreleased]

Changes not yet released go here (Added / Changed / Deprecated / Removed / Fixed / Security as appropriate).

## [1.0.0] - 2026-03-26

### Added

- Initial public release of the **discovery-modules** monorepo: Terraform discovery templates under `aws/`, `azurerm/`, and `gcp/`, with StackGen metadata in `.stackgen/stackgen.yaml` per module.
- Upload and maintenance helpers under `tools/` (including `upload_stackgen_modules.sh`), plus `stackgen_yaml_schema.json` for validating StackGen YAML.
- `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `LICENSE` (Apache-2.0), and documentation for versioning, tags, and provider constraints in `README.md`.
- Many modules include **`basic.tftest.hcl`** Terraform tests (`terraform test`).

### Compatibility (this tag)

Module `versions.tf` files on this release commonly expect:

| Component | Constraint |
|-----------|------------|
| Terraform CLI | `>= 1.0.0, < 2.0.0` |
| AWS provider (`hashicorp/aws`) | `~> 5.0` |
| Azure RM provider (`hashicorp/azurerm`) | `~> 3.9` |
| Microsoft Entra ID provider (`hashicorp/azuread`) | `~> 3.1.0` (only on modules that declare it alongside `azurerm`) |
| Google provider (`hashicorp/google`) | `~> 6.0` |

Pin the repository with a Git ref and module path, for example: `git::https://github.com/<org>/discovery-modules.git//aws/aws_s3_bucket?ref=v1.0.0`.
