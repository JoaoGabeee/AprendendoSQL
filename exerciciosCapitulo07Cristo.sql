CREATE DATABASE db_exercicio04Cristo;

USE db_exercicio04Cristo;

CREATE TABLE tbGerente 
(
cod_Gerente INT,
nome_Gerente VARCHAR(255),
CONSTRAINT pk_tbGerente PRIMARY KEY(cod_Gerente)
);

CREATE TABLE tbEmpregado 
(
cod_Emp INT,
nome_Emp VARCHAR(255),
rua_Emp VARCHAR(255),
cidade_Emp VARCHAR(255),
fone_Emp VARCHAR(255),
cod_Gerente INT,
CONSTRAINT pk_tbEmpregado PRIMARY KEY(cod_Emp),
CONSTRAINT fk_tbEmpregadotbGerente FOREIGN KEY(cod_Gerente) REFERENCES tbGerente(cod_Gerente)
);

CREATE TABLE tbCompanhia 
(
cod_Companhia int,
nome_Companhia VARCHAR(255),
cidade_Companhia VARCHAR(255),
CONSTRAINT pk_tbCompanhia PRIMARY KEY(cod_Companhia)
);

CREATE TABLE tbTrabalha 
(
cod_Emp int,
cod_Companhia int,
salrio DOUBLE, 
CONSTRAINT pk_tbTrabalha PRIMARY KEY(cod_Emp, cod_Companhia),
CONSTRAINT fk_tbTrabalhatbEmpregado FOREIGN KEY(cod_Emp) REFERENCES tbEmpregado(cod_Emp),
CONSTRAINT fk_tbTrabalhatbCompanhia FOREIGN KEY(cod_Companhia) REFERENCES tbCompanhia(cod_Companhia)
);

ALTER TABLE tbGerente 
ADD telefone_Gerente VARCHAR(11);

ALTER TABLE tbEmpregado 
DROP FOREIGN KEY fk_tbEmpregadotbGerente;
DROP TABLE tbGerente;