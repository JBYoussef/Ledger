-- =============================================================================
-- Ledger Part I — seed.sql
-- Baseline schema only (Day 00). Run after the CREATE TABLE statements.
-- Deterministic, self-contained, and sized for every exercise through Day 13
-- (except the multi-million-row scale exercise, which is generated on the day).
-- =============================================================================

BEGIN;

-- ---------------------------------------------------------------------------
-- 1. Users
-- ---------------------------------------------------------------------------
INSERT INTO users (id, full_name, email, country, created_at) VALUES
  ( 1, 'Alice Santos',       'alice@example.com',    'PT', '2023-11-01 09:00:00+00'),
  ( 2, 'Bruno Costa',        'bruno@example.com',    'PT', '2023-11-05 10:15:00+00'),
  ( 3, 'Carla Mendes',       'carla@example.com',    'ES', '2023-11-10 11:30:00+00'),
  ( 4, 'Diogo Ferreira',     'diogo@example.com',    'PT', '2023-11-12 08:45:00+00'),
  ( 5, 'Elena Ruiz',         'elena@example.com',    'ES', '2023-11-15 14:00:00+00'),
  ( 6, 'Francisco Lopes',    'francisco@example.com','PT', '2023-11-20 16:20:00+00'),
  ( 7, 'Giulia Romano',      'giulia@example.com',   'IT', '2023-12-01 09:10:00+00'),
  ( 8, 'Hugo Almeida',       'hugo@example.com',     'PT', '2023-12-03 12:00:00+00'),
  ( 9, 'Inês Carvalho',      'ines@example.com',     'PT', '2023-12-05 13:30:00+00'),
  (10, 'João Pereira',       'joao@example.com',     'PT', '2023-12-08 15:00:00+00'),
  (11, 'Katarina Novak',     'katarina@example.com', 'HR', '2023-12-10 10:00:00+00'),
  (12, 'Luis Oliveira',      'luis@example.com',     'PT', '2023-12-12 11:45:00+00'),
  (13, 'Maria Silva',        'maria@example.com',    'PT', '2024-01-02 09:00:00+00'),
  (14, 'Nuno Ribeiro',       'nuno@example.com',     'PT', '2024-01-05 10:30:00+00'),
  (15, 'Olivia Martins',     'olivia@example.com',   'PT', '2024-01-08 14:15:00+00');

-- ---------------------------------------------------------------------------
-- 2. Accounts
--    account_type ∈ {'checking','savings','business'}
-- ---------------------------------------------------------------------------
INSERT INTO accounts (id, user_id, account_type, currency, opened_at) VALUES
  -- Alice
  ( 1,  1, 'checking',  'EUR', '2023-11-01 09:05:00+00'),
  ( 2,  1, 'savings',   'EUR', '2023-11-01 09:06:00+00'),
  -- Bruno
  ( 3,  2, 'checking',  'EUR', '2023-11-05 10:20:00+00'),
  ( 4,  2, 'business',  'EUR', '2023-11-05 10:21:00+00'),
  -- Carla
  ( 5,  3, 'checking',  'EUR', '2023-11-10 11:35:00+00'),
  -- Diogo
  ( 6,  4, 'checking',  'EUR', '2023-11-12 08:50:00+00'),
  ( 7,  4, 'savings',   'EUR', '2023-11-12 08:51:00+00'),   -- frequently referenced (Day 07)
  -- Elena
  ( 8,  5, 'checking',  'EUR', '2023-11-15 14:05:00+00'),
  -- Francisco
  ( 9,  6, 'checking',  'EUR', '2023-11-20 16:25:00+00'),
  (10,  6, 'business',  'USD', '2023-11-20 16:26:00+00'),
  -- Giulia
  (11,  7, 'checking',  'EUR', '2023-12-01 09:15:00+00'),
  -- Hugo
  (12,  8, 'checking',  'EUR', '2023-12-03 12:05:00+00'),   -- frequently referenced (Day 06)
  (13,  8, 'savings',   'EUR', '2023-12-03 12:06:00+00'),
  -- Inês
  (14,  9, 'checking',  'EUR', '2023-12-05 13:35:00+00'),
  -- João
  (15, 10, 'checking',  'EUR', '2023-12-08 15:05:00+00'),
  (16, 10, 'business',  'EUR', '2023-12-08 15:06:00+00'),
  -- Katarina
  (17, 11, 'checking',  'EUR', '2023-12-10 10:05:00+00'),
  -- Luis
  (18, 12, 'checking',  'EUR', '2023-12-12 11:50:00+00'),
  (19, 12, 'savings',   'EUR', '2023-12-12 11:51:00+00'),
  -- Maria
  (20, 13, 'checking',  'EUR', '2024-01-02 09:05:00+00'),
  -- Nuno
  (21, 14, 'checking',  'EUR', '2024-01-05 10:35:00+00'),
  -- Olivia
  (22, 15, 'checking',  'EUR', '2024-01-08 14:20:00+00'),
  (23, 15, 'business',  'GBP', '2024-01-08 14:21:00+00');

