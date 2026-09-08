SELECT DISTINCT account_id
FROM ledger_entries
WHERE
    occurred_at BETWEEN '2024-06-01' AND '2024-12-31'
    OR merchant_id = 2
ORDER BY account_id DESC;

--------------------------------------------------------------------------------

-- SELECT DISTINCT

-- É usado para retornar apenas valores únicos, removendo duplicados
-- do resultado da consulta.
--
-- Exemplo:
-- SELECT DISTINCT status
-- FROM accounts;
--
-- Se existirem vários registros com:
-- ACTIVE
-- ACTIVE
-- INACTIVE
-- ACTIVE
--
-- O resultado será:
-- ACTIVE
-- INACTIVE

--------------------------------------------------------------------------------

-- OR

-- É usado para combinar duas ou mais condições.
-- O registro será retornado quando pelo menos uma das condições
-- for verdadeira.
--
-- Exemplo:
-- WHERE status = 'ACTIVE'
--    OR status = 'PENDING'
--
-- Retorna registros cujo status seja 'ACTIVE' OU 'PENDING'.

--------------------------------------------------------------------------------

-- Resumo:
--
-- SELECT DISTINCT → retorna apenas valores únicos, sem duplicados.
-- OR              → retorna o registro se pelo menos uma condição for verdadeira.