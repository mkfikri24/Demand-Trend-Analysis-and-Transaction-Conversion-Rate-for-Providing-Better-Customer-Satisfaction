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
      COUNT(order_id) AS total_payment,
      CASE
        WHEN payment_method IN('BCA Bank Transfer', 'Mandiri Bank Transfer', 'BNI Bank Transfer', 'BRI', 'BRI Bank Transfer', 'Mandiri', 'BNI', 'BII', 'Mandiri Internet Banking', 'Permata', 'DBS Bank Transfer', 'Bank BCA', 'BCA', 'BCA Klik Pay') THEN 'Bank Transfer'
        WHEN payment_method IN('Ralali Wallet',
        'Ovo') THEN 'e-Wallet'
        WHEN payment_method IN('Payment Nothing') THEN 'TOP'
        WHEN payment_method IN ('Credit Card',
        'Kredivo') THEN 'Credit Card'
    END
      AS method
    FROM
      a
    GROUP BY
      method )
  SELECT
    method,
    total_payment,
    SUM(total_payment) OVER() AS total
  FROM
    b )
SELECT
  method,
  ROUND((total_payment/total)*100,3) AS percentage
FROM
  c
ORDER BY
  2 DESC
