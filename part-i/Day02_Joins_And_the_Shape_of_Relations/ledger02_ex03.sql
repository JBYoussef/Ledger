SELECT *
FROM accounts
FULL OUTER JOIN ledger_entries
    ON accounts.id = ledger_entries.account_id
    AND EXTRACT( YEAR FROM ledger_entries.occurred_at ) = 2025 -- GIVEN YEAR
    AND EXTRACT( MONTH FROM ledger_entries.occurred_at ) = 4 -- GIVEN MONTH
;

--------------------------------------------------------------------------------

-- FULL OUTER JOIN

-- Retorna todos os registros de ambas as tabelas, combinando-os quando houver correspondência com base na condição especificada na cláusula ON.
-- Se não houver correspondência, os campos da tabela que não possui correspondência serão preenchidos com NULL, em vez de excluir o registro da impressão final.
-- Diferentemente do INNER JOIN ou JOIN (normal/simples), que retorna apenas os registros que possuem correspondência em ambas as tabelas, e do LEFT JOIN, que retorna todos os registros da tabela da esquerda e os registros correspondentes da tabela da direita, o FULL OUTER JOIN retorna todos os registros de ambas as tabelas, independentemente de haver correspondência ou não.
-- Mas os que tiverem correspondência, serão combinados em uma única linha no resultado final, enquanto os que não tiverem correspondência terão os campos da tabela que não possui correspondência preenchidos com NULL.

--------------------------------------------------------------------------------