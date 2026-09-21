SELECT
    merchant_id,
    amount,
    (
        SELECT name
        FROM merchants
        WHERE id = merchant_id
    ) AS merchant_name
FROM ledger_entries;

--------------------------------------------------------------------------------

-- SUBQUERY

-- É uma consulta dentro de outra consulta.
-- A subquery é executada primeiro e seu resultado é usado na consulta externa.

---------------------------------------------------------------------------------