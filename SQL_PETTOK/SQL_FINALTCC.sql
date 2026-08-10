CREATE DATABASE sistema_adocao;
USE sistema_adocao;


CREATE TABLE Doador (
    id_doador VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(150),
    senha VARCHAR(255)
);



CREATE TABLE Adotante (
    id_adotante VARCHAR(50) PRIMARY KEY,
    senha VARCHAR(255),
    email VARCHAR(150),
    telefone NUMERIC(15,0),
    nome VARCHAR(100),
    cidade VARCHAR(100)
);



CREATE TABLE Pet (
    id_pet VARCHAR(50) PRIMARY KEY,
    idade NUMERIC,
    microchipado integer,
    nome VARCHAR(100),
    raca VARCHAR(100),
    descricao VARCHAR(255),
    status_pet VARCHAR(50),
    foto VARCHAR(255),
    especie VARCHAR(100),

    fk_Doador_id_doador VARCHAR(50),

    CONSTRAINT fk_pet_doador
        FOREIGN KEY (fk_Doador_id_doador)
        REFERENCES Doador(id_doador)
);
--



CREATE TABLE Adocao (
    cdg_adocao VARCHAR(50) PRIMARY KEY,
    status_adocao VARCHAR(50),
    observacao VARCHAR(255),
    data_adocao DATE
);




CREATE TABLE hospeda (
    id_doador VARCHAR(50),
    id_pet VARCHAR(50),

    PRIMARY KEY (id_doador, id_pet),

    CONSTRAINT fk_hospeda_doador
        FOREIGN KEY (id_doador)
        REFERENCES Doador(id_doador),

    CONSTRAINT fk_hospeda_pet
        FOREIGN KEY (id_pet)
        REFERENCES Pet(id_pet)
);
--



CREATE TABLE sofre (
    id_pet VARCHAR(50),
    cdg_adocao VARCHAR(50),

    PRIMARY KEY (id_pet, cdg_adocao),

    CONSTRAINT fk_sofre_pet
        FOREIGN KEY (id_pet)
        REFERENCES Pet(id_pet),

    CONSTRAINT fk_sofre_adocao
        FOREIGN KEY (cdg_adocao)
        REFERENCES Adocao(cdg_adocao)
);
--

CREATE TABLE Adocao_Adotante_solicita (
    id_adotante VARCHAR(50),
    cdg_adocao VARCHAR(50),
    data_solicitacao DATE,
    status_solicitacao VARCHAR(50),

    PRIMARY KEY (id_adotante, cdg_adocao),

    CONSTRAINT fk_solicita_adotante
        FOREIGN KEY (id_adotante)
        REFERENCES Adotante(id_adotante),

    CONSTRAINT fk_solicita_adocao
        FOREIGN KEY (cdg_adocao)
        REFERENCES Adocao(cdg_adocao)
);




CREATE TABLE possui (
    id_mensagem VARCHAR(50),
    id_conversa VARCHAR(50),

    PRIMARY KEY (id_mensagem, id_conversa),

    CONSTRAINT fk_possui_mensagem
        FOREIGN KEY (id_mensagem)
        REFERENCES Mensagem(id_mensagem)
);
--

CREATE TABLE Conversa (
    id_conversa VARCHAR(50) PRIMARY KEY,
    id_doador VARCHAR(50),
    id_adotante VARCHAR(50),
    data_inicio DATE,

    CONSTRAINT fk_conversa_doador
        FOREIGN KEY (id_doador)
        REFERENCES Doador(id_doador),

    CONSTRAINT fk_conversa_adotante
        FOREIGN KEY (id_adotante)
        REFERENCES Adotante(id_adotante)
);

CREATE TABLE Mensagem (
    id_mensagem VARCHAR(50) PRIMARY KEY,
    texto VARCHAR(255),
    data_hora DATE,
    fk_Conversa_id_conversa VARCHAR(50),

    CONSTRAINT fk_mensagem_conversa
        FOREIGN KEY (fk_Conversa_id_conversa)
        REFERENCES Conversa(id_conversa)
);



CREATE TABLE Conversa_dialoga (
    id_doador VARCHAR(50),
    id_adotante VARCHAR(50),
    fk_Pet_id_pet VARCHAR(50),
    fk_Conversa_id_conversa VARCHAR(50),
    data_inicio DATE,

    PRIMARY KEY (
        id_doador,
        id_adotante,
        fk_Pet_id_pet,
        fk_Conversa_id_conversa
    ),


    CONSTRAINT fk_conversa_pet
        FOREIGN KEY (fk_Pet_id_pet)
        REFERENCES Pet(id_pet)
);
--