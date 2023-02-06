#!/usr/bin/env bash
# autor: HenriqueAD <www.osistematico.com.br> <youtube.com/OSistematico>
# descrição: Menu via utilitário Zenity, para acessar diversas funções em vários scripts do MangaQ.
# version: 1.1
# licença: MIT License

# Menu principal do MangaQ

#DIRETÓRIO DOS DEMAIS SCRIPTS, QUE DEVE ESTAR NO MESMO DIRETÓRIO DESTE SCRIPT 
CAMINHO_SCRIPTS="$HOME/MangaQ/mangaq_scripts"

#EXIBE MENSAGEM INICIAL
zenity --info --text="Bem-vindo ao MangaQ, o script de compactação de pastas em CBZ"

#ATRIBUI VALOR AS OPÇÕES
titulo="Imagens em CBZ com MangaQ"
prompt="                                                          Escolha uma opção"
options=(
          "🗨️   Sobre MangaQ"
          "📕️   Criar único arquivo CBZ"
          "📚️   Criar lote de arquivos CBZ"
        )

#EXIBE MENU DE SELEÇÃO E OPÇÕES
while opt=$(zenity --list --width=500 --height=400 --title="$titulo" --text="$prompt" --column="Opção" --hide-header "${options[@]}" --cancel-label="Sair"); do

# verifica se a janela foi fechada sem seleção
if [[ $? -ne 0 ]]; then
  exit 0
fi
    
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

    *) zenity --error --title="Erro" --text="Opção inválida!" --width=150 --height=100;;
    esac

done

exit

