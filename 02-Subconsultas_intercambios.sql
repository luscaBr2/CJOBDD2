-- Subconsultas INTERCAMBIO

use INTERCAMBIO;
go

-- aparece o nome das tabelas e quado elas foram criadas
select name as 'Nome da tabela',
	   create_date as 'Data de criação'
from sys.tables;
go

-- Exibe o nome das tabelas que existem no banco de dados em uso
SELECT TABLE_NAME AS 'Nome da Tabela'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND 
      TABLE_CATALOG = 'INTERCAMBIO';
GO

-- Mostra os valores inseridos na tabela PAISES
SELECT CodPais    AS 'Código do País',
       NomePais   AS 'Nome',
       IdiomaPais AS 'Idioma Principal'
FROM PAISES;
GO

-- Mostra os valores inseridos na tabela ALUNOS, exceto a data de nascimento e o telefone
SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Genero     AS 'Gênero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'Código da Viagem'
FROM ALUNOS;
GO

-- Mostra os valores inseridos na tabela AlunosCOPIA, exceto a data de nascimento e o telefone
SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Genero     AS 'Gênero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'Código da Viagem'
FROM AlunosCOPIA;
GO



SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero'
from ALUNOS
    UNION
SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero'
from AlunosCOPIA
order by CodAluno, NomeAluno;
go

SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero'
from ALUNOS
    EXCEPT
SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero'
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