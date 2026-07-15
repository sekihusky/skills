---
name: linux-server
description: Diagnose, administer, harden, and document Rocky Linux 8 and Ubuntu 24.04 servers using systemd, SSH, SFTP, networking, storage, users, permissions, firewalls, SELinux, logs, packages, and scheduled tasks. Use for Linux server operations or incident diagnosis; use nginx or docker for deeper product-specific work.
---

# Linux Server

## Safe workflow

1. Establish distribution/version, environment, privileges, service impact, and a rollback path.
2. Observe before changing: service state, recent logs, sockets, resources, filesystem, DNS, and firewall policy.
3. Form one hypothesis at a time and run the least invasive check that can disprove it.
4. Use native controls: `systemctl`/`journalctl`, `dnf` and firewalld/SELinux on Rocky, `apt` and UFW where configured on Ubuntu.
5. Preserve a working SSH session when modifying SSH, networking, firewall, or authentication.
6. Validate configuration before reload and verify both locally and from the expected client path.

## Guardrails

- Never disable SELinux or the firewall merely to bypass diagnosis.
- Never expose passwords, private keys, tokens, or full sensitive configuration.
- Avoid recursive permission changes without inspecting the target and required ownership.
- Show destructive, rebooting, package-removal, or access-changing commands and obtain explicit approval.
- Prefer dedicated service accounts and least privilege over broad sudo or `0777` permissions.

Report evidence, change, impact, verification, and rollback.
