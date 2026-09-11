WITH accounts_active_this_week AS
(
    SELECT
        account_id
    FROM ledger_entries
    WHERE EXTRACT( YEAR FROM occurred_at ) = EXTRACT( YEAR FROM now( ) )
        AND EXTRACT( WEEK FROM occurred_at ) = EXTRACT( WEEK FROM now( ) )
)
,
accounts_active_last_week AS
(
    SELECT
        account_id
    FROM ledger_entries
    WHERE EXTRACT( YEAR FROM occurred_at ) = EXTRACT( YEAR FROM now( ) )
        AND EXTRACT( WEEK FROM occurred_at ) = EXTRACT( WEEK FROM now( ) ) - 1
)
(
    SELECT
        account_id
    FROM accounts_active_this_week

    EXCEPT

    SELECT
        account_id
    FROM accounts_active_last_week
)

UNION

(
    SELECT
        account_id
    FROM accounts_active_last_week

    EXCEPT

    SELECT
        account_id
    FROM accounts_active_this_week
)

ORDER BY account_id;