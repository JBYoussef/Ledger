SELECT *
FROM merchants
LEFT JOIN ledger_entries
    ON merchants.id = ledger_entries.merchant_id
WHERE ledger_entries.merchant_id IS NULL;

--------------------------------------------------------------------------------

-- LEFT JOIN

-- Retorna todos os registros da tabela da esquerda (merchants)
-- e os registros correspondentes da tabela da direita (ledger_entries).
-- A tabela à esquerda é a primeira tabela mencionada na cláusula FROM, que neste caso é a tabela merchants.
-- Se não houver correspondência, ou melhor senão atender a condição do ON, os campos da tabela da direita serão preenchidos com NULL, em vez de excluir o registro da impressão final.
-- Diferentemente do INNER JOIN ou JOIN (normal/simples), que retorna apenas os registros que possuem correspondência em ambas as tabelas.

--------------------------------------------------------------------------------

-- IS

-- O operador IS é usado para comparar um valor com NULL.
-- Ele retorna TRUE se o valor for NULL e FALSE caso contrário.
-- Não é possível usar o operador de igualdade (=) para comparar com NULL, pois NULL representa a ausência de valor e não é considerado igual a nada, nem mesmo a outro NULL.
-- Portanto, para verificar se um valor é NULL, deve-se usar o operador IS NULL.
-- O operador IS também pode ser usado com outras palavras-chave, como IS NOT NULL, IS TRUE, IS FALSE, etc., para realizar comparações específicas.

---------------------------------------------------------------------------------