# Data sources

**Decision:** 
no raw or processed data are published in this repository.
The EUROCONTROL terms of use do not allow redistributing modified data, so for
consistency the same rule is applied to all sources, including the CC BY 4.0
licensed EEA data. The code, the report and derived results (aggregated
statistics, tables, figures) are published; the input data therefore **must be downloaded
from the original providers.**

Download each file from the link below and save it under `data/raw/` with the
local file name given. The scripts then reproduce the results.


| # | Local file (`data/raw/`) | Dataset | Provider | Version / reference year | Link | License | Downloaded |
|---|---|---|---|---|---|---|---|
| 1 | `eea_noise_2022round.xlsx` | Reported data on noise exposure covered by Directive 2002/49/EC, 2022, November 2024 (original file: `Summary_END_2022_cutoff241118_v4.xlsx`) | European Environment Agency (EEA) | Round 4, ref. year 2021, published 2025-08-05, ID `eea_t_noise-exposure-2022_p_2021_v02_r00` | <https://sdi.eea.europa.eu/data/1c483f43-1227-4068-a365-ecae6c293f87> | CC BY 4.0 | 2026-10-21 |
| 2 | `eea_noise_2017round.xlsx` | Reported data on noise exposure covered by Directive 2002/49/EC, 2017, July 2024 (original file: `Summary_END_2017_240628_v3.xlsx`) | European Environment Agency (EEA) | Round 3, ref. year 2016, published 2024-07-29, ID `eea_t_noise-exposure-2017_p_2016_v01_r01` | <https://sdi.eea.europa.eu/catalogue/datahub/api/records/2739ed5f-8fb1-4559-8367-1c154b3097a7> | CC BY 4.0 | 2026-10-21 |
| 3 | `ec_airport_traffic_2016.csv` | Airport traffic: daily IFR arrivals and departures by airport | EUROCONTROL Performance Review Unit | 2016 | <https://www.eurocontrol.int/performance/data/download/csv/airport_traffic_2016.csv> | EUROCONTROL terms (non-commercial, attribution, no modification) | 2026-10-21 |
| 4 | `ec_airport_traffic_2019.csv` | Airport traffic: daily IFR arrivals and departures by airport | EUROCONTROL Performance Review Unit | 2019 | <https://www.eurocontrol.int/performance/data/download/csv/airport_traffic_2019.csv> | EUROCONTROL terms (non-commercial, attribution, no modification) | 2026-10-21 |
| 5 | `ec_airport_traffic_2021.csv` | Airport traffic: daily IFR arrivals and departures by airport | EUROCONTROL Performance Review Unit | 2021 | <https://www.eurocontrol.int/performance/data/download/csv/airport_traffic_2021.csv> | EUROCONTROL terms (non-commercial, attribution, no modification) | 2026-10-21 |
| 6 | `ec_airport_traffic_2022.csv` | Airport traffic: daily IFR arrivals and departures by airport | EUROCONTROL Performance Review Unit | 2022 | <https://www.eurocontrol.int/performance/data/download/csv/airport_traffic_2022.csv> | EUROCONTROL terms (non-commercial, attribution, no modification) | 2026-10-21 |
 
## Notes
 
- **EEA files:** only the sheet `MAir_Data` (major airports) is used. The 2017
  and 2022 files have different column layouts (2017 has an extra `Region`
  column and no voluntary noise bands).
- **EUROCONTROL files:** `FLT_TOT_1` = total IFR movements (arrivals +
  departures) per airport and day, source: **Network Manager**. The `_2` columns
  come from airport operators and are missing for some airports, so `_1` is used
  for consistency. Metadata: <https://ansperformance.eu/reference/dataset/airport-traffic/>
- **EUROCONTROL terms of use** (<https://ansperformance.eu/about/disclaimer/>):
  copying allowed with EUROCONTROL named as source and for non-commercial use
  only; the information may not be modified without written permission. Raw and
  cleaned EUROCONTROL files are therefore **not redistributed** here; only
  derived results (yearly totals per airport) appear in the report.
- **Do not use** the superseded EEA file "2022, July 2024".
- **File names:** use the names exactly as published on the EEA server
  (`…_v4.xlsx`, `…_v3.xlsx`). Browsers may add suffixes to repeated downloads
  (e.g. `v41`, `v31`); rename before saving to `data/raw/`.
- **Data cut-off (2022 round):** the dataset README says submissions until
  16/11/2024 (file name: cutoff 18/11/2024), while the metadata text says
  16/04/2024. The November file is used.
  
## Attribution
 
Noise exposure data: © European Environment Agency (EEA), licensed under
CC BY 4.0. Air traffic data: source EUROCONTROL (Performance Review Unit), used for non-commercial research.
