# 006 — Primeiro contato com o terminal

> **Nesta missão:** você vai fazer pelo terminal o que já sabe fazer no Dolphin: andar entre pastas, criar, copiar, renomear e apagar arquivos.

**Tempo estimado:** 1 hora.

---

## Antes de começar

- [ ] Você terminou a missão **005** e tem a pasta `missoes` na sua pasta pessoal

---

## Parte 1 — O que é o terminal

O **terminal** é um jeito de conversar com o computador por texto. Você digita um **comando**, aperta Enter e o computador responde.

Parece coisa de filme de hacker, e é mesmo: é assim que programadores e administradores de servidores trabalham todo dia.

Abra o terminal (**Konsole**) com **Ctrl+Alt+T**. A linha que aparece, terminando em `$`, é o **prompt**: o computador esperando a sua ordem.

| Comando | O que faz | Exemplo |
| --- | --- | --- |
| `pwd` | Mostra em que pasta você está | `pwd` |
| `ls` | Lista o que tem na pasta | `ls -l` |
| `cd` | Entra em uma pasta | `cd missoes` |
| `cd ..` | Volta uma pasta | `cd ..` |
| `cd` sozinho | Volta para a pasta pessoal | `cd` |
| `mkdir` | Cria uma pasta | `mkdir terminal` |
| `touch` | Cria um arquivo vazio | `touch notas.txt` |
| `echo` | Escreve um texto na tela | `echo Olá` |
| `cat` | Mostra o conteúdo de um arquivo | `cat notas.txt` |
| `cp` | Copia | `cp notas.txt copia.txt` |
| `mv` | Move ou renomeia | `mv copia.txt nova.txt` |
| `rm` | Apaga **para sempre** (não vai para a Lixeira) | `rm nova.txt` |
| `clear` | Limpa a tela | `clear` |

---

## Parte 2 — Passo a passo

1. Digite `pwd` e aperte Enter. Anote a resposta.
2. Digite `ls`. Você reconhece a pasta `missoes`?
3. Entre nela com `cd missoes` e liste de novo com `ls`. Aparecem as suas três pastas.
4. Crie uma pasta nova: `mkdir terminal`. Entre nela: `cd terminal`.
5. Escreva em um arquivo:

    ```bash
    echo "Hoje eu usei o terminal" > notas.txt
    ```

    O símbolo `>` manda o texto para dentro do arquivo.

6. Veja o conteúdo: `cat notas.txt`.
7. Adicione mais uma linha sem apagar a primeira:

    ```bash
    echo "E foi divertido" >> notas.txt
    ```

    Rode `cat notas.txt` de novo. Qual a diferença entre `>` e `>>`?

8. Copie, renomeie e apague, um comando de cada vez, usando `ls` entre eles para ver o que mudou:

    ```bash
    cp notas.txt copia.txt
    mv copia.txt lixo.txt
    rm lixo.txt
    ```

9. Volte para a pasta pessoal digitando só `cd`.

---

## Parte 3 — Dois truques de quem usa terminal todo dia

- **Tab completa para você.** Digite `cd mis` e aperte **Tab**: o resto do nome aparece sozinho.
- **Seta para cima** traz de volta os comandos que você já digitou.

> **Cuidado:** o `rm` não pergunta e não tem Lixeira. Use só dentro da pasta `missoes`.

---

## Checkpoint

Abra o Dolphin na pasta `missoes/terminal` e mostre ao educador que o `notas.txt` que você criou **pelo terminal** está lá, com as duas linhas.

---

## Desafio extra

Peça autorização ao educador e instale dois programas divertidos:

```bash
sudo apt install cowsay sl
```

O `sudo` pede a **sua senha** e dá poder de administrador ao comando. Depois rode:

```bash
cowsay Olá Ceilândia
sl
```

---

## O que aprendemos

- O terminal faz tudo o que o Dolphin faz, só que por texto.
- `pwd` diz onde você está; `ls` mostra o que tem; `cd` leva para outro lugar.
- `>` grava um texto **substituindo** o arquivo; `>>` **acrescenta** no fim.
- `rm` apaga para sempre.
- **Tab** e **seta para cima** poupam digitação.

**Próxima missão:** [007 — Caça ao tesouro no terminal](007-caca-ao-tesouro.md)
