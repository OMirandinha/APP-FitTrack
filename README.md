# Sistema de Gestão e Acompanhamento de Treinos

**Projeto de Trabalho de Conclusão de Curso (TCC) — Desenvolvimento de Sistemas — 2026**

## 📌 Sobre o projeto

O **Sistema de Gestão e Acompanhamento de Treinos** é um projeto acadêmico desenvolvido como Trabalho de Conclusão de Curso, com o objetivo de propor uma solução web para auxiliar na organização, no gerenciamento e no acompanhamento de treinos físicos.

A proposta é centralizar informações relacionadas a alunos, professores, exercícios, fichas de treino e registros de execução, contribuindo para uma gestão mais organizada das atividades e para o acompanhamento da evolução dos alunos.

O projeto está sendo desenvolvido de forma colaborativa, com divisão de responsabilidades entre os integrantes e organização das atividades por meio de Sprints.

## 🎯 Objetivos

- Desenvolver uma aplicação web voltada à gestão e ao acompanhamento de treinos.
- Organizar informações de alunos, professores, exercícios e treinos.
- Estruturar um banco de dados para armazenar e relacionar as informações do sistema.
- Possibilitar o registro e o acompanhamento da execução dos exercícios.
- Aplicar conhecimentos de análise, modelagem, desenvolvimento e banco de dados adquiridos durante o curso.
- Utilizar o Git e o GitHub para controle de versão e colaboração entre os integrantes.

## ⚙️ Funcionalidades previstas

As funcionalidades planejadas para o sistema incluem:

- **Gestão de usuários:** organização dos dados dos usuários do sistema.
- **Cadastro de alunos:** armazenamento e gerenciamento das informações dos alunos.
- **Gestão de professores:** organização dos dados dos professores.
- **Gerenciamento de exercícios:** cadastro e organização dos exercícios disponíveis.
- **Montagem de treinos:** associação de exercícios para estruturar os treinos.
- **Acompanhamento de treinos:** associação entre alunos e treinos.
- **Registro de execução:** armazenamento das informações referentes à realização dos exercícios.
- **Comunicação interna:** estrutura prevista para conversas e troca de mensagens.

> **Observação:** as funcionalidades acima representam o escopo planejado. Sua implementação e disponibilidade serão atualizadas conforme o andamento do projeto.

## 🛠️ Tecnologias e ferramentas

| Tecnologia ou ferramenta | Finalidade |
|---|---|
| HTML5 | Estruturação das páginas web |
| CSS3 | Estilização e organização visual da interface |
| JavaScript | Implementação de interações no lado do cliente |
| PHP | Desenvolvimento da lógica do servidor, conforme a implementação |
| MariaDB / MySQL | Gerenciamento do banco de dados relacional |
| Git | Controle de versão do código |
| GitHub | Hospedagem do repositório e colaboração da equipe |
| XAMPP | Ambiente local de desenvolvimento e testes |

*As tecnologias serão ajustadas nesta documentação conforme a implementação efetiva do sistema.*

## 🗂️ Organização do projeto

```text
APP-FitTrack/
├── README.md
└── TCC/
    ├── index.html                 # Apresentação
    ├── login.html
    ├── cadastro.html
    ├── inicio.html                # Painel e atalhos
    ├── alunos.html
    ├── treinos.html
    ├── exercicios.html
    ├── acompanhamento.html
    ├── mensagens.html
    ├── app.css                    # Estilos do protótipo
    ├── app.js                     # Navegação e validações visuais
    ├── style.css
    ├── script.js
    └── Banco de dados/
        └── Banco_de_Dados_Sistema_Treinos.sql
```

As páginas de cadastro, login e funções estão implementadas como protótipo de interface. Elas ainda não enviam nem salvam dados no banco.

## 🚀 Como executar o projeto

As instruções abaixo deverão ser ajustadas à estrutura e às tecnologias utilizadas na versão atual do sistema.

### Pré-requisitos

- Git instalado.
- XAMPP ou ambiente equivalente, caso sejam utilizados PHP e MariaDB/MySQL.
- Navegador atualizado.
- Arquivos do projeto disponíveis no repositório.

### 1. Clonar o repositório

No terminal, execute:

```bash
git clone URL_DO_REPOSITORIO
```

Substitua `URL_DO_REPOSITORIO` pelo endereço real do repositório no GitHub.

### 2. Acessar a pasta do projeto

```bash
cd NOME_DA_PASTA
```

Substitua `NOME_DA_PASTA` pelo nome da pasta criada durante a clonagem.

### 3. Abrir a interface

Abra `TCC/index.html` no navegador para ver a apresentação ou acesse diretamente `TCC/login.html`, `TCC/cadastro.html` e `TCC/inicio.html` para navegar pelo protótipo.

### 4. Configurar o backend (próxima etapa)

Se o projeto utilizar PHP e banco de dados local:

1. Inicie o Apache e o MariaDB/MySQL pelo XAMPP, conforme a configuração adotada.
2. Disponibilize os arquivos PHP no diretório adequado do servidor local.
3. Importe o arquivo SQL do projeto pelo phpMyAdmin, caso exista um script de criação do banco.
4. Configure as credenciais de conexão de acordo com o ambiente local.
5. Siga as instruções específicas adicionadas pela equipe à medida que a implementação avançar.

### 5. Executar a aplicação

A forma de execução dependerá da versão disponível no repositório. Caso exista apenas uma interface HTML, CSS e JavaScript, ela poderá ser aberta no navegador ou servida por um servidor local. Se houver integração com PHP e banco de dados, será necessário executar a aplicação pelo ambiente configurado.

## 👥 Equipe de desenvolvimento

Projeto desenvolvido por estudantes do curso técnico de Desenvolvimento de Sistemas.

| Integrante | Responsabilidade no Scrum |
|---|---|
| Augusto Camargo | Product Owner |
| Mateus | Scrum Master |
| Caroline | Desenvolvimento |
| Evandro | Desenvolvimento |
| Vitor | Desenvolvimento |

A divisão das responsabilidades poderá ser ajustada conforme as necessidades do projeto e os acordos da equipe.

## 🔄 Metodologia de trabalho

O desenvolvimento é organizado em Sprints, com planejamento e distribuição de tarefas entre os integrantes.

O Git e o GitHub são utilizados para manter o histórico de alterações, compartilhar o código-fonte e facilitar a integração do trabalho desenvolvido por cada integrante.

## 📈 Status do projeto

**Situação atual: em desenvolvimento.**

O projeto encontra-se em fase de construção e evolução. A documentação, a estrutura do banco de dados, a interface e as funcionalidades serão atualizadas conforme o avanço das etapas de desenvolvimento.

As próximas atualizações desta seção deverão registrar entregas concluídas, funcionalidades implementadas, testes realizados e melhorias incorporadas.

## 🤝 Contribuições

As contribuições são realizadas pelos integrantes da equipe, respeitando a organização das tarefas e o fluxo de trabalho definido para o projeto.

Antes de integrar alterações à versão principal, recomenda-se revisar o código, testar as modificações e manter os arquivos organizados.

## 🎓 Contexto acadêmico

Este projeto é desenvolvido como Trabalho de Conclusão de Curso do curso técnico de Desenvolvimento de Sistemas, com finalidade educacional e aplicação prática dos conhecimentos adquiridos durante a formação.

---

**Sistema de Gestão e Acompanhamento de Treinos**  
*Trabalho de Conclusão de Curso — 2026*
