---
name: postgresql
description: Design, query, migrate, operate, and troubleshoot PostgreSQL databases. Use for schemas, indexes, JSONB, transactions, locking, vacuum, extensions, roles, backups, replication-aware changes, or PostgreSQL-specific SQL; use sql-optimizer when query performance is the primary task.
---

# PostgreSQL

## Workflow

1. Confirm the PostgreSQL version, topology, extensions, and workload constraints.
2. Inspect relations, constraints, indexes, statistics, and data distribution before changing them.
3. Use domain-appropriate types and database constraints to protect invariants.
4. Match B-tree, GIN, GiST, BRIN, partial, or expression indexes to demonstrated access patterns.
5. Account for MVCC, transaction duration, lock levels, autovacuum, and table rewrite behavior.
6. Make migrations compatible with rolling application deployment when required.
7. Test backup restoration and document recovery targets.

## Safety

- Default to read-only inspection and parameterized queries.
- Show destructive SQL and lock implications before requesting authorization.
- Do not use `VACUUM FULL`, broad role grants, or unbounded maintenance operations casually.
- Redact credentials and sensitive row data.

Report version assumptions, execution/lock risk, rollback strategy, and verification queries.
