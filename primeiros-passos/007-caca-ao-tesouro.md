# 007 — Caça ao tesouro no terminal

> **Nesta missão:** você vai seguir uma trilha de pistas usando só o terminal e descobrir a palavra secreta.

**Tempo estimado:** 40 minutos a 1 hora.

---

## Antes de começar

- [ ] Você terminou a missão **006**
- [ ] O educador preparou a pasta `caca-ao-tesouro` na sua pasta pessoal

---

## Parte 1 — Como funciona

O educador escondeu uma pasta chamada `caca-ao-tesouro` na sua pasta pessoal. Cada pista ensina um comando novo e leva para a próxima.

Sem Dolphin, sem mouse: só o **Konsole**.

Comece assim:

```bash
cd ~/caca-ao-tesouro
cat LEIA-ME.txt
```

---

## Parte 2 — Comandos novos que vão aparecer no caminho

| Comando | O que faz |
| --- | --- |
| `ls -a` | Lista também os arquivos escondidos (os que começam com ponto) |
| `find . -name 'nome*'` | Procura um arquivo pelo nome em todas as pastas abaixo da atual |
| `grep -r PALAVRA pasta` | Procura uma palavra dentro dos arquivos de uma pasta |
| `rev arquivo` | Mostra um texto de trás para frente |
| `chmod +x arquivo` | Dá permissão para um arquivo ser executado como programa |
| `./arquivo` | Executa um programa que está na pasta atual |

---

## Parte 3 — Regras da caça

- Leia cada pista até o fim antes de digitar.
- Se der erro, **leia a mensagem**: ela quase sempre diz o que está errado (nome digitado errado, pasta errada...).
- Perdeu-se? `pwd` diz onde você está, e `cd ~/caca-ao-tesouro` te leva de volta ao início.
- Anote no `diario.txt` cada comando novo que você usou.

---

## Checkpoint

Cochiche a **palavra secreta** no ouvido do educador. Não conte para os colegas!

---

## Desafio extra

O `grep` diferencia maiúsculas de minúsculas. Rode os dois comandos abaixo e compare:

```bash
grep -r cerrado biblioteca
grep -ri cerrado biblioteca
```

O que a letra `i` mudou?

---

## O que aprendemos

- Arquivos escondidos aparecem com `ls -a`.
- `find` acha arquivos **pelo nome**; `grep` acha arquivos **pelo conteúdo**.
- No Linux, um arquivo só roda como programa se tiver **permissão de execução** (`chmod +x`).
- Mensagens de erro são pistas, não broncas.

**Próxima missão:** [008 — Minha primeira página web](008-primeira-pagina-web.md)
