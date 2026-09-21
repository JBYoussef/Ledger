SELECT
    account_id
FROM
(
    SELECT
        account_id,
        CAST(occurred_at AS DATE) AS activity_date
    FROM ledger_entries
    WHERE direction = 'DEBIT'
        AND merchant_id IS NOT NULL
        AND status = 'SETTLED'

    INTERSECT

    SELECT
        account_id,
        CAST(occurred_at AS DATE) AS activity_date
    FROM ledger_entries
    WHERE direction = 'CREDIT'
        AND counterparty_account_id IS NOT NULL
        AND status = 'SETTLED'
)   AS same_day

ORDER BY account_id;



/*
--------------------------------------------------------------------------------

-- INTERSECT

-- A cláusula INTERSECT retorna apenas os registros que estão presentes em ambas as consultas.
-- Ele remove os registros duplicados.
-- É útil quando queremos encontrar registros comuns entre conjuntos de dados.
-- Para que funcione, as consultas precisam retornar o mesmo número de colunas, e as colunas correspondentes precisam ter tipos de dados compatíveis, assim como no UNION.
-- Os nomes e a ordem das colunas no resultado final são baseados na primeira consulta.
-- A comparação é feita pela posição, não pelo nome.

--------------------------------------------------------------------------------

-- CAST( X AS Y )

-- É usado para converter um valor de um tipo de dado para outro.
-- No exemplo acima, estamos convertendo a coluna occurred_at, que é do tipo TIMESTAMP, para o tipo DATE.
-- Isso é útil quando queremos comparar ou manipular valores de diferentes tipos de dados, ou quando queremos extrair apenas a parte da data de um valor de data e hora.
-- OS TIPOS DE DADOS COMPATÍVEIS SÃO AQUELAS QUE PODEM SER CONVERTIDAS ENTRE SI SEM PERDER INFORMAÇÃO OU GERAR ERROS.
-- A LISTA DOS TIPOS DE DADOS COMPATÍVEIS PODE VARIAR ENTRE DIFERENTES SGBDs, MAS ALGUNS EXEMPLOS COMUNS INCLUEM:
-- - INT, BIGINT, DECIMAL, NUMERIC
-- - CHAR, VARCHAR, TEXT
-- - DATE, TIMESTAMP, TIMESTAMPTZ
-- É importante verificar a documentação do SGBD específico que você está usando para entender quais tipos de dados são compatíveis e como eles podem ser convertidos entre si.

--------------------------------------------------------------------------------

*/