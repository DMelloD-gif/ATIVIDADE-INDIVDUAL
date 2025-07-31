CREATE DATABASE hotel;

CREATE TABLE funcionario (
    id serial PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11),
    cargo_id INT,
    FOREIGN KEY (cargo_id) 
    REFERENCES cargo(id)
);

CREATE TABLE cargo (
    id serial PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE hospede (
    id serial PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

CREATE TABLE endereco (
    id serial PRIMARY KEY,
    logradouro VARCHAR(100),
    localidade VARCHAR(100),
    cep CHAR(8),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    uf CHAR(2)
);

CREATE TABLE agenda (
    id serial PRIMARY KEY,
    data_checkin DATE,
    data_checkout DATE,
    hospede_id INT,
    funcionario_id INT,
    FOREIGN KEY (hospede_id) REFERENCES hospede(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

INSERT INTO funcionario (nome, cpf, cargo_id) VALUES
('João Silva', '12345678901', 1),
('Maria Oliveira', '23456789012', 2),
('Carlos Souza', '34567890123', 3),
('Ana Paula', '45678901234', 4),
('Rafael Costa', '56789012345', 5);
INSERT INTO cargo (nome) VALUES
('Recepcionista'),
('Gerente'),
('Camareira'),
('Segurança'),
('Atendente');
INSERT INTO hospede (nome, cpf, endereco_id) VALUES
('Lucas Martins', '65432109876', '1'),
('Fernanda Lima', '76543210987', '2'),
('Diego Ramos', '87654321098', '3'),
('Patrícia Alves', '98765432109', '4'),
('Bruno Ferreira', '09876543210', '5');
INSERT INTO endereco (logradouro, localidade, cep, numero, bairro, uf) VALUES
('Rua das Flores', 'São Paulo', '0100100', '123', 'Centro', 'SP'),
('Av. Brasil', 'Rio de Janeiro', '2004000', '456', 'Copacabana', 'RJ'),
('Rua das Acácias', 'Curitiba', '8001000', '789', 'Batel', 'PR'),
('Av. Paulista', 'São Paulo', '0131000', '1000', 'Bela Vista', 'SP'),
('Rua Bahia', 'Belo Horizonte', '3014000', '321', 'Funcionários', 'MG');
INSERT INTO agenda (data_checkin, data_checkout, hospede_id, funcionario_id) VALUES
('08/01/25', '08/05/25', '1', '5'),
('08/02/25', '08/06/25', '2', '4'),
('08/03/25', '08/07/25', '3', '3'),
('08/04/25', '08/08/25', '4', '2'),
('08/05/25', '08/09/25', '5', '1');

--- atividade individual - 31/07

--atualize o cargo do funcionario de id = 2
update funcionario
set cargo_id = 5
where id = 2;

--atualize a data de checkout do hospede de nome = 'Gabriel'
update agenda
SET data_checkout = '08/12/25'  
where hospede_id = (select id from hospede where nome = 'Gabriel')
 where hospede_id = 2;

--remova todos os endereços com logradouro que começa com 'A'
delete from endereco 
where logadrouro like %a%;

--exclua a tabela agenda
drop table agenda;

--insira a restrição not null nos campos nome, cpf, endereco_id do hospede
alter table hospede
alter column nome not null;

alter table hospede
alter column cpf not null;

alter table hospede
alter column endereco_id not null;

--insira a restrição not null no campo nome do cargo
alter table cargo 
alter column nome not null;

--insira a restrição not null no campo nome, cpf, cargo_id do funcionario
alter table funcionario 
alter column nome not null;

alter table funcionario 
alter column cpf not null;

alter table funcionario 
alter column cargo_id not null;

--insira a restrição not null no campo logradouro, localidade, cep, numero, bairro, uf do endereco
alter table endereco 
alter column logadouro not null;

alter table endereco 
alter column localidade not null;

alter table endereco 
alter column cep not null;

alter table endereco 
alter column numero not null;

alter table endereco 
alter column bairro not null;

alter table endereco 
alter column uf not null;

--insira a restrição not null nos campos data_checkin, data_checkout, hospede_id, funcionario_id da agenda
alter table agenda 
alter column data_checkin not null;

alter table agenda 
alter column data_checkout not null;

alter table agenda 
alter column hospede_id not null;

alter table agenda 
alter column funcionario_id not null;

--remova um registro inteiro da tabela hospede onde o cpf = '12345678911'
delete from hospede 
where cpf = "12345678911"

--insira a restrição unique no campo  cpf do funcionario e hospede
alter table funcionario 
add unique (cpf);




