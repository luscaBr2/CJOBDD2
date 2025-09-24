--------------------------------------------------------------------------------
-- 01-Intercambio.sql
-- Script para criar o banco de dados INTERCAMBIO
--------------------------------------------------------------------------------


-- Habilita o contexto do banco de dados MASTER
USE Master;
GO


-- Cria o banco de dados INTERCAMBIO, caso ele n�o exista
IF DB_ID(N'INTERCAMBIO') IS NULL
    CREATE DATABASE INTERCAMBIO;
GO


-- Habilita o contexto do banco de dados INTERCAMBIO
USE INTERCAMBIO;
GO


--------------------------------------------------------------------------------
-- Cria��o das tabelas
--------------------------------------------------------------------------------


-- Tabela PAISES (C�digo ISO3)
CREATE TABLE PAISES (
    CodPais CHAR(3) PRIMARY KEY,
    NomePais VARCHAR(255) NOT NULL,
    IdiomaPais VARCHAR(50) NULL
);
GO


-- Tabela VIAGENS
CREATE TABLE VIAGENS (
    CodViagem INT PRIMARY KEY,
    DataSaida DATE NOT NULL,
    DataRetorno DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    PaisDestino CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais)
);
GO


-- Tabela ALUNOS
CREATE TABLE ALUNOS (
    CodAluno INT IDENTITY PRIMARY KEY,
    NomeAluno CHAR(20) NOT NULL,
    DataNasc DATE NOT NULL,
    Endereco VARCHAR(60) NOT NULL,
    Telefone CHAR(12) NOT NULL,
    Genero CHAR(1) NULL,
    PaisOrigem CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais),
    CodViagem INT NOT NULL FOREIGN KEY REFERENCES VIAGENS(CodViagem)
);
GO


-- Tabela AlunosCOPIA
-- Essa tabela ser� utilizada apenas para demonstrar os operadores do conjunto relacional
CREATE TABLE AlunosCOPIA (
    CodAluno INT IDENTITY PRIMARY KEY,
    NomeAluno CHAR(20) NOT NULL,
    DataNasc DATE NOT NULL,
    Endereco VARCHAR(60) NOT NULL,
    Telefone CHAR(12) NOT NULL,
    Genero CHAR(1),
    PaisOrigem CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais),
    CodViagem INT NOT NULL FOREIGN KEY REFERENCES VIAGENS(CodViagem)
);
GO


-- Exibe o nome das tabelas que existem no banco de dados em uso
SELECT name 
FROM sys.tables;
GO


-- Exibe o nome das tabelas que existem no banco de dados em uso
SELECT TABLE_NAME AS 'Nome da Tabela'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND 
      TABLE_CATALOG = 'INTERCAMBIO';
GO


--------------------------------------------------------------------------------
-- Inser��o dos dados
--------------------------------------------------------------------------------


