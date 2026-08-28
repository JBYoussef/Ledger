# Ledger

**A solo data-engineering project inspired by 42’s methodology**

Relational foundations → multi-engine federation, all centred on a single financial ledger domain.

---

## What this is

Ledger is a self-directed learning project that applies the pedagogical style of 42 (progressive difficulty, one shared domain, concrete examples before theory) to modern data engineering.

It is **not** an official 42 piscine. It is a personal reconstruction of the ideas found in *Piscine SQL* and *Datomic*, redesigned so that every concept feeds directly into a companion Java project that models the same money-transfer domain.

The goal is simple: by the time a concept appears in application code, it has already been solved once in SQL, where the cost of being wrong is lower.

---

## Why a ledger?

A financial ledger is a domain that forces the right questions:

- How do you represent a transfer that must appear on two accounts?
- What happens when two writers touch the same balance at the same moment?
- How do you answer “what was the balance at 10:05 last Tuesday?” months later?
- When do you reach for a relational engine, a cache, a columnar store or a graph database?

Everything in this repository is built around one growing schema that starts minimal and gains a table or a column only when an exercise needs it.

```sql
CREATE TABLE users (
    id          BIGINT PRIMARY KEY,
    full_name   VARCHAR NOT NULL,
    email       VARCHAR NOT NULL,
    country     VARCHAR NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE accounts (
    id            BIGINT PRIMARY KEY,
    user_id       BIGINT NOT NULL REFERENCES users(id),
    account_type  VARCHAR NOT NULL,   -- 'checking' | 'savings' | 'business'
    currency      CHAR(3) NOT NULL,
    opened_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE categories (
    id    BIGINT PRIMARY KEY,
    name  VARCHAR NOT NULL
);

CREATE TABLE merchants (
    id           BIGINT PRIMARY KEY,
    name         VARCHAR NOT NULL,
    category_id  BIGINT REFERENCES categories(id)
);

CREATE TABLE ledger_entries (
    id                        BIGINT PRIMARY KEY,
    account_id                BIGINT NOT NULL REFERENCES accounts(id),
    counterparty_account_id   BIGINT REFERENCES accounts(id),
    merchant_id               BIGINT REFERENCES merchants(id),
    amount                    NUMERIC(12,2) NOT NULL,
    direction                 VARCHAR(6) NOT NULL,   -- 'DEBIT' | 'CREDIT'
    transfer_group            UUID NOT NULL,
    occurred_at               TIMESTAMPTZ NOT NULL,
    status                    VARCHAR(8) NOT NULL DEFAULT 'SETTLED'  -- 'PENDING' | 'SETTLED' | 'REVERSED'
);
```

A transfer is two rows that share a `transfer_group`. A reversal is a new row with `status = 'REVERSED'`. Nothing is ever hard-deleted.

---

## Structure

### Part I — Foundations (PostgreSQL only)

Nine progressive modules that turn SQL from “syntax I look up” into “the shape I reach for without thinking”.

| Module | Focus |
|--------|-------|
| 00 | Filtering, sorting, calculated columns, `CASE`, subqueries |
| 01 | Sets (`UNION` / `EXCEPT` / `INTERSECT`) and transfer reconciliation |
| 02 | Joins (`LEFT`, self-join, `NATURAL`, `FULL OUTER`) |
| 03 | Safe mutation — reverse instead of delete, constraints, seeding from history |
| 04 | Views and materialized views |
| 05 | Indexes, `EXPLAIN ANALYZE`, covering indexes, partial unique indexes |
| 06 | Aggregates and window functions (running balance, rankings, `LAG`, `NTILE`) |
| 07 | Transactions & isolation levels — Lost Update, non-repeatable read, phantom, deadlock |
| 08 | Triggers, audit trail, `reconstitute_balance_at()` in PL/pgSQL |

### Part II — Federation (multi-engine)

Five modules that answer real platform questions instead of completing a tour of technologies.

| Module | Engine | Question it answers |
|--------|--------|---------------------|
| A | PostgreSQL | Temporal / bitemporal modelling — “what did we report vs what actually was” |
| B | Redis | Write-through cache + distributed rate limiting |
| C | DuckDB / ClickHouse | Analytical queries at tens of millions of rows |
| D | Neo4j | Fraud-ring cycle detection (`[:TRANSFERRED*3..6]`) |
| E | DuckDB + postgres + Redis | Federated reconciliation without copying data |

---

## Relationship with the Java companion project

The same money-transfer domain is implemented a second time in Java (Spring Boot, JPA, event sourcing, etc.).

| Ledger concept | Reappears in Java as |
|----------------|----------------------|
| Orphan transfers (`EXCEPT`) | Unacknowledged-transfer detection over two collections |
| Covering index + `EXPLAIN` | Cursor pagination vs `OFFSET` |
| Running-balance window function | `reconstituteBalanceAt()` by folding an event log |
| Lost Update under concurrent sessions | `@Version` / `SELECT … FOR UPDATE` |
| Database trigger + audit table | Immutable event store |
| Redis rate limiter | In-memory token bucket (and why it breaks behind a load balancer) |

Having solved the problem once in SQL makes the Java version a deliberate choice of tool rather than the first time the problem is encountered.

---

## Repository layout

```
├── part-i/
│   ├── day00/ … day08/
│   └── bonus-reconciliation/
├── part-ii/
│   ├── module-a-temporal/
│   ├── module-b-redis/
│   ├── module-c-analytics/
│   ├── module-d-neo4j/
│   └── module-e-federation/
└── schema/
    └── baseline.sql
```

Each day/module contains:

- the SQL (or Cypher / Redis / DuckDB) scripts
- short notes explaining the design choice when it is non-obvious
- before/after `EXPLAIN ANALYZE` output where indexes are involved

Everything runs locally. No cloud account is required.

---

## Tech stack

- **PostgreSQL** (latest stable)
- **Redis**
- **DuckDB** (or ClickHouse)
- **Neo4j**
- Standard CLI tools / any IDE

---

## Status

Personal / solo project — ongoing.

Inspired by the teaching methodology of 42 School (progressive projects, one persistent domain, emphasis on understanding mechanisms rather than memorising APIs). Not an official 42 curriculum item and not subject to any formal evaluation.

---

**Companion project:** [piscine-java](https://github.com/JBYoussef/piscine-java)  
**Author:** [José Bofengola](https://github.com/JBYoussef)
