# 035 — Vendo o banco de dados com o pgAdmin

> **Neste capítulo:** você vai instalar o **pgAdmin**, um programa para **ver** o banco de dados do projeto com janelas, tabelas e botões. Vai entender por que o Rails entra no banco sem senha e o pgAdmin não, e fazer a sua primeira consulta SQL no banco do Território Inteligente.

**Tempo estimado:** 30 a 40 minutos.

---

## Antes de começar

- [ ] Você terminou o capítulo **030**, e o projeto rodou em `http://localhost:3000`
- [ ] Você sabe a **sua senha** do computador (o `sudo` vai pedir)

---

## Parte 1 — Por que o pgAdmin?

Até agora, o banco de dados é uma caixa-preta: o Rails guarda e busca coisas lá dentro, mas você não vê nada.

O **pgAdmin** é uma **janela para dentro do banco**. Com ele, você vê as tabelas, as colunas e os dados como numa planilha, e também pode escrever consultas SQL, como no 1º trimestre.

### Cliente e servidor

O PostgreSQL funciona como um **restaurante**:

- O **servidor** PostgreSQL é a **cozinha**: guarda os ingredientes (os dados) e prepara os pedidos. Ele fica ligado o tempo todo, como vimos no capítulo 020.
- Os **clientes** são quem faz os pedidos. O **Rails** é um cliente, o **`psql`** é outro, e o **pgAdmin** vai ser mais um.

Vários clientes podem falar com a mesma cozinha ao mesmo tempo. Você pode deixar o projeto rodando e olhar os dados no pgAdmin ao mesmo tempo.

---

## Parte 2 — Instalando o pgAdmin

O pgAdmin **não está** na loja padrão do Kubuntu. Vamos acrescentar a "loja oficial" do pgAdmin ao `apt`.

### 2.1 Baixar a chave de assinatura

```bash
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /etc/apt/keyrings/packages-pgadmin-org.gpg
```

- `curl -fsS ...` baixa a **chave pública** dos responsáveis pelo pgAdmin. `-f` falha em caso de erro, e `-sS` esconde a barra de progresso, mas mostra os erros.
- `| sudo gpg --dearmor -o ...` converte a chave para o formato que o `apt` entende e salva em `/etc/apt/keyrings/`, a pasta das chaves confiáveis do sistema.

> 🕵️ **Pensamento hacker:** lembra das chaves SSH do capítulo 030? Aqui é a mesma ideia, ao contrário. Os responsáveis pelo pgAdmin **assinam** os pacotes com a chave privada deles. Com a chave pública que você baixou, o `apt` confere se cada pacote veio mesmo deles e não foi alterado no caminho.

### 2.2 Cadastrar a loja do pgAdmin

```bash
sudo sh -c 'echo "deb [signed-by=/etc/apt/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
```

Este é longo, então vamos por partes:

- `sudo sh -c '...'` executa tudo entre aspas como administrador.
- `echo "deb ..." > /etc/apt/sources.list.d/pgadmin4.list` cria um arquivo com o endereço da loja do pgAdmin. Os arquivos da pasta `sources.list.d` são a lista de lojas que o `apt` consulta.
- `[signed-by=...]` diz: *"só aceite pacotes desta loja assinados com a chave do passo 2.1"*.
- `$(lsb_release -cs)` é trocado automaticamente pelo **apelido** da versão do seu Kubuntu. Teste sozinho: `lsb_release -cs`.
- `&& apt update`: o `&&` significa *"se o primeiro comando deu certo, rode o segundo"*. Aqui, ele atualiza a lista da loja, agora incluindo o pgAdmin.

### 2.3 Instalar

```bash
sudo apt install -y pgadmin4-desktop
```

- `pgadmin4-desktop` é a versão que abre como um **programa normal** no seu computador. Existe também uma versão web, para servidores, mas não precisamos dela.

Abra o pgAdmin pelo menu do Kubuntu: procure por **pgAdmin 4**. Na primeira vez, ele demora um pouco para abrir.

---

## Parte 3 — Por que o Rails entra sem senha e o pgAdmin não?

Se você tentar conectar agora, o pgAdmin vai mostrar este erro:

```
FATAL: password authentication failed for user "seu-usuario"
```

Parece estranho: o projeto funciona e o Rails nunca pediu senha. A explicação é que o PostgreSQL tem **duas portas de entrada**:

| Entrada | Quem usa | Como o PostgreSQL confere quem é você | Comparação |
| --- | --- | --- | --- |
| **Socket local** (um arquivo especial em `/var/run/postgresql`) | Rails e `psql` | Pergunta ao Linux quem é o usuário (`peer`). Não pede senha | A porta dos fundos, onde o porteiro reconhece o morador pelo rosto |
| **Rede TCP** (o endereço `localhost`, porta `5432`) | pgAdmin | Pede **senha** (`scram-sha-256`) | O portão da rua, onde todo mundo mostra o crachá, até quem mora no prédio |

