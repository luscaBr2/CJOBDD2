CREATE DATABASE neo_layer;
USE neo_layer;

-- 1. Tabela Usuario
-- Armazena os dados de todos os usuários, sejam Clientes ou Admins.
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único (Chave Primária) do usuário',
    nome VARCHAR(200) NOT NULL COMMENT 'Nome completo do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail de login (deve ser único no sistema)',
    senha VARCHAR(255) NOT NULL COMMENT 'Hash da senha (para armazenamento seguro, ex: bcrypt)',
    tipo_usuario VARCHAR(10) NOT NULL COMMENT 'Define o perfil de permissão: Cliente ou Admin',
    CONSTRAINT chk_tipo_usuario CHECK (tipo_usuario IN ('Cliente', 'Admin'))
) ENGINE=InnoDB;

-- 2. Tabela Filamento
-- Catálogo de matérias-primas (filamentos) disponíveis.
CREATE TABLE Filamento (
    id_filamento INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único (Chave Primária) do tipo de filamento',
    material VARCHAR(10) NOT NULL COMMENT 'Tipo de material (ex: PLA, ABS, PETG)',
    cor VARCHAR(50) NOT NULL COMMENT 'Cor descritiva do filamento (ex: Vermelho Translúcido)',
    fabricante VARCHAR(100) COMMENT 'Marca ou fabricante do filamento (opcional)',
    preco_por_grama DECIMAL(8, 4) NOT NULL COMMENT 'Custo do material por grama (usado no cálculo de preço)',
    CONSTRAINT chk_material CHECK (material IN ('PLA', 'ABS', 'PETG'))
) ENGINE=InnoDB;

-- 3. Tabela Produto
-- Catálogo de produtos (modelos 3D) que podem ser impressos.
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único (Chave Primária) do produto',
    nome VARCHAR(150) NOT NULL COMMENT 'Nome comercial do produto (ex: Vaso Grego)',
    descricao TEXT COMMENT 'Descrição detalhada do produto (opcional)',
    preco_base DECIMAL(10, 2) NOT NULL COMMENT 'Preço de "mão de obra" (design/tempo) sem incluir o custo do material',
    gramas_filamento_estimadas DECIMAL(10, 2) NOT NULL COMMENT 'Peso estimado em gramas da peça. Usado para calcular o custo do material'
) ENGINE=InnoDB;

-- 4. Tabela Estoque_Filamento
-- Controla a quantidade física de cada filamento. Relação 1:1 com a tabela Filamento.
CREATE TABLE Estoque_Filamento (
    id_filamento INT PRIMARY KEY COMMENT 'Chave Primária e Estrangeira (FK) referenciando Filamento.id_filamento',
    quantidade_gramas DECIMAL(10, 2) NOT NULL DEFAULT 0 COMMENT 'Quantidade atual em gramas disponível em estoque',
    CONSTRAINT fk_estoque_filamento FOREIGN KEY (id_filamento) 
        REFERENCES Filamento(id_filamento) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. Tabela Pedido
-- Armazena o cabeçalho de cada pedido de compra feito por um cliente.
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único (Chave Primária) do pedido de compra',
    id_usuario INT NOT NULL COMMENT 'FK para o Usuario (cliente) que fez o pedido',
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora exata da criação do pedido',
    status_pedido VARCHAR(20) NOT NULL COMMENT 'Status atual do pedido (ex: Pendente, Pago, Em Impressão, Concluído)',
    valor_total DECIMAL(10, 2) COMMENT 'Valor total calculado (soma de todos os preco_item do pedido)',
    CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT chk_status_pedido CHECK (status_pedido IN 
        ('Pendente', 'Pago', 'Em Impressão', 'Enviado', 'Concluído', 'Cancelado'))
) ENGINE=InnoDB;

-- 6. Tabela Solicitacao_Modelagem
-- Armazena pedidos de serviços personalizados de modelagem 3D.
CREATE TABLE Solicitacao_Modelagem (
    id_solicitacao INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único (Chave Primária) do serviço',
    id_usuario INT NOT NULL COMMENT 'FK para o Usuario (cliente) que solicitou o serviço',
    descricao_servico TEXT NOT NULL COMMENT 'Descrição detalhada enviada pelo cliente do que precisa ser modelado',
    status_solicitacao VARCHAR(20) NOT NULL COMMENT 'Status atual do serviço (ex: Aguardando Orçamento, Em Andamento)',
    preco_orcado DECIMAL(10, 2) COMMENT 'Valor orçado pelo Admin para realizar o serviço (preenchido a posteriori)',
    CONSTRAINT fk_solicitacao_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT chk_status_solicitacao CHECK (status_solicitacao IN 
        ('Aguardando Orçamento', 'Em Andamento', 'Concluída', 'Cancelada'))
) ENGINE=InnoDB;

-- 7. Tabela Item_Pedido
-- Tabela associativa (N:M) que detalha quais produtos/filamentos estão em qual pedido.
CREATE TABLE Item_Pedido (
    id_item_pedido INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único (Chave Primária) do item dentro do pedido',
    id_pedido INT NOT NULL COMMENT 'FK para o Pedido ao qual este item pertence',
    id_produto INT NOT NULL COMMENT 'FK para o Produto (modelo) que está sendo comprado',
    id_filamento INT NOT NULL COMMENT 'FK para o Filamento (material/cor) escolhido pelo cliente',
    quantidade INT NOT NULL DEFAULT 1 COMMENT 'Número de unidades deste produto/filamento específico',
    preco_item DECIMAL(10, 2) NOT NULL COMMENT 'Preço final do item: (Produto.preco_base + (Produto.gramas_filamento_estimadas * Filamento.preco_por_grama)) * Quantidade',
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    CONSTRAINT fk_item_filamento FOREIGN KEY (id_filamento) REFERENCES Filamento(id_filamento)
) ENGINE=InnoDB;

-- 8. Criação de Índice
-- Otimiza consultas que filtram pedidos por seu status (ex: "buscar pedidos em impressão").
CREATE INDEX idx_pedido_status ON Pedido(status_pedido);