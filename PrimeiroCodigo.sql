CREATE DATABASE db_SistemaBancarioCristo;

USE db_SistemaBancarioCristo;

CREATE TABLE tbAgencia 
(
cod_Ag INT,
nome_Ag VARCHAR(25),
cidade_Ag VARCHAR(25),
funodos DOUBLE,
CONSTRAINT pk_tbAgencia PRIMARY KEY(cod_Ag)
);

CREATE TABLE tbCliente 
(
cod_Cli INT,
nome_Cli VARCHAR(25),
cidade_Cli VARCHAR(25),
rua_Cli VARCHAR(35),
CONSTRAINT tbCliente PRIMARY KEY(cod_Cli)
);

CREATE TABLE tbConta 
(
num_Conta INT,
cod_Ag INT,
saldo DOUBLE,
CONSTRAINT tbConta PRIMARY KEY(num_Conta),
CONSTRAINT fk_tbAgenciatbConta FOREIGN KEY(cod_Ag) REFERENCES tbAgencia(cod_Ag) 
);

CREATE TABLE tbEmprestimo 
(
num_Emp INT,
cod_Ag INT,
total DOUBLE,
CONSTRAINT tbEmprestimo PRIMARY KEY(num_Emp),
CONSTRAINT fk_tbAgenciatbEmprestimo FOREIGN KEY(cod_Ag) REFERENCES tbAgencia(cod_Ag)
);

CREATE TABLE tbDepositante 
(
num_Conta INT,
cod_CLiente INT,
CONSTRAINT tbDepositante PRIMARY KEY(num_Conta, cod_Cliente),
CONSTRAINT fk_tbContatbDepositante FOREIGN KEY(num_Conta) REFERENCES tbConta(num_Conta),
CONSTRAINT fk_tbClientetbDepositante FOREIGN KEY(cod_Cliente) REFERENCES tbCliente(cod_Cli)
);

CREATE TABLE tbDevedor 
(
cod_Cli INT,
num_Emp INT,
CONSTRAINT tbDevedor PRIMARY KEY(cod_Cli, num_Emp),
CONSTRAINT fk_tbClientetbDevedor FOREIGN KEY(cod_Cli) REFERENCES tbCliente(cod_Cli),
CONSTRAINT fk_tbEmprestimotbDevedor FOREIGN KEY(num_emp) REFERENCES tbEmprestimo(num_Emp)
);
