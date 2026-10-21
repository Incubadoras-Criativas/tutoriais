# 020 — Preparando o seu ambiente de desenvolvimento

> **Neste capítulo:** você vai transformar o seu computador numa máquina de desenvolvimento Rails. Vamos instalar o **git**, o **mise**, o **Ruby**, o **PostgreSQL** e a **libvips**, entendendo para que serve cada um.

**Tempo estimado:** 1 hora (boa parte dela esperando o Ruby ficar pronto).

---

## Antes de começar

- [ ] Você está logado no computador do laboratório **com o seu próprio usuário**
- [ ] O computador está conectado à internet
- [ ] Você sabe a **sua senha** do computador (o `sudo` vai pedir)

Abra o **terminal**: no menu do Kubuntu, procure por **Konsole**.

> **Como ler este capítulo:** cada comando vem num bloco cinza. Digite o comando (ou copie e cole com **Ctrl+Shift+V**, que é o colar do terminal) e aperte **Enter**. Logo abaixo de cada bloco tem a explicação do que ele faz. **Leia a explicação antes de rodar o comando.** Quem programa de verdade não roda comando que não entende.

---

## O que vamos instalar

| Ferramenta | Para que serve | Comparação |
| --- | --- | --- |
| **git** | Guarda a história do código e conversa com o GitHub | O "salvar" com histórico de tudo que já foi feito |
| **mise** | Instala e troca versões de linguagens, como o Ruby | Um gerente que garante que todo mundo usa a mesma versão |
| **Ruby** | A linguagem em que o Rails é escrito | O idioma do projeto |
| **PostgreSQL** | O banco de dados: onde ficam as academias, as fotos e os relatos | O arquivo-morto organizado do projeto |
| **libvips** | Processa imagens: diminui, corta e converte fotos | O editor de fotos automático |

---

## Parte 1 — Instalando os pacotes do sistema

No Linux, os programas são instalados por um **gerenciador de pacotes**. No Kubuntu, ele se chama **apt**. Pense numa loja de aplicativos que você usa pelo terminal.

### 1.1 Atualizar a lista da loja

```bash
sudo apt update
```

- `sudo` = *"faça isso como administrador"*. Instalar programas mexe no sistema todo, então o computador pede a **sua senha**. Quando você digitar a senha, **nada aparece na tela**, nem asteriscos. É normal: digite e aperte Enter.
- `apt update` = baixa a lista mais recente de programas disponíveis. Ainda **não instala nada**.

> ⚠️ **Cuidado com o `sudo`.** Ele dá superpoderes ao comando. Use só quando o tutorial mandar. Nunca rode `sudo` em comando que você não entende.

### 1.2 Instalar tudo de uma vez

```bash
sudo apt install -y git curl build-essential libssl-dev libyaml-dev zlib1g-dev \
  libffi-dev libreadline-dev libgmp-dev postgresql libpq-dev libvips
```

- `apt install` = instala os pacotes listados.
- `-y` = responde "sim" automaticamente à pergunta *"deseja continuar?"*.
- A `\` no fim da primeira linha avisa que **o comando continua na linha de baixo**. Se você copiar e colar, as duas linhas vão juntas.

O que cada pacote faz:

| Pacote | Para quê |
| --- | --- |
| `git` | Controle de versão (o capítulo 030 é todo sobre ele) |
| `curl` | Baixa arquivos da internet pelo terminal |
| `build-essential` | Compiladores: transformam código-fonte em programa. Vamos precisar para construir o Ruby |
| `libssl-dev`, `libyaml-dev`, `zlib1g-dev`, `libffi-dev`, `libreadline-dev`, `libgmp-dev` | Bibliotecas que o Ruby usa por dentro: criptografia, leitura de configurações, compressão, histórico no terminal, matemática com números grandes |
| `postgresql` | O banco de dados |
| `libpq-dev` | Permite que o Ruby converse com o PostgreSQL |
| `libvips` | Processamento das fotos das academias |

### 1.3 Conferir o git

```bash
git --version
```

Deve aparecer algo como `git version 2.xx.x`. Se apareceu, o git está instalado.

Se aparecer `git: command not found`, instale o git sozinho:

```bash
sudo apt install -y git
```

Depois rode `git --version` de novo para conferir. Se o git não foi instalado no passo 1.2, provavelmente aquele comando deu erro. Role o terminal para cima, procure mensagens de erro e chame o educador.

---

## Parte 2 — Instalando o mise

### 2.1 Baixar e instalar

```bash
curl https://mise.run | sh
```

Este comando tem duas partes, ligadas pelo `|` (chamado de **pipe**, "cano"):

- `curl https://mise.run` baixa um **script de instalação** do site oficial do mise.
- `| sh` entrega esse script direto para o terminal **executar**.

