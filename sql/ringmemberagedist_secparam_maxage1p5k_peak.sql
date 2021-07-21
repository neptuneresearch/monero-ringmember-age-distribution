CREATE VIEW ringmemberagedist_secparam1_maxage1p5k_peak AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list
WHERE source_height >= 800000 AND source_height <= 1000000 -- Source Height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1500 -- Maximum ring member age
ORDER BY COUNT(1) DESC;

CREATE VIEW ringmemberagedist_secparam2_maxage1p5k_peak AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list
WHERE source_height >= 1000000 AND source_height <= 1200000 -- Source Height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1500 -- Maximum ring member age
ORDER BY COUNT(1) DESC;

CREATE VIEW ringmemberagedist_secparam3_maxage1p5k_peak AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list
WHERE source_height >= 1250000 AND source_height <= 1400000 -- Source Height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1500 -- Maximum ring member age
ORDER BY COUNT(1) DESC;

CREATE VIEW ringmemberagedist_secparam4_maxage1p5k_peak AS 
SELECT 
	source_height - ringmember_height AS ringmember_age_blocks,
    COUNT(1) AS freq
FROM tx_ringmember_list
WHERE source_height >= 1400000 AND source_height <= 1600000 -- Source Height range
GROUP BY (source_height - ringmember_height)
HAVING (source_height - ringmember_height) <= 1500 -- Maximum ring member age
ORDER BY COUNT(1) DESC;

--\COPY (SELECT * FROM ringmemberagedist_secparam1_maxage1p5k_peak) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_secparam1_maxage1p5k_peak.csv' CSV HEADER;
--\COPY (SELECT * FROM ringmemberagedist_secparam2_maxage1p5k_peak) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_secparam2_maxage1p5k_peak.csv' CSV HEADER;
--\COPY (SELECT * FROM ringmemberagedist_secparam3_maxage1p5k_peak) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_secparam3_maxage1p5k_peak.csv' CSV HEADER;
--\COPY (SELECT * FROM ringmemberagedist_secparam4_maxage1p5k_peak) TO '~/monero-ringmember-age-distribution/csv/ringmemberagedist_secparam4_maxage1p5k_peak.csv' CSV HEADER;