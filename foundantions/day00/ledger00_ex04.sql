SELECT
    amount, -- Mesmo se não incluissemos no SELECT, o CASE ainda funcionaria, mas não teríamos acesso ao valor de 'amount' para fazer a ordenação.
    CASE
        WHEN amount < 10 THEN 'micro'
        WHEN amount BETWEEN 10 AND 500 THEN 'regular'
        ELSE 'large'
    END AS amount_bucket
FROM ledger_entries
ORDER BY amount_bucket, amount;

--------------------------------------------------------------------------------

-- CASE

-- É usado para criar condições dentro de uma consulta SQL.
-- Permite definir diferentes resultados com base em condições específicas.
--
-- Nota: Usamos o AS para dar um nome à coluna resultante do CASE, sem isso, o resultado não teria um nome e seria mais difícil de referenciar.

--------------------------------------------------------------------------------

-- WHEN

-- Define a condição que será avaliada.
-- Se a condição for verdadeira, o valor definido após o THEN será retornado.

-------------------------------------------------------------------------------

-- THEN

-- Define o valor que será retornado se a condição do WHEN for verdadeira.

--------------------------------------------------------------------------------

-- ELSE

-- Define o valor que será retornado se nenhuma das condições do WHEN for verdadeira.
-- Nota: não é necessário usar o ELSE, mas é uma boa prática para lidar com casos não previstos.

--------------------------------------------------------------------------------

-- END

-- Indica o final do bloco CASE.

--------------------------------------------------------------------------------

-- ORDER BY valor1, valor2, ...

-- Quando usamos várias colunas no ORDER BY, a primeira coluna tem prioridade.
-- A segunda coluna só é usada para ordenar os registros que possuem
-- o mesmo valor na primeira coluna.
--
-- Exemplo:
--
-- ORDER BY amount_bucket, amount;
--
-- Primeiro, os registros são ordenados por 'amount_bucket'.
-- Depois, dentro de cada bucket, os registros são ordenados por 'amount'.
--
-- Podemos pensar assim:
--
-- 1º → ordena por 'amount_bucket'
-- 2º → se houver valores iguais em 'amount_bucket', ordena esses registros por 'amount'.