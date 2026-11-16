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
| 3 | `ec_airport_traffic.xlsx` | Airport traffic: daily IFR arrivals and departures by airport (sheet `DATA`) | EUROCONTROL Performance Review Unit (PRU) | Release 2026-10-14, V.1.0; period 2019-01-01 to 2026-09-30 | <https://www.eurocontrol.int/performance/data/download/xls/Airport_Traffic.xlsx> | EUROCONTROL terms (non-commercial, attribution, no modification) | 2026-11-16 |

## Notes
 
- **EEA files:** only the sheet `MAir_Data` (major airports) is used. The 2017
  and 2022 files have different column layouts (2017 has an extra `Region`
  column and no voluntary noise bands).
- **EUROCONTROL file:** one workbook for all years. Only the sheet `DATA` is used;
  Header information: release 14 October 2026 (V.1.0), period 1 January 2019 to
  30 September 2026, contact PRU-Support@eurocontrol.int. Years are selected in
  the SQL (2019-2023), not in the file. 2026 is incomplete (9 months) and is not used.
- **Columns used:** `APT_ICAO`, `STATE_NAME`, `FLT_DATE`, `FLT_TOT_1`
  (`YEAR` and `MONTH_NUM` are stored as text). `FLT_TOT_1` = total IFR
  movements (arrivals + departures) per airport and day, source: **Network
  Manager**. The `_2` columns (`FLT_TOT_IFR_2`) come from the airport operators
  and are missing for some airports, so `_1` is used for consistency. Both are
  IFR only. Metadata: <https://ansperformance.eu/reference/dataset/airport-traffic/>
- **Local conversion:** the sheet `DATA` is exported once to a local CSV for
  DuckDB. This is for own use only and is not redistributed. Keep the xlsx
  unchanged.
- **Checksum:** `sha256`: `<fill in with sha256sum ec_airport_traffic.xlsx>`
- **Data version:** the file is updated regularly, so results refer to the
  release of 2026-10-14. A later download may give slightly different numbers.
- **Date format:** the file shows `01.01.2014`, the website metadata shows
  `01-Jan-2014`. Check how `FLT_DATE` is read when loading.

## Attribution
 
Noise exposure data: © European Environment Agency (EEA), licensed under
CC BY 4.0. 

Air traffic data: © EUROCONTROL (Performance Review Unit), used for
non-commercial research. The data was not modified; all aggregations and
classifications in this repository are the author's own calculations and do not
reflect the views or policy of EUROCONTROL. EUROCONTROL makes no warranty for
the accuracy, completeness or usefulness of the data.
