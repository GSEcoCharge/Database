
# 🗄️ Banco de Dados

## 📘 Introdução

Este documento apresenta o modelo conceitual do banco de dados do projeto **EcoCharge**. O banco de dados foi projetado para armazenar informações sobre usuários, veículos elétricos, postos de carregamento, reservas, histórico de carregamentos, avaliações e viagens planejadas para ser utilizado em um aplicativo de carregamento de veículos elétricos.

## 📐 Modelo Conceitual

### 1. **Usuario**
-   **Nome da tabela**: `gs_usuario`
-   **Descrição**: Armazena os dados do usuário.
-   **Atributos**:
    -   `usuario_id` (PK): ID do usuário.
    -   `nome`: Nome completo do usuário.
    -   `email`: Email do usuário.
    -   `senha`: Senha do usuário.
    -   `img_perfil`: Imagem de perfil do usuário.
    -   `data_criacao`: Data de criação do perfil.
    -   `ultima_localizacao`: Localização do usuário (latitude e longitude).

### 2. **Veiculo**
-   **Nome da tabela**: `gs_veiculo`
-   **Descrição**: Armazena informações sobre os veículos elétricos dos usuários.
-   **Atributos**:
    -   `veiculo_id` (PK): ID do veículo.
    -   `usuario_id` (FK): ID do usuário do veículo.
    -   `marca`: Marca do veículo.
    -   `modelo`: Modelo do veículo.
    -   `ano`: Ano de fabricação.
    -   `autonomia`: Autonomia do veículo (em km).
    -   `tipo_conector`: Tipo de conector do veículo.

### 3. **PostoCarregamento**
-   **Nome da tabela**: `gs_posto_carregamento`
-   **Descrição**: Representa um ponto de carregamento.
-   **Atributos**:
    -   `posto_id` (PK): ID do posto de carregamento.
    -   `nome`: Nome do posto de carregamento.
    -   `latitude`: Latitude da localização do posto.
    -   `longitude`: Longitude da localização do posto.
    -   `endereco`: Endereço do posto.
    -   `horario_funcionamento`: Horário de funcionamento.
    -   `formas_pagamento`: Métodos de pagamento aceitos.
    -   `avaliacao_media`: Avaliação média do posto.

### 4. **PontoCarregamento**
-  **Nome da tabela**: `gs_ponto_carregamento`
-   **Descrição**: Representa cada ponto de carregamento dentro de um posto.
-   **Atributos**:
    -   `ponto_id` (PK): ID do ponto de carregamento.
    -   `posto_id` (FK): ID do posto de carregamento.
    -   `tipo_conector`: Tipo de conector disponível.
    -   `velocidade_carregamento`: Velocidade de carregamento (em kW).
    -   `disponibilidade`: Estado atual do ponto de carregamento (disponível, ocupado).
    -   `reservavel`: Indica se o ponto pode ser reservado (booleano).

### 5. **Reserva**
-   **Nome da tabela**: `gs_reserva`
-   **Descrição**: Armazena dados de reservas realizadas pelos usuários para pontos de carregamento.
-   **Atributos**:
    -   `reserva_id` (PK): ID da reserva.
    -   `usuario_id` (FK): ID do usuário que fez a reserva.
    -   `ponto_id` (FK): ID do ponto de carregamento reservado.
    -   `data_reserva`: Data e hora da reserva.
    -   `status`: Status da reserva (ativa, concluída, cancelada).

### 6. **HistoricoCarregamento**
-   **Nome da tabela**: `gs_historico_carregamento`
-   **Descrição**: Registra os carregamentos realizados pelo usuário.
-   **Atributos**:
    -   `historico_id` (PK): ID do histórico.
    -   `usuario_id` (FK): ID do usuário.
    -   `ponto_id` (FK): ID do ponto onde ocorreu o carregamento.
    -   `data_carregamento`: Data e hora do carregamento.
    -   `energia_consumida`: Quantidade de energia consumida durante o carregamento (em kWh).
    -   `emissoes_evitas`: Cálculo das emissões evitadas com o uso de VE (em kg de CO₂).

### 7. **Avaliacao**
-   **Nome da tabela**: `gs_avaliacao`
-   **Descrição**: Registra as avaliações dos usuários sobre os postos de carregamento.
-   **Atributos**:
    -   `avaliacao_id` (PK): ID da avaliação.
    -   `usuario_id` (FK): ID do usuário que fez a avaliação.
    -   `posto_id` (FK): ID do posto de carregamento avaliado.
    -   `nota`: Nota dada pelo usuário (1-5).
    -   `comentario`: Comentário do usuário.
    -   `data_avaliacao`: Data da avaliação.

### 8. **Viagem**
-   **Nome da tabela**: `gs_viagem`
-   **Descrição**: Armazena informações sobre viagens planejadas.
-   **Atributos**:
    -   `viagem_id` (PK): ID da viagem.
    -   `usuario_id` (FK): ID do usuário que criou a viagem.
    -   `origem`: Ponto de origem da viagem (latitude e longitude).
    -   `destino`: Ponto de destino da viagem (latitude e longitude).
    -   `autonomia_restante`: Autonomia restante antes de iniciar a viagem (em km).
    -   `data_criacao`: Data de criação do plano de viagem.

### 9. **PontoParada**
-   **Nome da tabela**: `gs_ponto_parada`
-   **Descrição**: Representa pontos de parada sugeridos ao longo de uma viagem.
-   **Atributos**:
    -   `ponto_parada_id` (PK): ID do ponto de parada.
    -   `viagem_id` (FK): ID da viagem associada.
    -   `ponto_id` (FK): ID do ponto de carregamento sugerido como parada.
    -   `ordem`: Ordem do ponto de parada na viagem.
