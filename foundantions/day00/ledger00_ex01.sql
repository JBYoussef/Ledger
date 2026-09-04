SELECT *
FROM ledger_entries
WHERE direction = 'DEBIT' 
AND status = 'SETTLED'
AND amount > 100.00; -- '>' outro operador como o de C/C++

SELECT *
FROM ledger_entries
WHERE direction = 'DEBIT'
AND status = 'SETTLED'
AND amount BETWEEN 100.01 AND 999999999999.99;

--------------------------------------------------------------------------------

-- BETWEEN

-- É usado para verificar se um valor está dentro de um determinado intervalo.
-- O BETWEEN inclui os dois limites do intervalo.
--
-- Exemplo:
-- WHERE age BETWEEN 18 AND 30
--
-- Retorna registros onde 'age' seja:
-- 18, 19, 20, ..., 29 ou 30.
--
-- BETWEEN também pode ser usado com datas:
-- WHERE created_at BETWEEN '2026-01-01' AND '2026-01-31'

--------------------------------------------------------------------------------

-- AND

-- É usado para combinar duas ou mais condições.
-- O registro só será retornado quando TODAS as condições
-- forem verdadeiras ao mesmo tempo.
--
-- Exemplo:
-- WHERE status = 'ACTIVE'
--   AND age >= 18
--
-- Significa:
-- O status deve ser 'ACTIVE'
-- E a idade deve ser maior ou igual a 18.
--
-- Se uma das condições for falsa, o registro não será retornado.

-- Podemos combinar várias condições com AND

--------------------------------------------------------------------------------

-- Resumo:
--
-- BETWEEN         → verifica se um valor está dentro de um intervalo.
-- AND             → retorna o registro se todas as condições forem verdadeiras.
