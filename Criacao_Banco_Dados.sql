drop schema if exists lojavirtual cascade;
create schema if not exists lojavirtual;

drop table if exists lojavirtual.usuarios;
create table if not exists lojavirtual.usuarios(
  id serial not null primary key,
  email varchar(100) not null default '',
  senha varchar(32) not null default ''
);

drop table if exists lojavirtual.marcas;
create table if not exists lojavirtual.marcas(
	id serial not null primary key,
	nome varchar(100) not null default ''
);

drop table if exists lojavirtual.categorias;
create table if not exists lojavirtual.categorias(
	id serial not null primary key,
	sub integer default null,
	nome varchar(100) not null default ''
);

drop table if exists lojavirtual.cupons;
create table if not exists lojavirtual.cupons(
	id serial not null primary key,
	nome varchar(100) not null default '',
	cupon_tipo integer not null,
	cupon_valor float not null
);

drop table if exists lojavirtual.atributos_produtos;
create table if not exists lojavirtual.atributos_produtos(
	id serial not null primary key,
	nome varchar(100) not null default ''
);

insert into lojavirtual.atributos_produtos(nome)
values
	('Cor'),
	('Tamanho'),
	('Memória RAM'),
	('Polegadas');

drop table if exists lojavirtual.paginas;
create table if not exists lojavirtual.paginas(
	id serial not null primary key,
	title varchar(100) not null default '',
	body text not null
);

drop table if exists lojavirtual.produtos;
create table if not exists lojavirtual.produtos(
	id serial not null primary key,
	id_categoria integer not null references lojavirtual.categorias(id),
	id_marca integer not null references lojavirtual.marcas(id),
	nome varchar(100) not null default '',
	descricao text,
	estoque integer not null,
	preco float not null,
	preco_de float not null,
	avaliacao float not null,
	promocao boolean not null,
	destaque boolean not null,
	sale boolean not null,
	mais_vendido boolean not null,
	novo boolean not null,
	atributos smallint[] default null
);

drop table if exists lojavirtual.imagens_produtos;
create table if not exists lojavirtual.imagens_produtos(
	id serial not null primary key,
	id_produto integer not null references lojavirtual.produtos(id),
	url varchar(50) not null default ''
);

drop table if exists lojavirtual.atributos;
create table if not exists lojavirtual.atributos(
  id serial not null primary key,
  id_produto integer not null references lojavirtual.produtos(id),
  id_atributo_produto integer not null references lojavirtual.atributos_produtos(id),
  valor_atributo varchar(100) not null default ''
);

drop table if exists lojavirtual.compras;
create table if not exists lojavirtual.compras(
  id serial not null primary key,
  id_usuario integer not null references lojavirtual.usuarios(id),
  id_cupon integer default null references lojavirtual.cupons(id),
  id_tipo_pagamento integer not null references lojavirtual.tipos_pagamento(id),
  id_situacao_pagamento integer not null references lojavirtual.situacoes_pagamento(id),
  total_compra float not null  
);

drop table if exists lojavirtual.transacoes_compras;
create table if not exists transacoes_compras(
  id serial not null primary key,
  id_compara integer not null references lojavirtual.compras(id),
  total_transacao float not null,
  codigo_transacao integer 
);

drop table if exists lojavirtual.compras_itens;
create table if not exists lojavirtual.compras_itens(
  id serial not null primary key,
  id_compra integer not null references lojavirtual.compras(id),
  id_produto integer not null,
  quantidade integer not null 
);

drop table if exists lojavirtual.votacoes;
create table if not exists lojavirtual.votacoes(
  id serial not null primary key,
  id_produto integer not null, 
  id_usuario integer not null references lojavirtual.usuarios(id),
  data_votacacao datetime not null,
  pontos integer not null,
  comentarios text 
)