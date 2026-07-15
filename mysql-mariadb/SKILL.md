---
name: mysql-mariadb
description: Design, query, migrate, operate, and troubleshoot MySQL or MariaDB databases. Use for schemas, indexes, transactions, locking, replication-aware changes, backups, charset/collation issues, or engine-specific SQL; use sql-optimizer when query performance is the primary task.
---

# MySQL and MariaDB

## Workflow

1. Confirm whether the server is MySQL or MariaDB and record its exact version before using version-specific syntax.
2. Inspect schema, keys, constraints, engine, charset, and collation before proposing changes.
3. Choose types from domain constraints; use appropriate precision for money and explicit time-zone conventions.
4. Design composite indexes around real predicates and ordering, considering the leftmost-prefix behavior.
5. Keep transactions short and access rows in consistent order to reduce deadlocks.
6. For migrations, estimate table size, lock behavior, replication impact, rollback, and application compatibility.
7. Verify backups through restore tests, not file existence alone.

## Safety

- Default to read-only inspection.
- Show destructive or blocking SQL before execution and require explicit authorization.
- Use parameterized queries; never interpolate user-controlled values.
- Do not assume MySQL and MariaDB features or JSON behavior are identical.
- Redact connection strings and data containing secrets or personal information.

Include assumptions, SQL, expected execution/locking impact, and verification steps.