-- Insere 244 registros na tabela PAISES
INSERT INTO PAISES VALUES 
    ('AFG', 'Afeganist�o', 'Dari e Pashtu'),
    ('ZAF', '�frica do Sul', 'Ingl�s'),
    ('ALA', 'Aland, Ilhas', 'Sueco'),
    ('ALB', 'Alb�nia', 'Alban�s'),
    ('DEU', 'Alemanha', 'Alem�o'),
    ('AND', 'Andorra', 'Catal�o'),
    ('AGO', 'Angola', 'Portugu�s'),
    ('AIA', 'Anguilla', 'Ingl�s'),
    ('ATA', 'Ant�rtida', NULL),
    ('ATG', 'Antigua e Barbuda', 'Ingl�s'),
    ('ANT', 'Antilhas Holandesas', 'Papiamento, Neerland�s e Ingl�s'),
    ('SAU', 'Ar�bia Saudita', '�rabe'),
    ('DZA', 'Arg�lia', '�rabe'),
    ('ARG', 'Argentina', 'Espanhol'),
    ('ARM', 'Arm�nia', 'Arm�nio'),
    ('ABW', 'Aruba', 'Neerland�s e Papiamento'),
    ('AUS', 'Austr�lia', 'Ingl�s'),
    ('AUT', '�ustria', 'Alem�o'),
    ('AZE', 'Azerbeij�o', 'Azeri'),
    ('BHS', 'Bahamas', 'Ingl�s'),
    ('BHR', 'Bahrein', '�rabe e Ingl�s'),
    ('BGD', 'Bangladesh', 'Bengali'),
    ('BRB', 'Barbados', 'Ingl�s'),
    ('BEL', 'B�lgica', 'Neerland�s, Franc�s e Alem�o'),
    ('BLZ', 'Belize', 'Ingl�s'),
    ('BEN', 'Benin', 'Franc�s'),
    ('BMU', 'Bermudas', 'Ingl�s'),
    ('BLR', 'Bielo-R�ssia', 'Russo'),
    ('BOL', 'Bol�via', 'Espanhol'),
    ('BIH', 'B�snia-Herzegovina', 'B�snio, Croata e S�rvio'),
    ('BWA', 'Botswana', 'Ingl�s'),
    ('BVT', 'Bouvet, Ilha', NULL),
    ('BRA', 'Brasil', 'Portugu�s'),
    ('BRN', 'Brunei', 'Malaio'),
    ('BGR', 'Bulg�ria', 'B�lgaro'),
    ('BFA', 'Burkina Faso', 'Franc�s'),
    ('BDI', 'Burundi', 'Franc�s'),
    ('BTN', 'But�o', 'Dzonka'),
    ('CPV', 'Cabo Verde', 'Portugu�s'),
    ('KHM', 'Cambodja', 'Khmer'),
    ('CMR', 'Camar�es', 'Ingl�s e Franc�s'),
    ('CAN', 'Canad�', 'Ingl�s e Franc�s'),
    ('CYM', 'Cayman, Ilhas', 'Ingl�s'),
    ('KAZ', 'Cazaquist�o', 'Russo'),
    ('CAF', 'Centro-africana, Rep�blica', 'Franc�s e Sangho'),
    ('TCD', 'Chade', 'Franc�s'),
    ('CZE', 'Checa, Rep�blica', 'Tcheco'),
    ('CHL', 'Chile', 'Espanhol'),
    ('CHN', 'China', 'Chin�s'),
    ('CYP', 'Chipre', 'Grego'),
    ('CXR', 'Christmas, Ilha', 'Ingl�s, Chin�s e Malaio'),
    ('CCK', 'Cocos, Ilhas', 'Ingl�s'),
    ('COL', 'Col�mbia', 'Espanhol'),
    ('COM', 'Comores', '�rabe'),
    ('COG', 'Congo, Rep�blica do', 'Franc�s'),
    ('COD', 'Congo, Rep�blica Democr�tica do (antigo Zaire),', 'Franc�s'),
    ('COK', 'Cook, Ilhas', 'Ingl�s e Maori'),
    ('KOR', 'Cor�ia do Sul', 'Coreano'),
    ('PRK', 'Cor�ia, Rep�blica Democr�tica da (Cor�ia do Norte),', 'Coreano'),
    ('CIV', 'Costa do Marfim', 'Franc�s'),
    ('CRI', 'Costa Rica', 'Espanhol'),
    ('HRV', 'Cro�cia', 'Croata'),
    ('CUB', 'Cuba', 'Castelhano ou Espanhol'),
    ('DNK', 'Dinamarca', 'Dinamarqu�s'),
    ('DJI', 'Djibouti', 'Franc�s'),
    ('DMA', 'Dominica', 'Ingl�s'),
    ('DOM', 'Dominicana, Rep�blica', 'Espanhol'),
    ('EGY', 'Egito', '�rabe'),
    ('SLV', 'El Salvador', 'Espanhol'),
    ('ARE', 'Emirados �rabes Unidos', '�rabe'),
    ('ECU', 'Equador', 'Espanhol'),
    ('ERI', 'Eritreia', 'Am�rico'),
    ('SVK', 'Eslov�quia', 'Eslovaco'),
    ('SVN', 'Eslov�nia', 'Esloveno'),
    ('ESP', 'Espanha', 'Castelhano ou Espanhol'),
    ('USA', 'Estados Unidos da Am�rica', 'Ingl�s'),
    ('EST', 'Est�nia', 'Est�nio'),
    ('ETH', 'Eti�pia', 'Am�rico'),
    ('FRO', 'Faroe, Ilhas', 'Fero�s e Dinamarqu�s'),
    ('FJI', 'Fiji', 'Ingl�s'),
    ('PHL', 'Filipinas', 'Ingl�s'),
    ('FIN', 'Finl�ndia', 'Finland�s'),
    ('FRA', 'Fran�a', 'Franc�s'),
    ('GAB', 'Gab�o', 'Franc�s'),
    ('GMB', 'G�mbia', 'Ingl�s'),
    ('GHA', 'Gana', 'Ingl�s'),
    ('GEO', 'Ge�rgia', 'Georgiano'),
    ('SGS', 'Ge�rgia do Sul e Sandwich do Sul, Ilhas', 'Ingl�s'),
    ('GIB', 'Gibraltar', 'Ingl�s'),
    ('GRC', 'Gr�cia', 'Grego'),
    ('GRD', 'Granada', 'Ingl�s'),
    ('GRL', 'Groenl�ndia', 'Groenland�s'),
    ('GLP', 'Guadalupe', 'Franc�s'),
    ('GUM', 'Guam', 'Ingl�s e Chamorro'),
    ('GTM', 'Guatemala', 'Espanhol'),
    ('GGY', 'Guernsey', 'Ingl�s e Franc�s'),
    ('GUY', 'Guiana', 'Ingl�s'),
    ('GUF', 'Guiana Francesa', 'Franc�s'),
    ('GNB', 'Guin�-Bissau', 'Portugu�s'),
    ('GIN', 'Guin�-Conacri', 'Franc�s'),
    ('GNQ', 'Guin� Equatorial', 'Espanhol'),
    ('HTI', 'Haiti', 'Franc�s e Crioulo'),
    ('HMD', 'Heard e McDonald, Ilhas', NULL),
    ('HND', 'Honduras', 'Espanhol'),
    ('HKG', 'Hong Kong', 'Chin�s e Ingl�s'),
    ('HUN', 'Hungria', 'H�ngaro'),
    ('YEM', 'I�men', '�rabe'),
    ('IND', '�ndia', 'Ingl�s e Hindi'),
    ('IDN', 'Indon�sia', 'Bahasa'),
    ('IRQ', 'Iraque', '�rabe'),
    ('IRN', 'Ir�', 'Persa'),
    ('IRL', 'Irlanda', 'Ingl�s'),
    ('ISL', 'Isl�ndia', 'Ingl�s'),
    ('ISR', 'Israel', 'Hebraico'),
    ('ITA', 'It�lia', 'Italiano'),
    ('JAM', 'Jamaica', 'Ingl�s'),
    ('JPN', 'Jap�o', 'Japon�s'),
    ('JEY', 'J�rsei', 'Ingl�, Franc�s e J�rriais'),
    ('JOR', 'Jord�nia', '�rabe'),
    ('KIR', 'Kiribati', 'Ingl�s'),
    ('KWT', 'Kuwait', '�rabe'),
    ('LAO', 'Laos', 'Lao'),
    ('LSO', 'Lesoto', 'Ingl�s'),
    ('LVA', 'Let�nia', 'Let�o'),
    ('LBN', 'L�bano', '�rabe'),
    ('LBR', 'Lib�ria', 'Ingl�s'),
    ('LBY', 'L�bia', '�rabe'),
    ('LIE', 'Liechtenstein', 'Alem�o'),
    ('LTU', 'Litu�nia', 'Lituano'),
    ('LUX', 'Luxemburgo', 'Franc�s'),
    ('MAC', 'Macau', 'Chin�s e Portugu�s'),
    ('MKD', 'Maced�nia, Rep�blica da', 'Maced�nio'),
    ('MDG', 'Madagascar', 'Franc�s e Malgaxe'),
    ('MYS', 'Mal�sia', 'Malaio'),
    ('MWI', 'Malawi', 'Ingl�s'),
    ('MDV', 'Maldivas', 'Divehi'),
    ('MLI', 'Mali', 'Franc�s'),
    ('MLT', 'Malta', 'Ingl�s'),
    ('FLK', 'Malvinas, Ilhas', 'Ingl�s'),
    ('IMN', 'Man, Ilha de', 'Ingl�s e Manx'),
    ('MNP', 'Marianas Setentrionais', 'Ingl�s, Chamorro, Carol�nio e Japon�s'),
    ('MAR', 'Marrocos', '�rabe'),
    ('MHL', 'Marshall, Ilhas', 'Ingl�s'),
    ('MTQ', 'Martinica', 'Franc�s'),
    ('MUS', 'Maur�cia', 'Ingl�s'),
    ('MRT', 'Maurit�nia', '�rabe'),
    ('MYT', 'Maiote', 'Franc�s'),
    ('UMI', 'Menores Distantes dos Estados Unidos, Ilhas', NULL),
    ('MEX', 'M�xico', 'Espanhol ou Castelhano'),
    ('MMR', 'Myanmar (antiga Birm�nia),', 'Birman�s'),
    ('FSM', 'Micron�sia, Estados Federados da', 'Ingl�s'),
    ('MOZ', 'Mo�ambique', 'Portugu�s'),
    ('MDA', 'Mold�via', 'Moldavo'),
    ('MCO', 'M�naco', 'Franc�s'),
    ('MNG', 'Mong�lia', 'Mongol'),
    ('MNE', 'Montenegro', 'S�rvio'),
    ('MSR', 'Montserrat', 'Ingl�s'),
    ('NAM', 'Nam�bia', 'Ingl�s'),
    ('NRU', 'Nauru', 'Nauruano'),
    ('NPL', 'Nepal', 'Nepal�s'),
    ('NIC', 'Nicar�gua', 'Espanhol'),
    ('NER', 'N�ger', 'Franc�s'),
    ('NGA', 'Nig�ria', 'Ingl�s'),
    ('NIU', 'Niue', '    Niueano e Ingl�s'),
    ('NFK', 'Norfolk, Ilha', 'Ingl�s e Norfuk'),
    ('NOR', 'Noruega', 'Noruegu�s'),
    ('NCL', 'Nova Caled�nia', 'Franc�s'),
    ('NZL', 'Nova Zel�ndia', 'Ingl�s'),
    ('OMN', 'Om�', '�rabe'),
    ('NLD', 'Pa�ses Baixos (Holanda),', 'Neerland�s'),
    ('PLW', 'Palau', 'Ingl�s'),
    ('PSE', 'Palestina', NULL),
    ('PAN', 'Panam�', 'Espanhol'),
    ('PNG', 'Papua-Nova Guin�', 'Ingl�s'),
    ('PAK', 'Paquist�o', 'Pumjabi'),
    ('PRY', 'Paraguai', 'Espanhol'),
    ('PER', 'Peru', 'Espanhol'),
    ('PCN', 'Pitcairn, Ilhas', 'Ingl�s'),
    ('PYF', 'Polin�sia Francesa', 'Franc�s'),
    ('POL', 'Pol�nia', 'Polon�s'),
    ('PRI', 'Porto Rico', 'Ingl�s'),
    ('PRT', 'Portugal', 'Portugu�s'),
    ('QAT', 'Qatar', '�rabe'),
    ('KEN', 'Qu�nia', 'Quisvaili'),
    ('KGZ', 'Quirguist�o', 'Quirguiz'),
    ('GBR', 'Reino Unido da Gr�-Bretanha e Irlanda do Norte', 'Ingl�s'),
    ('REU', 'Reuni�o, Ilhas', 'Franc�s e Crioulo'),
    ('ROU', 'Rom�nia', 'Romeno'),
    ('RWA', 'Ruanda', 'Franc�s'),
    ('RUS', 'R�ssia', 'Russo'),
    ('ESH', 'Saara Ocidental', '�rabe e Espanhol'),
    ('ASM', 'Samoa Americana', 'Ingl�s'),
    ('WSM', 'Samoa (Samoa Ocidental),', 'Ingl�s e Samoano'),
    ('SPM', 'S�o Pedro e Miquel�o', 'Franc�s'),
    ('SLB', 'Salom�o, Ilhas', 'Ingl�s'),
    ('KNA', 'S�o Crist�v�o e N�vis', 'Ingl�s'),
    ('SMR', 'San Marino', 'Italiano'),
    ('STP', 'S�o Tom� e Pr�ncipe', 'Portugu�s'),
    ('VCT', 'S�o Vicente e Granadinas', 'Ingl�s'),
    ('SHN', 'Santa Helena', 'Ingl�s'),
    ('LCA', 'Santa L�cia', 'Ingl�s e Franc�s'),
    ('SEN', 'Senegal', 'Franc�s'),
    ('SLE', 'Serra Leoa', 'Ingl�s'),
    ('SRB', 'S�rvia', 'S�rvio'),
    ('SYC', 'Seichelles', 'Ingl�s'),
    ('SGP', 'Cingapura', 'Ingl�s'),
    ('SYR', 'S�ria', '�rabe'),
    ('SOM', 'Som�lia', 'Somali'),
    ('LKA', 'Sri Lanka', 'Ingl�s'),
    ('SWZ', 'Suazil�ndia', 'Ingl�s'),
    ('SDN', 'Sud�o', '�rabe'),
    ('SWE', 'Su�cia', 'Sueco'),
    ('CHE', 'Su��a', 'Alem�o e Franc�s'),
    ('SUR', 'Suriname', 'Holand�s'),
    ('SJM', 'Svalbard e Jan Mayen', NULL),
    ('THA', 'Tail�ndia', 'Tai'),
    ('TWN', 'Taiwan', 'Mandarim'),
    ('TJK', 'Tadjiquist�o', 'Tadjique'),
    ('TZA', 'Tanz�nia', 'Ingl�s'),
    ('ATF', 'Terras Austrais e Ant�rticas Francesas (TAAF),', 'Franc�s'),
    ('IOT', 'Territ�rio Brit�nico do Oceano �ndico', 'Ingl�s'),
    ('TLS', 'Timor-Leste', 'Portugu�s'),
    ('TGO', 'Togo', 'Franc�s'),
    ('TKL', 'Toquelau', 'Toquelauano e Ingl�s'),
    ('TON', 'Tonga', 'Ingl�s'),
    ('TTO', 'Trinidad e Tobago', 'Ingl�s'),
    ('TUN', 'Tun�sia', '�rabe'),
    ('TCA', 'Turcos e Caicos, Ilhas', 'Ingl�s'),
    ('TKM', 'Turcomenist�o', 'Turcomano'),
    ('TUR', 'Turquia', 'Turco'),
    ('TUV', 'Tuvalu', 'Ingl�s'),
    ('UKR', 'Ucr�nia', 'Ucraniano'),
    ('UGA', 'Uganda', 'Ingl�s'),
    ('URY', 'Uruguai', 'Espanhol'),
    ('UZB', 'Uzbequist�o', 'Uzbequi'),
    ('VUT', 'Vanuatu', 'Franc�s e Ingl�s'),
    ('VAT', 'Vaticano', 'Italiano e Latim'),
    ('VEN', 'Venezuela', 'Espanhol'),
    ('VNM', 'Vietn�', 'Vietnamita'),
    ('VIR', 'Virgens Americanas, Ilhas', 'Ingl�s'),
    ('VGB', 'Virgens Brit�nicas, Ilhas', 'Ingl�s'),
    ('WLF', 'Wallis e Futuna, Ilhas', 'Franc�s e Wallisiano'),
    ('ZMB', 'Z�mbia', 'Ingl�s'),
    ('ZWE', 'Zimbabwe', 'Ingl�s');
