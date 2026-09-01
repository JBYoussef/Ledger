SELECT * -- Seleciona todos os campos
FROM ledger_entries -- Todos os campos de 'ledger_entries'
WHERE account_id = 7 -- Onde 'account_id' que é um campo de 'ledger_entries' é igual ao valor atribuido
ORDER BY occurred_at DESC; -- 'ORDER BY' ordenar por, 'occurred_at' que é um outro campo de 'ledger_entries', e que será utilizado como pivô ou valor para a ordenação. 'DESC' define a ordem de ordenação, neste caso é 'ordem descendente'.q