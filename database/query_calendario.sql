-- Criando o calendário com todos os dias do período
WITH RECURSIVE dim_calendario(data) AS (

    SELECT DATE(MIN(sale_date))
    FROM vendas

    UNION ALL

    SELECT DATE(data, '+1 day')
    FROM dim_calendario
    WHERE data < (SELECT DATE(MAX(sale_date)) FROM vendas)
),

-- soma as vendas por dia
vendas_diarias AS (
    SELECT
        DATE(sale_date)  AS data,
        SUM(total)       AS total_dia
    FROM vendas
    GROUP BY DATE(sale_date)
)

-- LEFT JOIN + COALESCE + média por dia da semana
SELECT
    CASE strftime('%w', cal.data)
        WHEN '0' THEN 'Domingo'
        WHEN '1' THEN 'Segunda-feira'
        WHEN '2' THEN 'Terça-feira'
        WHEN '3' THEN 'Quarta-feira'
        WHEN '4' THEN 'Quinta-feira'
        WHEN '5' THEN 'Sexta-feira'
        WHEN '6' THEN 'Sábado'
    END                                          AS dia_semana,

    COUNT(cal.data)                              AS total_dias,
    SUM(COALESCE(v.total_dia, 0))                AS total_vendas,
    ROUND(AVG(COALESCE(v.total_dia, 0)), 2)      AS media_vendas

FROM dim_calendario cal
LEFT JOIN vendas_diarias v ON cal.data = v.data

GROUP BY strftime('%w', cal.data)

ORDER BY
    CASE strftime('%w', cal.data)
        WHEN '1' THEN 1
        WHEN '2' THEN 2
        WHEN '3' THEN 3
        WHEN '4' THEN 4
        WHEN '5' THEN 5
        WHEN '6' THEN 6
        WHEN '0' THEN 7
    END;