# 005 — Organizar dados no LibreOffice Calc

> **Nesta missão:** você vai montar uma planilha com dados da pesquisa de campo, fazer contas automáticas e gerar um gráfico.

**Tempo estimado:** 1 hora.

---

## Antes de começar

- [ ] Você terminou a missão **004**
- [ ] Se você já foi à pesquisa de campo, tenha à mão os dados das academias visitadas

---

## Parte 1 — Células e fórmulas

Uma planilha é uma grade de **células**. Cada célula tem um endereço: coluna (letra) + linha (número). A célula do canto de cima, à esquerda, é a **A1**.

O poder da planilha está nas **fórmulas**: contas que o computador refaz sozinho quando um número muda. Toda fórmula começa com `=`.

---

## Parte 2 — Passo a passo

1. Abra o **LibreOffice Calc** pelo lançador.
2. Na linha 1, escreva estes títulos, um por coluna: `Local` (A1), `Aparelhos` (B1), `Quebrados` (C1), `Tem sombra?` (D1).
3. Preencha as linhas 2 a 6 com **cinco** academias ao ar livre. Use dados reais da pesquisa de campo, se você já tiver. Se não tiver, invente números parecidos com a realidade e escreva "dados de treino" na célula H1.
4. Na célula A7, escreva `Total`. Na B7, digite `=SOMA(B2:B6)` e aperte Enter. Faça o mesmo na C7 para os quebrados.
5. Na A8, escreva `Média`. Na B8, digite `=MÉDIA(B2:B6)`.
6. Na E1, escreva `% quebrados`. Na E2, digite `=C2/B2`. Clique na E2, segure o quadradinho do canto de baixo da célula e arraste até a E6: a fórmula se copia sozinha para as outras linhas.
7. Selecione E2:E6 e clique no botão **%** da barra de ferramentas para mostrar em porcentagem.
8. Mude um número da coluna B. Veja o total e a média mudarem sozinhos.
9. Selecione A1:C6 e vá em **Inserir** → **Gráfico**. Escolha **Colunas** e clique em **Concluir**.
10. Salve como `academias.ods` em `missoes/planilhas`.

---

## Checkpoint

Mostre ao educador o **gráfico** e responda: qual academia está em pior estado?

---

## Desafio extra

Na F2, digite `=SE(E2>0,3;"Precisa de reparo";"OK")` e copie até a F6. Descubra o que a fórmula `SE` faz.

---

## O que aprendemos

- Cada célula tem um **endereço**, como A1 ou C7.
- Fórmulas começam com `=` e se **refazem sozinhas** quando os dados mudam.
- **SOMA**, **MÉDIA** e **SE** resolvem muita coisa.
- Um **gráfico** mostra em um segundo o que a tabela leva um minuto para mostrar.

**Próxima missão:** [006 — Primeiro contato com o terminal](006-terminal.md)
