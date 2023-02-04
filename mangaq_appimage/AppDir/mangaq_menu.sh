#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br> <youtube.com/OSistematico>
# descrição: Menu via utilitário Zenity, para acessar diversas funções em vários scripts do MangaQ.
# version: 1.0
# licença: MIT License


#PARA FUNCIONAMENTO DO APPIMAGE
export APPDIR="$(dirname "$(readlink -f "${0}")")"

# Menu principal do MangaQ

#DIRETÓRIO DOS DEMAIS SCRIPTS, QUE DEVE ESTAR NO MESMO DIRETÓRIO DESTE SCRIPT 
CAMINHO_SCRIPTS="$APPDIR/mangaq_scripts"

#EXIBE MENSAGEM INICIAL
zenity --info --text="Bem-vindo ao MangaQ, o script de compactação de pastas em CBZ"

titulo="Imagens em CBZ com MangaQ"
prompt="                                                          Escolha uma opção"
options=(
          "[0] ---> Sobre MangaQ"
          "[1] ---> Criar único arquivo CBZ"
          "[2] ---> Criar lote de arquivos CBZ"
          "[3] ---> Sair"
        )
while opt=$(zenity --title="$titulo" --text="$prompt" --list --width=500 --height=410  \
                   --column="Opções" --hide-header "${options[@]}"); do
    
    case "$opt" in

    #SOBRE/FAQ
    "${options[0]}" ) source $CAMINHO_SCRIPTS/mangaq_faq.sh 
     ;;
     
    #CRIAR ÚNICO ARQUIVO CBZ
    "${options[1]}" ) source $CAMINHO_SCRIPTS/mangaq_unico.sh 
     ;;
     
    #CRIAR LOTE DE ARQUIVOS CBZ
    "${options[2]}" ) cd $HOME
                      source $CAMINHO_SCRIPTS/mangaq_lote.sh
     ;;

    #CRIAR LOTE DE ARQUIVOS CBZ
    "${options[3]}" ) exit
     ;;

    *) zenity --error --text="Opção inválida!" --width=150 --height=100;;
    esac

done

exit

