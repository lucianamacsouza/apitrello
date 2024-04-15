# Exercícios QA
Este projeto contém os 3 exercícios solicitados para o teste de automação de QA, explicados no arquivo Teste QA 1.docx

## Exercício 1
Neste exercício foi solicitada a construção de cenários de teste para a validação da funcionalidade de transferência de valores entre correntistas de um hipotético aplicativo bancário.
Os cenáris encobtram-se no arquivo outrosexercicios/2 - TransferenciaValoresCorentistas.feature da pasta "outros exercicios".

## Exercício 2
Neste exercício foi solicitada a construção de consultas SQL para um banco de dados de exemplo de controle de professores, alunos e disciplinas.
O exemplo foi construído utilizando o banco de dados PostgreSQL versão 15, e está contido no arquivo outrosexercicios/1 - Estrutura_E_Consultas_BD_Escola.sql da pasta "outrosexercicios", contendo 3 partes:
- Criação da estrutura do banco de dados
- Inclusão de dados de exemplo nas tabelas de dados
- Exemplos de consuktas conforme solicitado no exercício

## Exercício 3
Neste exercício foram criados casos de teste automatizados utilizando a API da aplicaçção Trello.
O objetivo desta automação é testar as seguntes operações:
- Cadastrar um board
- Cadastrar um card
- Excluir um card
- Excluir um board.

A automação foi criada para fazer estas operações na conta do Trello, utilixando as seguintes tecnologias:
- Java 17
- JUnit 5
- RestAssured
- Hamcrest
- Jackson