WITH
  data_gabungan AS (
    SELECT *
    FROM RLL.database.transactions_Q1_2018
    UNION ALL
    SELECT *
    FROM RLL.database.transactions_Q1_2019
    UNION ALL
    SELECT *
    FROM RLL.database.transactions_Q1_2020
  ),
  ordered AS (
    SELECT 'Ordered' AS Activity, COUNT(order_datetime) AS Count
    FROM data_gabungan
    WHERE order_datetime IS NOT NULL
  ),
  paid AS (
    SELECT 'Paid' AS Activity, COUNT(payment_datetime) AS Count
    FROM data_gabungan
    WHERE order_datetime IS NOT NULL
    AND payment_datetime IS NOT NULL
  ),
  processed AS (
    SELECT 'Processed' AS Activity, COUNT(processed_datetime) AS Count
    FROM data_gabungan
    WHERE order_datetime IS NOT NULL
    AND payment_datetime IS NOT NULL
    AND processed_datetime IS NOT NULL
  ),
  delivered AS (
    SELECT 'Delivered' AS Activity, COUNT(delivered_datetime) AS Count
    FROM data_gabungan
    WHERE order_datetime IS NOT NULL
    AND payment_datetime IS NOT NULL
    AND processed_datetime IS NOT NULL
    AND delivered_datetime IS NOT NULL
  ),
  received AS (
    SELECT 'Received' AS Activity, COUNT(received_datetime) AS Count
    FROM data_gabungan
    WHERE order_datetime IS NOT NULL
    AND payment_datetime IS NOT NULL
    AND processed_datetime IS NOT NULL
    AND delivered_datetime IS NOT NULL
    AND received_datetime IS NOT NULL
  ),
  settled AS (
    SELECT 'Settled' AS Activity, COUNT(settled_datetime) AS Count
    FROM data_gabungan
    WHERE order_datetime IS NOT NULL
    AND payment_datetime IS NOT NULL
    AND processed_datetime IS NOT NULL
    AND delivered_datetime IS NOT NULL
    AND received_datetime IS NOT NULL
    AND settled_datetime IS NOT NULL
  )


SELECT ordered.Activity, ordered.Count,
  ROUND(((ordered.Count) / (ordered.Count) * 100),1) AS Rate
FROM ordered
UNION ALL
SELECT paid.Activity, paid.Count,
  ROUND(((paid.Count) / (ordered.Count) * 100),0) AS Rate
FROM ordered, paid
UNION ALL
SELECT processed.Activity, processed.Count,
  ROUND(((processed.Count) / (ordered.Count) * 100),0) AS Rate
FROM ordered, processed
UNION ALL
SELECT delivered.Activity, delivered.Count,
  ROUND(((delivered.Count) / (ordered.Count) * 100),0) AS Rate
FROM ordered, delivered
UNION ALL
SELECT received.Activity, received.Count,
  ROUND(((received.Count) / (ordered.Count) * 100),0) AS Rate
FROM ordered, received
UNION ALL
SELECT settled.Activity, settled.Count,
  ROUND(((settled.Count) / (ordered.Count) * 100),0) AS Rate
FROM ordered, settled
ORDER BY 2 DESC, 1 ASC
