# 008 — Minha primeira página web

> **Nesta missão:** você vai escrever uma página de internet à mão e abrir no navegador.

**Tempo estimado:** 1 hora.

---

## Antes de começar

- [ ] Você terminou a missão **007**
- [ ] Você tem a imagem `missoes/imagens/minha-tela.png` (da missão 003)

---

## Parte 1 — O que é HTML

Toda página da internet é um arquivo de texto escrito em **HTML**.

O HTML usa **tags**, palavras entre `< >` que dizem o que cada pedaço é: `<h1>` é um título, `<p>` é um parágrafo, `<img>` é uma imagem.

O aplicativo **Território Inteligente** que a turma está construindo também é feito de páginas assim.

---

## Parte 2 — Passo a passo

1. No terminal, crie a pasta e o arquivo:

    ```bash
    mkdir -p ~/missoes/site
    cd ~/missoes/site
    cp ~/missoes/imagens/minha-tela.png .
    kate index.html &
    ```

2. No Kate, **digite** (não copie e cole: digitar ajuda a aprender) e troque os textos pelos seus:

    ```html
    <!DOCTYPE html>
    <html lang="pt-BR">
    <head>
      <meta charset="utf-8">
      <title>Minha página</title>
      <style>
        body { font-family: sans-serif; background: #fdf6e3; margin: 40px; }
        h1 { color: #2e7d32; }
      </style>
    </head>
    <body>
      <h1>Olá, eu sou o(a) Seu Nome</h1>
      <p>Moro em Ceilândia e estou aprendendo Linux.</p>
      <h2>Coisas que eu gosto</h2>
      <ul>
        <li>Primeira coisa</li>
        <li>Segunda coisa</li>
      </ul>
      <img src="minha-tela.png" width="400">
      <p><a href="https://www.kernel.org">Conheça o Linux</a></p>
    </body>
    </html>
    ```

3. Salve com **Ctrl+S**.
4. No terminal, abra a página: `firefox index.html`.
5. Mude alguma coisa no Kate, salve e aperte **F5** no Firefox para recarregar. Veja a mudança.

---

## Checkpoint

Mostre ao educador a sua página aberta no Firefox, com o **seu nome**, a **lista** e a **imagem**.

---

## Desafio extra

Troque as cores `#fdf6e3` e `#2e7d32` por outras (pesquise "seletor de cores html").

Depois, no Firefox, aperte **F12** e explore as **ferramentas de desenvolvedor**: passe o mouse sobre o código e veja as partes da página se acenderem.

---

## O que aprendemos

- Uma página web é um **arquivo de texto** com tags HTML.
- O bloco `<style>` muda a aparência: cores, fontes, espaços.
- Escrever, salvar e recarregar (**F5**) é o ciclo de quem faz sites.

**Parabéns, você completou o passaporte!** Volte ao [README](README.md#passaporte-de-missões) e peça o último carimbo.

**Próximo passo:** [010 — Conta no GitHub](../010-conta-no-github.md)