No capítulo 020, criamos o seu usuário no banco **sem senha**, porque o Rails só usa a porta dos fundos. Para o pgAdmin entrar pelo portão da rua, o seu usuário precisa de uma **senha**.

### 3.1 Criar a senha do seu usuário no banco

Entre no banco pela porta dos fundos, que funciona sem senha:

```bash
psql -d postgres
```

O terminal muda: aparece algo como `postgres=>`. Agora você está **dentro do PostgreSQL**. Digite:

```
\password
```

- Comandos que começam com `\` são comandos do `psql`, não de SQL.
- `\password` cria ou troca a senha **do seu usuário**. Digite a senha duas vezes. Como sempre, **nada aparece enquanto você digita**.

> 🔐 **No laboratório, use a mesma senha do seu usuário do computador.** Assim você tem uma senha a menos para lembrar.
>
> ⚠️ **Atenção:** isso é um combinado **só para o laboratório**. Aqui o banco aceita conexões apenas do próprio computador e guarda só dados de teste. Num servidor de verdade, acessível pela internet, como o que vai hospedar o Território Inteligente, **cada serviço tem a sua própria senha, forte e diferente das outras**. Se uma senha vaza, ela não pode abrir todas as portas. E nunca repita a senha do GitHub em lugar nenhum.

Para sair do `psql`:

```
\q
```

> **E o Rails?** Continua igual. Ele segue entrando pela porta dos fundos, sem senha. A senha nova serve só para quem entra pelo portão da rua, como o pgAdmin.

---

## Parte 4 — Conectando o pgAdmin ao banco

1. No pgAdmin, no painel da esquerda, clique com o botão direito em **Servers** → **Register** → **Server...**
2. Na aba **General**, em **Name**, escreva: `Território Inteligente (local)`. Esse é só o nome que aparece para você.
3. Na aba **Connection**, preencha:

| Campo | O que colocar | Por quê |
| --- | --- | --- |
| **Host name/address** | `localhost` | O banco está no seu próprio computador |
| **Port** | `5432` | A porta padrão do PostgreSQL |
| **Maintenance database** | `postgres` | Um banco que sempre existe, usado para a primeira conexão |
| **Username** | o seu usuário do Kubuntu (o mesmo de `echo $USER`) | O usuário do banco que criamos no capítulo 020 |
| **Password** | a senha que você criou no passo 3.1 | A senha do portão da rua |
| **Save password?** | ligado | Para não digitar toda vez. A senha fica guardada só no **seu** usuário do computador |

4. Clique em **Save**.

Se não apareceu nenhum erro, o servidor aparece no painel da esquerda. 🎉

---

## Parte 5 — Passeando pelo banco do projeto

No painel da esquerda, vá abrindo as setinhas:

```
Servers
└── Território Inteligente (local)
    └── Databases
        ├── postgres
        ├── territorio_inteligente_development   ← o banco do projeto
        └── territorio_inteligente_test
```

### Três bancos? Por quê?

| Banco | Para que serve |
| --- | --- |
| `territorio_inteligente_development` | O banco que você usa enquanto **desenvolve**, em `localhost:3000` |
| `territorio_inteligente_test` | Usado só pelos **testes automáticos**. É apagado e recriado o tempo todo |
| `postgres` | O banco de manutenção do próprio PostgreSQL. Não é do projeto |

O `bin/setup` do capítulo 030 criou os dois bancos do projeto. O Rails dá a cada **ambiente** o seu próprio banco, para que um teste nunca apague os dados com que você está trabalhando.

### As tabelas

Abra:

```
territorio_inteligente_development
└── Schemas
    └── public
        └── Tables
```

Por enquanto, existem só duas tabelas, e as duas foram criadas pelo **próprio Rails**:

| Tabela | O que guarda |
| --- | --- |
| `schema_migrations` | A lista das **migrations** que já rodaram neste banco. Uma migration é um arquivo que muda a estrutura do banco: criar uma tabela, acrescentar uma coluna. Vamos escrever a primeira em breve |
| `ar_internal_metadata` | Anotações do Rails sobre este banco, como em qual ambiente ele está. Fica preenchida quando rodar a primeira migration |

À medida que formos criando as tabelas do projeto, elas vão aparecer aqui.

---

## Parte 6 — Sua primeira consulta no banco do projeto

1. Clique em **`territorio_inteligente_development`** para selecionar o banco.
2. No menu de cima, clique em **Tools** → **Query Tool**.
3. Escreva a consulta:

```sql
SELECT current_database(), current_user;
```

4. Aperte **F5** (ou clique no botão ▶) para executar.

Embaixo, aparece o resultado: o nome do banco em que você está (`territorio_inteligente_development`) e o seu usuário. Essas duas funções do PostgreSQL respondem às perguntas *"onde estou?"* e *"quem sou eu?"*.

Agora, peça ao banco a lista das tabelas do projeto:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
```

