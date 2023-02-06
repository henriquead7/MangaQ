# MangaQ
Script de compactação de pastas, com imagens, no formato digital de leitura aberto de mangás e HQ's CBZ.


**MangaQ** é um shell script Linux que faz uso dos utilitários **Zip**, para compactação dos arquivos, e **Zenity** para interface gráfica.
Originalmente este script era apenas de uso interno, afim de criar arquivos CBZ das minhas coleções de Mangás/HQ's digitalizadas em png/jpg, mas sem uma interface gráfica e com criação em lote somente.

Atualmente o MangaQ possui uma interface interativa em Zenity bem simples, mas que torna a experiência rica, com opções de criação de um arquivo único ou em lotes.

***

## Funções do MangaQ
O formato digital de leitura aberto CBZ, basicamente é um conjunto de imagens "encapsuladas"/compactados. No qual outros softwares fazem uso, como: Komikku, OpenComic, Evince, mComix e qualquer outro leitor de mangás e HQ's do mercado. Utilizar tal formato é uma ótima prática para conservar seus arquivos de leitura, além de ser um formato aberto o CBZ preserva as qualidades originais das imagens, podendo inclusive extrair as imagens posteriormente caso deseje.

Por design o MangaQ não remove os arquivos originais após a criação dos arquivos CBZ. Essa escolha é totalmente proposital, assim se eventualmente algum erro ocorra no processo seus arquivos continuarão seguros.

O menu principal contém 03 opções:

![Imagem do menu principal](https://github.com/henriquead7/MangaQ/blob/main/mangaq_imagens/IMG_01.png)

### Sobre MangaQ
Algumas informações úteis sobre o MangaQ e seus recursos.

![Gif opção sobre](https://github.com/henriquead7/MangaQ/blob/main/mangaq_imagens/VID_00.gif)

### Criar único arquivo CBZ (print antiga)
Crie um arquivo CBZ escolhendo uma única pasta contendo várias imagens, dê nome ao arquivo final.

![Gif opção criar único CBZ](https://github.com/henriquead7/MangaQ/blob/main/mangaq_imagens/VID_01.gif)

### Criar lote de arquivos CBZ (print antiga)
Crie arquivos em lote, contudo desta vez escolha uma pasta "pai" contendo outras pastas "filho" cada uma com suas respectivas imagens. Essa opção é interessante caso tenha diversos capítulos e queira vários arquivos CBZ por capitulo. Os nomes dos arquivos finais serão os mesmos das pastas, para renomear em lote utilize um software de terceiros (todo gerenciador de arquivos moderno, por exemplo o Nautilus do GNOME, possui o recurso de renomear em lote).

![Gif opção criar lote CBZ](https://github.com/henriquead7/MangaQ/blob/main/mangaq_imagens/VID_02.gif)

***

## MangaQ em AppImage
Para facilitar o uso do MangaQ empacotei o mesmo em AppImage, bastando dar as permissões de execução uma única vez e dando dois cliques sobre o mesmo. Fique ciente que ao utilizar o ManfaQ no formato shell script é preciso configurar o caminho onde os scripts se encontram, no AppImage nenhuma configuração deste tipo é necessária. É possível integrar o AppImage via **AppImageLauncher** (esteja ciente que por se tratar de um utilitário script baseado em Zenity terá um ícone genérico).

![Gif como executar appimage](https://github.com/henriquead7/MangaQ/blob/main/mangaq_imagens/VID_04.gif)

[Baixe o MangaQ em AppImage!](https://github.com/henriquead7/MangaQ/releases/download/v1.0/MangaQ-x86_64.AppImage)

***

## Considere apoiar o projeto OSistemático

[Apoia.se](https://apoia.se/osistematico) |
[Youtube](https://www.youtube.com/OSistematico) |
[Site](http://www.osistematico.com.br/) |
[Twitter](https://twitter.com/henriquead7)

***Obrigado pela atenção e apoio de todos, SISTEMATICAMENTE!***
