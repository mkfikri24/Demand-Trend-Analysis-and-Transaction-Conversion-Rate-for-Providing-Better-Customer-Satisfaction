WITH
  data_2018 AS (
  SELECT
    cat_name,
    EXTRACT(year
    FROM
      order_datetime) AS year,
    SUM(price * product_quantity) AS gmv_2018
  FROM
    RLL.database.transactions_Q1_2018
  WHERE
    cat_name IN ("Agriculture & Food",
      "Horeca",
      "Machinery & Industrial Parts",
      "Computer & Communication")
  GROUP BY
    1,
    2),
  data_2019 AS (
  SELECT
    cat_name,
    EXTRACT(year
    FROM
      order_datetime) AS year,
    SUM(price * product_quantity) AS gmv_2019
  FROM
    RLL.database.transactions_Q1_2019
  WHERE
    cat_name IN ("Agriculture & Food",
      "Horeca",
      "Machinery & Industrial Parts",
      "Computer & Communication")
  GROUP BY
    1,
    2 ),
  data_2020 AS (
  SELECT
    cat_name,
    EXTRACT(year
    FROM
      order_datetime) AS year,
    SUM(price * product_quantity) AS gmv_2020
  FROM
    RLL.database.transactions_Q1_2020
  WHERE
    cat_name IN ("Agriculture & Food",
      "Horeca",
      "Machinery & Industrial Parts",
      "Computer & Communication")
  GROUP BY
    1,
    2 )
SELECT
  a.cat_name,
  a.year,
  a.gmv_2018 AS gmv,
  0 AS pct_change_YoY
FROM
  data_2018 a
GROUP BY
  1,
  2,
  3
UNION ALL
SELECT
  b.cat_name,
  b.year,
  b.gmv_2019 AS gmv,
  ROUND(SUM((gmv_2019-gmv_2018)/gmv_2018),0) AS pct_change_YoY
FROM
  data_2018 a,
  data_2019 b
GROUP BY
  1,
  2,
  3
UNION ALL
SELECT
  c.cat_name,
  c.year,
  c.gmv_2020 AS gmv,
  ROUND(SUM((gmv_2020-gmv_2019)/gmv_2019),0) AS pct_change_YoY
FROM
  data_2019 b,
  data_2020 c
GROUP BY
  1,
  2,
  3
ORDER BY
  1,
  2
