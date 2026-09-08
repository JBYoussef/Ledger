SELECT
    ldge.amount || ' ' ||
    acc.currency || ' to ' ||
    mrch.name || ' (' ||
    ctg.name || ') — ' ||
    TO_CHAR(ldge.occurred_at, 'YYYY-MM-DD') AS receipt_line

FROM ledger_entries AS ldge

JOIN accounts AS acc
    ON acc.id = ldge.account_id

JOIN merchants AS mrch
    ON mrch.id = ldge.merchant_id

JOIN categories AS ctg
    ON ctg.id = mrch.category_id

ORDER BY receipt_line;

--------------------------------------------------------------------------------

-- JOIN

-- qual tabela queremos relacionar
-- É usado para relacionar duas ou mais tabelas.
-- Permite combinar informações de tabelas diferentes com base
-- em uma condição de relacionamento definida no ON.
-- Um JOIN simples (INNER JOIN) retorna apenas os registros
-- que possuem correspondência entre as tabelas.

--------------------------------------------------------------------------------

-- ON

-- como as tabelas estão relacionadas
-- Define a condição que determina como as tabelas serão relacionadas.
-- Neste exemplo, estamos dizendo que o 'id' da tabela accounts
-- deve corresponder ao 'account_id' da tabela ldge.

--------------------------------------------------------------------------------

-- AS

-- apelido (alias) para tabela ou coluna
-- É usado para criar um alias (apelido) para uma tabela ou coluna.
-- Neste caso, 'acc' é o alias da tabela 'accounts'.
-- Assim, podemos referenciar a tabela usando 'acc' em vez
-- de escrever 'accounts' várias vezes.

--------------------------------------------------------------------------------

-- ||

-- concatena/junta strings
-- É o operador de concatenação de strings no PostgreSQL.
-- É usado para juntar dois ou mais valores de texto em uma única string.
-- Também podemos concatenar colunas e texto fixo.

--------------------------------------------------------------------------------

-- TO_CHAR(expressão, 'formato')

-- converte um valor para string com formato específico
-- É uma função que converte um valor (como data ou número)
-- em uma string formatada de acordo com o formato especificado.
-- Exemplo:
-- TO_CHAR(ldge.occurred_at, 'YYYY-MM-DD')
-- Converte a data 'occurred_at' para o formato 'YYYY-MM-DD'.
