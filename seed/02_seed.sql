-- ============================================================
-- Ledger — Day 01 / Exercise 03
-- Symmetric Difference
--
-- Expected:
--
-- account 1  -> THIS WEEK only
-- account 2  -> LAST WEEK only
-- account 3  -> BOTH weeks      -> must NOT appear
-- account 4  -> THIS WEEK only
-- account 5  -> LAST WEEK only
--
-- Expected result:
-- 1
-- 2
-- 4
-- 5
-- ============================================================


INSERT INTO ledger_entries
(
    id,
    account_id,
    counterparty_account_id,
    merchant_id,
    amount,
    direction,
    transfer_group,
    occurred_at,
    status
)
VALUES

-- ============================================================
-- THIS WEEK ONLY
-- account 1
-- ============================================================

(
    31,
    1,
    NULL,
    1,
    100.00,
    'DEBIT',
    '00000000-0000-0000-0000-000000000031',
    date_trunc('week', now()) + INTERVAL '1 day',
    'SETTLED'
),

-- ============================================================
-- LAST WEEK ONLY
-- account 2
-- ============================================================

(
    32,
    2,
    NULL,
    1,
    200.00,
    'DEBIT',
    '00000000-0000-0000-0000-000000000032',
    date_trunc('week', now()) - INTERVAL '6 days',
    'SETTLED'
),

-- ============================================================
-- BOTH WEEKS
-- account 3
-- Must NOT appear in the final result
-- ============================================================

(
    33,
    3,
    NULL,
    1,
    150.00,
    'DEBIT',
    '00000000-0000-0000-0000-000000000033',
    date_trunc('week', now()) - INTERVAL '6 days',
    'SETTLED'
),

(
    34,
    3,
    NULL,
    2,
    175.00,
    'DEBIT',
    '00000000-0000-0000-0000-000000000034',
    date_trunc('week', now()) + INTERVAL '1 day',
    'SETTLED'
),

-- ============================================================
-- THIS WEEK ONLY
-- account 4
-- ============================================================

(
    35,
    4,
    NULL,
    3,
    50.00,
    'DEBIT',
    '00000000-0000-0000-0000-000000000035',
    date_trunc('week', now()) + INTERVAL '2 days',
    'SETTLED'
),

-- ============================================================
-- LAST WEEK ONLY
-- account 5
-- ============================================================

(
    36,
    5,
    NULL,
    3,
    75.00,
    'DEBIT',
    '00000000-0000-0000-0000-000000000036',
    date_trunc('week', now()) - INTERVAL '5 days',
    'SETTLED'
);