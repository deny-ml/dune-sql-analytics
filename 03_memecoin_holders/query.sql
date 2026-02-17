WITH token_transfers AS (
    SELECT 
        "to" AS wallet_address,
        CAST(value AS DOUBLE) / 1e18 AS amount 
    FROM 
        erc20_ethereum.evt_Transfer
    WHERE 
        contract_address = 0x6982508145454ce325ddbe47a25d4ec3d2311933
        
    UNION ALL
    SELECT 
        "from" AS wallet_address,
        -CAST(value AS DOUBLE) / 1e18 AS amount
    FROM 
        erc20_ethereum.evt_Transfer
    WHERE 
        contract_address = 0x6982508145454ce325ddbe47a25d4ec3d2311933
),
holder_balances AS (
    SELECT 
        wallet_address,
        SUM(amount) AS current_balance
    FROM 
        token_transfers
    GROUP BY 
        1
)
SELECT 
    wallet_address,
    current_balance
FROM 
    holder_balances
WHERE 
    current_balance > 0 
    AND wallet_address != 0x0000000000000000000000000000000000000000
ORDER BY 
    current_balance DESC
LIMIT 50;
