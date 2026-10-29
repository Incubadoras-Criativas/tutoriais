# Primeiros Passos — Orientações para o educador

> **Neste arquivo:** como preparar a trilha de iniciantes e conduzir as aulas com o mínimo de intervenção.

As oito missões somam cerca de **7 horas**: duas aulas de 4h para um aluno no ritmo médio. Só a missão 007 exige preparo antes da aula.

---

## Preparar a caça ao tesouro (missão 007)

O script [`caca-ao-tesouro.sh`](caca-ao-tesouro.sh) cria `~/caca-ao-tesouro` na pasta de cada aluno, já com o dono certo. Rode uma vez por máquina, passando os usuários dos alunos:

```bash
sudo bash caca-ao-tesouro.sh ana joao
```

Sem argumentos, ele cria a caça na pasta de quem rodou:

```bash
bash caca-ao-tesouro.sh
```

Rodar de novo **recria a caça do zero**, útil para quem quiser jogar outra vez.

### A trilha

`LEIA-ME.txt` → `portao/` (cd, cat) → `jardim/.pista2.txt` (ls -a) → `labirinto/` (find) → `biblioteca/` (grep) → `cofre/senha.txt` (rev) → `cofre/abrir.sh` (chmod +x, ./)

**Palavra secreta:** PEQUI.

> Não deixe o script nas máquinas dos alunos: lendo o script, a caça perde a graça.

---

## Dicas para a aula andar sozinha

- Confira antes se as máquinas têm o **LibreOffice Writer e Calc**. O Kubuntu 26.04 costuma trazer, mas laboratórios variam.
- O **checkpoint** é o único momento obrigatório com cada aluno: 2 minutos para olhar, carimbar e fazer uma pergunta.
- Quem termina o passaporte vira **monitor** do próximo iniciante. Ensinar fixa o que aprendeu e alivia o educador.
- Os dados da missão 005 podem sair da **pesquisa de campo** real; assim o trabalho dos iniciantes já serve ao projeto.
- Na missão 006, o desafio com `sudo` é proposital: é a hora de conversar sobre o que é ser **administrador** da máquina.
