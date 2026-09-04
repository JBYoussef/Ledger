SELECT *
FROM ledger_entries
WHERE account_id = 7
ORDER BY occurred_at DESC;

--------------------------------------------------------------------------------

-- SELECT

-- Define quais colunas ou valores queremos obter no resultado da consulta.
-- É onde escolhemos os dados que queremos visualizar.
--
-- Exemplo:
-- SELECT name, email
-- Retorna apenas as colunas 'name' e 'email'.

--------------------------------------------------------------------------------

-- FROM

-- Define de qual tabela vamos buscar os dados.
-- É a tabela de origem da consulta.
--
-- Exemplo:
-- FROM accounts
-- Significa que estamos a buscar os dados da tabela 'accounts'.

--------------------------------------------------------------------------------

-- WHERE

-- Define condições para filtrar os registros.
-- Apenas os registros que atendem à condição serão retornados.
--
-- Exemplo:
-- WHERE status = 'ACTIVE'
-- Retorna apenas os registros cujo status seja 'ACTIVE'.

--------------------------------------------------------------------------------

-- ORDER BY

-- Define a ordem em que os registros serão apresentados no resultado.
-- Por padrão, a ordenação é ASC (ascendente).
-- Podemos usar DESC para ordenar de forma descendente.
--
-- Exemplo:
-- ORDER BY created_at DESC
-- Mostra primeiro os registros mais recentes.

--------------------------------------------------------------------------------

-- A lógica pode ser entendida assim:
--
-- FROM      → de onde vêm os dados?
-- WHERE     → quais registros queremos?
-- SELECT    → quais colunas queremos mostrar?
-- ORDER BY  → em que ordem queremos mostrar?
