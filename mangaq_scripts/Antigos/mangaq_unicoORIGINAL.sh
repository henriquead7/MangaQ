#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br> <youtube.com/OSistematico>
# descrição: Pequeno utilitário Zenity do MangaQ, que seleciona uma pasta contendo imagens e compacta num arquivo único em CBZ.
# version: 1.0
# licença: MIT License

#EXIBE MENSAGEM INICIAL
zenity --info --text="MangaQ irá compactar suas imagens em um único CBZ"

#SELECIONA PASTA PARA TRANSFORMAR EM CBZ, SELECIONA O DESTINO E NOMEIA O ARQUIVO FINAL
  pasta=$(zenity --file-selection --directory --title "Selecione uma pasta com imagens")
  destino=$(zenity --file-selection --directory --title "Selecione o destino do arquivo CBZ")
  nome_cbz=$(zenity --entry --text "Digite o nome do arquivo CBZ:")

  if [ -d "$pasta" ]; then
    cd "$pasta"
    zip -r "$destino/$nome_cbz".cbz * | zenity --progress --pulsate --title "Criando CBZ..." --auto-close
    zenity --info --text "Arquivo salvo em ''$destino/$nome_cbz.cbz''"
  else
    zenity --error --text "Pasta não encontrada."
  fi

