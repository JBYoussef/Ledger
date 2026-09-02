SELECT
    ldge.amount,
    ldge.occurred_at,
    accounts.currency,
    mrch.name,
    ctg.name

FROM ledger_entries AS ldge -- 'AS' é uma keyword, que permite mudar o nome de uma tabela ou coluna, para facilitar a leitura do código, ou para evitar conflitos de nomes.

JOIN accounts AS acc        -- 'JOIN' é uma keyword usada para quando queremos pegar informações de mais de uma tabela, com base em uma condição, que é definida no 'ON', e retorna apenas os registros que atendem a essa condição.
    ON acc.id = ldge.account_id -- 'ON' é uma keyword que define a condição de junção entre as tabelas, ou seja, como elas estão relacionadas.

JOIN merchants AS mrch
    ON mrch.id = ldge.merchant_id

JOIN categories AS ctg
    ON ctg.id = mrch.category_id
