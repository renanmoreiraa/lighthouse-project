-- SQLite
/* 
Questão 1.1 - SQL
Código calculando:
Quantidade total de linhas
Quantidade total de colunas
Intervalo de datas analisado (data mínima e máxima)
Valor mínimo
Valor máximo
Valor médio
*/
SELECT
    COUNT(*) AS total_linhas,
    6 AS total_colunas,
    MIN(sale_date) AS data_minima,
    MAX(sale_date) AS data_maxima,
    MIN(total) AS total_minimo,
    MAX(total) AS total_maximo,
    ROUND(AVG(total), 2) AS total_medio
FROM vendas;