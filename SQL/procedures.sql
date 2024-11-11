/* ---------------------------- INSERT PROCEDURES --------------------------- */

CREATE OR REPLACE PROCEDURE insert_gs_usuario (
    p_nome IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_img_perfil IN BLOB DEFAULT NULL,
    p_ultima_localizacao IN VARCHAR2 DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_USUARIO (NOME, EMAIL, SENHA, IMG_PERFIL, ULTIMA_LOCALIZACAO)
    VALUES (p_nome, p_email, p_senha, p_img_perfil, p_ultima_localizacao);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_veiculo (
    p_usuario_id IN NUMBER,
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2,
    p_ano IN NUMBER DEFAULT NULL,
    p_autonomia IN NUMBER DEFAULT NULL,
    p_tipo_conector IN VARCHAR2 DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_VEICULO (USUARIO_ID, MARCA, MODELO, ANO, AUTONOMIA, TIPO_CONECTOR)
    VALUES (p_usuario_id, p_marca, p_modelo, p_ano, p_autonomia, p_tipo_conector);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_posto_carregamento (
    p_nome IN VARCHAR2,
    p_latitude IN NUMBER DEFAULT NULL,
    p_longitude IN NUMBER DEFAULT NULL,
    p_endereco IN VARCHAR2 DEFAULT NULL,
    p_horario_funcionamento IN VARCHAR2 DEFAULT NULL,
    p_formas_pagamento IN VARCHAR2 DEFAULT NULL,
    p_avaliacao_media IN NUMBER DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_POSTO_CARREGAMENTO (NOME, LATITUDE, LONGITUDE, ENDERECO, HORARIO_FUNCIONAMENTO, FORMAS_PAGAMENTO, AVALIACAO_MEDIA)
    VALUES (p_nome, p_latitude, p_longitude, p_endereco, p_horario_funcionamento, p_formas_pagamento, p_avaliacao_media);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_ponto_carregamento (
    p_posto_id IN NUMBER,
    p_tipo_conector IN VARCHAR2,
    p_velocidade_carregamento IN NUMBER DEFAULT NULL,
    p_disponibilidade IN VARCHAR2 DEFAULT 'disponível',
    p_reservavel IN CHAR DEFAULT 'N'
) AS
BEGIN
    INSERT INTO GS_PONTO_CARREGAMENTO (POSTO_ID, TIPO_CONECTOR, VELOCIDADE_CARREGAMENTO, DISPONIBILIDADE, RESERVAVEL)
    VALUES (p_posto_id, p_tipo_conector, p_velocidade_carregamento, p_disponibilidade, p_reservavel);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_reserva (
    p_usuario_id IN NUMBER,
    p_ponto_id IN NUMBER,
    p_data_reserva IN DATE,
    p_status IN VARCHAR2 DEFAULT 'ativa'
) AS
BEGIN
    INSERT INTO GS_RESERVA (USUARIO_ID, PONTO_ID, DATA_RESERVA, STATUS)
    VALUES (p_usuario_id, p_ponto_id, p_data_reserva, p_status);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_historico_carregamento (
    p_usuario_id IN NUMBER,
    p_ponto_id IN NUMBER,
    p_energia_consumida IN NUMBER DEFAULT NULL,
    p_EMISSOES_EVITADAS IN NUMBER DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_HISTORICO_CARREGAMENTO (USUARIO_ID, PONTO_ID, ENERGIA_CONSUMIDA, EMISSOES_EVITADAS)
    VALUES (p_usuario_id, p_ponto_id, p_energia_consumida, p_EMISSOES_EVITADAS);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_avaliacao (
    p_usuario_id IN NUMBER,
    p_posto_id IN NUMBER,
    p_nota IN NUMBER,
    p_comentario IN VARCHAR2 DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_AVALIACAO (USUARIO_ID, POSTO_ID, NOTA, COMENTARIO)
    VALUES (p_usuario_id, p_posto_id, p_nota, p_comentario);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_viagem (
    p_usuario_id IN NUMBER,
    p_origem IN VARCHAR2 DEFAULT NULL,
    p_destino IN VARCHAR2 DEFAULT NULL,
    p_autonomia_restante IN NUMBER DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_VIAGEM (USUARIO_ID, ORIGEM, DESTINO, AUTONOMIA_RESTANTE)
    VALUES (p_usuario_id, p_origem, p_destino, p_autonomia_restante);
END;
/

CREATE OR REPLACE PROCEDURE insert_gs_ponto_parada (
    p_viagem_id IN NUMBER,
    p_ponto_id IN NUMBER,
    p_ordem IN NUMBER DEFAULT NULL
) AS
BEGIN
    INSERT INTO GS_PONTO_PARADA (VIAGEM_ID, PONTO_ID, ORDEM)
    VALUES (p_viagem_id, p_ponto_id, p_ordem);
END;
/
