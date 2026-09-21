SELECT
    transfer_group
FROM ledger_entries
WHERE direction = 'DEBIT';

--EXCEPT

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
-- Para que funcione, as consultas precisam retornar o mesmo número de colunas, e as colunas correspondentes precisam ter tipos de dados compatíveis, assim como no UNION.
-- Os nomes e a ordem das colunas no resultado final são baseados na primeira consulta.
-- A comparação é feita pela posição, não pelo nome.

--------------------------------------------------------------------------------
*/