-- ---------------------------------------------------------------------------
-- 3. Categories
-- ---------------------------------------------------------------------------
INSERT INTO categories (id, name) VALUES
  (1, 'Groceries'),
  (2, 'Fuel'),
  (3, 'Entertainment'),
  (4, 'Salary'),
  (5, 'Travel'),
  (6, 'Fees'),
  (7, 'Restaurants'),
  (8, 'Utilities'),
  (9, 'Shopping'),
  (10, 'Healthcare');

-- ---------------------------------------------------------------------------
-- 4. Merchants
--    Some left without any ledger_entries → useful for LEFT JOIN / NOT EXISTS
-- ---------------------------------------------------------------------------
INSERT INTO merchants (id, name, category_id) VALUES
  ( 1, 'Whole Foods',          1),
  ( 2, 'Continente',           1),
  ( 3, 'Pingo Doce',           1),
  ( 4, 'Shell',                2),
  ( 5, 'Galp',                 2),
  ( 6, 'BP',                   2),
  ( 7, 'Netflix',              3),
  ( 8, 'Spotify',              3),
  ( 9, 'Cinema NOS',           3),
  (10, 'Company Payroll',      4),   -- salary credits often use this
  (11, 'Ryanair',              5),
  (12, 'Booking.com',          5),
  (13, 'TAP Air Portugal',     5),
  (14, 'Bank Fee',             6),
  (15, 'McDonald''s',          7),
  (16, 'Starbucks',            7),
  (17, 'EDP',                  8),
  (18, 'Águas de Lisboa',      8),
  (19, 'Zara',                 9),
  (20, 'Fnac',                 9),
  (21, 'Farmácia Central',    10),
  (22, 'Unused Merchant A',    9),   -- never appears in ledger_entries
  (23, 'Unused Merchant B',    3),   -- never appears in ledger_entries
  (24, 'Unused Merchant C',    1);   -- never appears in ledger_entries

-- ---------------------------------------------------------------------------
-- 5. Ledger entries
--    Conventions:
--      • Transfer = two rows sharing the same transfer_group
--        (DEBIT on sender + CREDIT on recipient)
--      • Card purchase = single DEBIT with merchant_id, counterparty NULL
--      • Statuses mixed: mostly SETTLED, some PENDING, some REVERSED
--      • A few deliberate orphans (DEBIT without matching CREDIT)
--      • A few intentional cycles for the recursive CTE exercise
-- ---------------------------------------------------------------------------

-- Helper: fixed UUIDs so results are reproducible
-- (generated offline; do not change)

INSERT INTO ledger_entries
  (id, account_id, counterparty_account_id, merchant_id, amount, direction,
   transfer_group, occurred_at, status)
