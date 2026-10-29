#!/usr/bin/env bash
# Caça ao Tesouro do Terminal — Incubadoras Criativas
# Uso:
#   bash caca-ao-tesouro.sh                  -> cria na pasta do próprio usuário
#   sudo bash caca-ao-tesouro.sh ana joao    -> cria na pasta de cada aluno
set -euo pipefail

criar() {
  local home_dir="$1" dono="$2"
  local base="$home_dir/caca-ao-tesouro"

  rm -rf "$base"
  mkdir -p "$base"/{portao,jardim,biblioteca,cofre}
  mkdir -p "$base"/labirinto/{norte,sul,leste,oeste}/{pedra,arvore,rio}

  cat > "$base/LEIA-ME.txt" <<'EOF'
Bem-vindo(a) à Caça ao Tesouro do Terminal!

Cada pista ensina um comando novo. No fim, você descobre a palavra secreta.

A primeira pista está dentro da pasta "portao".
Entre nela com:  cd portao
Veja o que tem lá com:  ls
Leia um arquivo com:  cat nome-do-arquivo
EOF

  cat > "$base/portao/pista1.txt" <<'EOF'
Muito bem! Você sabe entrar em pastas e ler arquivos.

A próxima pista está na pasta "jardim". Mas ela está ESCONDIDA.
Arquivos escondidos começam com ponto e só aparecem com:  ls -a

Dica: para sair desta pasta e entrar no jardim, use:  cd ../jardim
EOF
  echo "Não é aqui. Leia o arquivo pista1.txt." > "$base/portao/nao-e-aqui.txt"

  cat > "$base/jardim/.pista2.txt" <<'EOF'
Você achou o arquivo escondido!

Agora vá para a pasta "labirinto":  cd ../labirinto
Ela tem 12 pastas dentro de outras pastas. Procurar uma por uma cansa.
Peça ao computador para procurar por você:

    find . -name 'pista3*'

O find mostra o caminho do arquivo. Leia com cat + o caminho.
EOF
  echo "Só flores por aqui. Será que tem algo que você não está vendo?" > "$base/jardim/flores.txt"

  for d in norte leste oeste; do
    for s in pedra arvore rio; do
      echo "Caminho errado. Volte e use o find." > "$base/labirinto/$d/$s/beco.txt"
    done
  done

  cat > "$base/labirinto/sul/rio/pista3.txt" <<'EOF'
Achou! O find é o detetive do Linux.

Volte para o início da caça:  cd ~/caca-ao-tesouro

A pasta "biblioteca" tem 30 livros. Só um tem a próxima pista,
e ele contém a palavra CERRADO, escrita toda em maiúsculas.
Procure dentro de todos os livros de uma vez:

    grep -r CERRADO biblioteca
EOF

  local frases=(
    "O cerrado é a savana mais rica do mundo em espécies."
    "O pequi é um fruto típico do cerrado. Cuidado com os espinhos!"
    "Ceilândia nasceu em 1971 e hoje é a região mais populosa do DF."
    "O ipê amarelo floresce no fim da seca."
    "Muitos rios do Brasil nascem no cerrado."
    "Exercício físico regular faz bem ao coração e à cabeça."
  )
  local i n
  for i in $(seq -w 1 30); do
    n=$((10#$i % ${#frases[@]}))
    {
      echo "Livro $i"
      echo
      echo "${frases[$n]}"
      echo "Nada de pistas neste livro."
    } > "$base/biblioteca/livro$i.txt"
  done
  cat > "$base/biblioteca/livro17.txt" <<'EOF'
Livro 17

CERRADO: você encontrou o livro certo!
A próxima pista está no arquivo cofre/senha.txt,
mas ela foi escrita de trás para frente. Leia com:

    rev cofre/senha.txt
EOF

  echo "Ultima etapa: o arquivo cofre/abrir.sh e um programa, mas ainda nao tem permissao para rodar. De a permissao com: chmod +x cofre/abrir.sh   e depois rode: ./cofre/abrir.sh" \
    | rev > "$base/cofre/senha.txt"

  cat > "$base/cofre/abrir.sh" <<'EOF'
#!/usr/bin/env bash
cat <<'TROFEU'

      ___________
     '._==_==_=_.'
     .-\:      /-.
    | (|:.     |) |
     '-|:.     |-'
       \::.    /
        '::. .'
          ) (
        _.' '._
       '-------'

  PARABÉNS! Você abriu o cofre!
  A palavra secreta é: PEQUI

  Cochiche no ouvido do educador.
TROFEU
EOF
  chmod 644 "$base/cofre/abrir.sh"

  chown -R "$dono":"$dono" "$base" 2>/dev/null || true
  echo "Caça criada em $base"
}

if [ "$#" -eq 0 ]; then
  criar "$HOME" "$(id -un)"
else
  for u in "$@"; do
    h=$(getent passwd "$u" | cut -d: -f6)
    if [ -z "$h" ]; then
      echo "Usuário $u não existe, pulando."
      continue
    fi
    criar "$h" "$u"
  done
fi
