WITH
  e AS (
  WITH
    d AS (
    WITH
      c AS (
      WITH
        b AS (
        WITH
          a AS (
          SELECT
            *
          FROM
            RLL.database.transactions_Q1_2018
          UNION ALL
          SELECT
            *
          FROM
            RLL.database.transactions_Q1_2019
          UNION ALL
          SELECT
            *
          FROM
            RLL.database.transactions_Q1_2020 )
        SELECT
          buyer_id,
          COUNT(order_id) AS total_transaction,
          SUM(price*product_quantity) AS total_gmv
        FROM
          a
        GROUP BY
          1
        ORDER BY
          2 DESC )
      SELECT
        buyer_id,
        CASE
          WHEN total_transaction < 6 THEN 'under_6'
          WHEN total_transaction >= 6
        AND total_transaction <= 10 THEN 'between_6_to_10'
          WHEN total_transaction >= 11 AND total_transaction <= 15 THEN 'between_11_to_15'
          WHEN total_transaction >= 16
        AND total_transaction <= 20 THEN 'between_16_to_20'
          WHEN total_transaction > 20 THEN 'up_to_20'
      END
        AS number_of_transaction,
        total_gmv
      FROM
        b )
    SELECT
      buyer_id,
      number_of_transaction,
      CASE
        WHEN total_gmv < 10000000 THEN '0-10 Mil IDR'
        WHEN total_gmv >= 10000000
      AND total_gmv <= 25000000 THEN '10-25Mil IDR'
        WHEN total_gmv >= 25000000 AND total_gmv <= 50000000 THEN '25-50 Mil IDR'
        WHEN total_gmv >= 50000000
      AND total_gmv <= 75000000 THEN '50-75 Mil IDR'
        WHEN total_gmv >= 75000000 AND total_gmv <= 100000000 THEN '75-100 Mil IDR'
        WHEN total_gmv > 100000000 THEN '>100 Mil IDR'
    END
      AS annual_gmv
    FROM
      c )
  SELECT
    number_of_transaction,
    COUNT(buyer_id) AS total_customer,
    annual_gmv
  FROM
    d
  GROUP BY
    1,
    3 )
SELECT
  *
FROM
  e PIVOT(SUM(total_customer) FOR (number_of_transaction) IN ('under_6',
      'between_6_to_10',
      'between_11_to_15',
      'between_16_to_20',
      'up_to_20'))
ORDER BY
  1
