---
name: composer
description: Configure and troubleshoot Composer dependency management, package constraints, lockfiles, repositories, scripts, platform requirements, PSR-4 autoloading, and reproducible PHP installs. Use for composer.json, composer.lock, dependency conflicts, package upgrades, autoload failures, private packages, or production Composer workflows.
---

# Composer

## Workflow

1. Inspect `composer.json`, `composer.lock`, PHP/extensions, Composer version, configured repositories, plugins, scripts, and the existing vendor strategy.
2. Preserve the lockfile for applications; use `composer install` for reproducible environments and intentional `composer update` scopes for dependency changes.
3. Diagnose conflicts with Composer's dependency reasoning commands before changing constraints.
4. Keep runtime packages in `require` and development-only tools in `require-dev`.
5. Use correct PSR-4 namespace-to-directory mappings and regenerate the autoloader after changes.
6. Review package provenance, abandonment notices, security advisories, plugin execution, and licensing.
7. Verify on the project's minimum PHP version and required extension set.

## Guardrails

- Do not delete `composer.lock` to bypass a dependency conflict.
- Do not use unconstrained versions or broad stability relaxation without justification.
- Do not run untrusted Composer plugins or scripts blindly.
- Do not commit credentials from `auth.json`, repository URLs, or environment variables.
- For production, prefer optimized authoritative/classmap settings only after checking dynamic class discovery.

Report constraints changed, lockfile impact, transitive upgrades, platform assumptions, audit results, and validation performed.
