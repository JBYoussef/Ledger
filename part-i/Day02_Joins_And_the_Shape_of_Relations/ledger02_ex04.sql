SELECT
    categories.name,
    SUM(ledger_entries.amount) AS total_amount
FROM ledger_entries
JOIN merchants
    ON merchants.id = ledger_entries.merchant_id
JOIN categories
    ON categories.id = merchants.category_id
GROUP BY categories.name
ORDER BY total_amount DESC;

--------------------------------------------------------------------------------

-- GROUP BY

-- O GROUP BY é uma cláusula SQL usada para agrupar registros com base
-- em uma ou mais colunas. Ele permite trabalhar com funções de
-- agregação, como SUM, COUNT, AVG, MAX e MIN, para cada grupo de
-- registros.

-- No exemplo acima, estamos usando o GROUP BY para agrupar os registros
-- resultantes dos JOINs com base na coluna name da tabela categories.
-- Isso significa que todas as linhas do resultado que possuem o mesmo
-- valor em categories.name pertencem ao mesmo grupo. Depois disso,
-- a função de agregação SUM pode ser aplicada à coluna amount dentro
-- de cada um desses grupos.


-- Pelo que eu entendi, é isso que acontece debaixo dos panos aqui:

-- Primeiro temos o FROM e depois um ou mais JOINs. O FROM define a
-- tabela inicial, que podemos chamar de tabela "base", e cada JOIN
-- estabelece uma relação entre o resultado que já temos e uma nova
-- tabela.

-- "Como assim?" Bem, sem JOIN, se fizermos:
--
-- SELECT * FROM ledger_entries;
--
-- estamos simplesmente obtendo as linhas da tabela ledger_entries,
-- com as suas respectivas colunas.

-- Quando adicionamos:
--
-- JOIN new_table
--     ON new_table.id = ledger_entries.shared_id
--
-- estamos dizendo que queremos relacionar as linhas de new_table
-- com as linhas de ledger_entries que satisfazem essa condição.
--
-- Como estamos falando de um JOIN normal (INNER JOIN), somente as
-- combinações que satisfazem a condição do ON permanecem no resultado.

-- Portanto, não é exatamente que o JOIN simplesmente "filtra a
-- tabela base". Ele constrói um novo resultado relacionando linhas
-- das tabelas envolvidas.
--
-- Por exemplo, se uma linha de ledger_entries possui shared_id = 5,
-- o JOIN procura uma linha de new_table cujo id seja 5. Se essa
-- relação satisfizer a condição do ON, temos uma linha do resultado
-- contendo informações das duas tabelas.

-- A cada novo JOIN, esse resultado é novamente relacionado com uma
-- nova tabela.
--
-- Por exemplo:
--
-- ledger_entries
--       ↓
--     JOIN merchants
--       ↓
--     JOIN categories
--
-- Depois do primeiro JOIN temos um resultado contendo informações
-- de ledger_entries e merchants. O segundo JOIN trabalha sobre esse
-- resultado e adiciona as informações de categories que satisfazem
-- a condição do seu ON.

-- Assim, ao final dos JOINs, podemos imaginar que temos uma sequência
-- de linhas resultantes, onde cada linha representa uma combinação
-- válida de registros das tabelas envolvidas.
--
-- Por exemplo:
--
-- ledger_entry 1 → merchant 10 → category 5
-- ledger_entry 2 → merchant 10 → category 5
-- ledger_entry 3 → merchant 20 → category 8
--
-- Essa é a minha visualização lógica do resultado. Não estou dizendo
-- que o PostgreSQL realmente cria fisicamente uma lista ou uma lista
-- encadeada dessa forma.

-- Também é importante perceber que uma condição utilizada em um JOIN
-- anterior não precisa ser repetida no JOIN seguinte. Isso acontece
-- porque o resultado produzido pelo JOIN anterior já contém as linhas
-- que satisfizeram aquela relação.
--
-- Por exemplo:
--
-- JOIN merchants
--     ON merchants.id = ledger_entries.merchant_id
--
-- JOIN categories
--     ON categories.id = merchants.category_id
--
-- No segundo JOIN já estamos trabalhando sobre o resultado que contém
-- ledger_entries e merchants. Portanto, podemos usar merchants para
-- estabelecer a nova relação com categories.


-- E então entra o GROUP BY.

-- O GROUP BY pode ser entendido, na minha visualização, como uma
-- operação que percorre logicamente essas linhas resultantes e as
-- separa em grupos de acordo com os valores das colunas escolhidas.

-- Por exemplo, se fizermos:
--
-- GROUP BY categories.name
--
-- ele observa o valor de categories.name em cada linha do resultado.
--
-- Se tivermos:
--
-- linha 1 → categories.name = "Food"
-- linha 2 → categories.name = "Food"
-- linha 3 → categories.name = "Transport"
-- linha 4 → categories.name = "Food"
--
-- então teremos logicamente:
--
-- Food
--     → linha 1
--     → linha 2
--     → linha 4
--
-- Transport
--     → linha 3
--
-- Ou seja, as linhas que possuem o mesmo valor em categories.name
-- pertencem ao mesmo grupo.


-- Depois disso podemos aplicar uma função de agregação.

-- Por exemplo:
--
-- SUM(ledger_entries.amount)
--
-- O SUM não soma simplesmente todos os amounts do resultado inteiro.
-- Ele é aplicado separadamente dentro de cada grupo.
--
-- Se tivermos:
--
-- Food
--     → 100
--     → 50
--     → 30
--
-- Transport
--     → 80
--     → 20
--
-- teremos:
--
-- Food      → SUM = 180
-- Transport → SUM = 100


-- Isso também explica por que uma coluna que aparece no SELECT,
-- mas que não está no GROUP BY, normalmente precisa estar dentro de
-- uma função de agregação.
--
-- Se fizermos:
--
-- SELECT categories.name, ledger_entries.amount
-- GROUP BY categories.name;
--
-- para o grupo "Food" poderíamos ter vários amounts:
--
-- Food → 100
-- Food → 50
-- Food → 30
--
-- Então o PostgreSQL não sabe qual amount deveria representar o
-- grupo "Food".
--
-- Precisamos transformar esses vários valores em um único valor,
-- por exemplo:
--
-- SUM(amount)
-- AVG(amount)
-- MAX(amount)
-- MIN(amount)
--
-- ou então colocar amount também no GROUP BY, fazendo com que ele
-- participe da definição dos grupos.

-- Portanto, a minha visão geral é:
--
-- FROM
--     ↓
-- define o ponto de partida
--
-- JOIN
--     ↓
-- estabelece relações e constrói o resultado com novas linhas
--
-- GROUP BY
--     ↓
-- separa as linhas resultantes em grupos de acordo com determinados
-- valores
--
-- SUM / COUNT / AVG / MAX / MIN
--     ↓
-- transforma os vários valores de cada grupo em valores agregados
--
-- SELECT
--     ↓
-- define os dados que serão apresentados no resultado
--
-- ORDER BY
--     ↓
-- ordena o resultado final

-- NOTE: EXPLANATION CORRECTED BY "BOTILSON"( ChatGPT )

--------------------------------------------------------------------------------