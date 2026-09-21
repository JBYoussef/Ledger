SELECT *
FROM merchants
NATURAL JOIN
(
    SELECT id
    FROM merchants
    WHERE id NOT IN
    (
        SELECT merchant_id
        FROM ledger_entries
        WHERE merchant_id IS NOT NULL
    )
) AS merchant_ids_nobody_bought
ORDER BY id DESC;

--------------------------------------------------------------------------------

-- NATURAL JOIN

-- O NATURAL JOIN é um tipo de junção que combina registros de duas tabelas com base em colunas com o mesmo nome e tipo de dados. Ele automaticamente identifica as colunas comuns entre as tabelas e realiza a junção com base nesses campos, sem a necessidade de especificar explicitamente as condições de junção.
-- No exemplo acima, estamos realizando um NATURAL JOIN entre a tabela merchants e uma subconsulta que seleciona os IDs dos comerciantes que não possuem entradas correspondentes na tabela ledger_entries. A junção é feita automaticamente com base nas colunas comuns entre as duas tabelas, que neste caso é a coluna id.
-- O NATURAL JOIN funde as duas tabelas em uma única tabela resultante, incluindo apenas as colunas comuns uma vez. Se houver mais de uma coluna com o mesmo nome, todas elas serão usadas para a junção.
-- Não precisamos definir a condição de junção explicitamente, pois o NATURAL JOIN faz isso automaticamente com base nas colunas comuns ou seja, ele usa as colunas com o mesmo nome e tipo de dados para realizar a junção.
-- No entanto, é importante ter cuidado ao usar o NATURAL JOIN, pois ele pode levar a resultados inesperados se houver colunas com o mesmo nome em ambas as tabelas que não deveriam ser usadas para a junção.
-- Caso tenham o mesmo nome, mas tipos de dados diferentes, o NATURAL JOIN não funcionará corretamente e resultará em um erro. Portanto, é recomendável revisar cuidadosamente as tabelas envolvidas antes de usar o NATURAL JOIN para garantir que ele produza os resultados desejados.

-- Supondo que queremos 'NATURAL JOIN' a tabela1 e a tabela2, podemos usar a seguinte sintaxe:

-- SELECT *
-- FROM tabela1
-- NATURAL JOIN tabela2;

-- Supondo que ambas as tabelas possuem duas colunas com o mesmo nome e tipo de dados compativeos, o NATURAL JOIN irá combinar os registros dessas tabelas com base nessas colunas comuns, retornando apenas os registros que possuem correspondência em ambas as tabelas.
-- Seria como se sintactimante fosse adicionado depois do NATURAL JOIN a cláusula ON, que especifica as colunas comuns para a junção. No entanto, o NATURAL JOIN faz isso automaticamente, sem a necessidade de escrever explicitamente a condição de junção.

-- Exemplo:
--  ON tabela1.coluna_comum = tabela2.coluna_comum
--  AND tabela1.outra_coluna_comum = tabela2.outra_coluna_comum
--  ...
-- É mais ou menos assim como é feito, de baixo dos panos. Talvez eu tenha enrolado e escrevido demais, mas é isso.

--------------------------------------------------------------------------------

-- IN

-- O operador IN é usado para verificar se um valor está presente em uma lista de valores ou em um conjunto de resultados retornados por uma subconsulta. Ele retorna TRUE se o valor estiver presente na lista ou no conjunto, e FALSE caso contrário.
-- No exemplo acima, estamos usando o operador IN para verificar se o id do comerciante está presente na lista de IDs retornados pela subconsulta que seleciona os merchant_id da tabela ledger_entries. A subconsulta retorna todos os merchant_id que não são nulos, e o operador IN verifica se o id do comerciante está presente nessa lista. Se estiver, o comerciante será incluído no resultado final da consulta. Caso contrário, ele será excluído do resultado.
-- O operador IN é útil quando queremos filtrar registros com base em uma lista de valores ou em um conjunto de resultados retornados por uma subconsulta, tornando a consulta mais legível e fácil de entender. Ele é frequentemente usado em conjunto com subconsultas para realizar filtragens complexas de dados em consultas SQL.

--------------------------------------------------------------------------------