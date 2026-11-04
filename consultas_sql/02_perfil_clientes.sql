SELECT
    SEX,
    COUNT(*) AS total_clientes
FROM inadimplencia_clientes
GROUP BY SEX;


SELECT
    SEX,
    COUNT(*) AS total_clientes,
    SUM(
        CASE
            WHEN "default payment next month" = 1 THEN 1
            ELSE 0
        END
    ) AS clientes_inadimplentes
FROM inadimplencia_clientes
GROUP BY SEX;


SELECT
    SEX,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN "default payment next month" = 1 THEN 1 ELSE 0 END) AS clientes_inadimplentes,
    ROUND(
        100.0 * SUM(CASE WHEN "default payment next month" = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS taxa_inadimplencia
FROM inadimplencia_clientes
GROUP BY SEX;