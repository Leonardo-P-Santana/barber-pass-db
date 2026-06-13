# 💈 Banco de Dados: Barber-Pass (Gestão de Barbearias)

Este repositório contém a modelagem, os scripts de definição (DDL) e de manipulação (DML) desenvolvidos em PostgreSQL (via Supabase) para a plataforma de gestão de barbearias Barber-Pass.

---

## 1. Cenário
O **Barber-Pass** é um sistema SaaS (Software as a Service) desenhado para modernizar o modelo de negócios de barbearias tradicionais. O sistema permite o agendamento digital de serviços, a venda de planos de assinatura global (com pagamentos recorrentes) e a fidelização de clientes através de um clube de recompensas com cortes gratuitos. A plataforma gere múltiplas unidades (filiais), dezenas de profissionais e centraliza as transações financeiras do catálogo de serviços.

---

## 2. Modelagem Conceitual
Abaixo encontra-se o modelo conceitual de dados, representando as entidades principais e os seus relacionamentos em alto nível, antes da normalização física.

<img width="1963" height="1508" alt="MER FINAL drawio" src="https://github.com/user-attachments/assets/a3c5222f-e305-4e50-9787-80c8a6c28c78" />

---

## 3. Modelagem Lógica
O Modelo Entidade-Relacionamento (MER) refinado, contendo tipos de dados, restrições de chaves primárias (PK), chaves estrangeiras (FK) e a normalização de atributos multivalorados.

<img width="1729" height="1506" alt="modelo logico - final drawio" src="https://github.com/user-attachments/assets/928567d3-9ff0-449a-beaa-de6e02b51093" />

---

## 4. Modelagem Física
A implementação física foi realizada num banco de dados relacional PostgreSQL na nuvem (Supabase). Todos os scripts de criação e inserção em lote encontram-se versionados na raiz deste repositório.

**Evidência da Criação das Tabelas e Schema:**
<img width="1158" height="777" alt="criação das  tabelas" src="https://github.com/user-attachments/assets/c9bf321d-62a0-44ce-836d-a06adf3ffd3e" />

---

## 5. CRUD (Operações Essenciais)
Demonstração das 4 operações básicas da linguagem SQL operando de forma transacional na tabela CLIENTE, atestando o funcionamento e a integridade do banco de dados.

### Create (Inserção de Dados)
<img width="1606" height="204" alt="insert dos values" src="https://github.com/user-attachments/assets/c8af1c77-502d-487c-a377-7e436f497791" />


### Read (Consulta de Dados)
<img width="779" height="810" alt="Consulta dados" src="https://github.com/user-attachments/assets/d0c5674a-7554-4ddb-a07c-faca5eab812b" />


### Update (Atualização de Dados)
<img width="511" height="199" alt="Update - atualizando dados" src="https://github.com/user-attachments/assets/c37c5987-b3ec-4c2d-9bcd-c9531c3590b8" />


### Delete (Exclusão de Dados)
<img width="577" height="219" alt="DELETE" src="https://github.com/user-attachments/assets/4fe92a53-a88a-4051-9537-26dd3aa8a75f" />


### Arquivo Completo de Consultas (10 Relatórios)
Para demonstrar a vasta capacidade de extração de dados da plataforma, foram desenvolvidos 10 scripts de Business Intelligence contemplando agregações, múltiplos joins e filtros complexos.
<img width="1001" height="760" alt="CONSULTAS TABELAS" src="https://github.com/user-attachments/assets/2530a533-e610-4202-8169-a193680ebd82" />

---

## 7. Evolução do Schema (Comandos DDL)
Durante o desenvolvimento do banco de dados, foram aplicadas técnicas de refatoração estrutural para garantir e melhorar a semântica do projeto sem a necessidade de recriar as tabelas do zero.

### Alteração de Nome de Coluna (Rename)
Comando utilizado para adequar a nomenclatura de uma coluna ao padrão do projeto.
<img width="670" height="336" alt="alter" src="https://github.com/user-attachments/assets/38fbac6a-4250-443e-b627-b961c03e782c" />


### Exclusão de Coluna (Drop Column)
Comando utilizado para remover a coluna física de 'telefone' da tabela principal, justificando a criação da tabela dependente e garantindo o suporte a atributos multivalorados (múltiplos telefones por barbearia).
<img width="462" height="119" alt="alter - drop" src="https://github.com/user-attachments/assets/27b54424-d5a0-4e23-81b1-736aa284e681" />

