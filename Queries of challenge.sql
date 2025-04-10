-- Recuperando dados a partir de consultas SQL

-- Recuperar número de clientes
SELECT count(*) FROM clients;

-- Recuperar pedidos feitos pelos clientes
SELECT concat(Fname,' ', Lname) as Client, Id_Order, OrderStatus FROM clients as c, orders as o WHERE c.id_Client = o.Id_OrderClient;
SELECT * FROM clients LEFT OUTER JOIN orders ON id_Client = Id_OrderClient;

-- Recuperar quantos pedidos foram realizados pelos clientes
select c.id_Client, Fname, count(*) as Number_of_orders from clients as c 
				inner join orders as o ON c.id_Client = o.Id_OrderClient
		group by Id_Client; 

-- Algum vendedor também é forncedor?( Nenhum vendedor é fornecedor)
SELECT Id_seller, AbstName as Seller_Name FROM seller as s
INNER JOIN supplier as sup ON s.CNPJ = sup.CNPJ;

-- Relação produtos, fornecedores e estoque
SELECT p.Pname, sup.Social_Name, sto.Quantity
FROM products AS p
INNER JOIN productSupplier AS ps ON p.id_Product = ps.Id_PSproduct
INNER JOIN supplier AS sup ON sup.id_Supplier = ps.Id_PSsupplier
INNER JOIN productStorage AS sto ON p.id_Product = sto.Id_ProdStorage;

-- Relação de nomes dos fornecedores e nomes de produto
SELECT sup.Social_Name, p.Pname as Product_Name
FROM supplier as sup
INNER JOIN productSupplier as ps ON sup.Id_Supplier = ps.Id_PSsupplier
INNER JOIN products as p ON p.id_Product = ps.Id_PSproduct;
