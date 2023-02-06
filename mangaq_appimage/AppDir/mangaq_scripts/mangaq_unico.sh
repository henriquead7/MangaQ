#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br> <youtube.com/OSistematico>
# descrição: Pequeno utilitário Zenity do MangaQ, que seleciona uma pasta contendo imagens e compacta num arquivo único em CBZ.
# version: 1.1
# licença: MIT License

#EXIBE MENSAGEM INICIAL
zenity --info --text="MangaQ irá compactar suas imagens em um único CBZ"

#SELECIONA PASTA PARA TRANSFORMAR EM CBZ, SELECIONA O DESTINO E NOMEIA O ARQUIVO FINAL
pasta=$(zenity --file-selection --directory --title "Selecione uma pasta com imagens")

if [ -d "$pasta" ]; then
   destino=$(zenity --file-selection --directory --title "Selecione o destino do arquivo CBZ")
if [ -d "$destino" ]; then
  nome_cbz=$(zenity --entry --text "Digite o nome do arquivo CBZ:")

#VERIFICA SE O ARQUIVO TEM NOME VAZIO OU COM "." E SUBSTITUI POR "Sem_nome"
if [ -z "$nome_cbz" ] || [ "$nome_cbz" == "." ]; then
nome_cbz="Sem_nome"
fi

#COMPRIME EM CBZ E SALVA NA PASTA DESTINO COM NOME
  cd "$pasta"
  zip -r "$destino/$nome_cbz".cbz * | zenity --progress --pulsate --title "Criando CBZ..." --auto-close
  zenity --info --text "Arquivo salvo em ''$destino/$nome_cbz.cbz''"
else
  zenity --error --text "Pasta de destino não encontrada."
fi
else
  zenity --error --text "Pasta de origem não encontrada."
fi


