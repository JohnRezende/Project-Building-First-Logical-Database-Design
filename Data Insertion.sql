-- Inserção dos dados
insert into Clients (Fname, Minit, Lname, CPF, Address)
		values('Maria', 'M', 'Silva', 12346789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
			  ('Matheus', 'O', 'Pimentel', 987654321, 'Rua Alameda 289, Centro - Cidade das Flores'),
              ('Ricardo', 'F', 'Silva', 45678913, 'Rua Almeda Vinha 1009, Centro - Cidade das Flores'),
              ('Julia', 'S', 'França', 789123456, 'Rua Lareijras 861, Centro - Cidade das Flores'),
              ('Roberta','G', 'Assis', 98745631, 'Avenidade Koller 19, Centro - Cidade das Flores'),
              ('Isabela', 'M', 'Cruz', 654789123, 'Rua Alameda das Flores 28, Centro - Cidade das Flores');

insert into products (Pname, Classification_kids, Category, Review, Size)
		values('HeadSet',false,'Eletrônico','4', null),
			  ('Barbie Elsa',true,'Brinquedo','3', null),
              ('Body Carters',true,'Vestimenta','5', null),
              ('Microfone',false,'Eletrônico','4', null),
              ('Jogador N1',false,'Livros','3','3x57x80'),
              ('Farinha',false,'Alimentos','2', null),
              ('Fire Stick',false,'Eletrônico','3', null);

insert into orders (id_OrderClient, OrderStatus, OrderDescription, Freight, PaymentCash)
		values(1, default, 'compra via aplicativo', null, 1),
			  (2, default, 'compra via aplicativo', 50, 0),
			  (3, 'Confirmado', null, null, 1),
              (4, default, 'compra via web site', 150,0);
          
insert into productOrder (id_POproduct, id_POorder, poQuantity, poStatus)
		 values(1,1,2,null),
			   (2,2,1,null),
			   (3,3,1,null);
               
insert into productStorage (storageLocation, quantity)
		values('Rio de Janeiro', 1000),
              ('Rio de Janeiro', 500),
		      ('São Paulo', 10),
              ('São Paulo', 100),
              ('São Paulo',10),
              ('Brasília', 60);
              
insert into storageLocation (Id_Lproduct,Id_Lstorage,Location)
			values(1,2,'RJ'),
                  (2,6,'GO');

insert into supplier (Social_Name, CNPJ, Contact)
		values('Almeida e filhos', 123456789123456,'21985474'),
		      ('Eletronicos Silva', 854519649143457, '21985484'),
              ('Eletronicos Valma', 934567893934695, '21975474');
              
insert into productSupplier (Id_PSsupplier, Id_PSproduct, Quantity)
		values(1,1,500),
              (1,2,400),
              (2,4,633),
              (3,3,5),
              (2,5,10);
              
              
insert into seller(AbstName, CNPJ, CPF, Location, Contact)
		values('Tech eletronics', 123456789456321, null,'Rio de Janeiro', 219946287),
              ('Botique Durgas',null, 123456783, 'Rio de Janeiro', 219567895),
              ('Kids World', 456789123654485, null, 'São Paulo', 1198657484);
              
              
insert into productSeller (Id_Pseller, Id_Product, Quantity)
		values(1,6,80),
              (2,7,10);
			
insert into orders (id_OrderClient, OrderStatus, OrderDescription, Freight, PaymentCash)
		values(2,default, 'compra via aplicativo', null, 1);