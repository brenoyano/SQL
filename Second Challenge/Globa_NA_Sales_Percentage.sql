SELECT *
FROM console_games

ALTER TABLE console_games
ADD COLUMN global_sales float8;

UPDATE console_games
SET global_sales = na_sales + eu_sales + jp_sales + other_sales

ALTER TABLE console_games
ADD COLUMN global_na_sales_percentage float8;

UPDATE console_games
SET global_na_sales_percentage = na_sales/global_sales * 100
WHERE global_sales > 0;