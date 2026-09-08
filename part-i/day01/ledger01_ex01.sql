SELECT
    transfer_group
FROM ledger_entries
WHERE direction = 'DEBIT'

EXCEPT

SELECT
    transfer_group
FROM ledger_entries
WHERE direction = 'CREDIT'

ORDER BY transfer_group;

/*
--------------------------------------------------------------------------------

-- EXCEPT

-- É usado para retornar os registros que existem na primeira consulta, mas não existem na segunda.
-- Ele remove os registros duplicados.
-- É útil quando queremos encontrar diferenças entre conjuntos de dados.

--------------------------------------------------------------------------------
*/