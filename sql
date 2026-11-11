Respostas da atividade — SQL DML
1. Todos os atributos dos produtos cujo nome começa com a letra “D”
SELECT *
FROM Produto
WHERE nome_produto LIKE 'D%';


2. Nome do produto, marca e estoque onde a marca termina com a letra “E”
SELECT nome_produto, marca, estoque
FROM Produto
WHERE marca LIKE '%E';


3. Nome do produto, marca e preço unitário onde o nome contém “Gamer”
SELECT nome_produto, marca, preco_unitario
FROM Produto
WHERE nome_produto LIKE '%Gamer%';


4. Todos os atributos dos clientes cujo nome contém “Barbosa”
SELECT *
FROM Cliente
WHERE nome_cliente LIKE '%Barbosa%';


5. Nome do cliente, data da venda, preço unitário e forma de pagamento onde o nome começa com “C”
SELECT Cliente.nome_cliente,
       Venda.data_venda,
       Venda.preco_unitario_venda,
       Venda.forma_pagamento
FROM Cliente
INNER JOIN Venda
ON Cliente.id_cliente = Venda.id_cliente
WHERE Cliente.nome_cliente LIKE 'C%';


6. Nome do produto, preço, ID da venda e forma de pagamento onde o produto contém “Polegada” e o pagamento é PIX ou Boleto
SELECT Produto.nome_produto,
       Venda.preco_unitario_venda,
       Venda.id_venda,
       Venda.forma_pagamento
FROM Produto
INNER JOIN Venda
ON Produto.id_produto = Venda.id_produto
WHERE Produto.nome_produto LIKE '%Polegada%'
AND Venda.forma_pagamento IN ('PIX', 'Boleto');


7. Nome do produto, nome do cliente, desconto e forma de pagamento, ordenados pelo status da venda em ordem crescente
SELECT Produto.nome_produto,
       Cliente.nome_cliente,
       Venda.desconto_percentual,
       Venda.forma_pagamento
FROM Venda
INNER JOIN Produto
ON Venda.id_produto = Produto.id_produto
INNER JOIN Cliente
ON Venda.id_cliente = Cliente.id_cliente
WHERE Produto.nome_produto LIKE '%Placa%'
   OR Produto.nome_produto LIKE '%Notebook%'
   OR Cliente.nome_cliente LIKE '%Ana%'
ORDER BY Venda.status_venda ASC;
