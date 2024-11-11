# 🗄️ Banco de Dados

<details open>
    <summary><h3><strong>📑 Sumário</strong></h3>
        <ol>
            <li><a href="#introdução">Introdução</a></li>
            <li><a href="#documentação-online">Documentação Online</a></li>
            <li><a href="#modelo-conceitual">Modelo Conceitual</a></li>
        </ol>
    </summary>
</details>


<h2 id="introdução">📘 Introdução</h2>

Este documento apresenta o modelo conceitual do banco de dados do projeto **EcoCharge**. O banco de dados foi projetado para armazenar informações sobre usuários, veículos elétricos, postos de carregamento, reservas, histórico de carregamentos, avaliações e viagens planejadas para ser utilizado em um aplicativo de carregamento de veículos elétricos.

<h2 id="documentação-online">🌐 Documentação Online</h2>

[DbDocs](https://dbdocs.io/gutocebola/EcoCharge)

<h2 id="modelo-conceitual">📐 Modelo Conceitual</h2>

### 1. **Usuario**

- **Nome da tabela**: `gs_usuario`
- **Descrição**: Armazena os dados do usuário.
- **Atributos**:
  - `usuario_id` (PK): ID do usuário.
  - `nome`: Nome completo do usuário.
  - `email`: Email do usuário.
  - `senha`: Senha do usuário.
  - `img_perfil`: Imagem de perfil do usuário.
  - `data_criacao`: Data de criação do perfil.
  - `ultima_localizacao`: Localização do usuário (latitude e longitude).

### 2. **Veiculo**

- **Nome da tabela**: `gs_veiculo`
- **Descrição**: Armazena informações sobre os veículos elétricos dos usuários.
- **Atributos**:
  - `veiculo_id` (PK): ID do veículo.
  - `usuario_id` (FK): ID do usuário do veículo.
  - `marca`: Marca do veículo.
  - `modelo`: Modelo do veículo.
  - `ano`: Ano de fabricação.
  - `autonomia`: Autonomia do veículo (em km).
  - `tipo_conector`: Tipo de conector do veículo.

### 3. **PostoCarregamento**

- **Nome da tabela**: `gs_posto_carregamento`
- **Descrição**: Representa um ponto de carregamento.
- **Atributos**:
  - `posto_id` (PK): ID do posto de carregamento.
  - `nome`: Nome do posto de carregamento.
  - `latitude`: Latitude da localização do posto.
  - `longitude`: Longitude da localização do posto.
  - `endereco`: Endereço do posto.
  - `horario_funcionamento`: Horário de funcionamento.
  - `formas_pagamento`: Métodos de pagamento aceitos.
  - `avaliacao_media`: Avaliação média do posto.

### 4. **PontoCarregamento**

- **Nome da tabela**: `gs_ponto_carregamento`
- **Descrição**: Representa cada ponto de carregamento dentro de um posto.
- **Atributos**:
  - `ponto_id` (PK): ID do ponto de carregamento.
  - `posto_id` (FK): ID do posto de carregamento.
  - `tipo_conector`: Tipo de conector disponível.
  - `velocidade_carregamento`: Velocidade de carregamento (em kW).
  - `disponibilidade`: Estado atual do ponto de carregamento (disponível, ocupado).
  - `reservavel`: Indica se o ponto pode ser reservado (booleano).

### 5. **Reserva**

- **Nome da tabela**: `gs_reserva`
- **Descrição**: Armazena dados de reservas realizadas pelos usuários para pontos de carregamento.
- **Atributos**:
  - `reserva_id` (PK): ID da reserva.
  - `usuario_id` (FK): ID do usuário que fez a reserva.
  - `ponto_id` (FK): ID do ponto de carregamento reservado.
  - `data_reserva`: Data e hora da reserva.
  - `status`: Status da reserva (ativa, concluída, cancelada).

### 6. **HistoricoCarregamento**

- **Nome da tabela**: `gs_historico_carregamento`
- **Descrição**: Registra os carregamentos realizados pelo usuário.
- **Atributos**:
  - `historico_id` (PK): ID do histórico.
  - `usuario_id` (FK): ID do usuário.
  - `ponto_id` (FK): ID do ponto onde ocorreu o carregamento.
  - `data_carregamento`: Data e hora do carregamento.
  - `energia_consumida`: Quantidade de energia consumida durante o carregamento (em kWh).
  - `emissoes_evitas`: Cálculo das emissões evitadas com o uso de VE (em kg de CO₂).

### 7. **Avaliacao**

- **Nome da tabela**: `gs_avaliacao`
- **Descrição**: Registra as avaliações dos usuários sobre os postos de carregamento.
- **Atributos**:
  - `avaliacao_id` (PK): ID da avaliação.
  - `usuario_id` (FK): ID do usuário que fez a avaliação.
  - `posto_id` (FK): ID do posto de carregamento avaliado.
  - `nota`: Nota dada pelo B (1-5).
  - `comentario`: Comentário do usuário.
  - `data_avaliacao`: Data da avaliação.

### 8. **Viagem**

- **Nome da tabela**: `gs_viagem`
- **Descrição**: Armazena informações sobre viagens planejadas.
- **Atributos**:
  - `viagem_id` (PK): ID da viagem.
  - `usuario_id` (FK): ID do usuário que criou a viagem.
  - `origem`: Ponto de origem da viagem (latitude e longitude).
  - `destino`: Ponto de destino da viagem (latitude e longitude).
  - `autonomia_restante`: Autonomia restante antes de iniciar a viagem (em km).
  - `data_criacao`: Data de criação do plano de viagem.

### 9. **PontoParada**

- **Nome da tabela**: `gs_ponto_parada`
- **Descrição**: Representa pontos de parada sugeridos ao longo de uma viagem.
- **Atributos**:
  - `ponto_parada_id` (PK): ID do ponto de parada.
  - `viagem_id` (FK): ID da viagem associada.
  - `ponto_id` (FK): ID do ponto de carregamento sugerido como parada.
  - `ordem`: Ordem do ponto de parada na viagem.

## 📋 Requisitos do Projeto de Banco de Dados

- Modelagem de Banco de Dados Relacional (30 Pontos)

  - [ ] Desenvolver o modelo lógico e físico do banco de dados.
  - [x] Garantir que o modelo esteja na **3ª Forma Normal (3FN)**, com todas as cardinalidades corretas.
  - [x] Certificar-se de que cada entidade e relacionamento seja coerente com o tema da solução proposta.
  - [x] Implementar o modelo no banco de dados relacional **Oracle**.
  - [x] Criar os objetos no banco de dados (tabelas, chaves primárias, chaves estrangeiras, etc.).

- Procedures e Funções (30 Pontos)

  - [x] Criar **procedures** para realizar inserts no banco de dados.
  - [ ] Criar **2 funções** para cálculos ou validações de dados.
  - [x] Criar uma **trigger de auditoria** para cada tabela, monitorando as transações.
  - [ ] Inserir pelo menos **10 registros** em cada tabela usando as procedures, com dados coerentes com a solução proposta.
  - [ ] As funções devem usar **expressões regulares** (ex.: validação de formato de dados) e conter **tratamento de exceções**.
  - [ ] Criar uma **procedure para exportar um dataset no formato JSON** com dados relevantes para uma aplicação de IA.
  - **Nota**: Procedures com hard inserts ou valores fora do contexto da aplicação serão desconsideradas.

- Empacotamento de Objetos de Banco de Dados (10 Pontos)

  - [ ] Empacotar todos os objetos do banco (tabelas, procedures, funções, etc.) para garantir **modularidade** e **reusabilidade**.
  - [ ] Seguir boas práticas de empacotamento, agrupando os objetos de maneira lógica e acessível.

- Integração com Outras Linguagens do Curso (Java, C#, Mobile) (10 Pontos)

  - [ ] Usar a mesma base de dados relacional no backend da aplicação (Java, C# ou plataforma mobile).
  - [ ] As procedures criadas no item 2 devem ser chamadas via aplicação e demonstradas em vídeo.

- Importação para MongoDB (10 Pontos)

  - [ ] Importar o dataset exportado em JSON para o **MongoDB**, criando uma estrutura de dados coerente com um banco de documentos.
  - [ ] Organizar a estrutura MongoDB seguindo os princípios de bancos NoSQL, otimizando para consultas.

- Demonstração em Vídeo (10 Pontos)

  - [ ] Gravar um vídeo demonstrando:
    - [ ] A execução das procedures no backend da aplicação.
    - [ ] A inserção dos dados no banco relacional.
    - [ ] A exportação do dataset para JSON e sua importação no MongoDB.

## 📦 Entregáveis

- [ ] **Modelos Lógico e Físico** do banco de dados relacional (formato `.pdf`).
- [ ] **Procedures e funções personalizadas** com tratamento de exceções (formato `.sql`).
- [ ] **Arquivo JSON** gerado a partir do banco relacional.
- [ ] **Estrutura MongoDB** (código-fonte para criação e importação dos dados).
- [ ] **Vídeo demonstrativo** da execução de todas as partes descritas.