> 🕵️ **Pensamento hacker:** baixar um script da internet e executar sem ler é **confiar totalmente** em quem escreveu. Aqui confiamos porque é o site oficial do mise, usado por milhares de pessoas. Mas o hábito certo é sempre se perguntar: *"de onde veio esse código e por que eu confio nele?"* Se quiser ver o que o script faz antes, rode só `curl https://mise.run` e leia.

O mise é instalado em `~/.local/bin/mise`. O `~` significa **a sua pasta pessoal** (`/home/seu-usuario`).

### 2.2 Ativar o mise no terminal

```bash
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
```

- O arquivo `~/.bashrc` é lido **toda vez que você abre um terminal**. É a lista de coisas que o terminal faz ao começar.
- `echo '...' >> ~/.bashrc` **acrescenta** uma linha no fim desse arquivo. Atenção: são **dois** sinais `>>`. Com um só (`>`), você **apagaria** o arquivo inteiro e deixaria só essa linha!
- A linha acrescentada manda o terminal ativar o mise sempre que abrir.

Agora, recarregue as configurações no terminal que já está aberto:

```bash
source ~/.bashrc
```

### 2.3 Conferir

```bash
mise doctor
```

O `mise doctor` faz um "check-up" da instalação. Procure por linhas indicando que está tudo certo (`activated: yes`). Se aparecer algum aviso, chame o educador.

---

## Parte 3 — Instalando o Ruby (a parte demorada)

```bash
mise use -g ruby@4.0.7
```

- `mise use` = instala uma versão e passa a usá-la.
- `-g` = **global**: vale para todo o seu usuário, em qualquer pasta.
- `ruby@...` = qual ferramenta e qual versão.

O mise vai **baixar o código-fonte do Ruby e compilar** na sua máquina. Compilar é transformar o código-fonte (texto) num programa que o computador executa. Isso leva **vários minutos**, e muitas mensagens vão passar na tela. É normal.

> ☕ **Não feche este terminal.** Enquanto o Ruby compila, abra o **navegador** e faça o capítulo **010 — Sua conta no GitHub**, se ainda não fez.

Quando terminar, confira:

```bash
ruby -v
```

Deve aparecer a versão que você instalou. Teste também o Ruby de verdade:

```bash
ruby -e 'puts "Olá, Território Inteligente!"'
```

- `-e` = *"execute este código"*. Se aparecer a mensagem, o Ruby está funcionando. Esse é o seu **primeiro programa em Ruby**! 🎉

> 💡 **E o Rails? Não vamos instalar agora, e é de propósito.**
>
> O Rails chega no capítulo 030, junto com o projeto. Lá, o comando `bin/setup` lê o arquivo `Gemfile.lock` e instala **exatamente a versão do Rails que o projeto usa**, junto com todas as outras peças.
>
> Se você instalasse o Rails agora, pegaria a versão mais nova do dia, que pode ser diferente da do projeto, e isso causa erros difíceis de entender. Por isso, no projeto, sempre usamos `bin/rails`, que garante a versão certa.

---

## Parte 4 — Preparando o PostgreSQL

O PostgreSQL foi instalado na Parte 1 e já está **rodando como um serviço**: um programa que fica ligado em segundo plano, esperando pedidos.

### 4.1 Conferir se o banco está ligado

```bash
systemctl status postgresql
```

Procure a palavra **`active`** em verde. Para sair dessa tela, aperte **q**.

#### Se o PostgreSQL não estiver instalado

Se aparecer `Unit postgresql.service could not be found`, o PostgreSQL não foi instalado. Instale e configure assim:

```bash
sudo apt install -y postgresql libpq-dev
```

- Instala o banco de dados e a biblioteca que permite ao Ruby conversar com ele.
- No Kubuntu, a instalação já faz a **configuração inicial**: cria a pasta onde os dados ficam guardados e o usuário administrador `postgres`.

```bash
sudo systemctl enable --now postgresql
```

- `systemctl` é o programa que controla os serviços do Linux.
- `enable` = ligue o banco **automaticamente toda vez que o computador iniciar**.
- `--now` = e ligue **agora também**, sem esperar reiniciar.

Confira de novo:

```bash
systemctl status postgresql
```

Agora deve aparecer **`active`** em verde.

#### Se estiver instalado, mas desligado

Se aparecer **`inactive`** ou **`failed`**, o banco está instalado, mas parado. Ligue com:

```bash
sudo systemctl enable --now postgresql
```

Se continuar `failed`, chame o educador.

### 4.2 Criar o seu usuário no banco

