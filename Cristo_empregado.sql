CREATE DATABASE bdEmpregadoCristo;

USE bdEmpregadoCristo;

CREATE TABLE tbDepartamento
(
nome_depto VARCHAR(255),
numero_depto INT AUTO_INCREMENT,
rgGerente_depto NUMERIC(9),
CONSTRAINT pk_tbDepartamento PRIMARY KEY(numero_depto) 
);

CREATE TABLE tbEmpregado
(
nome_emp VARCHAR(255),
RG_emp NUMERIC(9),
CPF_emp NUMERIC(11),
numDepto_emp INT,
salario_emp DOUBLE,
cidade_emp VARCHAR(255),
CONSTRAINT pk_tbEmpregado PRIMARY KEY(RG_emp),
CONSTRAINT fk_tbDepartamentotbEmpregado FOREIGN KEY(numDepto_emp) REFERENCES tbDepartamento(numero_depto)
);

ALTER TABLE tbDepartamento 
ADD CONSTRAINT fk_tbEmpregadotbDepartamento FOREIGN KEY(rgGerente_depto) REFERENCES tbEmpregado(RG_emp);

CREATE TABLE tbDependentes 
(
rgResponsavel_dep NUMERIC(9),
nome_dep VARCHAR(255),
dataNascimento_dep DATE,
genero_dep CHAR(1),
CONSTRAINT pk_tbDependentes PRIMARY KEY(rgResponsavel_dep, nome_dep),
CONSTRAINT fk_tbEmpregadotbDependentes FOREIGN KEY(rgResponsavel_dep) REFERENCES tbEmpregado(RG_emp),
CONSTRAINT ck_genero_deptbDependentes CHECK(genero_dep IN ('F', 'M', 'O'))
);

CREATE TABLE tbProjeto
(
nome_proj VARCHAR(255),
numero_proj INT AUTO_INCREMENT,
localizacao VARCHAR(255),
CONSTRAINT pk_tbProjeto PRIMARY KEY(numero_proj)
);

CREATE TABLE tbDepartamentoProjeto
(
numero_depto INT,
numero_proj INT,
CONSTRAINT pk_tbDepartamentoProjeto PRIMARY KEY(numero_depto, numero_proj),
CONSTRAINT fk_tbDepartamentotbdepartamentoProjeto FOREIGN KEY(numero_depto) REFERENCES tbDepartamento(numero_depto),
CONSTRAINT fk_tbProjetotbdepartamentoProjeto FOREIGN KEY(numero_proj) REFERENCES tbProjeto(numero_proj)
);

CREATE TABLE tbEmpregadoProjeto
(
rg_emp NUMERIC(9),
numero_proj INT,
horas_proj INT,
CONSTRAINT pk_tbEmpregadoProjeto PRIMARY KEY(rg_emp, numero_proj),
CONSTRAINT fk_tbEmpregadotbEmpregadoProjeto FOREIGN KEY(rg_emp) REFERENCES tbEmpregado(RG_emp),
CONSTRAINT fk_tbProjetotbEmpregadoProjeto FOREIGN KEY(numero_proj) REFERENCES tbProjeto(numero_proj)
);

INSERT INTO tbDepartamento (nome_depto)
VALUES ('dep1');

INSERT INTO tbDepartamento (nome_depto)
VALUES ('dep2');

INSERT INTO tbDepartamento (nome_depto)
VALUES ('dep3');

INSERT INTO tbDepartamento (nome_depto)
VALUES ('dep4');

INSERT INTO tbDepartamento (nome_depto)
VALUES ('dep5');

##tbEmpregado
INSERT INTO tbEmpregado (nome_emp, RG_emp, CPF_emp, numDepto_emp, salario_emp, cidade_emp)
VALUES ('João', 100000, 200000, 1, 1500,'Curitiba');

INSERT INTO tbEmpregado (nome_emp, RG_emp, CPF_emp, numDepto_emp, salario_emp, cidade_emp)
VALUES ('Heber ', 110000, 220000, 2, 1500,'Curitiba');

INSERT INTO tbEmpregado (nome_emp, RG_emp, CPF_emp, numDepto_emp, salario_emp, cidade_emp)
VALUES ('Matheus', 111000, 222000, 3, 1500,'Curitiba');

INSERT INTO tbEmpregado (nome_emp, RG_emp, CPF_emp, numDepto_emp, salario_emp, cidade_emp)
VALUES ('Leonardo', 111100, 222200, 4, 1500,'Curitiba');

INSERT INTO tbEmpregado (nome_emp, RG_emp, CPF_emp, numDepto_emp, salario_emp, cidade_emp)
VALUES ('Rafael', 111110, 222220, 5, 1500,'Curitiba');

INSERT INTO tbEmpregado (nome_emp, RG_emp, CPF_emp, numDepto_emp, salario_emp, cidade_emp)
VALUES ('Mário', 111111, 222222, 5, 4000, 'Curitiba');

UPDATE tbDepartamento SET
    rgGerente_depto = 100000
WHERE numero_depto = 1;

