SELECT 
    DATE_TRUNC('day', b.evt_block_time) AS borrow_date,
    t.symbol AS token_symbol,
    COUNT(b.evt_tx_hash) AS total_borrow_transactions,
    SUM(CAST(b.amount AS DOUBLE) / POWER(10, t.decimals)) AS total_amount_borrowed
FROM 
    aave_v3_ethereum.Pool_evt_Borrow b
JOIN 
    tokens.erc20 t 
    ON b.reserve = t.contract_address 
    AND t.blockchain = 'ethereum'
WHERE 
    b.evt_block_time >= NOW() - INTERVAL '14' day 
    AND t.symbol IN ('USDC', 'USDT', 'WETH', 'WBTC') 
GROUP BY 
    1, 2
ORDER BY 
    borrow_date DESC, total_amount_borrowed DESC;