O banco de dados tem os **seus próprios usuários**, separados dos usuários do computador. Vamos criar um usuário no banco com **o mesmo nome** do seu usuário do Kubuntu:

```bash
sudo -u postgres createuser -d $USER
```

- `sudo -u postgres` = rode o comando **como o usuário `postgres`**, que é o administrador do banco.
- `createuser` = cria um usuário no banco.
- `-d` = esse usuário pode **criar bancos de dados** (o Rails vai precisar).
- `$USER` = uma **variável** que guarda o seu nome de usuário. Teste: `echo $USER`.

Por que o mesmo nome? Porque assim o PostgreSQL reconhece você automaticamente, **sem senha**. Se você está logado como `ana` no computador, o banco sabe que você é a `ana` do banco.

### 4.3 Conferir

```bash
psql -d postgres -c "select current_user;"
```

- `psql` = o programa para conversar com o banco pelo terminal.
- `-d postgres` = conecte no banco chamado `postgres`, que sempre existe.
- `-c "..."` = rode este comando **SQL**. É a mesma linguagem que vocês estudaram no 1º trimestre!

Deve aparecer uma pequena tabela com o **seu nome de usuário**.

---

## Parte 5 — Conferindo a libvips

```bash
ldconfig -p | grep libvips
```

- `ldconfig -p` lista todas as bibliotecas instaladas no sistema.
- `| grep libvips` filtra só as linhas que têm `libvips`. É o pipe de novo: a saída de um comando vira a entrada do outro.

Se aparecer pelo menos uma linha com `libvips`, está instalada.

---

## Checklist final

Rode estes comandos. **Todos** devem responder sem erro:

```bash
git --version
mise --version
ruby -v
psql -d postgres -c "select current_user;"
ldconfig -p | grep libvips
```

Tudo certo? **Seu computador agora é uma máquina de desenvolvimento Rails.** 🚀

---

## Deu problema?

| Mensagem ou problema | O que fazer |
| --- | --- |
| `Could not get lock /var/lib/dpkg/lock` | Outro programa está instalando algo. Espere 1 ou 2 minutos e tente de novo. |
| `mise: command not found` | Rode `source ~/.bashrc` ou feche e abra o terminal. Confira se fez o passo 2.2. |
| A compilação do Ruby parou com erro sobre `yaml`, `ssl` ou `ffi` | Falta algum pacote da Parte 1. Rode o comando do passo 1.2 de novo e depois o da Parte 3. |
| `role "seu-usuario" does not exist` | O passo 4.2 não foi feito ou deu erro. Rode de novo. |
| `role "seu-usuario" already exists` | Você já tinha feito o passo 4.2. Pode seguir! |
| `Peer authentication failed` | O nome do usuário do banco é diferente do seu usuário do Kubuntu. Confira com `echo $USER` e chame o educador. |
| Digitei a senha do `sudo` e não apareceu nada | É assim mesmo: o terminal não mostra a senha. Digite e aperte Enter. |
| Apaguei meu `~/.bashrc` sem querer (usei `>` em vez de `>>`) | Chame o educador. Dá para restaurar com `cp /etc/skel/.bashrc ~/` e refazer o passo 2.2. |

---

## Palavras novas deste capítulo

| Palavra | O que significa |
| --- | --- |
| **Terminal** | A tela onde você conversa com o computador digitando comandos. |
| **Gerenciador de pacotes** | Uma "loja de aplicativos" pelo terminal. No Kubuntu, é o `apt`. |
| **sudo** | Executa um comando como administrador. Superpoder: use com cuidado. |
| **Pipe (`\|`)** | Liga dois comandos: a saída do primeiro vira a entrada do segundo. |
| **Compilar** | Transformar código-fonte (texto) num programa que o computador executa. |
| **Serviço** | Um programa que fica rodando em segundo plano, como o banco de dados. |
| **Variável de ambiente** | Um valor guardado pelo terminal, como `$USER`, que guarda o seu nome de usuário. |
| **`~/.bashrc`** | O arquivo de configurações que o terminal lê toda vez que abre. |

---

## O que aprendemos

- O **apt** instala programas do sistema; o **mise** instala versões de linguagens.
- O **`sudo`** é necessário para mexer no sistema, e por isso merece cuidado.
- O **pipe** (`|`) é uma das ideias mais poderosas do Linux: comandos pequenos que se combinam.
- O **PostgreSQL** tem usuários próprios, e usar o mesmo nome do usuário do computador dispensa senha.
- Antes de executar código da internet, pergunte **de onde ele veio**.

**Próximo capítulo:** [030 — Git e GitHub no terminal](030-git-e-github-no-terminal.md)
