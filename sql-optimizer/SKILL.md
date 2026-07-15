---
name: sql-optimizer
description: Diagnose and improve slow SQL using execution plans, row estimates, indexes, query rewrites, statistics, and workload evidence across MySQL, MariaDB, and PostgreSQL. Use for slow queries, high database load, inefficient joins, or index selection; pair with the engine-specific skill for dialect details.
---

# SQL Optimizer

## Evidence-first workflow

1. Capture the exact query shape, parameter distribution, engine/version, schema, existing indexes, row counts, latency, and frequency.
2. Obtain a safe execution plan. Avoid executing write statements or dangerously expensive analysis on production.
3. Compare estimated versus actual rows and locate scans, joins, sorts, temporary work, spills, and repeated loops.
4. Determine whether the cause is query shape, missing/poor index, stale statistics, skew, excessive result size, locking, or application behavior.
5. Propose the smallest change and explain write/storage costs of any new index.
6. Re-measure with representative parameters and check regressions on related queries.

## Rules

- Do not recommend indexes from query text alone when plans and schema can be obtained.
- Do not wrap indexed columns in functions unless an expression index supports it.
- Do not replace joins with denormalization without workload evidence.
- Treat ORM-generated SQL and N+1 request patterns as part of the investigation.

Present before/after evidence, proposed SQL, tradeoffs, and rollback steps.
