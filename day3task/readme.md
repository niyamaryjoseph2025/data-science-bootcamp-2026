##Data Overview

The dataset contains 4,009 used car listings, each describing a vehicle's brand, model, model year, mileage, price, fuel type, transmission, engine specification, accident history, and title status. It spans model years from 1974 to 2024 and prices from $2,000 to $2,954,083, reflecting a mix of everyday used cars and high-end luxury or exotic vehicles. Two key numeric fields, milage and price, arrived as text with embedded symbols (e.g., "51,000 mi.", "$10,300") rather than usable numbers, and several categorical fields — fuel_type, accident, and clean_title — had a meaningful share of missing values. No exact duplicate rows were found, so the dataset required formatting and consistency fixes more than deduplication.

## Data Quality Issues Identified
- `milage` and `price` are stored as text with symbols (e.g. `"51,000 mi."`, `"$10,300"`), not numeric.
- Missing values present in three columns: `fuel_type` (170 rows, ~4.2%), `accident` (113 rows, ~2.8%), and `clean_title` (596 rows, ~14.9%).
- No exact duplicate rows found (0 out of 4,009).
- Wide range of `model_year` (1974–2024) and `price` ($2,000–$2,954,083) with heavy right-skew (skewness ≈ 19.5); the IQR method flags 244 price outliers and 69 mileage outliers.
- Inconsistent formatting across `transmission` and `engine` text fields (many free-text variants), and a stray `"–"`/`"not supported"` category inside `fuel_type`.

## Cleaning Techniques Applied
- Stripped non-numeric characters from `milage` and `price` and converted both to `float`.
- Filled missing categorical values (`fuel_type`, `accident`, `clean_title`) with `"Unknown"`.
- Filled missing numerical values with the column median.
- Removed exact duplicate rows.
- Capped (winsorized) extreme values in `price` and `milage` at the IQR bounds instead of dropping rows.

## Feature Engineering Performed
1. **`car_age`** — current year minus `model_year`; captures depreciation over time.
2. **`mileage_per_year`** — `milage / car_age`; normalizes usage intensity regardless of car age.
3. **`is_luxury_brand`** — binary flag for whether `brand` is a recognized luxury brand.
4. **`had_accident`** — binary flag extracted from the `accident` text column.
5. **`has_clean_title`** — binary flag from `clean_title`.
6. **`engine_size_l`** — engine displacement in liters, extracted from the `engine` text field.
7. **`is_automatic`** — binary flag simplifying `transmission` into automatic vs. not.

## Five Key Insights
1. Missing data is concentrated in three columns: `clean_title` is missing for ~14.9% of rows, `accident` for ~2.8%, and `fuel_type` for ~4.2% — every other column is complete.
2. Most listings fall between 2012 and 2020 model years (25th–75th percentile), though the full range spans 1974–2024.
3. Ford, BMW, Mercedes-Benz, Chevrolet, and Porsche are the top 5 brands by listing count, with Ford leading at 386 listings.
4. Price is heavily right-skewed (skewness ≈ 19.5): the median is $31,000 but the mean is pulled up to ~$44,550 by a long tail of luxury/exotic listings reaching up to ~$2.95M. The IQR method flags 244 price outliers and 69 mileage outliers.
5. Accident history correlates with lower price: cars with a reported accident average ~$28,832, versus ~$49,681 for cars with no reported accident — roughly a 42% price gap.

