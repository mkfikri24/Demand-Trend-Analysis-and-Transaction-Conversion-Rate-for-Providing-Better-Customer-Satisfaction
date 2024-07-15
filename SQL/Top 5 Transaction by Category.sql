WITH a
AS
(
SELECT *
        FROM RLL.database.transactions_Q1_2018
UNION ALL
SELECT *
        FROM RLL.database.transactions_Q1_2019
UNION ALL
SELECT *
        FROM RLL.database.transactions_Q1_2020
)
SELECT cat_name,COUNT(order_id) AS Total_Transaksi
      FROM a
      GROUP BY 1
      ORDER BY 2 DESC
LIMIT 5
