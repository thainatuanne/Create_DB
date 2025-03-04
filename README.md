# Create_DB

- Este repositório contém a modelagem e implementação de um **banco de dados relacional** utilizando **PostgreSQL**, criado no **Neon Console** e gerenciado via **DBeaver**. O objetivo é estruturar um banco eficiente para armazenar informações sobre **clientes, vendas, produtos, serviços e acessos**, garantindo **integridade referencial e consultas otimizadas**.

## 🏗 **Estrutura do Banco**
O banco é composto pelas seguintes tabelas principais:

- **`estado`** e **`cidade`**: Organização geográfica dos clientes.
- **`cliente`**: Dados cadastrais dos clientes.
- **`veiculo`**: Veículos vinculados a clientes.
- **`formaPagamento`**: Tipos de pagamento aceitos.
- **`vendas`**: Registro de compras realizadas.
- **`produto`** e **`servico`**: Itens disponíveis para venda.
- **`itensVendas`**: Associação entre vendas, produtos e serviços.
- **`acompanhamento`**: Controle do status das vendas.
- **`acesso`**: Gerenciamento de usuários e permissões.

## ⚙ **Tecnologias Utilizadas**
- **Banco de Dados:** PostgreSQL
- **Gerenciamento:** Neon Console e DBeaver
- **Linguagem SQL:** DDL e DML para modelagem e manipulação de dados

## 🛠 **Principais Funcionalidades**
✔ Estruturação com **chaves primárias e estrangeiras**  
✔ Exclusão em cascata **(ON DELETE CASCADE)**  
✔ Uso de **ENUMs** para status e tipos de usuário  
✔ **Scripts SQL** para criação, inserção e consulta de dados  

## 📌 **Como Usar**
1️⃣ **Clone o repositório**:
```sh
git clone https://github.com/thainatuanne/Create_DB.git
