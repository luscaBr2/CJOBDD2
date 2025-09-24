-- Subconsultas INTERCAMBIO

use INTERCAMBIO;
go

-- aparece o nome das tabelas e quado elas foram criadas
select name as 'Nome da tabela',
	   create_date as 'Data de cria��o'
from sys.tables;
go

-- Exibe o nome das tabelas que existem no banco de dados em uso
SELECT TABLE_NAME AS 'Nome da Tabela'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND 
      TABLE_CATALOG = 'INTERCAMBIO';
GO

-- Mostra os valores inseridos na tabela PAISES
SELECT CodPais    AS 'C�digo do Pa�s',
       NomePais   AS 'Nome',
       IdiomaPais AS 'Idioma Principal'
FROM PAISES;
GO

-- Mostra os valores inseridos na tabela ALUNOS, exceto a data de nascimento e o telefone
SELECT CodAluno   AS 'C�digo',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endere�o',
       Genero     AS 'G�nero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'C�digo da Viagem'
FROM ALUNOS;
GO

-- Mostra os valores inseridos na tabela AlunosCOPIA, exceto a data de nascimento e o telefone
SELECT CodAluno   AS 'C�digo',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endere�o',
       Genero     AS 'G�nero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'C�digo da Viagem'
FROM AlunosCOPIA;
GO



SELECT CodAluno   AS 'C�digo',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'G�nero'
from ALUNOS
    UNION
SELECT CodAluno   AS 'C�digo',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'G�nero'
from AlunosCOPIA
order by CodAluno, NomeAluno;
go

SELECT CodAluno   AS 'C�digo',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'G�nero'
from ALUNOS
    EXCEPT
SELECT CodAluno   AS 'C�digo',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'G�nero'
from AlunosCOPIA
order by CodAluno, NomeAluno;
go

SELECT NomeAluno as 'Nome do aluno'
from alunos
    intersect
SELECT NomeAluno as 'Nome do aluno'
from AlunosCOPIA
order by NomeAluno;
go