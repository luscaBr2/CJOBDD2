--CREATE DATABASE empresa123;
USE empresa123;

SET DATEFORMAT DMY;

CREATE TABLE funcionarios(
	id INT PRIMARY KEY,
    nome varchar(35),
);

CREATE TABLE dependentes (
    codDependente INT PRIMARY KEY,
    nome VARCHAR(35) NOT NULL,
    sexo CHAR(1) NULL,
    dataNascimento DATE NOT NULL,
    id INT,
    FOREIGN KEY (id) REFERENCES funcionarios(id)
);

insert into funcionarios values 
    (1, '')


BULK INSERT dependentes
FROM 'dados/dependentes.CSV'
WITH (
	FIRSTROW = 2,
	datafiletype = 'widechar',
	fieldterminator = ','
);

-- CROSS JOIN
select * from funcionarios, dependentes;

select f.id as 'codigo funcionario',
    f.nome as '',
    d.nome as '',
    d.dataNascimento as ''
from funcionarios f cross join dependentes d;
