CREATE DATABASE fullstackeletro;
USE fullstackeletro;

create table produtos (
id_produtos integer auto_increment not null,
descricao varchar(500),
preco decimal(8,2),
preco_venda decimal(8,2),
nome_imagem varchar(100),
primary key(id_produto)
);



create table comentarios(
id_contato int auto_increment,
nome varchar(100),
msg varchar(500),
data_cadastro datetime default now(),
primary key (id_contato));


create table categorias(
id_categoria int auto_increment not null,
nome varchar(30),
chave varchar(30),
primary key(id_categoria)
);

create table produto_categoria(
id_produto_categoria int primary key not null auto_increment,
id_produto int,
id_categoria int
);

alter table produto_categoria add foreign key (id_produto) references produtos(id_produtos);
alter table produto_categoria add foreign key (id_categoria) references categorias(id_categoria);


insert into categorias (nome, chave) values
("Geladeira","geladeira"),
("Fogão","fogao"),
("Microondas","microondas"),
("Lava-roupas","lavaroupas"),
("Lava-louças","lavaloucas");

insert into produto_categoria (id_produto,id_categoria) values
("1","1"),
("2","1"),
("5","1"),
("3","2"),
("10","2"),
("4","3"),
("8","4"),
("9","4"),
("6","5"),
("7","5");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Geladeira Consul Frost Free Duplex 397 litros Evox com freezer embaixo", 3479.00, 2709.00,"Consul_Geladeira_CRE44AK_Imagem_Frontal_1.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Geladeira Brastemp Frost Free Duplex 375 litros cor Inox com Espaço Adapt", 3479.00, 2249.10,"Brastemp_Geladeira_BRM45HK_Imagem_Frontal_1600x1400.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Fogão de Piso Brastemp de 05 Bocas com Duplo Forno e Painel Touch Inox",4239.00 ,3932.00 ,"BRBFD5VCR_PRD_447_1.jpg","fogao");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Forno de Micro-ondas Electrolux ME41X com Painel Blue Touch 31 Litros",1259.00 ,999.00 ,"forno-de-micro-ondas-31l-electrolux-me41x_211417_7.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Refrigerador Brastemp BRM44HB Frost Free com Compartimento para Latas e Long Necks Branco - 375L", 2499.00,2089.05 ,"Geladeira Brastemp Frost Free Duplex BRM44HB 375L Branco.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Lava-Louças Electrolux LV14X 14Serviços com Display Digital - Inox",4349.00 ,3914.10 ,"lava-loucas-14-servicos-electrolux-lv14x-inox-photo892601426-12-2c-17.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Lava Louças 8 Serviços 220V Cinza Brastemp", 2129.00,2063.00 ,"lava_loucas_febe_300x300.jpg","lavaloucas");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Lavadora de Roupas LG Smart VC4 FV5011WG4A - 11Kg Cesto Inox 14 Programas de Lavagem", 3599.00, 2825.10,"Lavadora de Roupas LG Vivace VC4 11kg Branca.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Lava e Seca Samsung WD4000 com Ecobubble™, 11kg, Inox - WD11M4453JXFAZ 220V", 4499.00, 3599.10,"lavadora-e-secadora-de-roupas-samsung-11kg-air-wash-e-ecobubble-branca.jpg");

insert into produtos (descricao, preco, preco_venda, nome_imagem) 
values ("Fogão de Piso Electrolux de 05 Bocas com Mesa de Vidro e Tripla Chama Prata - 76USV", 2849.00, 2149.00,"Range_76USV_Front_View_Electrolux_1000x1000.jpg");


select produtos.*, categorias.nome from produtos 
inner join produto_categoria on produtos.id_produtos = produto_categoria.id_produto 
inner join categorias on categorias.id_categoria = produto_categoria.id_categoria
where categorias.chave = 'fogao';

select  categorias.*, count( categorias.nome) as qtd  from categorias 
cross join produto_categoria on categorias.id_categoria = produto_categoria.id_categoria
group by categorias.nome; 

