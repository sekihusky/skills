---
name: security-audit
description: Perform evidence-based security reviews of application code, APIs, dependencies, containers, Nginx, Linux configuration, authentication, authorization, secrets, and data handling. Use for security audits, threat-focused reviews, hardening, or pre-release risk assessment. Do not use for unauthorized exploitation.
---

# Security Audit

## Workflow

1. Confirm scope, assets, trust boundaries, data sensitivity, deployment model, and allowed testing methods.
2. Inventory entry points, identities, privileges, dependencies, secrets, storage, and outbound connections.
3. Trace untrusted input through validation, authorization, persistence, rendering, logging, and external commands.
4. Review authentication, session/token lifecycle, object-level authorization, rate limits, and account recovery.
5. Review injection, path traversal, SSRF, upload handling, XSS/CSRF, CORS, cryptography, and secret exposure as applicable.
6. Review runtime hardening, least privilege, network exposure, headers, logging, backup protection, and update strategy.
7. Verify findings safely and minimize access to sensitive data.

## Findings format

For each finding include severity, confidence, evidence/location, attack preconditions, impact, remediation, and verification. Separate confirmed findings from hypotheses and defense-in-depth suggestions.

Never perform destructive testing, persistence, credential attacks, data exfiltration, or out-of-scope access. Redact all secrets.
