SELECT *
FROM ledger_entries
WHERE direction = 'DEBIT' 
AND status = 'SETTLED' -- 'AND' é um operador condicional, como && de C/C++
AND amount > 100.00; -- '>' outro operador como o de C/C++

SELECT *
FROM ledger_entries
WHERE direction = 'DEBIT'
AND status = 'SETTLED'
AND amount between 100.01 AND 999999999999.99; -- 'BETWEEN' é um operador condicional, como >= e <= de C/C++, utiliza-se assim: BETWEEN valor1 AND valor2