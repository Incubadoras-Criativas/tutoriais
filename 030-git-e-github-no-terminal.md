# 030 — Git e GitHub no terminal

> **Neste capítulo:** você vai entender o que é o **git**, se apresentar para ele, criar uma **chave SSH** para provar ao GitHub quem você é, baixar o projeto Território Inteligente e colocá-lo para rodar no seu computador.

**Tempo estimado:** 1 hora.

---

## Antes de começar

- [ ] Você terminou o capítulo **010** (tem conta no GitHub e aceitou o convite da organização)
- [ ] Você terminou o capítulo **020** (o checklist final passou sem erros)
- [ ] Você está com o **celular** à mão (o GitHub pode pedir o código do 2FA)

---

## Parte 1 — O que é o git?

Imagine um jogo com **pontos de salvamento**. Você salva antes de enfrentar o chefe. Se der errado, volta para o ponto salvo e tenta de novo.

O **git** faz isso com código. Cada ponto de salvamento se chama **commit**, e cada commit guarda:

- **o que** mudou nos arquivos;
- **quem** fez a mudança;
- **quando** foi feita;
- **por que** foi feita (uma mensagem escrita por quem fez).

Mas o git vai além de um jogo, porque **várias pessoas** trabalham no mesmo projeto ao mesmo tempo, cada uma no seu computador. Para isso existem mais três ideias:

| Palavra | O que é | No nosso projeto |
| --- | --- | --- |
| **Repositório** | A pasta do projeto, com toda a sua história | `territorio-inteligente` |
| **Remoto** | Uma cópia do repositório guardada num servidor, que todo mundo compartilha | O repositório no GitHub |
| **Branch** (ramo) | Uma linha paralela de trabalho, para mexer sem atrapalhar ninguém | Você vai criar a sua no capítulo 040 |

**git** e **GitHub** são coisas diferentes:

- O **git** é o programa que roda no **seu computador** e guarda a história.
- O **GitHub** é o **site** onde a cópia compartilhada fica guardada.

---

## Parte 2 — Apresente-se ao git

Cada commit leva o nome e o e-mail de quem fez. Por isso, antes de tudo, o git precisa saber quem você é.

### 2.1 Escolha o e-mail que vai aparecer nos commits

O e-mail dos commits fica **visível** para quem vê o código. Para proteger o seu e-mail pessoal, o GitHub oferece um **e-mail de privacidade**:

1. No GitHub, clique na **sua foto** → **Settings**.
2. No menu da esquerda, clique em **Emails**.
3. Marque a opção **Keep my email addresses private** (manter meus e-mails privados).
4. Logo abaixo, vai aparecer um e-mail parecido com `12345678+seu-usuario@users.noreply.github.com`. **Copie esse e-mail.**

### 2.2 Configure o git

Troque os textos entre aspas pelos seus dados:

```bash
git config --global user.name "seu-usuario-do-github"
git config --global user.email "12345678+seu-usuario@users.noreply.github.com"
```

- `git config` = muda uma configuração do git.
- `--global` = vale para **todos** os projetos do seu usuário.
- `user.name` = o nome que aparece nos commits. Use o seu **nome de usuário do GitHub** (lembre: nada de nome completo).
- `user.email` = o e-mail de privacidade que você copiou.

Mais uma configuração, para o seu ramo principal se chamar `main`, como no GitHub:

```bash
git config --global init.defaultBranch main
```

Confira tudo:

```bash
git config --global --list
```

Devem aparecer as três linhas que você configurou.

---

## Parte 3 — A chave SSH: o seu crachá digital

O repositório do projeto é **privado**. Só membros da organização podem baixar o código. Então o GitHub precisa ter certeza de que **é você mesmo** quem está pedindo.

Digitar senha toda hora seria chato e inseguro. Por isso, vamos usar uma **chave SSH**.

### Como funciona: o cadeado e a chave

Uma chave SSH é, na verdade, um **par** de arquivos:

