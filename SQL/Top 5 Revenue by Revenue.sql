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
SELECT cat_name, ROUND(SUM((price*product_quantity)*percentage_commission)) AS revenue
FROM a
WHERE payment_datetime IS NOT NULL
    AND received_datetime IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
