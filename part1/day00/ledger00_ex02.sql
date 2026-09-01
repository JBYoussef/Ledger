SELECT DISTINCT account_id -- 'DISTINCT' é um operador que seleciona apenas valores distintos, ou seja, sem repetição, ele permite que os valores retornados de uma coluna selecionada sejam únicos, sem duplicatas.
FROM ledger_entries
WHERE
    occurred_at BETWEEN '2024-06-01' AND '2024-12-31'
    OR merchant_id = 2 -- 'OR' é um operador condicional, como || de C/C++.
ORDER BY account_id DESC;
