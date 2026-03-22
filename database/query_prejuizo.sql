/*
- Questão 4.1 - SQL
Código calculando:
custo em R$ (custo_usd * taxa_cambio_data) - Se atentar ao cambio do dia
agregação por id_produto contendo:
- receita total (soma do valor de venda em reais),
- prejuízo total (soma apenas das perdas),
- percentual de perda (prejuízo_total / receita_total).
*/
SELECT
    id_product,
    ROUND(SUM(total), 2) AS receita_total,
    ROUND(SUM(CASE WHEN resultado < 0 THEN ABS(resultado) ELSE 0 END), 2) AS prejuizo_total,
    ROUND(SUM(CASE WHEN resultado < 0 THEN ABS(resultado) ELSE 0 END) / SUM(total) * 100, 2) AS percentual_perda
FROM vendas_com_custo
GROUP BY id_product
HAVING prejuizo_total > 0
ORDER BY prejuizo_total DESC;