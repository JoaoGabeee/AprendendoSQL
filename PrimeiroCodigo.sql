CREATE DATABASE db_SistemaBancarioCristo;

USE db_SistemaBancarioCristo;

CREATE TABLE tbAgencia 
(
cod_Ag INT,
nome_Ag VARCHAR(25),
cidade_Ag VARCHAR(25),
fundos DOUBLE,
CONSTRAINT pk_tbAgencia PRIMARY KEY(cod_Ag)
);

CREATE TABLE tbCliente 
(
cod_Cli INT,
nome_Cli VARCHAR(25),
cidade_Cli VARCHAR(25),
rua_Cli VARCHAR(35),
CONSTRAINT pk_tbCliente PRIMARY KEY(cod_Cli)
);

CREATE TABLE tbConta 
(
num_Conta INT,
cod_Ag INT,
saldo DOUBLE,
CONSTRAINT pk_tbConta PRIMARY KEY(num_Conta),
CONSTRAINT fk_tbAgenciatbConta FOREIGN KEY(cod_Ag) REFERENCES tbAgencia(cod_Ag) 
);

CREATE TABLE tbEmprestimo 
(
num_Emp INT,
cod_Ag INT,
total DOUBLE,
CONSTRAINT pk_tbEmprestimo PRIMARY KEY(num_Emp),
CONSTRAINT fk_tbAgenciatbEmprestimo FOREIGN KEY(cod_Ag) REFERENCES tbAgencia(cod_Ag)
);

CREATE TABLE tbDepositante 
(
num_Conta INT,
cod_CLiente INT,
CONSTRAINT pk_tbDepositante PRIMARY KEY(num_Conta, cod_Cliente),
CONSTRAINT fk_tbContatbDepositante FOREIGN KEY(num_Conta) REFERENCES tbConta(num_Conta),
CONSTRAINT fk_tbClientetbDepositante FOREIGN KEY(cod_Cliente) REFERENCES tbCliente(cod_Cli)
);

CREATE TABLE tbDevedor 
(
cod_Cli INT,
num_Emp INT,
CONSTRAINT pk_tbDevedor PRIMARY KEY(cod_Cli, num_Emp),
CONSTRAINT fk_tbClientetbDevedor FOREIGN KEY(cod_Cli) REFERENCES tbCliente(cod_Cli),
CONSTRAINT fk_tbEmprestimotbDevedor FOREIGN KEY(num_emp) REFERENCES tbEmprestimo(num_Emp)
);

/*insert tbAgencia*/
INSERT INTO tbAgencia(cod_Ag, nome_Ag, cidade_Ag, fundos) 
VALUES (1, 'Portão', 'Curitiba', 1000);

INSERT INTO tbAgencia(cod_Ag, nome_Ag, cidade_Ag, fundos) 
VALUES (2, 'Boqueirão', 'Curitiba', 1100);

INSERT INTO tbAgencia(cod_Ag, nome_Ag, cidade_Ag, fundos) 
VALUES (3, 'Xaxim', 'Curitiba', 1200);

INSERT INTO tbAgencia(cod_Ag, nome_Ag, cidade_Ag, fundos) 
VALUES (4, 'CIC', 'Curitiba', 1400);

INSERT INTO tbAgencia(cod_Ag, nome_Ag, cidade_Ag, fundos) 
VALUES (5, 'Batel', 'Curitiba', 1500);

SELECT tbAgencia.*
FROM tbAgencia; 

/*insert tbCliente*/
INSERT INTO tbCliente(cod_Cli, nome_Cli, cidade_Cli, rua_Cli)
VALUES (1, 'Bele', 'Itaperuçu', 'Rua Bele');

INSERT INTO tbCliente(cod_Cli, nome_Cli, cidade_Cli, rua_Cli)
VALUES (2, 'Joao', 'Itaperuçu', 'Rua Joao');

INSERT INTO tbCliente(cod_Cli, nome_Cli, cidade_Cli, rua_Cli)
VALUES (3, 'Heber', 'São José dops Pinhais', 'Rua Heber');

INSERT INTO tbCliente(cod_Cli, nome_Cli, cidade_Cli, rua_Cli)
VALUES (4, 'Julio', 'Curitiba', 'Rua Julio');

INSERT INTO tbCliente(cod_Cli, nome_Cli, cidade_Cli, rua_Cli)
VALUES (5, 'Leonardo', 'Curitiba', 'Rua Leonardo');

SELECT tbCliente.*
FROM tbCliente; 

/*insert tbEmprestimo*/
INSERT INTO tbEmprestimo(num_Emp, cod_Ag, total)
VALUE (1, 1, 100);

INSERT INTO tbEmprestimo(num_Emp, cod_Ag, total)
VALUE (2, 2, 200);

INSERT INTO tbEmprestimo(num_Emp, cod_Ag, total)
VALUE (3, 3, 300);

INSERT INTO tbEmprestimo(num_Emp, cod_Ag, total)
VALUE (4, 4, 400);

INSERT INTO tbEmprestimo(num_Emp, cod_Ag, total)
VALUE (5, 5, 500);

SELECT tbEmprestimo.*
FROM tbEmprestimo;

/*insert tbConta*/
INSERT INTO tbConta(num_Conta, cod_Ag, saldo)
VALUE (1, 1, 1000);

INSERT INTO tbConta(num_Conta, cod_Ag, saldo)
VALUE (2, 2, 1100);

INSERT INTO tbConta(num_Conta, cod_Ag, saldo)
VALUE (3, 3, 1200);

INSERT INTO tbConta(num_Conta, cod_Ag, saldo)
VALUE (4, 4, 1300);

INSERT INTO tbConta(num_Conta, cod_Ag, saldo)
VALUE (5, 5, 1400);

SELECT tbConta.*
FROM tbConta;

/*insert tbDepositante*/
INSERT INTO tbDepositante(num_Conta, cod_Cliente)
VALUE (1, 1);

INSERT INTO tbDepositante(num_Conta, cod_Cliente)
VALUE (2, 2);

INSERT INTO tbDepositante(num_Conta, cod_Cliente)
VALUE (3, 3);

INSERT INTO tbDepositante(num_Conta, cod_Cliente)
VALUE (4, 4);

INSERT INTO tbDepositante(num_Conta, cod_Cliente)
VALUE (5, 5);

SELECT tbDepositante.*
FROM tbDepositante;

/*insert tbDevedor*/
INSERT INTO tbDevedor(cod_Cli, num_Emp)
VALUE (1, 1);

INSERT INTO tbDevedor(cod_Cli, num_Emp)
VALUE (2, 2);

INSERT INTO tbDevedor(cod_Cli, num_Emp)
VALUE (3, 3);

INSERT INTO tbDevedor(cod_Cli, num_Emp)
VALUE (4, 4);

INSERT INTO tbDevedor(cod_Cli, num_Emp)
VALUE (5, 5);

SELECT tbDevedor.*
FROM tbDevedor;
