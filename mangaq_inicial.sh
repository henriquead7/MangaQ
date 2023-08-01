#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br>
# descrição: Inicia com tela de boas-vindas e carrega o script de menu principal 
# version: 1.2
# licença: MIT License

#EXIBE MENSAGEM INICIAL
zenity --info --text="Bem-vindo ao MangaQ, o script de compactação de pastas em CBZ"

source $APPDIR/mangaq_menu.sh

exit
