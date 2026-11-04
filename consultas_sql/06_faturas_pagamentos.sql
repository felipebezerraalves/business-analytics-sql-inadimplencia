SELECT
    ROUND(AVG(BILL_AMT1), 2) AS media_fatura,
    ROUND(AVG(PAY_AMT1), 2) AS media_pagamento
FROM inadimplencia_clientes;



SELECT
    "default payment next month",
    COUNT(*) AS total_clientes,
    ROUND(AVG(BILL_AMT1), 2) AS media_fatura,
    ROUND(AVG(PAY_AMT1), 2) AS media_pagamento
FROM inadimplencia_clientes
GROUP BY "default payment next month"
ORDER BY "default payment next month";
