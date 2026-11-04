SELECT
    MIN(LIMIT_BAL) AS menor_limite,
    MAX(LIMIT_BAL) AS maior_limite,
    ROUND(AVG(LIMIT_BAL), 2) AS limite_medio
FROM inadimplencia_clientes;


SELECT
    CASE
        WHEN LIMIT_BAL <= 50000 THEN '1 - Ate 50 mil'
        WHEN LIMIT_BAL <= 150000 THEN '2 - De 50 a 150 mil'
        WHEN LIMIT_BAL <= 300000 THEN '3 - De 150 a 300 mil'
        ELSE '4 - Acima de 300 mil'
    END AS faixa_limite,
    COUNT(*) AS total_clientes
FROM inadimplencia_clientes
GROUP BY faixa_limite
ORDER BY faixa_limite;


SELECT
    CASE
        WHEN LIMIT_BAL <= 50000 THEN '1 - Ate 50 mil'
        WHEN LIMIT_BAL <= 150000 THEN '2 - De 50 a 150 mil'
        WHEN LIMIT_BAL <= 300000 THEN '3 - De 150 a 300 mil'
        ELSE '4 - Acima de 300 mil'
    END AS faixa_limite,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN "default payment next month" = 1 THEN 1 ELSE 0 END) AS clientes_inadimplentes,
    ROUND(
        100.0 * SUM(CASE WHEN "default payment next month" = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS taxa_inadimplencia
FROM inadimplencia_clientes
GROUP BY faixa_limite
ORDER BY faixa_limite;