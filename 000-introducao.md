# 000 — Introdução: o Ruby on Rails e por que ele está neste projeto

> **Neste capítulo:** de onde vieram o Ruby e o Rails, quem usa essas ferramentas hoje, o que esperar delas no futuro e por que escolhemos o Rails para construir o Território Inteligente.

---

## Comece por aqui

Pense no **GitHub**, o site onde o código deste projeto está guardado, e na **Shopify**, a plataforma por trás de milhões de lojas virtuais no mundo inteiro.

Os dois foram construídos com a mesma ferramenta que você vai usar a partir de hoje: o **Ruby on Rails**.

O que você vai escrever nas próximas semanas usa as mesmas peças, as mesmas regras e os mesmos comandos que as equipes dessas empresas usam todos os dias.

---

## Primeiro, o Ruby: uma linguagem feita para pessoas

Antes do Rails existe o **Ruby**, a linguagem de programação em que ele é escrito.

O Ruby foi criado no **Japão** por **Yukihiro Matsumoto**, conhecido como **Matz**, e lançado em **1995**. A ideia de Matz era diferente da maioria: em vez de pensar primeiro no computador, ele pensou no **programador**. Ele queria uma linguagem que fosse agradável de ler e de escrever, que deixasse quem programa **feliz**.

Compare. Para mostrar "Olá" três vezes, em Ruby você escreve:

```ruby
3.times { puts "Olá" }
```

Dá para ler quase como uma frase: *"três vezes, mostre Olá"*.

Em dezembro de 2025, o Ruby completou **30 anos**. Para comemorar, a versão **Ruby 4.0** foi lançada no dia 25 de dezembro, mantendo a tradição da comunidade de soltar as versões importantes no Natal.

---

## De onde veio o Rails

Em 2003, um programador dinamarquês chamado **David Heinemeier Hansson** (todo mundo chama de **DHH**) estava construindo o **Basecamp**, um sistema de gestão de projetos, na empresa 37signals.

Enquanto construía o Basecamp, ele percebeu que estava resolvendo sempre os mesmos problemas: guardar dados num banco, mostrar páginas, receber formulários, cuidar de login. Então ele **separou essas soluções** do Basecamp e as transformou numa ferramenta que qualquer pessoa poderia usar.

Essa ferramenta é o **Ruby on Rails**, lançado publicamente em **julho de 2004** como **código aberto**: qualquer pessoa pode usar, estudar e melhorar.

### O que é um "framework"?

O Rails é um **framework**. Pense numa obra:

- A **linguagem** (Ruby) são os tijolos, o cimento e as ferramentas.
- O **framework** (Rails) é a planta da casa, mais as paredes que toda casa tem: encanamento, parte elétrica, portas no lugar certo.

Você não precisa reinventar o encanamento em cada casa. Você se concentra no que torna **esta** casa única. No nosso caso, é o mapa das academias, a ficha de cada uma e as contribuições dos moradores.

### A ideia que mudou a web

O Rails ficou famoso por duas ideias simples:

