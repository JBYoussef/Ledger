SELECT
    first_entry.account_id AS sender_id,
    second_entry.account_id AS recipient_id,
    second_entry.amount,
    second_entry.occurred_at,
    first_entry.transfer_group

FROM ledger_entries AS first_entry
JOIN ledger_entries AS second_entry
    ON second_entry.transfer_group = first_entry.transfer_group
    AND first_entry.direction = 'DEBIT'
    AND second_entry.direction = 'CREDIT';

--------------------------------------------------------------------------------

-- "SELF JOIN"

-- Um "SELF JOIN" é uma técnica em SQL onde uma tabela é unida a ela mesma. Isso é útil quando você deseja comparar registros dentro da mesma tabela ou encontrar relacionamentos entre registros da mesma entidade.
-- No exemplo acima, a tabela ledger_entries é unida a ela mesma usando aliases (sender e recipient) para diferenciar as duas instâncias da tabela. A junção é feita com base na coluna transfer_group, que indica que as transações estão relacionadas.
-- O resultado da consulta retorna informações sobre o remetente (sender) e o destinatário (recipient) das transações, incluindo os IDs das contas, o valor da transação e a data em que ocorreu.
-- Em um SELF JOIN, é importante usar aliases para diferenciar as duas instâncias da tabela, caso contrário, o SQL não saberia a qual instância da tabela você está se referindo.
-- Uma coisa que se pode fazer em um SELF JOIN é usar condições adicionais na cláusula ON para filtrar os registros que você deseja unir. No exemplo acima, a condição adicional é que a primeira entrada (first_entry) deve ser um débito e a segunda entrada (second_entry) deve ser um crédito
-- algo que só pode ser feito em um SELF JOIN, pois estamos comparando registros da mesma tabela, e não há o risco de sofrermos um erro pelo fato de estarmos predefinindo que a primeira entrada é um débito e a segunda entrada é um crédito, pois estamos comparando registros da mesma tabela.

---------------------------------------------------------------------------------

-- Anotações

/*
CASE
        WHEN
            CASE
                WHEN first_entry.status = 'SETTLED' AND second_entry.status = 'SETTLED'
                    THEN TRUE
                ELSE FALSE
            END
        THEN
            CASE
                WHEN first_entry.direction = 'DEBIT' AND second_entry.direction = 'CREDIT'
                    THEN first_entry.account_id
                ELSE second_entry.account_id
            END
    END AS sender_id
    ,
    CASE
        WHEN first_entry.status = 'SETTLED' AND second_entry.status = 'SETTLED'
            THEN
                CASE
                    WHEN first_entry.direction = 'DEBIT' AND second_entry.direction = 'CREDIT'
                        THEN second_entry.account_id
                    ELSE first_entry.account_id
                END
    END AS recipient_id


No primeiro WHEN do primeiro CASE, não havia bem a necessidade de eu fazer um CASE dentro de outro CASE, mas eu fiz para meio que mostrar que é possível fazer isso. O primeiro CASE poderia ser substituído por uma simples condição, como a que eu fiz no segundo CASE do SELECT, mas eu quis mostrar que é possível fazer um CASE dentro de outro CASE kkk.

No PostegreSQL, o WHEN tem de analisar uma expressão booleana, ou seja, uma expressão que retorna TRUE ou FALSE. No primeiro CASE, eu fiz um CASE dentro do WHEN para retornar TRUE ou FALSE, mas poderia ter feito uma simples condição booleana, como a que eu fiz no segundo CASE do SELECT.

'<>' É um operador de comparação que significa "diferente de". No exemplo acima, ele é usado para garantir que a segunda entrada (second_entry) seja diferente da primeira entrada (first_entry) ao fazer a junção. Isso evita que a mesma transação seja comparada consigo mesma.

A diferença entre o operador '<>' e o operador '!=' é que ambos significam "diferente de", mas '<>' é o padrão SQL ANSI, enquanto '!=' é mais comumente usado em algumas implementações de SQL, como MySQL. No PostgreSQL, ambos são suportados e funcionam da mesma forma.
*/

---------------------------------------------------------------------------------

