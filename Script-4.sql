-- Crie um banco de dados chamado estacionamento - Crie uma tabela chamada vaga com id, numero
create database estacionamento

create table vaga (
	id serial primary key,
	numero int not null
);

--Crie uma tabela chamada carro com id, marca, modelo, chassi(número único para cada carro), vaga_id

create table carro (
	id serial primary key,
	marca varchar(50) not null,
	modelo varchar(50) not null,
	chassi char(17) not null unique,
	vaga_id int,
	foreign key (vaga_id) references vaga(id),		
);

--Crie uma tabela chamada tempo com id, data_hora_chegada, data_hora_saida, carro_id, vaga_id

create table tempo (
	id serial primary key,
	data_hora_chegada date not null,
	data_hora_saida timestamp not null,
	carro_id int not null,
	vaga_id int not null,
	foreign (carro_id) references carro(id),
	foreign (vaga_id) references vaga(id),

);