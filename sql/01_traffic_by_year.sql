-- In DuckDB, read the CSV and look at it with DESCRIBE and a LIMIT 10.

DESCRIBE SELECT *
FROM read_csv('data/raw/ec_airport_traffic.csv',
              delim = ';',
              header = true,
              dateformat = '%d.%m.%Y');

SELECT *
FROM read_csv('data/raw/ec_airport_traffic.csv',
              delim = ';',
              header = true,
              dateformat = '%d.%m.%Y')
LIMIT 10;


--- Should be 989.224
SELECT COUNT(*)
FROM read_csv('data/raw/ec_airport_traffic.csv',
              delim = ';',
              header = true,
              dateformat = '%d.%m.%Y');

-- MIN(FLT_DATE) and MAX(FLT_DATE) should be 2019-01-01 and 2026-09-30.

SELECT MIN(FLT_DATE), MAX(FLT_DATE)
FROM read_csv('data/raw/ec_airport_traffic.csv',
              delim = ';',
              header = true,
              dateformat = '%d.%m.%Y');

-- COUNT(*) where FLT_TOT_1 is NULL, to see if the column has gaps.

SELECT COUNT(*) AS n_null
FROM read_csv('data/raw/ec_airport_traffic.csv',
              delim = ';',
              header = true,
              dateformat = '%d.%m.%Y')
WHERE FLT_TOT_1 IS NULL;

--- Mhm.. FLT_TOT_1 Datatype seems to have an issue -> Line 676012 is Istanbul (LTFM) on 8 May 2024, and FLT_TOT_1 there is the text 1 422, 
--- with a space inside the number. The row’s departures and arrivals are 709 and 713, which add up to 1,422, so the intended value is clear.
--- Afterwards.. DuckDB guessed BIGINT from the first 20,480 rows. Those were clean, so the guess held until it hit this row

--- Therefore, lets build a flight column as text, converting it in a controlled step.
CREATE OR REPLACE TABLE raw_traffic AS
SELECT *
FROM read_csv('data/raw/ec_airport_traffic.csv',
              delim = ';',
              header = true,
              dateformat = '%d.%m.%Y',
              types = {'FLT_DEP_1': 'VARCHAR', 'FLT_ARR_1': 'VARCHAR', 'FLT_TOT_1': 'VARCHAR',
                       'FLT_DEP_IFR_2': 'VARCHAR', 'FLT_ARR_IFR_2': 'VARCHAR', 'FLT_TOT_IFR_2': 'VARCHAR'});
