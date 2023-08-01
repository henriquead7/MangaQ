#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br> <youtube.com/OSistematico>
# descrição: Pequeno utilitário Zenity do MangaQ, que seleciona uma pasta contendo outras pastas com imagens e de forma recursiva compacta em vários arquivos em CBZ.
# version: 1.2
# licença: MIT License

#DIRETÓRIO DO SCRIPT MENU 
CAMINHO_SCRIPTS="$APPDIR"

#MENSAGEM INICIAL
zenity --info --text="MangaQ irá compactar suas pastas com imagens em vários arquivos CBZ"

#SELECIONA A PASTA QUE SERÁ COMPACTADA EM CBZ
pasta=$(zenity --file-selection --directory --title="Selecione a pasta com as imagens")

#VERIFICA SE A PASTA FOI SELECIONADA
if [ -z "$pasta" ]; then
  zenity --error --text="Pasta não selecionada. Reiniciando o MangaQ..."
  source "$CAMINHO_SCRIPTS/mangaq_menu.sh"
  exit 1
fi

#CONTA A QUANTIDADE DE ARQUIVOS NA PASTA E QUANTAS PASTAS
total_arquivos=$(find "$pasta" -type f | wc -l)
total_pastas=$(ls -l "$pasta" | grep ^d | wc -l)
total_pastas=$((total_pastas + 1))
arquivo_atual=0

#SELECIONA O DESTINO FINAL DOS ARQUIVOS CBZ
destino=$(zenity --file-selection --directory --title="Selecione o local de destino dos arquivos CBZ")

#VERIFICA SE O DESTINO FOI SELECIONADO
if [ -z "$destino" ]; then
  zenity --error --text="Destino não selecionado. Reiniciando o MangaQ..."
  source "$CAMINHO_SCRIPTS/mangaq_menu.sh"
  exit 1
fi

#COMPACTA DE FORMA RECURSIVA TODAS AS PASTAS DENTRO DA PASTA SELECIONADA
(
for arquivo in "$pasta"/*; do
  if [ -d "$arquivo" ]; then
    arquivo_atual=$((arquivo_atual + 1))
    nome_arquivo=$(basename "$arquivo")
    cd "$pasta" || exit
    zip -r "$destino/$nome_arquivo.cbz" "$nome_arquivo" >/dev/null 2>&1
    percentage=$((100 * arquivo_atual / total_pastas))
    echo "# Compactando '$nome_arquivo' --> $arquivo_atual de $total_pastas"
    echo "$percentage"
    sleep 0.1  # Atraso para atualizar a barra de progresso no Zenity
  fi
done
) | zenity --progress \
  --title="Compactando arquivos" \
  --text="Compactando arquivos para formato CBZ..." \
  --percentage=0 \
  --auto-close \
  --pulsate \
  --no-cancel

#MENSAGEM DE SUCESSO
zenity --info --text "Arquivos CBZ salvos em '$destino'"

#VOLTA AO MENU PRINCIPAL
source "$CAMINHO_SCRIPTS/mangaq_menu.sh"

exit

