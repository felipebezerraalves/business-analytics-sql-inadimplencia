# Análise de Inadimplência e Risco de Crédito com SQL

## Objetivo
Investigar padrões associados à inadimplência no mês seguinte em uma base histórica de clientes de cartão de crédito, utilizando SQL (SQLite) no DBeaver. O projeto é uma análise exploratória, não um modelo de previsão individual de risco.

## Base de dados
- **Fonte:** UCI Machine Learning Repository, *Default of Credit Card Clients*.
- **Contexto:** 30.000 clientes de cartão de crédito em Taiwan, com registros históricos de 2005.
- **Variável de resultado:** `default payment next month` (0 = não inadimplente no mês seguinte; 1 = inadimplente no mês seguinte).
- **Principais variáveis:** `LIMIT_BAL`, `SEX`, `PAY_0`, `BILL_AMT1` a `BILL_AMT6`, `PAY_AMT1` a `PAY_AMT6`.
- **Referência da fonte:** https://archive.ics.uci.edu/dataset/350/default+of+credit+card+clients

## Ferramentas
- SQLite
- DBeaver
- SQL: `SELECT`, `WHERE`, `GROUP BY`, `CASE WHEN`, `COUNT`, `SUM`, `AVG`, `ROUND` e `NULLIF`.

## Perguntas de negócio
1. Qual é a proporção de clientes inadimplentes?
2. Como a inadimplência varia por histórico de atraso e faixa de limite?
3. A relação entre limite de crédito e inadimplência se mantém entre clientes com dois meses de atraso?
4. Como diferem os valores de faturas e pagamentos entre os grupos?
5. As diferenças nos pagamentos médios aparecem ao longo de seis períodos?

## Principais resultados

| Indicador | Resultado |
|---|---:|
| Clientes analisados | 30.000 |
| Inadimplentes no mês seguinte | 6.636 (22,12%) |
| Taxa de inadimplência com `PAY_0 = 2` | 69,14% (1.844 de 2.667) |
| Taxa com limite de até NT$ 50 mil | 31,79% |
| Taxa com limite acima de NT$ 300 mil | 13,26% |

### Segmentação de clientes com `PAY_0 = 2`

| Faixa de limite | Clientes | Inadimplentes | Taxa |
|---|---:|---:|---:|
| Até NT$ 50 mil | 1.049 | 718 | 68,45% |
| Acima de NT$ 50 mil até NT$ 150 mil | 999 | 709 | 70,97% |
| Acima de NT$ 150 mil até NT$ 300 mil | 477 | 324 | 67,92% |
| Acima de NT$ 300 mil | 142 | 93 | 65,49% |

As taxas de inadimplência foram elevadas em todas as faixas entre clientes com dois meses de atraso. Esse recorte mostra por que o limite de crédito não deve ser interpretado isoladamente.

### Faturas e pagamentos

| Indicador | Não inadimplentes | Inadimplentes |
|---|---:|---:|
| Fatura média de setembro (NT$) | 51.994,23 | 48.509,16 |
| Pagamento médio de setembro (NT$) | 6.307,34 | 3.397,04 |
| Relação entre soma de pagamentos e soma de faturas | 12,13% | 7,00% |

O grupo inadimplente apresentou pagamentos médios menores nos seis períodos de abril a setembro de 2005. A relação pagamento/fatura é uma comparação agregada dos valores registrados, **não** uma taxa de quitação, inadimplência vencida ou recuperação de crédito.

## Interpretação e recomendações
- Investigar o histórico de atrasos em conjunto com o limite de crédito e os valores de faturas e pagamentos.
- Explorar indicadores de mudança no comportamento de pagamento ao longo do tempo.
- Validar eventuais regras de monitoramento ou decisões de crédito antes de sua adoção operacional.

## Limitações
- Base histórica de Taiwan (2005); os resultados não representam automaticamente carteiras atuais ou outros mercados.
- A análise é descritiva e observacional: associações não demonstram causalidade.
- As médias não descrevem o comportamento de cada cliente; seria útil avaliar distribuições, valores extremos e segmentos adicionais.
- Os campos de faturas e pagamentos não permitem, isoladamente, determinar o valor vencido, o pagamento mínimo devido ou a recuperação de dívidas.
- Não foi desenvolvido nem validado um modelo preditivo de risco.

## Organização do repositório

```text
business-analytics-sql-inadimplencia/
├── README.md
├── dados_tratados/
│   └── inadimplencia_clientes.csv
└── consultas_sql/
    ├── 01_analise_inadimplencia.sql
    ├── 02_analise_sexo.sql
    ├── 03_historico_atrasos.sql
    ├── 04_limite_credito.sql
    ├── 05_segmentacao_risco.sql
    ├── 06_faturas_pagamentos.sql
    └── 07_historico_pagamentos.sql
```

## Como reproduzir
1. Obtenha a base original no repositório UCI e consulte suas informações de uso e atribuição.
2. Importe o CSV para uma base SQLite no DBeaver, com a tabela `inadimplencia_clientes`.
3. Execute os scripts em `consultas_sql/` para reproduzir as análises.

> **Nota:** os resultados apresentados refletem as consultas executadas neste estudo. O repositório não representa uma análise de dados bancários reais de uma instituição específica.
