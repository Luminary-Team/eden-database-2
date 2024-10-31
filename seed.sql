
Insert Into usage_time(time, discount_percentage) 
values('até 6 meses', 0.1),
('6 meses a 1 ano', 0.15),
('1 ano a 2 anos', 0.2),
('2 anos a 3 anos', 0.25),
('3 anos a 4 anos', 0.3),
('4 anos a 5 anos', 0.35),
('5 anos a 6 anos', 0.4),
('mais de 6 anos', 0.45);

INSERT INTO condition_types(type, description)
values('novo', 'Aparelho em ótimo estado'),
('usado', 'Aparelho gasto'),
('seminovo', 'Aparelho relativamente desgasto');


INSERT INTO payments_types(type, description)
values('cartao', 'Cartão de Credito'),
('boleto', 'Boleto Bancário'),
('pix', 'Transfrencia PIX');


INSERT INTO status_orders(status, description)
VALUES
('pendente', 'Aguardando pagamento'),
('processando', 'Pedido em processamento'),
('enviado', 'Pedido enviado para entrega'),
('entregue', 'Pedido entregue ao cliente'),
('cancelado', 'Pedido cancelado pelo cliente ou pelo sistema');



INSERT INTO users(name, cpf, user_name, password, email, cellphone,rating)
VALUES
('João Silva', '12345678901', 'joaosilva', 'senha123', 'joao.silva@gmail.com', '21987654321',0.0),
('Maria Oliveira', '09876543210', 'mariaoliveira', 'senha456', 'maria.oliveira@hotmail.com', '31987654321',0.0),
('Pedro Souza', '12312312399', 'pedrosouza', 'senha789', 'pedro.souza@yahoo.com', '11987654321',0.0),
('Ana Costa', '98798798788', 'anacosta', 'senha321', 'ana.costa@live.com', '41987654321',0.0),
('Lucas Lima', '65465465477', 'lucaslima', 'senha654', 'lucas.lima@gmail.com', '51987654321',0.0);


INSERT INTO cards(fk_user_id, card_number, cvv, validity)
VALUES
(2, '1234567812345678', '123', '12/25'),
(2, '2345678923456789', '456', '11/24'),
(3, '3456789034567890', '789', '10/23'),
(4, '4567890145678901', '012', '09/26'),
(5, '5678901256789012', '345', '08/27');


INSERT INTO products(fk_condition_type_id, fk_user_id, fk_usage_time_id, title, description, price, max_price, sender_zip_code,premium)
VALUES
(1, 2, 1, 'iPhone 13 Pro Max', 'Smartphone de última geração, com câmera de alta resolução', 9000.00, 0.0, '01001000', TRUE),
(2, 2, 2, 'MacBook Pro 2021', 'Laptop da Apple com chip M1, excelente performance', 12000.00, 0.0, '21000000',FALSE),
(3, 3, 3, 'Samsung Galaxy Tab S7', 'Tablet Android de alto desempenho, ideal para trabalho e lazer', 3000.00, 0.0,'30100000',TRUE),
(1, 4, 4, 'Fones Bluetooth Sony WH-1000XM4', 'Fones de ouvido com cancelamento de ruído e som de alta qualidade', 1500.00, 0.0,'40000000',FALSE),
(2, 5, 5, 'Canon EOS R5', 'Câmera digital mirrorless com excelente qualidade de imagem e vídeo', 15000.00, 0.0, '80000000',TRUE);


INSERT INTO categories(pk_id,category, description)
VALUES
(1,'Smartphones', 'Dispositivos móveis inteligentes, com funcionalidades avançadas'),
(2,'Computadores', 'Desktops, laptops e notebooks para uso pessoal ou profissional'),
(3,'Tablets', 'Dispositivos portáteis com telas sensíveis ao toque'),
(4,'Acessórios de Tecnologia', 'Acessórios como fones de ouvido, cabos, carregadores, etc.'),
(5,'Câmeras', 'Equipamentos fotográficos e de vídeo, incluindo câmeras digitais e filmadoras');


INSERT INTO categories_of_products(pfk_product_id, pfk_category_id)
VALUES
(1, 1), -- Produto 1, Categoria 'Smartphones'
(2, 2), -- Produto 2, Categoria 'Computadores'
(3, 3), -- Produto 3, Categoria 'Tablets'
(4, 4), -- Produto 4, Categoria 'Acessórios de Tecnologia'
(5, 5); -- Produto 5, Categoria 'Câmeras'


INSERT INTO orders(fk_user_id,fk_status_order_id, fk_payment_type_id, order_date, adress_delivery, total_sale)
VALUES
(1,1, 1, '2024-10-01 12:30:00', 'Rua A, 123, São Paulo, SP', 0.0),
(1,2, 2, '2024-10-02 15:45:00', 'Avenida B, 456, Rio de Janeiro, RJ', 0.0),
(2,3,3, '2024-10-03 09:10:00', 'Travessa C, 789, Belo Horizonte, MG', 0.0),
(3,4, 1, '2024-10-04 11:00:00', 'Praça D, 321, Salvador, BA', 0.0),
(4, 5, 2, '2024-10-05 16:20:00', 'Rua E, 654, Curitiba, PR', 0.0);


INSERT INTO orders_itens(fk_order_id, fk_product_id)
VALUES
(2, 1), -- Pedido 2, Produto 1
(2, 2), -- Pedido 2, Produto 2
(3, 3), -- Pedido 3, Produto 3
(4, 4), -- Pedido 4, Produto 4
(5, 5); -- Pedido 5, Produto 5



INSERT INTO ecopoints(name, adress, zip_code)
VALUES
('Ecoponto Central', 'Rua Verde, 100, São Paulo, SP', '01001000'),
('Ecoponto Zona Norte', 'Avenida Sustentável, 200, Rio de Janeiro, RJ', '21000000'),
('Ecoponto BH Sul', 'Rua Reciclagem, 300, Belo Horizonte, MG', '30100000'),
('Ecoponto Salvador', 'Avenida Eco, 400, Salvador, BA', '40000000'),
('Ecoponto Curitiba Oeste', 'Travessa Limpa, 500, Curitiba, PR', '80000000');

INSERT INTO ratings(rating, fk_user_appraiser_id, fk_user_appraised_id)
VALUES
(4.5, 1, 2), 
(4.8, 2, 2), 
(3.9, 3, 2), 
(4.2, 4, 5), 
(4.0, 5, 5); 
