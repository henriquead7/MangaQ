#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br> <youtube.com/OSistematico>
# descrição: Pequeno utilitário Zenity do MangaQ, que seleciona uma pasta contendo outras pastas com imagens e de forma recursiva compacta em vários arquivos em CBZ.
# version: 1.0
# licença: MIT License

#MENSAGEM INICIAL
zenity --info --text="MangaQ irá compactar suas pastas com imagens em vários arquivos CBZ"

#SELECIONA A PASTA QUE SERÁ COMPACTADA EM CBZ
pasta=$(zenity --file-selection --directory --title="Selecione a pasta com as imagens")

#VERIFICA SE A PASTA FOI SELECIONADA
if [ -z "$pasta" ]; then
  zenity --error --text="Pasta não selecionada. Encerrando MangaQ..."
  exit 1
fi

#SELECIONA O DESTINO FINAL DOS ARQUIVOS CBZ
destino=$(zenity --file-selection --directory --title="Selecione o local de destino dos arquivos CBZ")

#VERIFICA SE O DESTINO FOI SELECIONADO
if [ -z "$destino" ]; then
  zenity --error --text="Destino não selecionado. Encerrando MangaQ..."
  exit 1
fi

#COMPACTA DE FORMA RECURSIVA TODAS AS PASTAS DENTRO DA PASTA SELECIONADA
find "$pasta" -mindepth 1 -type d | while read -r pasta_origem; do
  nome=$(basename "$pasta_origem")
  arquivo_cbz="$destino/$nome.cbz"
  
  (
    cd "$pasta_origem" || exit
    zip -q -r "$arquivo_cbz" .
  ) | zenity --progress --pulsate --title="Compactando $nome" --text="compactando $nome para $arquivo_cbz..." --auto-close
done

#MENSAGEM DE SUCESSO
zenity --info --text="Arquivos CBZ criados com sucesso!"

