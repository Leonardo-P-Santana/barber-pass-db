CREATE SCHEMA gestao_barbearia;

CREATE TABLE gestao_barbearia.BARBEARIA(
  id_barbearia              INT PRIMARY    KEY,
  nome_fantasia             VARCHAR(100)    NOT NULL,
  preco_creditos_globais    DECIMAL(10,2)   NOT NULL,
  latitude                  DECIMAL(10,6),
  longitude                 DECIMAL(10,6),
  end_rua                   VARCHAR(150),
  end_numero                VARCHAR(10),
  end_cidade                VARCHAR(100),
  end_cep                   VARCHAR(20),
  email                     VARCHAR(100)    UNIQUE  NOT NULL,
  saldo_devedor_plataforma  DECIMAL(10, 2)  DEFAULT 0.0
);

CREATE TABLE gestao_barbearia.CLIENTE(
  id_usuario        INT           PRIMARY KEY,
  cpf               VARCHAR(20)   UNIQUE  NOT NULL,
  nome_completo     VARCHAR(100)  NOT NULL,
  data_nascimento   DATE,
  idade             INT,
  email             VARCHAR(100)  UNIQUE  NOT NULL,
  ponto_nivel       INT           DEFAULT 0,
  saldo_cashback    DECIMAL(10,2) DEFAULT 0.0,
  saldo_creditos    DECIMAL(10,2) DEFAULT 0.0
);

CREATE TABLE gestao_barbearia.SERVICO(
  cod_servico       INT           PRIMARY KEY,
  descricao         VARCHAR(100),
  fator_peso        FLOAT         DEFAULT 1.0
);

CREATE TABLE gestao_barbearia.BARBEIRO(
  cpf_barbeiro      VARCHAR(20)   PRIMARY KEY,
  nome              VARCHAR(100)  NOT NULL,
  email             VARCHAR(100)  UNIQUE      NOT NULL,
  id_barbearia      INT           NOT NULL    REFERENCES  gestao_barbearia.BARBEARIA(id_barbearia),
  data_contratacao  DATE
);

CREATE TABLE gestao_barbearia.PLANO_GLOBAL(
  id_plano            INT           PRIMARY KEY,
  id_usuario          INT           NOT NULL    REFERENCES  gestao_barbearia.CLIENTE(id_usuario),
  ativo               BOOLEAN       DEFAULT TRUE,
  tipo_recorrencia    VARCHAR(50),
  categoria_permitida VARCHAR(100)
);

CREATE TABLE gestao_barbearia.FILA_ESPERA(
  cod_fila            INT           PRIMARY KEY,
  id_usuario          INT           NOT NULL    REFERENCES  gestao_barbearia.CLIENTE(id_usuario),
  id_barbearia        INT           NOT NULL    REFERENCES  gestao_barbearia.BARBEARIA(id_barbearia),
  data_desejada       TIMESTAMP     NOT NULL,
  notificado          BOOLEAN       DEFAULT FALSE,
  criado_em           TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE gestao_barbearia.CLUBE_FIDELIDADE(
  id_clube            INT           PRIMARY KEY,
  id_usuario          INT           NOT NULL    REFERENCES  gestao_barbearia.CLIENTE(id_usuario),
  id_barbearia        INT           NOT NULL    REFERENCES  gestao_barbearia.BARBEARIA(id_barbearia),
  cortes_restantes    INT           NOT NULL,
  validade            DATE
);

CREATE TABLE gestao_barbearia.AGENDAMENTO(
  cod_agendamento     INT           PRIMARY KEY,
  id_barbearia        INT           NOT NULL    REFERENCES  gestao_barbearia.BARBEARIA(id_barbearia),
  cpf_barbeiro        VARCHAR(20)   NOT NULL    REFERENCES  gestao_barbearia.BARBEIRO(cpf_barbeiro),
  id_usuario          INT           NOT NULL    REFERENCES  gestao_barbearia.CLIENTE(id_usuario),
  cod_servico         INT           NOT NULL    REFERENCES  gestao_barbearia.SERVICO(cod_servico),
  data_hora           TIMESTAMP     NOT NULL,
  valor_pago          DECIMAL(10,2) NOT NULL,
  creditos_debitados  FLOAT         DEFAULT 0.0,
  met_pagamento       VARCHAR(50)   NOT NULL,
  status              VARCHAR(30)   NOT NULL
);

CREATE TABLE gestao_barbearia.TELEFONE_BARBEARIA(
  id_telefone         INT           PRIMARY KEY,
  id_barbearia        INT           NOT NULL    REFERENCES  gestao_barbearia.BARBEARIA(id_barbearia),
  numero_telefone     VARCHAR(20)   NOT NULL,
  principal           BOOLEAN       DEFAULT FALSE
)