GO


-- Mostra os valores inseridos na tabela PAISES
SELECT CodPais    AS 'C�digo do Pa�s',
       NomePais   AS 'Nome',
       IdiomaPais AS 'Idioma Principal'
FROM PAISES;
GO


-- Insere 30 registros na tabela VIAGENS
INSERT INTO VIAGENS VALUES 
    (001, '2010-10-12', '2010-12-12', 5350.00, 'VGB'),
    (002, '2010-09-14', '2010-12-22', 8900.00, 'VNM'),
    (003, '2010-12-05', '2011-12-05', 18525.35, 'UKR'),
    (004, '2010-08-11', '2011-05-21', 12350.25, 'TUR'),
    (005, '2010-06-25', '2010-08-25', 7520.00, 'TKL'),
    (006, '2010-03-16', '2011-03-16', 14255.35, 'USA'),
    (007, '2010-12-01', '2010-12-30', 3250.00, 'TLS'),
    (008, '2010-10-12', '2010-12-30', 9500.00, 'THA'),
    (009, '2010-06-21', '2010-09-05', 9250.00, 'RUS'),
    (010, '2010-09-10', '2010-10-02', 6525.00, 'SEN'),
    (011, '2010-07-27', '2011-11-15', 12355.00, 'QAT'),
    (012, '2010-09-04', '2011-10-02', 14200.00, 'CHE'),
    (013, '2010-08-02', '2012-05-02', 16100.00, 'SYR'),
    (014, '2010-06-04', '2011-10-22', 15300.00, 'NZL'),
    (015, '2010-11-04', '2010-12-30', 6250.50, 'MRT'),
    (016, '2010-11-05', '2012-11-05', 22850.25, 'USA'),
    (017, '2010-12-02', '2012-12-30', 18600.10, 'MEX'),
    (018, '2010-11-10', '2012-03-02', 19000.50, 'DNK'),
    (019, '2010-11-11', '2010-12-20', 8200.00, 'GTM'),
    (020, '2010-08-19', '2010-10-20', 7500.00, 'COG'),
    (021, '2010-07-19', '2010-11-19', 8900.50, 'FRA'),
    (022, '2011-01-05', '2012-01-05', 15650.25, 'MEX'),
    (023, '2011-01-08', '2012-01-08', 11850.95, 'USA'),
    (024, '2011-01-10', '2012-01-10', 15850.95, 'USA'),
    (025, '2010-08-02', '2011-08-02', 16550.20, 'USA'),
    (026, '2010-09-05', '2011-03-20', 14750.25, 'USA'),
    (027, '2011-03-15', '2012-04-20', 13560.65, 'THA'),
    (028, '2010-08-15', '2012-10-20', 19500.80, 'USA'),
    (029, '2011-01-01', '2011-12-01', 12520.25, 'USA'),
    (030, '2011-02-20', '2012-02-20', 11950.65, 'IND');
