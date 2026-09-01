-- baseline schema — Day 00
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
    name  VARCHAR NOT NULL             -- Groceries, Fuel, Entertainment, Salary, Travel, Fees...
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