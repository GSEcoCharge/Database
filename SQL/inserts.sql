/* ----------------------- RESET TABLES AND SEQUENCES ----------------------- */

BEGIN
 
    -- Clear all tables
    DELETE FROM GS_PONTO_PARADA;
    DELETE FROM GS_VIAGEM;
    DELETE FROM GS_AVALIACAO;
    DELETE FROM GS_HISTORICO_CARREGAMENTO;
    DELETE FROM GS_RESERVA;
    DELETE FROM GS_PONTO_CARREGAMENTO;
    DELETE FROM GS_POSTO_CARREGAMENTO;
    DELETE FROM GS_VEICULO;
    DELETE FROM GS_USUARIO;
 
    -- Reset all sequences
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_USUARIO_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_USUARIO_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_VEICULO_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_VEICULO_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_POSTO_CARREGAMENTO_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_POSTO_CARREGAMENTO_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_PONTO_CARREGAMENTO_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_PONTO_CARREGAMENTO_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_RESERVA_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_RESERVA_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_HISTORICO_CARREGAMENTO_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_HISTORICO_CARREGAMENTO_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_AVALIACAO_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_AVALIACAO_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_VIAGEM_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_VIAGEM_SEQ START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'DROP SEQUENCE GS_PONTO_PARADA_SEQ';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE GS_PONTO_PARADA_SEQ START WITH 1 INCREMENT BY 1';
END;
/

/* --------------------------------- INSERTS -------------------------------- */

BEGIN
    INSERT_GS_USUARIO('Carlos Santos', 'carlos@example.com', 'senha123');
    INSERT_GS_USUARIO('Ana Silva', 'ana.silva@example.com', 'senha456', NULL, 'SP');
    INSERT_GS_USUARIO('José Oliveira', 'jose.oliveira@example.com', 'senha789', NULL, 'RJ');
    INSERT_GS_USUARIO('Mariana Souza', 'mariana.souza@example.com', 'senha101112', NULL, 'MG');
    INSERT_GS_USUARIO('Pedro Lima', 'pedro.lima@example.com', 'senha131415', NULL, 'BA');
END;
/

SELECT
    *
FROM
    GS_USUARIO;

BEGIN
    INSERT_GS_VEICULO(1, 'Tesla', 'Model S', 2021, 500, 'Tipo 2');
    INSERT_GS_VEICULO(2, 'Nissan', 'Leaf', 2019, 240, 'CHAdeMO');
    INSERT_GS_VEICULO(3, 'Chevrolet', 'Bolt', 2020, 380, 'CSS');
    INSERT_GS_VEICULO(4, 'BMW', 'i3', 2018, 290, 'Tipo 2');
    INSERT_GS_VEICULO(5, 'Renault', 'Zoe', 2017, 300, 'CSS');
END;
/

BEGIN
    INSERT_GS_POSTO_CARREGAMENTO('Posto Central', -23.5558, -46.6396, 'Rua A, SP', '24 horas', 'Cartão, Dinheiro', 4.8);
    INSERT_GS_POSTO_CARREGAMENTO('EletroPosto', -22.9035, -43.2096, 'Av B, RJ', '08:00-20:00', 'Cartão', 4.5);
    INSERT_GS_POSTO_CARREGAMENTO('EcoCharge', -19.9191, -43.9386, 'Rua C, BH', '06:00-22:00', 'Cartão, Pix', 4.7);
    INSERT_GS_POSTO_CARREGAMENTO('Carga Rápida', -30.0277, -51.2287, 'Av D, POA', '24 horas', 'Dinheiro, Pix', 4.3);
    INSERT_GS_POSTO_CARREGAMENTO('PowerCharge', -12.9714, -38.5014, 'Av E, SSA', '07:00-23:00', 'Cartão', 4.6);
END;
/

BEGIN
    INSERT_GS_PONTO_CARREGAMENTO(1, 'Tipo 2', 22, 'disponível', 'S');
    INSERT_GS_PONTO_CARREGAMENTO(2, 'CHAdeMO', 50, 'ocupado', 'N');
    INSERT_GS_PONTO_CARREGAMENTO(3, 'CSS', 100, 'ocupado', 'S');
    INSERT_GS_PONTO_CARREGAMENTO(4, 'Tipo 2', 43, 'disponível', 'N');
    INSERT_GS_PONTO_CARREGAMENTO(5, 'CSS', 75, 'disponível', 'S');
END;
/

BEGIN
    INSERT_GS_RESERVA(1, 1, TO_DATE('2021-10-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ativa');
    INSERT_GS_RESERVA(2, 2, TO_DATE('2021-10-11 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ativa');
    INSERT_GS_RESERVA(3, 3, TO_DATE('2021-10-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'cancelada');
    INSERT_GS_RESERVA(4, 4, TO_DATE('2021-10-13 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'concluída');
    INSERT_GS_RESERVA(5, 5, TO_DATE('2021-10-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ativa');
END;
/

BEGIN
    INSERT_GS_HISTORICO_CARREGAMENTO(1, 1, 10.5, 0.8);
    INSERT_GS_HISTORICO_CARREGAMENTO(2, 2, 15.0, 1.1);
    INSERT_GS_HISTORICO_CARREGAMENTO(3, 3, 20.2, 1.5);
    INSERT_GS_HISTORICO_CARREGAMENTO(4, 4, 8.0, 0.6);
    INSERT_GS_HISTORICO_CARREGAMENTO(5, 5, 12.5, 1.0);
END;
/

BEGIN
    INSERT_GS_AVALIACAO(1, 1, 5, 'Excelente posto!');
    INSERT_GS_AVALIACAO(2, 2, 4, 'Bom, mas poderia ser mais rápido.');
    INSERT_GS_AVALIACAO(3, 3, 3, 'Regular, teve fila.');
    INSERT_GS_AVALIACAO(4, 4, 5, 'Ótimo atendimento.');
    INSERT_GS_AVALIACAO(5, 5, 2, 'Não recomendo.');
END;
/

BEGIN
    INSERT_GS_VIAGEM(1, 'São Paulo', 'Rio de Janeiro', 300);
    INSERT_GS_VIAGEM(2, 'Belo Horizonte', 'Brasília', 250);
    INSERT_GS_VIAGEM(3, 'Curitiba', 'Florianópolis', 200);
    INSERT_GS_VIAGEM(4, 'Porto Alegre', 'Montevidéu', 150);
    INSERT_GS_VIAGEM(5, 'Salvador', 'Recife', 350);
END;
/

BEGIN
    INSERT_GS_PONTO_PARADA(1, 1, 1);
    INSERT_GS_PONTO_PARADA(2, 2, 1);
    INSERT_GS_PONTO_PARADA(3, 3, 1);
    INSERT_GS_PONTO_PARADA(4, 4, 1);
    INSERT_GS_PONTO_PARADA(5, 5, 1);
END;
/