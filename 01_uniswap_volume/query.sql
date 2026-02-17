SELECT 
    DATE_TRUNC('day', block_time) AS block_date,
    SUM(amount_usd) AS total_volume_usd
FROM 
    dex.trades
WHERE 
    project = 'uniswap' 
    AND version = '3'
    AND block_time >= NOW() - INTERVAL '30' day
    AND amount_usd IS NOT NULL 
GROUP BY 
    1 
ORDER BY 
    block_date DESC;
