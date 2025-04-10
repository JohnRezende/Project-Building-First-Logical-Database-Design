-- Criação do banco de dados para cenário de E-Commerce
-- DROP DATABASE ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criação da tabela clientes
CREATE TABLE clients(
	id_Client INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR (15),
    Minit CHAR (3),
    Lname VARCHAR (20),
    CPF CHAR (11) NOT NULL,
    Address VARCHAR(20),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

ALTER TABLE clients MODIFY Address VARCHAR (255);
ALTER TABLE clients AUTO_INCREMENT = 1; 

-- Criação da tabela produto
CREATE TABLE products(
	id_Product INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR (15),
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM('Eletrônico','Vestimenta','Brinquedo','Alimentos','Livros') NOT NULL,
    Review FLOAT DEFAULT 0,
    Size VARCHAR (10)
);

alter table products auto_increment=1;

-- Criação da tabela pagamento (NÃO FINALIZADO)
CREATE TABLE payments(
	Id_Client INT,
    Id_Payment INT,
    TypePayment ENUM('Boleto','Cartão','Dinheiro') NOT NULL,
    LimitAvaliable FLOAT,
    PRIMARY KEY (Id_Client, Id_Payment)
);

-- Criação da tabela pedido
CREATE TABLE orders(
	Id_Order INT AUTO_INCREMENT PRIMARY KEY,
    Id_OrderClient INT,
    OrderStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    OrderDescription VARCHAR (15),
	Freight FLOAT DEFAULT 10,
    PaymentCash BOOL DEFAULT FALSE,
    Constraint fk_order_client FOREIGN KEY (Id_OrderClient) REFERENCES clients(Id_Client)
		ON UPDATE CASCADE
);

ALTER TABLE orders AUTO_INCREMENT=1;
ALTER TABLE orders MODIFY OrderDescription VARCHAR (30);

-- Criação da tabela de estoque
CREATE TABLE productStorage(
	Id_ProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    StorageLocation VARCHAR (45),
    Quantity INT DEFAULT 0
);

alter table productStorage auto_increment=1;

-- Criação da tabela de fornecedor
CREATE TABLE supplier(
	Id_Supplier INT AUTO_INCREMENT PRIMARY KEY,
    Social_Name VARCHAR (255) NOT NULL,
    CNPJ CHAR (15) NOT NULL,
    Contact VARCHAR (11) DEFAULT 0,
    Constraint unique_supplier UNIQUE (CNPJ)
);

alter table supplier auto_increment=1;

-- Criação da tabela de vendedor
CREATE TABLE seller(
	Id_Seller INT AUTO_INCREMENT PRIMARY KEY,
    AbstName VARCHAR (255) NOT NULL,
    CNPJ CHAR (15),
    CPF CHAR (9),
    Location VARCHAR (255),
    Contact VARCHAR (11) DEFAULT 0,
    Constraint unique_CNPJseller UNIQUE (CNPJ),
    Constraint unique_CPFseller UNIQUE (CPF)
);

alter table seller auto_increment=1;

CREATE TABLE productSeller(
	Id_Pseller INT,
    Id_Product INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (Id_Pseller, Id_Product),
    CONSTRAINT fk_product_Seller FOREIGN KEY (Id_Pseller) REFERENCES seller(Id_Seller),
	CONSTRAINT fk_product_product FOREIGN KEY (Id_Product) REFERENCES products(id_Product)
);

CREATE TABLE productOrder(
	Id_POproduct INT,
    Id_POorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (Id_POproduct, Id_POorder),
    CONSTRAINT fk_PO_product FOREIGN KEY (Id_POproduct) REFERENCES products(id_Product),
	CONSTRAINT fk_PO_order FOREIGN KEY (Id_POorder) REFERENCES orders(Id_Order)
);

CREATE TABLE storageLocation(
	Id_Lproduct INT,
    Id_Lstorage INT,
    Location VARCHAR (255) NOT NULL,
    PRIMARY KEY (Id_Lproduct, Id_Lstorage),
    CONSTRAINT fk_Location_product FOREIGN KEY (Id_Lproduct) REFERENCES products(id_Product),
	CONSTRAINT fk_Location_storage FOREIGN KEY (Id_Lstorage) REFERENCES productStorage(Id_ProdStorage)
);

CREATE TABLE productSupplier(
	Id_PSsupplier INT,
    Id_PSproduct INT,
	Quantity INT NOT NULL,
    PRIMARY KEY (Id_PSsupplier, Id_PSproduct),
    CONSTRAINT fk_PS_supplier FOREIGN KEY (Id_PSsupplier) REFERENCES supplier(Id_Supplier),
	CONSTRAINT fk_PS_product FOREIGN KEY (Id_PSproduct) REFERENCES products(id_Product)
);