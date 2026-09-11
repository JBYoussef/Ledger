WITH accounts_active_this_week AS
(
    SELECT
        account_id
    FROM ledger_entries
    WHERE EXTRACT( YEAR FROM occurred_at ) = EXTRACT( YEAR FROM now( ) )
        AND EXTRACT( WEEK FROM occurred_at ) = EXTRACT( WEEK FROM now( ) )
)
,
accounts_active_last_week AS
(
    SELECT
        account_id
    FROM ledger_entries
    WHERE EXTRACT( YEAR FROM occurred_at ) = EXTRACT( YEAR FROM now( ) )
        AND EXTRACT( WEEK FROM occurred_at ) = EXTRACT( WEEK FROM now( ) ) - 1
)
(
    SELECT
        account_id
    FROM accounts_active_this_week

    EXCEPT

    SELECT
        account_id
    FROM accounts_active_last_week
)

UNION

(
    SELECT
        account_id
    FROM accounts_active_last_week

    EXCEPT

    SELECT
        account_id
    FROM accounts_active_this_week
)

ORDER BY account_id;

/*
---------------------------------------------------------------------------------
-- WITH (Common Table Expressions - CTEs)

-- WITH é usado para criar CTEs (Common Table Expressions), que são consultas
-- nomeadas e temporárias que podem ser referenciadas dentro da consulta
-- principal. Elas ajudam a organizar consultas complexas, tornando-as mais
-- legíveis e fáceis de manter.

-- No exemplo acima, criamos duas CTEs:
-- accounts_active_this_week
-- accounts_active_last_week
--
-- Cada uma delas seleciona os account_id ativos em uma semana específica.

-- As CTEs são definidas no início da instrução SQL e podem ser referenciadas
-- posteriormente pela consulta principal e, dependendo do caso, por outras
-- CTEs definidas depois delas.

-- As CTEs existem apenas durante a execução da instrução SQL. Elas não são
-- objetos permanentes armazenados no banco de dados e não podem ser
-- referenciadas por outras instruções SQL depois que a instrução termina.

-- As CTEs também podem ser recursivas, permitindo que uma CTE faça referência
-- a si mesma. Isso é útil, por exemplo, para consultar estruturas
-- hierárquicas, como árvores de categorias, organogramas ou relacionamentos
-- entre registros.

-- As CTEs são especialmente úteis para melhorar a legibilidade e a manutenção
-- de consultas complexas, permitindo dividir uma consulta em partes menores,
-- nomeadas e mais fáceis de entender.

-- Dependendo do SGBD, uma CTE pode ser materializada ou não materializada.
-- Quando materializada, o resultado da CTE é calculado e armazenado
-- temporariamente para ser utilizado pela consulta.
--
-- Quando não materializada, o otimizador pode tratar a CTE de forma semelhante
-- a uma subconsulta e incorporá-la ao restante da consulta. O comportamento
-- exato depende do SGBD e do plano de execução.
--
-- Alguns SGBDs, como o PostgreSQL, permitem especificar explicitamente
-- MATERIALIZED ou NOT MATERIALIZED em determinadas situações.
---------------------------------------------------------------------------------
*/