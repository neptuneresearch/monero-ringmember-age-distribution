CREATE VIEW ringmemberagedist_v11rct_maxage1p4k AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list trl
JOIN ringctvinindex_v11plus rct ON rct.height = trl.source_height AND rct.tx_index = trl.source_tx_index AND rct.vin_index = trl.source_vin_index -- RingCT only
WHERE source_height >= 1788720 AND source_height < 1978433 -- Source height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1400 -- Maximum ring member age
ORDER BY (source_height - ringmember_height) ASC;

CREATE VIEW ringmemberagedist_v12rct_maxage1p4k AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list trl
JOIN ringctvinindex_v11plus rct ON rct.height = trl.source_height AND rct.tx_index = trl.source_tx_index AND rct.vin_index = trl.source_vin_index -- RingCT only
WHERE source_height >= 1978433 AND source_height < 2210000 -- Source height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1400 -- Maximum ring member age
ORDER BY (source_height - ringmember_height) ASC;

CREATE VIEW ringmemberagedist_v13rct_maxage1p4k AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list trl
JOIN ringctvinindex_v11plus rct ON rct.height = trl.source_height AND rct.tx_index = trl.source_tx_index AND rct.vin_index = trl.source_vin_index -- RingCT only
WHERE source_height >= 2210000 AND source_height < 2210720 -- Source height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1400 -- Maximum ring member age
ORDER BY (source_height - ringmember_height) ASC;

CREATE VIEW ringmemberagedist_v14rct_maxage1p4k AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list trl
JOIN ringctvinindex_v11plus rct ON rct.height = trl.source_height AND rct.tx_index = trl.source_tx_index AND rct.vin_index = trl.source_vin_index -- RingCT only
WHERE source_height >= 2210720 -- Source height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1400 -- Maximum ring member age
ORDER BY (source_height - ringmember_height) ASC;

--\COPY (SELECT * FROM ringmemberagedist_v11rct_maxage1p4k) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_v11rct_maxage1p4k.csv' CSV HEADER;
--\COPY (SELECT * FROM ringmemberagedist_v12rct_maxage1p4k) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_v12rct_maxage1p4k.csv' CSV HEADER;
--\COPY (SELECT * FROM ringmemberagedist_v13rct_maxage1p4k) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_v13rct_maxage1p4k.csv' CSV HEADER;
--\COPY (SELECT * FROM ringmemberagedist_v14rct_maxage1p4k) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_v14rct_maxage1p4k.csv' CSV HEADER;