VALUES
-- ========== January 2024 ==========
-- Alice (acc 1) buys groceries
( 1,  1, NULL, 1,  12.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000001', '2024-01-03 10:15:00+00', 'SETTLED'),
( 2,  1, NULL, 4,  45.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000002', '2024-01-05 18:30:00+00', 'SETTLED'),
( 3,  1, NULL, 7,  15.99, 'DEBIT',  'a1000000-0000-4000-8000-000000000003', '2024-01-07 09:00:00+00', 'SETTLED'),

-- Salary credit for Alice
( 4,  1, NULL,10, 2500.00, 'CREDIT','a1000000-0000-4000-8000-000000000004', '2024-01-01 00:01:00+00', 'SETTLED'),

-- Transfer Alice → Bruno (acc 3)
( 5,  1,  3, NULL, 100.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000005', '2024-01-08 14:00:00+00', 'SETTLED'),
( 6,  3,  1, NULL, 100.00, 'CREDIT','a1000000-0000-4000-8000-000000000005', '2024-01-08 14:00:00+00', 'SETTLED'),

-- Bruno buys fuel + restaurant
( 7,  3, NULL, 5,  55.20, 'DEBIT',  'a1000000-0000-4000-8000-000000000006', '2024-01-09 12:10:00+00', 'SETTLED'),
( 8,  3, NULL,15,  18.75, 'DEBIT',  'a1000000-0000-4000-8000-000000000007', '2024-01-10 20:00:00+00', 'SETTLED'),

-- Carla (acc 5) — salary + shopping
( 9,  5, NULL,10, 1800.00, 'CREDIT','a1000000-0000-4000-8000-000000000008', '2024-01-01 00:01:00+00', 'SETTLED'),
(10,  5, NULL,19,  89.90, 'DEBIT',  'a1000000-0000-4000-8000-000000000009', '2024-01-12 16:45:00+00', 'SETTLED'),

-- Diogo (acc 6 & 7) — internal transfer checking → savings
(11,  6,  7, NULL, 200.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000010', '2024-01-15 11:00:00+00', 'SETTLED'),
(12,  7,  6, NULL, 200.00, 'CREDIT','a1000000-0000-4000-8000-000000000010', '2024-01-15 11:00:00+00', 'SETTLED'),

-- Account 7 (the one used in Day 07 isolation exercises) receives more activity
(13,  7, NULL, 1,  32.40, 'DEBIT',  'a1000000-0000-4000-8000-000000000011', '2024-01-16 09:30:00+00', 'SETTLED'),
(14,  7, NULL,10, 1200.00, 'CREDIT','a1000000-0000-4000-8000-000000000012', '2024-01-01 00:01:00+00', 'SETTLED'),

-- Hugo (acc 12) — many entries so running-balance examples look realistic
(15, 12, NULL,10, 2200.00, 'CREDIT','a1000000-0000-4000-8000-000000000013', '2024-01-01 00:01:00+00', 'SETTLED'),
(16, 12, NULL, 1,  12.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000014', '2024-01-03 10:15:00+00', 'SETTLED'),
(17, 12, NULL, 4,  45.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000015', '2024-01-05 18:30:00+00', 'SETTLED'),
(18, 12, NULL, 2,  67.80, 'DEBIT',  'a1000000-0000-4000-8000-000000000016', '2024-01-07 11:00:00+00', 'SETTLED'),
(19, 12, NULL,16,  4.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000017', '2024-01-08 08:20:00+00', 'SETTLED'),
(20, 12, NULL, 7,  15.99, 'DEBIT',  'a1000000-0000-4000-8000-000000000018', '2024-01-10 09:00:00+00', 'SETTLED'),
(21, 12, NULL,11,  89.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000019', '2024-01-12 15:00:00+00', 'SETTLED'),
(22, 12, NULL,14,   2.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000020', '2024-01-15 00:00:00+00', 'SETTLED'),

-- ========== February 2024 ==========
(23, 12, NULL, 1,  28.30, 'DEBIT',  'a1000000-0000-4000-8000-000000000021', '2024-02-02 10:00:00+00', 'SETTLED'),
(24, 12, NULL, 5,  52.10, 'DEBIT',  'a1000000-0000-4000-8000-000000000022', '2024-02-04 17:45:00+00', 'SETTLED'),
(25, 12, NULL,15,  22.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000023', '2024-02-06 19:30:00+00', 'SETTLED'),
(26, 12, NULL, 9,  12.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000024', '2024-02-08 21:00:00+00', 'SETTLED'),
(27, 12, NULL,10, 2200.00, 'CREDIT','a1000000-0000-4000-8000-000000000025', '2024-02-01 00:01:00+00', 'SETTLED'),

-- Transfer Hugo → Inês
(28, 12, 14, NULL, 150.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000026', '2024-02-10 13:00:00+00', 'SETTLED'),
(29, 14, 12, NULL, 150.00, 'CREDIT','a1000000-0000-4000-8000-000000000026', '2024-02-10 13:00:00+00', 'SETTLED'),

-- Alice again
(30,  1, NULL, 3,  41.20, 'DEBIT',  'a1000000-0000-4000-8000-000000000027', '2024-02-11 09:15:00+00', 'SETTLED'),
(31,  1, NULL,10, 2500.00, 'CREDIT','a1000000-0000-4000-8000-000000000028', '2024-02-01 00:01:00+00', 'SETTLED'),

-- ========== March 2024 ==========
(32, 12, NULL,10, 2200.00, 'CREDIT','a1000000-0000-4000-8000-000000000029', '2024-03-01 00:01:00+00', 'SETTLED'),
(33, 12, NULL, 1,  19.90, 'DEBIT',  'a1000000-0000-4000-8000-000000000030', '2024-03-03 11:20:00+00', 'SETTLED'),
(34, 12, NULL, 4,  48.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000031', '2024-03-05 18:00:00+00', 'SETTLED'),
(35, 12, NULL,12, 320.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000032', '2024-03-08 10:00:00+00', 'SETTLED'),
(36, 12, NULL,20,  75.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000033', '2024-03-12 16:00:00+00', 'SETTLED'),

-- PENDING entry (hold)
(37, 12, NULL, 1,  55.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000034', '2024-03-15 09:00:00+00', 'PENDING'),

-- REVERSED entry (later corrected)
(38, 12, NULL,14,  25.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000035', '2024-03-18 12:00:00+00', 'REVERSED'),

-- ========== April 2024 ==========
(39, 12, NULL,10, 2200.00, 'CREDIT','a1000000-0000-4000-8000-000000000036', '2024-04-01 00:01:00+00', 'SETTLED'),
(40, 12, NULL, 2,  93.40, 'DEBIT',  'a1000000-0000-4000-8000-000000000037', '2024-04-04 10:30:00+00', 'SETTLED'),
(41, 12, NULL, 6,  61.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000038', '2024-04-07 17:00:00+00', 'SETTLED'),
(42, 12, NULL, 8,   9.99, 'DEBIT',  'a1000000-0000-4000-8000-000000000039', '2024-04-09 08:00:00+00', 'SETTLED'),
(43, 12, NULL,17,  78.30, 'DEBIT',  'a1000000-0000-4000-8000-000000000040', '2024-04-12 00:00:00+00', 'SETTLED'),

-- Transfer cycle seed (for Day 10 recursive CTE)
-- Path: 1 → 3 → 5 → 1  (3-hop cycle)
(44,  1,  3, NULL,  50.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000041', '2024-04-15 10:00:00+00', 'SETTLED'),
(45,  3,  1, NULL,  50.00, 'CREDIT','a1000000-0000-4000-8000-000000000041', '2024-04-15 10:00:00+00', 'SETTLED'),
(46,  3,  5, NULL,  50.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000042', '2024-04-15 10:05:00+00', 'SETTLED'),
(47,  5,  3, NULL,  50.00, 'CREDIT','a1000000-0000-4000-8000-000000000042', '2024-04-15 10:05:00+00', 'SETTLED'),
(48,  5,  1, NULL,  50.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000043', '2024-04-15 10:10:00+00', 'SETTLED'),
(49,  1,  5, NULL,  50.00, 'CREDIT','a1000000-0000-4000-8000-000000000043', '2024-04-15 10:10:00+00', 'SETTLED'),

-- Longer path that also cycles (5 hops) for stress-testing the recursive CTE
-- 6 → 8 → 9 → 11 → 14 → 6
(50,  6,  8, NULL,  30.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000044', '2024-04-16 11:00:00+00', 'SETTLED'),
(51,  8,  6, NULL,  30.00, 'CREDIT','a1000000-0000-4000-8000-000000000044', '2024-04-16 11:00:00+00', 'SETTLED'),
(52,  8,  9, NULL,  30.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000045', '2024-04-16 11:05:00+00', 'SETTLED'),
(53,  9,  8, NULL,  30.00, 'CREDIT','a1000000-0000-4000-8000-000000000045', '2024-04-16 11:05:00+00', 'SETTLED'),
(54,  9, 11, NULL,  30.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000046', '2024-04-16 11:10:00+00', 'SETTLED'),
(55, 11,  9, NULL,  30.00, 'CREDIT','a1000000-0000-4000-8000-000000000046', '2024-04-16 11:10:00+00', 'SETTLED'),
(56, 11, 14, NULL,  30.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000047', '2024-04-16 11:15:00+00', 'SETTLED'),
(57, 14, 11, NULL,  30.00, 'CREDIT','a1000000-0000-4000-8000-000000000047', '2024-04-16 11:15:00+00', 'SETTLED'),
(58, 14,  6, NULL,  30.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000048', '2024-04-16 11:20:00+00', 'SETTLED'),
(59,  6, 14, NULL,  30.00, 'CREDIT','a1000000-0000-4000-8000-000000000048', '2024-04-16 11:20:00+00', 'SETTLED'),

-- ========== May 2024 ==========
(60, 12, NULL,10, 2200.00, 'CREDIT','a1000000-0000-4000-8000-000000000049', '2024-05-01 00:01:00+00', 'SETTLED'),
(61, 12, NULL, 1,  33.10, 'DEBIT',  'a1000000-0000-4000-8000-000000000050', '2024-05-02 09:40:00+00', 'SETTLED'),
(62, 12, NULL, 3,  55.60, 'DEBIT',  'a1000000-0000-4000-8000-000000000051', '2024-05-05 12:00:00+00', 'SETTLED'),
(63, 12, NULL,21,  18.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000052', '2024-05-08 15:30:00+00', 'SETTLED'),
(64, 12, NULL,13, 145.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000053', '2024-05-10 07:00:00+00', 'SETTLED'),

-- More activity on other accounts so aggregates / rankings have volume
(65,  3, NULL,10, 2100.00, 'CREDIT','a1000000-0000-4000-8000-000000000054', '2024-05-01 00:01:00+00', 'SETTLED'),
(66,  3, NULL, 2,  48.90, 'DEBIT',  'a1000000-0000-4000-8000-000000000055', '2024-05-03 10:00:00+00', 'SETTLED'),
(67,  5, NULL,10, 1800.00, 'CREDIT','a1000000-0000-4000-8000-000000000056', '2024-05-01 00:01:00+00', 'SETTLED'),
(68,  5, NULL,19, 120.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000057', '2024-05-06 14:00:00+00', 'SETTLED'),
(69,  6, NULL,10, 1900.00, 'CREDIT','a1000000-0000-4000-8000-000000000058', '2024-05-01 00:01:00+00', 'SETTLED'),
(70,  7, NULL,10, 1200.00, 'CREDIT','a1000000-0000-4000-8000-000000000059', '2024-05-01 00:01:00+00', 'SETTLED'),
(71, 14, NULL,10, 1600.00, 'CREDIT','a1000000-0000-4000-8000-000000000060', '2024-05-01 00:01:00+00', 'SETTLED'),
(72, 15, NULL,10, 2400.00, 'CREDIT','a1000000-0000-4000-8000-000000000061', '2024-05-01 00:01:00+00', 'SETTLED'),
(73, 18, NULL,10, 2000.00, 'CREDIT','a1000000-0000-4000-8000-000000000062', '2024-05-01 00:01:00+00', 'SETTLED'),

-- ========== June 2024 ==========
(74, 12, NULL,10, 2200.00, 'CREDIT','a1000000-0000-4000-8000-000000000063', '2024-06-01 00:01:00+00', 'SETTLED'),
(75, 12, NULL, 1,  22.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000064', '2024-06-03 10:00:00+00', 'SETTLED'),
(76, 12, NULL, 4,  39.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000065', '2024-06-05 18:20:00+00', 'SETTLED'),
(77, 12, NULL,16,   5.20, 'DEBIT',  'a1000000-0000-4000-8000-000000000066', '2024-06-07 08:15:00+00', 'SETTLED'),
(78, 12, NULL, 7,  15.99, 'DEBIT',  'a1000000-0000-4000-8000-000000000067', '2024-06-10 09:00:00+00', 'SETTLED'),

-- Large amounts for NTILE / top-spender exercises
(79, 15, NULL,12, 890.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000068', '2024-06-12 11:00:00+00', 'SETTLED'),
(80, 16, NULL,11, 450.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000069', '2024-06-13 09:30:00+00', 'SETTLED'),
(81,  4, NULL,13, 670.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000070', '2024-06-14 14:00:00+00', 'SETTLED'),

-- ========== Orphan transfers (Day 01 / Day 09) ==========
-- DEBIT without a matching CREDIT
(82,  9, 18, NULL,  75.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000071', '2024-06-15 16:00:00+00', 'SETTLED'),
(83, 20,  1, NULL, 120.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000072', '2024-06-16 10:00:00+00', 'SETTLED'),
(84, 21, 22, NULL,  40.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000073', '2024-06-17 12:30:00+00', 'SETTLED'),

-- ========== Extra purchases so every active merchant has volume ==========
(85,  1, NULL, 2,  36.70, 'DEBIT',  'a1000000-0000-4000-8000-000000000074', '2024-06-18 09:00:00+00', 'SETTLED'),
(86,  3, NULL, 3,  29.40, 'DEBIT',  'a1000000-0000-4000-8000-000000000075', '2024-06-18 10:00:00+00', 'SETTLED'),
(87,  5, NULL, 5,  48.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000076', '2024-06-18 11:00:00+00', 'SETTLED'),
(88,  6, NULL, 6,  55.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000077', '2024-06-18 12:00:00+00', 'SETTLED'),
(89,  8, NULL, 8,   9.99, 'DEBIT',  'a1000000-0000-4000-8000-000000000078', '2024-06-18 13:00:00+00', 'SETTLED'),
(90,  9, NULL, 9,  14.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000079', '2024-06-18 14:00:00+00', 'SETTLED'),
(91, 11, NULL,15,  11.50, 'DEBIT',  'a1000000-0000-4000-8000-000000000080', '2024-06-18 15:00:00+00', 'SETTLED'),
(92, 14, NULL,16,   6.80, 'DEBIT',  'a1000000-0000-4000-8000-000000000081', '2024-06-18 16:00:00+00', 'SETTLED'),
(93, 17, NULL,17,  62.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000082', '2024-06-18 17:00:00+00', 'SETTLED'),
(94, 18, NULL,18,  28.40, 'DEBIT',  'a1000000-0000-4000-8000-000000000083', '2024-06-18 18:00:00+00', 'SETTLED'),
(95, 20, NULL,19, 110.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000084', '2024-06-18 19:00:00+00', 'SETTLED'),
(96, 21, NULL,20,  45.00, 'DEBIT',  'a1000000-0000-4000-8000-000000000085', '2024-06-18 20:00:00+00', 'SETTLED'),
(97, 22, NULL,21,  12.30, 'DEBIT',  'a1000000-0000-4000-8000-000000000086', '2024-06-18 21:00:00+00', 'SETTLED'),

-- A few more entries on account 7 for the isolation / phantom-read exercises
(98,  7, NULL, 2,  19.80, 'DEBIT',  'a1000000-0000-4000-8000-000000000087', '2024-06-19 09:00:00+00', 'SETTLED'),
(99,  7, NULL,15,  14.20, 'DEBIT',  'a1000000-0000-4000-8000-000000000088', '2024-06-19 12:30:00+00', 'SETTLED'),
(100,7, NULL, 1,  27.60, 'DEBIT',  'a1000000-0000-4000-8000-000000000089', '2024-06-20 08:45:00+00', 'SETTLED');

-- ---------------------------------------------------------------------------
-- Optional but useful: set a deterministic sequence so future INSERTs
-- (Day 03 exercises, etc.) continue from a known id.
-- ---------------------------------------------------------------------------
SELECT setval(pg_get_serial_sequence('users', 'id'),          (SELECT MAX(id) FROM users));
-- Note: the schema uses plain BIGINT PRIMARY KEY (no SERIAL), so the above
-- is a no-op unless you later change the columns to BIGSERIAL.
-- Keeping it here for convenience if the schema evolves.

COMMIT;

-- =============================================================================
-- Quick sanity checks (run manually if you want)
-- =============================================================================
-- SELECT COUNT(*) FROM users;            -- 15
-- SELECT COUNT(*) FROM accounts;         -- 23
-- SELECT COUNT(*) FROM categories;       -- 10
-- SELECT COUNT(*) FROM merchants;        -- 24 (3 unused)
-- SELECT COUNT(*) FROM ledger_entries;   -- 100
-- SELECT status, COUNT(*) FROM ledger_entries GROUP BY status;
-- SELECT direction, COUNT(*) FROM ledger_entries GROUP BY direction;
--
-- Orphan transfers:
-- SELECT transfer_group FROM ledger_entries WHERE direction = 'DEBIT'
-- EXCEPT
-- SELECT transfer_group FROM ledger_entries WHERE direction = 'CREDIT';
--
-- Merchants with zero activity:
-- SELECT m.* FROM merchants m
-- LEFT JOIN ledger_entries le ON le.merchant_id = m.id
-- WHERE le.id IS NULL;