UPDATE tbDepartamento SET
    rgGerente_depto = 110000
WHERE numero_depto = 2;

UPDATE tbDepartamento SET
    rgGerente_depto = 111000
WHERE numero_depto = 3;

UPDATE tbDepartamento SET
    rgGerente_depto = 111100
WHERE numero_depto = 4;

UPDATE tbDepartamento SET
    rgGerente_depto = 111110
WHERE numero_depto = 5;

INSERT INTO tbDependentes (rgResponsavel_dep, nome_dep, dataNascimento_dep, genero_dep)
VALUES (100000, 'Antonella', '2033-07-12', 'F');

INSERT INTO tbDependentes (rgResponsavel_dep, nome_dep, dataNascimento_dep, genero_dep)
VALUES (100000, 'Francisco', '2034-06-12', 'M');

INSERT INTO tbDependentes (rgResponsavel_dep, nome_dep, dataNascimento_dep, genero_dep)
VALUES (110000, 'Aylla', '2034-05-23', 'F');

INSERT INTO tbDependentes (rgResponsavel_dep, nome_dep, dataNascimento_dep, genero_dep)
VALUES (110000, 'Liz', '2035-04-20', 'F');

INSERT INTO tbDependentes (rgResponsavel_dep, nome_dep, dataNascimento_dep, genero_dep)
VALUES (110000, 'Natanael', '2036-03-22', 'M');

INSERT INTO tbProjeto (numero_proj, nome_proj, localizacao)
VALUES (1, 'Primeiro Projeto', 'Curitiba');

INSERT INTO tbProjeto (numero_proj, nome_proj, localizacao)
VALUES (2, 'Segundo Projeto', 'Colombo');

INSERT INTO tbProjeto (numero_proj, nome_proj, localizacao)
VALUES (3, 'Terceiro Projeto', 'Curitiba');

INSERT INTO tbProjeto (numero_proj, nome_proj, localizacao)
VALUES (4, 'Quarto Projeto', 'Colombo');

INSERT INTO tbProjeto (numero_proj, nome_proj, localizacao)
VALUES (5, 'Quinto Projeto', 'Curitiba');

INSERT INTO tbDepartamentoProjeto (numero_depto, numero_proj)
VALUES (1, 1);

INSERT INTO tbDepartamentoProjeto (numero_depto, numero_proj)
VALUES (2, 2);

INSERT INTO tbDepartamentoProjeto (numero_depto, numero_proj)
VALUES (3, 3);

INSERT INTO tbDepartamentoProjeto (numero_depto, numero_proj)
VALUES (4, 4);

INSERT INTO tbDepartamentoProjeto (numero_depto, numero_proj)
VALUES (5, 5);

INSERT INTO tbEmpregadoProjeto (rg_emp, numero_proj, horas_proj)
VALUES (100000, 1, 10);

INSERT INTO tbEmpregadoProjeto (rg_emp, numero_proj, horas_proj)
VALUES  (110000, 2, 20);

INSERT INTO tbEmpregadoProjeto (rg_emp, numero_proj, horas_proj)
VALUES (111000, 3, 30);

INSERT INTO tbEmpregadoProjeto (rg_emp, numero_proj, horas_proj)
VALUES (111100, 4, 20);

INSERT INTO tbEmpregadoProjeto (rg_emp, numero_proj, horas_proj)
VALUES (111110, 5, 20);

SELECT tbEmpregado.*
FROM tbEmpregado;

SELECT tbProjeto.nome_proj
FROM tbProjeto
WHERE tbProjeto.localizacao = 'Curitiba';

SELECT tbEmpregado.nome_emp
FROM tbEmpregado
WHERE tbEmpregado.cidade_emp = 'São José dos Pinhais';

SELECT tbEmpregado.salario_emp
FROM tbEmpregado
WHERE tbEmpregado.cidade_emp = 'Curitiba';

SELECT tbDependentes.nome_dep
FROM tbDependentes 
WHERE tbDependentes.dataNascimento_dep BETWEEN '2009-01-01' AND '2009-12-31';

SELECT tbEmpregado.nome_emp, tbEmpregado.cidade_emp
FROM tbEmpregado 
WHERE tbEmpregado.salario_emp > 3000;

SELECT tbEmpregado.nome_emp, tbDepartamento.nome_depto
FROM tbEmpregado INNER JOIN tbDepartamento 
ON tbDepartamento.rgGerente_depto = tbEmpregado.RG_emp;

SELECT DISTINCT tbDepartamento.nome_depto
FROM tbDepartamento INNER JOIN tbDepartamentoProjeto
ON tbDepartamento.numero_depto = tbDepartamentoProjeto.numero_depto
INNER JOIN tbProjeto 
ON tbDepartamentoProjeto.numero_proj = 2;

SELECT tbEmpregado.nome_emp
FROM tbEmpregado INNER JOIN tbDepartamento
ON tbEmpregado.numDepto_emp = tbDepartamento.numero_depto
WHERE tbDepartamento.nome_depto = 'informatica';