| Arquivo | Comparação | O que fazer com ele |
| --- | --- | --- |
| **Chave pública** (`.pub`) | Um **cadeado aberto** | Pode distribuir à vontade. Você vai entregar uma cópia ao GitHub |
| **Chave privada** (sem `.pub`) | A **única chave** que abre esse cadeado | **Nunca** mostre, envie ou copie para ninguém |

Quando você se conecta, o GitHub fecha uma mensagem com o seu cadeado e diz: *"se você é mesmo quem diz ser, abra isto"*. Só a sua chave privada consegue. Assim, você prova quem é **sem nunca enviar a chave pela internet**.

Essa ideia se chama **criptografia de chave pública**. Ela protege bancos, sites com cadeado no navegador (HTTPS) e servidores no mundo todo. E você vai usar a mesma coisa para acessar servidores Linux mais adiante no curso.

### 3.1 Criar o par de chaves

Troque o e-mail pelo seu e-mail de privacidade do GitHub:

```bash
ssh-keygen -t ed25519 -C "12345678+seu-usuario@users.noreply.github.com"
```

- `ssh-keygen` = gera um par de chaves.
- `-t ed25519` = o tipo de criptografia. O `ed25519` é moderno, seguro e gera chaves pequenas.
- `-C "..."` = um comentário para identificar a chave. Usamos o e-mail.

O programa vai fazer três perguntas:

1. **Onde salvar** (`Enter file in which to save the key`): só aperte **Enter**, para aceitar o lugar padrão (`~/.ssh/id_ed25519`).
2. **Senha da chave** (`Enter passphrase`): crie uma senha. Ela protege a sua chave caso alguém use o seu computador. Como no `sudo`, **nada aparece enquanto você digita**.
3. **Confirme a senha** (`Enter same passphrase again`): digite de novo.

Ao final, aparece um desenho estranho feito de símbolos (o *randomart*). É só uma "impressão digital" visual da sua chave. Pronto, o par foi criado!

Veja os dois arquivos:

```bash
ls ~/.ssh
```

Devem aparecer `id_ed25519` (a **privada**) e `id_ed25519.pub` (a **pública**).

### 3.2 Entregar o cadeado ao GitHub

Mostre a chave **pública** na tela:

```bash
cat ~/.ssh/id_ed25519.pub
```

> ⚠️ Confira se o comando termina em **`.pub`**. Você vai copiar a chave **pública**. A privada nunca sai do seu computador.

Aparece uma linha começando com `ssh-ed25519`. Selecione a linha inteira com o mouse e copie com **Ctrl+Shift+C** (o copiar do terminal).

Agora, no navegador:

1. No GitHub, clique na **sua foto** → **Settings**.
2. No menu da esquerda, clique em **SSH and GPG keys**.
3. Clique em **New SSH key**.
4. Em **Title**, escreva algo que identifique o computador, por exemplo: `Laboratório Guará`.
5. Em **Key type**, deixe **Authentication Key**.
6. Em **Key**, cole a linha que você copiou.
7. Clique em **Add SSH key**. O GitHub pode pedir o código do 2FA.

### 3.3 Testar a conexão

```bash
ssh -T git@github.com
```

- `ssh` = o programa de conexão segura.
- `-T` = só testa a conexão, sem abrir um terminal remoto.
- `git@github.com` = o endereço do GitHub para conexões git.

**Na primeira vez**, aparece uma pergunta parecida com esta:

```
The authenticity of host 'github.com' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

O seu computador está dizendo: *"nunca falei com esse servidor antes. Tem certeza de que é o GitHub de verdade?"*. Confira se a **impressão digital** (`SHA256:+DiY3...`) é igual à que está acima. Ela é publicada oficialmente pelo GitHub. Se for igual, digite **`yes`** e aperte Enter.

> 🕵️ **Pensamento hacker:** essa pergunta protege você de um ataque chamado **homem no meio** (*man-in-the-middle*): alguém fingindo ser o GitHub para roubar o seu código. Por isso, conferir a impressão digital não é frescura.

Depois, o terminal pede a **senha da sua chave** (a que você criou no passo 3.1). Se tudo deu certo, aparece:

```
Hi seu-usuario! You've successfully authenticated, but GitHub does not provide shell access.
```

A parte *"does not provide shell access"* é normal: o GitHub só aceita conexões do git, não deixa ninguém "entrar" no servidor dele. O importante é o **"successfully authenticated"**. 🎉

---

## Parte 4 — Baixar o projeto

### 4.1 Criar uma pasta para os seus projetos

```bash
mkdir -p ~/projetos
cd ~/projetos
```

- `mkdir` = cria uma pasta. O `-p` evita erro se ela já existir.
- `cd` = entra na pasta (*change directory*).

### 4.2 Clonar o repositório

```bash
git clone git@github.com:Incubadoras-Criativas/territorio-inteligente.git
```

- `git clone` = baixa o repositório **inteiro**, com toda a sua história. É uma **cópia completa**, não só os arquivos de hoje.
- O endereço começa com `git@github.com:`, o que quer dizer que o download usa a sua **chave SSH**.

Pode ser que peça a senha da sua chave de novo. Ao final, entre na pasta do projeto:

```bash
cd territorio-inteligente
```

### 4.3 Olhar a história do projeto

```bash
git log --oneline
```

- `git log` = mostra os commits, do mais novo para o mais antigo.
- `--oneline` = um commit por linha, resumido.

Você vai ver o commit que criou o esqueleto do projeto. Cada commit tem um **código** no começo da linha (algo como `a1b2c3d`). É a "identidade" daquele ponto de salvamento.

Veja também o estado atual:

```bash
git status
```

Deve aparecer `nothing to commit, working tree clean`: nenhuma mudança desde o último commit. Esse vai ser um dos comandos que você mais vai usar.

---

## Parte 5 — Colocar o projeto para rodar

### 5.1 Conferir a versão do Ruby

O projeto tem um arquivo chamado `mise.toml` que diz qual versão do Ruby ele usa. Veja:

```bash
cat mise.toml
```

Na primeira vez que o mise encontra um `mise.toml` numa pasta nova, ele pode pedir que você **confie** nesse arquivo. É outra proteção: arquivos de configuração podem mandar o computador fazer coisas. Como este é o nosso projeto, confie:

```bash
mise trust
```

Agora peça ao mise para instalar o que o projeto precisa:

```bash
mise install
```

Como você já instalou o **Ruby 4.0.7** no capítulo 020, o mise deve dizer que **já está tudo instalado**, sem compilar nada.

### 5.2 Ler o script de preparação antes de rodar

O projeto tem um script que prepara tudo sozinho: o `bin/setup`. Mas lembre da regra: **não rodamos o que não entendemos**. Vamos ler primeiro:

```bash
cat bin/setup
```

É código **Ruby**! Procure por estas linhas e entenda o que cada uma faz:

| Linha no `bin/setup` | O que faz |
| --- | --- |
| `bundle install` | Lê o `Gemfile.lock` e instala **as gems** (bibliotecas Ruby) do projeto, **incluindo o Rails**, na versão exata |
| `bin/rails db:prepare` | Cria os bancos de dados do projeto no PostgreSQL e monta as tabelas |
| `bin/rails log:clear tmp:clear` | Limpa arquivos temporários |
| `exec "bin/dev"` | No fim, **liga o servidor** do projeto |

Lembra do aviso do capítulo 020? É aqui que o **Rails** chega ao seu computador, na versão certa.

### 5.3 Rodar o setup

```bash
bin/setup
```

O `bundle install` vai baixar e instalar dezenas de gems. Pode levar alguns minutos. No fim, o servidor liga sozinho, e você vai ver algo parecido com:

```
* Listening on http://127.0.0.1:3000
```

### 5.4 Ver o projeto funcionando

Abra o navegador e acesse:

**http://localhost:3000**

- `localhost` = **o seu próprio computador**.
- `3000` = a **porta** onde o servidor do Rails está esperando pedidos.

Se aparecer a página de boas-vindas do Rails, **o Território Inteligente está rodando no seu computador!** 🚀

Por enquanto é só o esqueleto. A partir do próximo capítulo, você começa a construir o aplicativo de verdade.

### 5.5 Desligar e ligar o servidor

Para **desligar** o servidor, volte ao terminal e aperte **Ctrl+C**.

Nas próximas aulas, você **não precisa** rodar o `bin/setup` de novo. Para ligar o servidor, entre na pasta do projeto e rode:

```bash
cd ~/projetos/territorio-inteligente
bin/dev
```

Confira também a versão do Rails que o projeto usa:

```bash
bin/rails --version
```

---

## Deu problema?

| Mensagem ou problema | O que fazer |
| --- | --- |
| `Permission denied (publickey)` | O GitHub não reconheceu a sua chave. Confira se você colou a chave **`.pub`** no GitHub (passo 3.2) e teste de novo com `ssh -T git@github.com`. |
| `ERROR: Repository not found` | Você ainda não é membro da organização. Confira se aceitou o convite (capítulo 010, Passo 4). |
| `Host key verification failed` | Você respondeu `no` na pergunta da impressão digital. Rode `ssh -T git@github.com` de novo e responda `yes`. |
| Esqueci a senha da chave SSH | Não tem como recuperar. Apague as chaves com `rm ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub`, refaça a Parte 3 e remova a chave antiga no GitHub. |
| `mise ERROR ... not trusted` | Rode `mise trust` dentro da pasta do projeto. |
| O `mise install` começou a compilar o Ruby | A versão do projeto é diferente da que você instalou. Deixe terminar. |
| Erro na gem `pg` durante o `bundle install` | Falta a biblioteca do PostgreSQL. Rode `sudo apt install -y libpq-dev` e depois `bin/setup` de novo. |
| `role "seu-usuario" does not exist` | Falta o seu usuário no banco. Refaça o passo 4.2 do capítulo 020. |
| `Address already in use` (porta 3000) | Já tem um servidor ligado em outro terminal. Procure esse terminal e aperte Ctrl+C. |
| `fatal: not a git repository` | Você não está na pasta do projeto. Rode `cd ~/projetos/territorio-inteligente`. |

---

## Palavras novas deste capítulo

| Palavra | O que significa |
| --- | --- |
| **git** | O programa que guarda a história do código no seu computador. |
| **Commit** | Um ponto de salvamento: o que mudou, quem, quando e por quê. |
| **Repositório** | A pasta do projeto, junto com toda a sua história. |
| **Remoto** | A cópia compartilhada do repositório, guardada num servidor (o GitHub). |
| **Clonar** | Baixar uma cópia completa de um repositório, com toda a história. |
| **Branch** | Uma linha paralela de trabalho. Veremos no capítulo 040. |
| **Chave SSH** | Um par de arquivos (cadeado público e chave privada) que prova quem você é. |
| **Impressão digital** (*fingerprint*) | Um código curto que identifica uma chave, usado para conferir se ela é verdadeira. |
| **Gem** | Uma biblioteca de código Ruby. O próprio Rails é uma gem. |
| **localhost** | O seu próprio computador, visto como servidor. |
| **Porta** | Um número que diz qual programa do computador deve atender um pedido. O Rails usa a 3000. |

---

## O que aprendemos

- O **git** guarda a história do código em **commits**; o **GitHub** guarda a cópia compartilhada.
- Uma **chave SSH** prova quem você é sem enviar senha: o cadeado vai para o GitHub, a chave fica com você.
- Conferir a **impressão digital** protege contra quem finge ser outro servidor.
- `git clone` baixa o projeto **com toda a história**.
- Antes de rodar um script, **leia o que ele faz**. O `bin/setup` é Ruby, e dá para entender.
- O Rails chegou pelo `bundle install`, **na versão exata do projeto**.

**Próximo capítulo:** [040 — Seu primeiro pull request](040-primeiro-pull-request.md)

---

## Fontes

- [Gerar uma nova chave SSH — GitHub Docs](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Impressões digitais das chaves SSH do GitHub — GitHub Docs](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)
- [Configurar o e-mail de commit — GitHub Docs](https://docs.github.com/pt/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address)