GO


-- Mostra os valores inseridos na tabela VIAGENS
SELECT * FROM VIAGENS;
GO


-- Insere 50 registros na tabela ALUNOS
INSERT INTO ALUNOS VALUES 
    ('Maria Cristina', '1985-10-12', 'Rua Jo�o XXIII, 15 - S�o Paulo', '1155686899', 'F', 'BRA', 001),
    ('Ana Paula Lima', '1980-12-01', 'Rua Mauro Silva, 1908 - S�o Paulo', '1156923232', 'F', 'BRA', 002),
    ('Carlos Renato', '1979-05-10', 'Av. Faria Lima, 347 - S�o Paulo', '1156121010', 'M', 'BRA', 003),
    ('Hugo Silva', '1975-10-02', 'Av. da Consola��o, 1216 - S�o Paulo', '1154788901', 'M', 'BRA', 004),
    ('Marcos Ant�nio', '1985-10-23', 'Rua Agripino Lopes, 100 - S�o Paulo', '1156010201', 'M', 'BRA', 005),
    ('Gislaine Silva', '1983-11-06', 'Av. Nelson D�vila, 2345 - S�o Jos� dos Campos', '1234598910', 'F', 'BRA', 006),
    ('Ant�nio Pereira', '1979-06-18', 'Rua Joaquim Nabuco, 18 - Jacare�', '1234966852', 'M', 'BRA', 007),
    ('Jair Lopes', '1982-12-14', 'Rua Pedro XIII, Santa Isabel', '1236691857', 'M', 'BRA', 008),
    ('Miguel Firmino', '1982-05-12', 'Av. Colinas, 2340 - S�o Jos� dos Campos', '1234581212', 'M', 'BRA', 009),
    ('Marta da Silva', '1982-06-15', 'Rua Alfredo Miragaia, 321 - Taubat�', '1234568989', 'F', 'BRA', 010),
    ('Jorge Augusto', '1985-06-19', 'Rua Calif�rnia, 3451 - S�o Paulo', '1158988810', 'M', 'BRA', 011),
    ('Renato C�sar', '1981-10-22', 'Rua Cafezal, 10 - Cafezal do Sul', '4488562323', 'M', 'BRA', 012),
    ('J�lio Antunes', '1981-11-23', 'Rua do Descanso, 99 - Cama�ari', '7196521010', 'M', 'BRA', 013),
    ('M�rcio Gomes', '1986-11-24', 'Rua Miguel Pereira, 15 - S�o Paulo', '1156451212', 'M', 'BRA', 014),
    ('Carlos Pereira', '1986-12-24', 'Rua Maria Augusta, 290 - S�o Paulo', '1158457525', 'M', 'BRA', 015),
    ('Carlos Barreto', '1986-02-21', 'Rua Augusta, 90 - S�o Paulo', '1156322558', 'M', 'BRA', 016),
    ('Simone Gomes', '1985-02-20', 'Rua A, 18 - Campos do Jord�o', '1296895959', 'F', 'BRA', 017),
    ('Jos� Aur�lio', '1987-03-26', 'Rua Canarinho, 789 - S�o Paulo', '1186574512', 'M', 'BRA', 018),
    ('Juliana Marcondes', '1988-07-27', 'Av. da Consola��o, 3450 - S�o Paulo', '1155125566', 'F', 'BRA', 019),
    ('Jezebel Lima', '1983-07-29', 'Av. Calif�rnia, 2553 - S�o Paulo', '1154332332', 'F', 'BRA', 020),
    ('Geisa Lima', '1982-09-29', 'Rua Constantino Pereira, 130 - S�o Paulo', '1155847889', 'F', 'BRA', 020),
    ('Ana Mara da Silva', '1985-10-30', 'Av. Costa e Silva, 109 - Cruzeiro', '1236658956', 'F', 'BRA', 015),
    ('Pedro Costa', '1985-12-30', 'Av. Francisco Teixeira, 1218 - Campos do Jord�o', '1236631225', 'M', 'BRA', 005),
    ('Miriam Pereira', '1986-01-30', 'Av. Matheus da Costa Pinto, 1801 - Campos do Jord�o', '1236621515', 'F', 'BRA', 002),
    ('Marcos Manuel', '1977-01-12', 'Rua An�sio Teixeira, 555 - Campos do Jord�o', '1236621859', 'M', 'BRA', 001),
    ('Jairo Pereira', '1977-03-13', 'Rua Pedro Augusto, 318 - Cruzeiro', '1236661518', 'M', 'BRA', 001),
    ('Cristina Rocha', '1979-08-14', 'Av. Nelson Lima, 347 - S�o Paulo', '1153212102', 'F', 'BRA', 009),
    ('�gatha Silva', '1975-08-15', 'Av. Faria Lima, 448 - S�o Paulo', '1156020303', 'F', 'BRA', 015),
    ('Mariana Lopes', '1975-09-18', 'Rua Calif�rnia, 1009 - S�o Paulo', '1154121111', 'F', 'BRA', 015),
    ('C�sar Augusto', '1975-10-19', 'Rua Augusta, 235 - S�o Paulo', '1154189898', 'M', 'BRA', 019),
    ('Melissa Pereira', '1975-10-21', 'Rua Am�rico Vesp�cio, 56 - S�o Paulo', '1156887110', 'F', 'BRA', 012),
    ('J�ssica Patr�cia', '1985-10-12', 'Rua Brigadeiro Jord�o, 199 - Campos do Jord�o', '1236625307', 'F', 'BRA', 011),
    ('Patr�cia Silva', '1982-11-12', 'Rua Periquito, 24 - Campos do Jord�o', '1236620181', 'F', 'BRA', 011),
    ('Maria Duarte', '1982-12-10', 'Rua F, 341 - Campos do Jord�o', '1236631118', 'F', 'BRA', 011),
    ('Marcelo Augusto', '1984-09-22', 'Av. Frei Orestes Girardi, 899 - Campos do Jord�o', '1236635696', 'M', 'BRA', 013),
    ('Cristiano Leite', '1984-08-25', 'Rua Gumercindo Lopes, 566 - S�o Paulo', '1158871771', 'M', 'BRA', 016),
    ('Alberto Carlos', '1983-07-26', 'Av. Jorge Aparecido, 641 - Rio de Janeiro', '2124565353', 'M', 'BRA', 018),
    ('Jaime Augusto', '1983-05-15', 'Rua S�o Leopoldo, 11 - Rio de Janeiro', '2125896060', 'M', 'BRA', 003),
    ('Leandro Leite', '1982-06-15', 'Av. do Povo, 3489 - Rio de Janeiro', '2156894510', 'M', 'BRA', 009),
    ('M�nica Silva', '1978-04-17', 'Rua Americana, 5200 - Rio de Janeiro', '2189562121', 'F', 'BRA', 009),
    ('Mar�lia dos Santos', '1984-04-15', '', '2134588585', 'F', 'BRA', 004),
    ('Guilherme dos Santos', '1978-10-11', 'Av. Brasil, 1008 - S�o Paulo', '1155661010', 'M', 'BRA', 001),
    ('Heidi Lima', '1978-08-11', 'Rua C�sar Concei��o, 12 - Santo Ant�nio do Pinhal', '1236645605', 'F', 'BRA', 002),
    ('Am�lcar J�nior', '1976-04-10', 'Rua Senador Kennedy, 901 - S�o Paulo', '1155640290', 'M', 'BRA', 008),
    ('Alexandro Duarte', '1974-05-29', 'Rua Maria C�ntia - Cruzeiro', '1236661515', 'M', 'BRA', 011),
    ('Maur�cio dos Santos', '1988-04-13', 'Rua Marta Silva - Jacare�', '1236665650', 'M', 'BRA', 016),
    ('Mary Ann Duarte', '1989-04-13', 'Av. Brasil, 6320 - S�o Paulo', '1158854516', 'F', 'BRA', 017),
    ('Gabriela Pereira', '1983-07-29', 'Rua Franco Silva, 1599 - S�o Paulo', '1159404014', 'F', 'BRA', 018),
    ('Andr� C�sar', '1984-12-30', 'Rua Militar, 349 - Rio de Janeiro', '2128002525', 'M', 'BRA', 014),
    ('Edson Lopes', '1979-01-11', 'Av. Pedro Silva, 3047 - Rio de Janeiro', '2126900099', 'M', 'BRA', 014);
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


