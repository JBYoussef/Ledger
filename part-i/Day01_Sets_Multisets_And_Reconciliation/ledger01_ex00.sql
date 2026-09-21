SELECT
    name,
    'merchant' AS source
FROM merchants

UNION

SELECT
    name,
    'category' AS source
FROM categories

ORDER BY name, source;

/*
--------------------------------------------------------------------------------

-- UNION

-- É usado para combinar o resultado de duas ou mais consultas SELECT
-- em um único resultado.
--
-- O resultado da segunda consulta é colocado abaixo do resultado
-- da primeira consulta.
--
-- As consultas precisam retornar o mesmo número de colunas,
-- e as colunas correspondentes precisam ter tipos de dados compatíveis, não necessariamente com os mesmos nomes.
--
-- Por padrão, UNION remove registros duplicados.


--------------------------------------------------------------------------------

-- Exemplo:

SELECT name
FROM merchants

UNION

SELECT name
FROM categories;


-- Resultado:
--
-- Junta os nomes retornados pelas duas consultas:
--
-- merchant_1
-- merchant_2
-- merchant_3
-- category_1
-- category_2
-- category_3
--
-- Se o mesmo valor aparecer nas duas consultas, ele aparece apenas uma vez.


--------------------------------------------------------------------------------

-- UNION ALL

-- UNION ALL também combina os resultados das consultas,
-- mas NÃO remove os registros duplicados.
--
-- É útil quando queremos manter todas as linhas retornadas.

SELECT name
FROM merchants

UNION ALL

SELECT name
FROM categories;


--------------------------------------------------------------------------------

-- IMPORTANTE

-- As duas consultas precisam ter o mesmo número de colunas.
--
-- Isto é válido:

SELECT id, name
FROM merchants

UNION

SELECT id, name
FROM categories;


-- Isto NÃO é válido:

SELECT id, name
FROM merchants

UNION

SELECT name
FROM categories;


-- A primeira consulta retorna 2 colunas,
-- enquanto a segunda retorna apenas 1.


--------------------------------------------------------------------------------

-- UNION combina resultados VERTICALMENTE.
--
-- Consulta 1:
--
-- A
-- B
-- C
--
-- UNION
--
-- Consulta 2:
--
-- D
-- E
--
-- Resultado:
--
-- A
-- B
-- C
-- D
-- E


--------------------------------------------------------------------------------

-- RESUMO
--
-- UNION     → junta resultados e remove duplicados.
-- UNION ALL  → junta resultados e mantém duplicados.
--
-- JOIN      → combina colunas de tabelas relacionadas.
--           → junta tabelas lado a lado
--           → adiciona/combina COLUNAS

-- UNION     → combina linhas de diferentes SELECTs.
--           → junta resultados um embaixo do outro
--           → adiciona/combina LINHAS

--------------------------------------------------------------------------------
*/