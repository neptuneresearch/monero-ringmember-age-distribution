-- Number of RingCT outputs in range
SELECT COUNT(1)
FROM monero AS block,
LATERAL UNNEST(block.transactions) WITH ORDINALITY tx(hash, version, unlock_time, vin, vout, extra, fee),
LATERAL UNNEST(tx.vin) WITH ORDINALITY vin
WHERE block.height >= 1400000 AND block.height < 1600000
AND vin.amount = 0;

-- Number of Pre-RingCT outputs in range
SELECT COUNT(1)
FROM monero AS block,
LATERAL UNNEST(block.transactions) WITH ORDINALITY tx(hash, version, unlock_time, vin, vout, extra, fee),
LATERAL UNNEST(tx.vin) WITH ORDINALITY vin
WHERE block.height >= 1400000 AND block.height < 1600000
AND vin.amount <> 0;

-- Unique Pre-RingCT amounts in range
SELECT COUNT(1) OVER ()
FROM monero AS block,
LATERAL UNNEST(block.transactions) WITH ORDINALITY tx(hash, version, unlock_time, vin, vout, extra, fee),
LATERAL UNNEST(tx.vin) WITH ORDINALITY vin
WHERE block.height >= 1400000 AND block.height < 1600000
AND vin.amount <> 0
GROUP BY vin.amount
LIMIT 1;