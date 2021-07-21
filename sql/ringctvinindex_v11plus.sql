CREATE VIEW ringctvinindex_v11plus AS
SELECT
    block.height AS height,
    tx.ordinality AS tx_index,
    vin.ordinality AS vin_index
FROM monero AS block,
LATERAL UNNEST(block.transactions) WITH ORDINALITY tx(hash, version, unlock_time, vin, vout, extra, fee),
LATERAL UNNEST(tx.vin) WITH ORDINALITY vin
WHERE block.height >= 1788720
	AND vin.amount = 0
ORDER BY height, tx_index, vin_index;