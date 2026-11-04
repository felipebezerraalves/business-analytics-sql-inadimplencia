SELECT
    ROUND(AVG(PAY_AMT1), 2) AS pagamento_1,
    ROUND(AVG(PAY_AMT2), 2) AS pagamento_2,
    ROUND(AVG(PAY_AMT3), 2) AS pagamento_3,
    ROUND(AVG(PAY_AMT4), 2) AS pagamento_4,
    ROUND(AVG(PAY_AMT5), 2) AS pagamento_5,
    ROUND(AVG(PAY_AMT6), 2) AS pagamento_6
FROM inadimplencia_clientes;


SELECT
    "default payment next month",
    ROUND(AVG(PAY_AMT6), 2) AS abril,
    ROUND(AVG(PAY_AMT5), 2) AS maio,
    ROUND(AVG(PAY_AMT4), 2) AS junho,
    ROUND(AVG(PAY_AMT3), 2) AS julho,
    ROUND(AVG(PAY_AMT2), 2) AS agosto,
    ROUND(AVG(PAY_AMT1), 2) AS setembro
FROM inadimplencia_clientes
GROUP BY "default payment next month"
ORDER BY "default payment next month";