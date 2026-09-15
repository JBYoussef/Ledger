SELECT
    CASE
        WHEN
            CASE
                WHEN first_entry.status = 'SETTLED' AND second_entry.status = 'SETTLED'
                    THEN 1
                ELSE 0
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
    ,
    sender.account_id AS sender_id,
    recipient.account_id AS recipient_id,
    recipient.amount,
    recipient.occurred_at
FROM ledger_entries AS first_entry
JOIN ledger_entries AS second_entry
    ON second_entry.transfer_group = first_entry.transfer_group;

--------------------------------------------------------------------------------

-- "SELF JOIN"

-- Um "SELF JOIN" é uma técnica em SQL onde uma tabela é unida a ela mesma. Isso é útil quando você deseja comparar registros dentro da mesma tabela ou encontrar relacionamentos entre registros da mesma entidade.
-- No exemplo acima, a tabela ledger_entries é unida a ela mesma usando aliases (sender e recipient) para diferenciar as duas instâncias da tabela. A junção é feita com base na coluna transfer_group, que indica que as transações estão relacionadas.
-- O resultado da consulta retorna informações sobre o remetente (sender) e o destinatário (recipient) das transações, incluindo os IDs das contas, o valor da transação e a data em que ocorreu.

---------------------------------------------------------------------------------

-- No primeiro WHEN do primeiro CASE, não havia bem a necessidade de eu fazer um CASE dentro de outro CASE, mas eu fiz para meio que mostrar que é possível fazer isso. O primeiro CASE poderia ser substituído por uma simples condição, como a que eu fiz no segundo CASE do SELECT, mas eu quis mostrar que é possível fazer um CASE dentro de outro CASE kkk.