-- Insere 20 registros na tabela ALUNOSCOPIA
INSERT INTO AlunosCOPIA VALUES 
    ('Maria Cristina', '1985-10-12', 'Rua Jo�o XXIII, 15 - S�o Paulo', '1155686899', 'F', 'BRA', 001),
    ('Ana Paula Lima', '1980-12-01', 'Rua Mauro Silva, 1908 - S�o Paulo', '1156923232', 'F', 'BRA', 002),
    ('Felipe Neto', '1975-11-23', 'Rua da Pregui�a, 70 - S�o Paulo', '8996521919', 'M', 'BRA', 015),
    ('Carlos Eduardo', '1966-11-24', 'Rua Miguel Pereira, 150 - S�o Paulo', '1156651210', 'M', 'BRA', 015),
    ('Carlos Pereira', '1986-12-24', 'Rua Maria Augusta, 290 - S�o Paulo', '1158457525', 'M', 'BRA', 015),
    ('Cristiano Leite', '1984-08-25', 'Rua Gumercindo Lopes, 566 - S�o Paulo', '1158871771', 'M', 'BRA', 016),
    ('Alberto Carlos', '1983-07-26', 'Av. Jorge Aparecido, 641 - Rio de Janeiro', '2124565353', 'M', 'BRA', 018),
    ('Maria Rita', '1993-05-15', 'Av. Marcos Lima, 110 - Florian�polis', '4825906066', 'F', 'BRA', 003),
    ('Leandro Leite', '1982-06-15', 'Av. do Povo, 3489 - Rio de Janeiro', '2156894510', 'M', 'BRA', 009),
    ('M�nica Silva', '1978-04-17', 'Rua Americana, 5200 - Rio de Janeiro', '2189562121', 'F', 'BRA', 009),
    ('Emerson Soares', '1994-04-15', '', '4834588585', 'M', 'BRA', 018),
    ('Melissa Lima', '1988-10-11', 'Rua da Cegonha, 124 - S�o Paulo', '1155661010', 'F', 'BRA', 001),
    ('J�ssica Santos', '1968-08-20', 'Rua do Periquito, 99 - Florian�polis', '4846685615', 'F', 'BRA', 015),
    ('Edson Renato', '1966-04-10', 'Rua da Gaivota, 1501 - S�o Paulo', '1155640290', 'M', 'BRA', 011),
    ('Alex Silva', '1984-05-29', 'Rua do Xarope - Cruzeiro', '1236661515', 'M', 'BRA', 012),
    ('Maur�cio dos Santos', '1988-04-13', 'Rua Marta Silva - Jacare�', '1236665650', 'M', 'BRA', 016),
    ('Avelino J�nior', '1985-04-13', 'Rua da Rel�quia, 24 - Trememb�', '1258854516', 'M', 'BRA', 017),
    ('Gabriela Pereira', '1983-07-29', 'Rua Franco Silva, 1599 - S�o Paulo', '1159404014', 'F', 'BRA', 018),
    ('Andr� C�sar', '1984-12-30', 'Rua Militar, 349 - Rio de Janeiro', '2128002525', 'M', 'BRA', 014),
    ('Edson Lopes', '1979-01-11', 'Av. Pedro Silva, 3047 - Rio de Janeiro', '2126900099', 'M', 'BRA', 014);
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


--------------------------------------------------------------------------------
-- FIM!
--------------------------------------------------------------------------------