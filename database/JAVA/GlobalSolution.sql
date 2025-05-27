set verify off;
set serveroutput on;


CREATE TABLE TB_LOCALIZACAO (
id_abrigo VARCHAR(255),
identificacao_unica_abriga VARCHAR(255),
latitude_abrigo VARCHAR(255),
longitude_abrigo VARCHAR(255),
rua_abrigo VARCHAR(255),
CONSTRAINT tb_localizacao_id_abrigo_pk PRIMARY KEY(id_abrigo)
);

CREATE TABLE TB_ABRIGO (
id_abrigo VARCHAR(255),
nome_abrigo VARCHAR(255),
capacidade_suportada_abrigo NUMBER,
email_abrigo VARCHAR(255),
CONSTRAINT tb_abrigo_id_abrigo_pk PRIMARY KEY(id_abrigo)
);

CREATE TABLE TB_USUARIO (
id_usuario VARCHAR(255),
nome_usuario VARCHAR(255),
email_usuario VARCHAR(255),
senha_usuario VARCHAR(255),
cpf_usuario VARCHAR(255),
telefone_usuario VARCHAR(255), 
data_nascimento TIMESTAMP,
data_criacao_usuario TIMESTAMP,
CONSTRAINT tb_usuario_id_usuario_pk PRIMARY KEY (id_usuario)
);

CREATE TABLE TB_TIPO_EMERGENCIA (
id_tipo_emergencia VARCHAR(255),
tipo_emergencia VARCHAR(255),
CONSTRAINT tb_tipo_emergencia_id_tipo_emergencia_pk PRIMARY KEY(id_tipo_emergencia)
)

CREATE TABLE TB_ABRIGO_TIPO_EMERGENCIA (
id_abrigo VARCHAR(255),
id_tipo_emergencia VARCHAR(255),
CONSTRAINT tb_abrigo_tipo_emergencia_id_abrigo_fk FOREIGN KEY(id_abrigo)
    REFERENCES TB_ABRIGO(id_abrigo),
CONSTRAINT tb_abrigo_tipo_emergencia_id_tipo_emergencia_fk FOREIGN KEY(id_tipo_emergencia)
    REFERENCES TB_TIPO_EMERGENCIA(id_tipo_emergencia)
);

