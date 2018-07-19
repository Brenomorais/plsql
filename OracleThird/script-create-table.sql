-- Script para criar tabelas do ambiente
-- Atenção para os nomes das tabelas e os campo, Oracle é case sensitive!

-- Cria table cliente
Create Table Cliente(
    Id Number(5),
    Razao_Social Varchar2(100),
    Cnpj Varchar2(20),
    Segmercado_Id Number(5),
    Data_Inclusao Date,
    Faturamento_Previsto Number(10,2),
    Categoria Varchar2(20)
);

-- Altera table para adicionar a chave primária
ALTER TABLE Cliente ADD CONSTRAINT Cliente_id_pk PRIMARY KEY(ID);

-- Criando table SegMercado
CREATE TABLE SegMercado(
    ID NUMBER(5),
    Descricao VARCHAR2(100)
);

-- Chave primaria 
ALTER TABLE Segmercado ADD CONSTRAINT SegMercado_id_pk PRIMARY KEY(ID);

-- Altera table para adicionar a chave estrangeira referente a table Seg
ALTER TABLE Cliente ADD CONSTRAINT Cliente_SegMercado_fk FOREIGN KEY(SegMercado_id) REFERENCES Segmercado(id);