1. **Convenção sobre configuração.** Em vez de configurar tudo, você segue combinados. Se existe uma tabela chamada `academias`, o Rails já sabe que o código que cuida dela se chama `Academia`. Ninguém precisa escrever isso.
2. **Não se repita** (em inglês, *DRY: Don't Repeat Yourself*). Cada informação existe em um lugar só. Se mudar, muda em um lugar.

Essas ideias tornaram possível que equipes pequenas construíssem sistemas grandes em pouco tempo. Muitas ferramentas que vieram depois, em outras linguagens, adotaram ideias parecidas.

### MVC: cada parte do código no seu lugar

Todo projeto Rails organiza o código em três partes. Juntas, elas formam o padrão **MVC**, sigla em inglês para **Model–View–Controller** (Modelo–Visão–Controlador).

O MVC não foi inventado pelo Rails. A ideia surgiu nos anos 1970, mas foi o Rails que a tornou popular no desenvolvimento web.

Pense num **restaurante**:

| Parte | No restaurante | No Rails | O que faz |
| --- | --- | --- | --- |
| **Controller** (Controlador) | O **garçom** | `app/controllers/` | Recebe o pedido, decide o que fazer e coordena as outras partes |
| **Model** (Modelo) | A **cozinha e a despensa** | `app/models/` | Cuida dos dados: guarda, busca e confere se estão corretos |
| **View** (Visão) | O **prato servido** | `app/views/` | Mostra o resultado para quem pediu, do jeito certo |

A sigla é M-V-C, mas o caminho de um pedido começa pelo **C**:

1. Um morador abre no celular a ficha da **Academia da Praça**.
2. O **Controller** recebe o pedido: *"quero ver a academia número 7"*.
3. Ele pede ao **Model**: *"me traga a academia 7 do banco de dados"*.
4. O **Model** busca os dados: nome, localização, estado de conservação.
5. O **Controller** entrega esses dados para a **View**.
6. A **View** monta a página com o mapa, as fotos e a ficha, e ela aparece no celular do morador.

Por que separar assim? Porque cada parte pode mudar sem quebrar as outras. Se a equipe quiser mudar a cor da ficha, mexe só na **View**. Se surgir uma regra nova, como *"toda academia precisa ter um bairro"*, ela entra só no **Model**. Numa equipe grande como a nossa, isso também deixa claro **onde** procurar cada coisa.

---

## Quem usa o Rails hoje

### GitHub

O GitHub é um sistema em Rails **desde o começo**. A equipe publica mudanças até **20 vezes por dia**, e quase toda semana uma delas é a atualização para a versão mais nova do Rails. Quando você abrir seu primeiro *pull request* neste projeto, vai estar usando um sistema feito em Rails para mandar código em Rails.

### Shopify

A Shopify é a maior empresa do mundo construída sobre o Rails. Na **Black Friday de 2025**, os lojistas da plataforma venderam um recorde de **14,6 bilhões de dólares** em um fim de semana. No pico, os servidores da aplicação atenderam mais de **117 milhões de requisições por minuto**.

A Shopify também é uma das grandes responsáveis pelo futuro do Rails. Segundo o próprio DHH, quase **metade das pessoas que mais contribuem** para o Rails trabalha lá.

### E muitos outros

Basecamp, HEY e dezenas de milhares de empresas pequenas e médias no mundo todo, inclusive no Brasil, usam Rails todos os dias.

---

## Tem brasileiro nessa história 🇧🇷

O Rails é mantido por um grupo pequeno de pessoas chamado **Rails Core Team**, e brasileiros fazem parte dele.

- **Rafael Mendonça França** entrou para o Rails Core em **2012**. Hoje ele é engenheiro na Shopify e um dos líderes técnicos do Rails no mundo.
- **Carlos Antonio da Silva** também entrou para o Rails Core no mesmo ano.
- Os dois trabalhavam na **Plataformatec**, uma empresa brasileira que chegou a ter **três** integrantes no Rails Core ao mesmo tempo. O terceiro, **José Valim**, depois criou a linguagem **Elixir**, usada no mundo inteiro.

O Brasil também tem a **Tropical.rb** (antes chamada Tropical on Rails), uma conferência anual de Rails que se apresenta como a conferência de Rails da América Latina.

Ou seja: gente que começou como você, num computador, aprendendo, hoje ajuda a decidir como a ferramenta funciona para o mundo todo.

---

## Como o Rails está agora

### Rails 8: "Não precisa de PaaS"

Em **novembro de 2024**, saiu o **Rails 8**, com um lema: **"No PaaS Required"**, algo como "não precisa de plataforma paga".

Até então, para colocar um sistema no ar, muitas equipes pagavam caro por serviços de hospedagem especializados. O Rails 8 trouxe ferramentas para você colocar a aplicação **no seu próprio servidor**, de forma simples:

- **Kamal:** transforma um servidor Linux comum num servidor pronto para a aplicação.
- **Solid Queue, Solid Cache e Solid Cable:** cuidam de tarefas em segundo plano, de memória rápida e de atualizações em tempo real **usando o próprio banco de dados**, sem precisar de serviços extras.
- **Gerador de autenticação:** cria o login, o logout e a recuperação de senha prontos para usar.

Isso importa para nós: o Território Inteligente precisa de **hospedagem de baixo custo** e de **manutenção simples**. O Rails 8 foi pensado exatamente para isso.

### Rails 8.1 e o que vem por aí

A série atual é o **Rails 8.1**, lançado em outubro de 2025. A próxima, o **Rails 8.2**, já está em preparação.

Em setembro de 2026, a **Rails World**, a conferência oficial do Rails, reuniu em Austin, nos Estados Unidos, **mais de mil desenvolvedores de 58 países**. Foi a maior edição até agora. A próxima será em Lisboa, em 2027.

### Quem cuida do futuro

Em **2022**, foi criada a **Rails Foundation**, uma organização sem fins lucrativos que cuida da documentação, da divulgação e dos eventos do Rails. Ela começou com **1 milhão de dólares** doados por empresas que dependem do Rails, entre elas **GitHub** e **Shopify**.

Quando empresas desse tamanho investem dinheiro numa ferramenta de código aberto, é sinal de que ela vai continuar existindo e melhorando por muitos anos.

---

## O futuro: com os pés no chão

O Rails tem mais de 20 anos. Ele não é a tecnologia mais falada nas redes sociais, e tudo bem: ferramentas novas aparecem e desaparecem todos os anos.

O que mantém o Rails vivo é outra coisa. Ele continua sendo uma das formas mais rápidas de **uma equipe pequena** construir um sistema completo, com banco de dados, páginas, login, envio de arquivos e publicação, tudo no mesmo lugar e seguindo os mesmos combinados.

---

## Por que Rails no Território Inteligente?

| O que o projeto precisa | Como o Rails ajuda |
| --- | --- |
| Equipe pequena, pouco tempo | Convenções prontas: menos decisões, mais funcionalidades |
| Uma turma aprendendo junto | Todo projeto Rails tem a mesma estrutura: quem aprende uma, se acha em qualquer outra |
| Mapa, ficha, fotos, login e moderação | Tudo isso já tem peças prontas no Rails |
| Hospedagem barata e manutenção simples | Rails 8 com Kamal, no nosso próprio servidor |
| Código aberto, para a comunidade | O Rails também é código aberto |

---

## Palavras novas deste capítulo

| Palavra | O que significa |
| --- | --- |
| **Linguagem de programação** | O idioma em que escrevemos instruções para o computador. A nossa é o Ruby. |
| **Framework** | Um conjunto de peças e combinados prontos para construir um tipo de sistema. O nosso é o Rails. |
| **Código aberto** | Código que qualquer pessoa pode usar, estudar, modificar e compartilhar. |
| **Convenção** | Um combinado. Seguindo o combinado, você não precisa explicar tudo de novo. |
| **MVC** | Model–View–Controller: o jeito de o Rails separar o código entre dados (Model), telas (View) e quem coordena os pedidos (Controller). |
| **Servidor** | Um computador ligado o tempo todo, que entrega o aplicativo para quem acessa pela internet. |

---

## Para conversar em grupo

1. Matz criou o Ruby pensando na felicidade de quem programa. Você acha que uma ferramenta pode ser "feliz" de usar? Que aplicativo você usa que é assim?
2. DHH tirou do Basecamp as partes que se repetiam e transformou numa ferramenta para todo mundo. Que problema do seu território se repete em vários lugares e poderia virar uma solução para todos?
3. Por que será que empresas como GitHub e Shopify doam dinheiro para um projeto que é gratuito?

---

## Fontes

- [Ruby 4.0.0 lançado — ruby-lang.org](https://www.ruby-lang.org/en/news/2025/12/) (dezembro de 2025)
- [Ruby on Rails — Wikipedia](https://en.wikipedia.org/wiki/Ruby_on_Rails)
- [Building GitHub with Ruby and Rails — GitHub Blog](https://github.blog/engineering/architecture-optimization/building-github-with-ruby-and-rails/)
- [Shopify: resultados da Black Friday-Cyber Monday 2025](https://www.shopify.com/investors/press-releases/shopify-merchants-achieve-record-breaking-146-billion-black) (2 de dezembro de 2025)
- [Six billion reasons to cheer for Shopify — DHH](https://world.hey.com/dhh/six-billion-reasons-to-cheer-for-shopify-55720846) (1º de dezembro de 2025)
- [Rafael França joins the Rails Core Team — Plataformatec](https://blog.plataformatec.com.br/2012/10/rafael-franca-joins-the-rails-core-team/) (2012)
- [Carlos Antonio da Silva joins the Rails Core team — Plataformatec](https://blog.plataformatec.com.br/tag/great-work)
- [Tropical.rb 2024 — RubyEvents](https://www.rubyevents.org/events/tropicalrb-2024/talks)
- [Rails 8.0: No PaaS Required — rubyonrails.org](https://rubyonrails.org/2024/11/7/rails-8-no-paas-required) (7 de novembro de 2024)
- [Ruby on Rails — endoflife.date](https://endoflife.date/ruby-on-rails)
- [Rails World 2026 recap — rubyonrails.org](https://rubyonrails.org/2026/10/1/rails-world-2026-recap) (1º de outubro de 2026)
- [The Rails Foundation kicks off with one million dollars — rubyonrails.org](https://rubyonrails.org/2022/11/14/the-rails-foundation) (14 de novembro de 2022)

---

**Próximo capítulo:** [010 — Sua conta no GitHub](010-conta-no-github.md)
