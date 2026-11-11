Primeiro, selecione o banco de dados:


sql
USE vendas_informatica;
1. Produtos cadastrados durante todo o mês de março de 2024

sql
SELECT *
FROM Produto
WHERE data_cadastro >= '2024-03-01'
  AND data_cadastro < '2024-04-01';
2. Nome, marca, estoque e data de cadastro dos produtos cadastrados em janeiro, fevereiro e março de 2024

sql
SELECT
    nome_produto,
    marca,
    estoque,
    data_cadastro
FROM Produto
WHERE data_cadastro >= '2024-01-01'
  AND data_cadastro < '2024-04-01';
3. Todos os campos da tabela Cliente para clientes cadastrados em janeiro de 2023

sql
SELECT *
FROM Cliente
WHERE data_cadastro >= '2023-01-01'
  AND data_cadastro < '2023-02-01';
4. Nome, e-mail, cidade, estado e data de cadastro dos clientes cadastrados na primeira quinzena de junho de 2023

sql
SELECT
    nome_cliente,
    email,
    cidade,
    estado,
    data_cadastro
FROM Cliente
WHERE data_cadastro >= '2023-06-01'
  AND data_cadastro < '2023-06-16';
5. Todos os campos da entidade Venda para vendas realizadas durante todo o mês de maio de 2025

sql
SELECT *
FROM Venda
WHERE data_venda >= '2025-05-01'
  AND data_venda < '2025-06-01';
6. Nome do cliente, data da venda, preço e forma de pagamento das vendas realizadas de 24/12/2025 até 15/01/2026, ordenadas do maior preço para o menor

sql
SELECT
    Cliente.nome_cliente,
    Venda.data_venda,
    Venda.preco_unitario_venda,
    Venda.forma_pagamento
FROM Venda
INNER JOIN Cliente
    ON Venda.id_cliente = Cliente.id_cliente
WHERE Venda.data_venda >= '2025-12-24'
  AND Venda.data_venda <= '2026-01-15'
ORDER BY Venda.preco_unitario_venda DESC;
7. Nome do cliente, e-mail, nome do produto, marca, categoria, forma de pagamento, data da venda e status da venda, ordenados da maior venda para a menor, considerando vendas canceladas ou concluídas em dezembro de 2025

sql
SELECT
    Cliente.nome_cliente,
    Cliente.email,
    Produto.nome_produto,
    Produto.marca,
    Produto.categoria,
    Venda.forma_pagamento,
    Venda.data_venda,
    Venda.status_venda,
    (
        Venda.quantidade *
        Venda.preco_unitario_venda *
        (1 - Venda.desconto_percentual / 100)
    ) AS valor_total_venda
FROM Venda
INNER JOIN Cliente
    ON Venda.id_cliente = Cliente.id_cliente
INNER JOIN Produto
    ON Venda.id_produto = Produto.id_produto
WHERE Venda.data_venda >= '2025-12-01'
  AND Venda.data_venda < '2026-01-01'
  AND Venda.status_venda IN ('Cancelada', 'Concluída')
ORDER BY valor_total_venda DESC;
