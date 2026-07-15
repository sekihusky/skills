---
name: docker
description: Build, review, secure, optimize, and troubleshoot Dockerfiles, images, containers, networks, volumes, and Docker Compose applications. Use for containerizing apps, multi-stage builds, Compose orchestration, health checks, image size, startup failures, or container security.
---

# Docker

## Workflow

1. Inspect Docker/Compose versions, target architecture, build context, ignore rules, runtime constraints, and existing conventions.
2. Use deterministic, cache-friendly multi-stage builds and copy only required artifacts into runtime images.
3. Run as a non-root user where practical; keep secrets out of images, build arguments, and committed Compose files.
4. Use exec-form commands and ensure the application handles termination signals and graceful shutdown.
5. Add health checks that reflect actual readiness without creating heavy load.
6. Treat volumes and databases as persistent state; document backup, migration, and ownership behavior.
7. Validate configuration, build the image, inspect logs/health, and exercise the critical path.

## Guardrails

- Do not use `latest` for reproducible deployments.
- Do not publish database or admin ports unless required.
- Do not bake environment-specific credentials into layers.
- Do not prune images, volumes, or networks without explicit permission and a reviewed target.
- Keep development conveniences separate from production configuration.
