WITH period AS (
    SELECT
        DATE '2016-09-30' AS start_date,
        DATE '2018-10-31' AS end_date
), start_customer AS (
    SELECT
        c.customer_state,
        COUNT(DISTINCT c.customer_unique_id) AS s
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    CROSS JOIN period p
    WHERE o.order_purchase_timestamp::DATE <= p.start_date
    GROUP BY c.customer_state
), end_customer AS (
    SELECT
        c.customer_state,
        COUNT(DISTINCT c.customer_unique_id) AS e
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    CROSS JOIN period p
    WHERE o.order_purchase_timestamp::DATE <= p.end_date
    GROUP BY c.customer_state
), new_customer AS (
    SELECT
        c.customer_state,
        COUNT(DISTINCT c.customer_unique_id) AS n
    FROM (
        SELECT
            c.customer_unique_id,
            c.customer_state,
            MIN(o.order_purchase_timestamp::DATE) AS first_purchase
        FROM orders o
        JOIN customers c
            ON o.customer_id = c.customer_id
        GROUP BY
            c.customer_unique_id,
            c.customer_state
    ) c
    CROSS JOIN period p
    WHERE c.first_purchase > p.start_date
      AND c.first_purchase <= p.end_date
    GROUP BY c.customer_state
)

SELECT
    sc.customer_state,
    sc.s,
    COALESCE(ec.e, 0) AS e,
    COALESCE(nc.n, 0) AS n,
    ROUND(
        ((COALESCE(ec.e,0) - COALESCE(nc.n,0))::NUMERIC
        / NULLIF(sc.s,0)) * 100,
        2
    ) AS crr
FROM start_customer sc
LEFT JOIN end_customer ec
    ON sc.customer_state = ec.customer_state
LEFT JOIN new_customer nc
    ON sc.customer_state = nc.customer_state
ORDER BY sc.customer_state;