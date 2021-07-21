# Implementation details

1. Setup a Monero full node and sync the entire blockchain.

2. Setup a PostgreSQL 13 database.

3. Import the Monero blockchain into the PostgreSQL database with coinmetrics-export: https://github.com/neptuneresearch/monero-notes/blob/main/coinmetrics-export.md

4. Install the package Ring Membership SQL: https://github.com/neptuneresearch/ring-membership-sql

5. Run the SQL files provided in this repository.
- `ringctvinindex_v11plus` is a shim used by all `ringmemberagedist` to filter RingCT outputs after HF v11.
- `ringmemberagedist`:
  - `secparam`: secparam distributions
  - `hfrct`: hard fork RingCT distributions
  - `_peak`: order by frequency instead of age to find the peaks
- `output_count_secparam4` shows RingCT/Pre-RingCT/amount makeup of secparam4 distribution.

6. Export CSV files from the SQL views.

7. Plot the CSV files in Glueviz.

```
Color: #aa00ff
Points: show=false
Line: show=true
Limits, x axis: 
    secparam distributions: -50:1550
    HF distributions: -50:1450
    Peak zoom: 0:100
```