- `information_schema` é um "catálogo" que todo banco PostgreSQL tem, com informações **sobre o próprio banco**: quais tabelas existem, quais colunas cada uma tem.
- `WHERE table_schema = 'public'` filtra só as tabelas do projeto.

Devem aparecer as duas tabelas que você viu na Parte 5: `schema_migrations` e `ar_internal_metadata`. É a mesma informação da árvore da esquerda, agora pedida em SQL.

Por fim, olhe o conteúdo de uma delas:

```sql
SELECT * FROM schema_migrations;
```

Vai voltar **vazio**: aparece o nome da coluna (`version`), mas nenhuma linha. Isso **não é erro**. A tabela existe, só não tem nada guardado ainda, porque não escrevemos nenhuma migration. O mesmo acontece com a `ar_internal_metadata`.

Guarde esta consulta. Quando criarmos a primeira migration, volte aqui e veja as linhas novas aparecerem nas duas tabelas.

> 💡 **Dica:** o mesmo SQL funciona no terminal. Dentro da pasta do projeto, rode `bin/rails dbconsole`. O Rails abre o `psql` já conectado no banco certo. Para sair, `\q`.

---

## ⚠️ Combinado importante: o pgAdmin é para **olhar**

O pgAdmin deixa você editar dados, apagar linhas e até criar e apagar tabelas com poucos cliques. **No nosso projeto, não fazemos isso.**

- A **estrutura** do banco (tabelas e colunas) muda **somente por migrations**, que ficam no código, no GitHub, e chegam iguais para a equipe toda. Uma tabela criada à mão no pgAdmin existe **só no seu computador**, e o projeto dos colegas quebra.
- Os **dados** de teste vêm dos **seeds** do projeto, que vamos criar juntos.

Use o pgAdmin para **ver, entender e consultar** com `SELECT`. Para mudar, use o Rails.

---

## Deu problema?

| Mensagem ou problema | O que fazer |
| --- | --- |
| `password authentication failed for user "..."` | O seu usuário do banco ainda não tem senha, ou a senha digitada está errada. Refaça o passo 3.1. |
| `role "..." does not exist` | O **Username** no pgAdmin está diferente do seu usuário do Kubuntu. Confira com `echo $USER`. |
| `connection refused` | O PostgreSQL está desligado. Veja o passo 4.1 do capítulo 020. |
| `Unable to locate package pgadmin4-desktop` | O passo 2.2 não deu certo. Confira o arquivo com `cat /etc/apt/sources.list.d/pgadmin4.list` e rode `sudo apt update`. |
| `NO_PUBKEY` durante o `apt update` | A chave do passo 2.1 não foi salva. Rode o passo 2.1 de novo. |
| O banco `territorio_inteligente_development` não aparece | Clique com o botão direito em **Databases** → **Refresh**. Se continuar sumido, rode `bin/setup` de novo na pasta do projeto. |
| As tabelas não aparecem | Clique com o botão direito em **Tables** → **Refresh**. |

---

## Palavras novas deste capítulo

| Palavra | O que significa |
| --- | --- |
| **pgAdmin** | Um programa com janelas para ver e consultar bancos PostgreSQL. |
| **Cliente / servidor** | O servidor guarda e entrega os dados; os clientes (Rails, `psql`, pgAdmin) fazem os pedidos. |
| **Socket local** | Uma entrada do banco que só funciona dentro do próprio computador. O Rails usa essa. |
| **TCP** | O jeito como os programas conversam pela rede, mesmo quando o destino é o próprio computador (`localhost`). |
| **Assinatura de pacote** | A garantia de que um programa veio mesmo de quem diz e não foi alterado. |
| **Ambiente** | O "modo" em que o Rails roda: desenvolvimento, teste ou produção. Cada um tem o seu banco. |
| **Migration** | Um arquivo do projeto que muda a estrutura do banco de forma registrada e repetível. |

---

## O que aprendemos

- O PostgreSQL é um **servidor**; o Rails, o `psql` e o pgAdmin são **clientes**.
- Existem **duas portas de entrada**: o socket local, que reconhece o usuário do Linux, e a rede TCP, que pede senha.
- Pacotes de fora da loja padrão são **assinados**, e a chave pública confere a assinatura.
- O Rails dá a cada **ambiente** o seu próprio banco.
- A estrutura do banco muda **por migrations**, nunca à mão. O pgAdmin é para **olhar**.

**Próximo capítulo:** em breve.

---

## Fontes

- [pgAdmin 4 — instalação pelo APT (pgadmin.org)](https://www.pgadmin.org/download/pgadmin-4-apt/)
