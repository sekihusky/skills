---
name: nginx
description: Configure, review, secure, and troubleshoot Nginx as a web server, reverse proxy, TLS terminator, static asset server, or load balancer. Use for Nginx configuration, upstream failures, redirects, headers, caching, WebSocket proxying, TLS, or performance issues.
---

# Nginx

## Workflow

1. Identify the operating system, Nginx version/build, deployment topology, DNS, upstream protocol, and current include tree.
2. Read the complete effective configuration before editing a single site file.
3. Keep server-name, TLS, redirect, proxy, static-file, and error behavior explicit.
4. Preserve the original host and forwarding information only when the application and trusted-proxy configuration expect it.
5. Set bounded timeouts and body limits based on workload; configure WebSocket upgrade only where needed.
6. Validate syntax with `nginx -t`, inspect the diff, then reload rather than restart when safe.
7. Verify externally with status, headers, TLS, uploads, streaming, and relevant application flows.

## Safety

- Back up or version the active configuration before changing it.
- Do not expose dotfiles, secrets, internal status endpoints, or directory listings.
- Do not apply global CORS or caching headers without resource-specific requirements.
- Account for SELinux, firewall rules, file permissions, and upstream health on Rocky Linux.
- Provide rollback commands before production changes.
