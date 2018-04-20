#!/bin/bash

# --------- Cores  --------- #
BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\033[0m' # reset/no color
BLUE='\e[1;34m'
PINK='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'
YELLOW='\e[1;33m'

# --------- Caminhos mais usados  --------- #
crondaily=/home/ahlr
cronhourly=/home/ahlr
minilicense=/tmp/minilicense.txt
pkgs=/tmp/pkgs.txt
rcd=/home/ahlr
ulbin=/home/ahlr
usa=/home/ahlr
blacklist=">> /etc/slackpkg/blacklist"
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs

# --------- Mensagens --------- #

aminilicensetxt="\e[ \t$GREEN minilicense.txt => Arquivo de licença a ser incluído nos spripts $NC"
apkgstxt="\e[ \t$GREEN pkgs.txt => Arquivo com lista de pacotes a serem instalados automaticamente $NC"
cleanrettxt="\e[ \t$GREEN cleanret.sh => Move os arquivos de retorno da caixa $NC"
mvrejsgrtxt="\e[ \t$GREEN mvrejsgr.sh => Move os arquivos de rejeitados e francesinha do BNB $NC"
cleansicitxt="\e[ \t$GREEN cleansici.sh => Move os arquivos declaração do SICI para o Dropbox $NC"
backupprojetostxt="\e[ \t$GREEN backupprojetos.sh => Mover os arquivos de backup das configuracoes $NC"
cleansaitxt="\e[ \t$GREEN cleansai.sh => Move os arquivos de retorno do bnb $NC"
cleancachetxt="\e[ \t$GREEN cleancache.sh => Limpa o cache $NC"
ntptxt="\e[ \t$GREEN ntp.sh => Habilita o NTP pool server brasileiro $NC"
sambatxt="\e[ \t$GREEN Configuraçoes do Samba $NC"
samba2txt="\e[ \t$GREEN Incluindo inicialização do daeamon do Samba no rc.local $NC"
cupstxt="\e[ \t$GREEN Inicializando do CUPS $NC"
shutdowntxt="\e[ \t$GREEN Configuracoes de rc.local_shutdown $NC"
teamviewerdtxt="\e[ \t$GREEN Incluindo inicialização do deamon do teamviewer no rc.local $NC"
plextxt="\e[ \t$GREEN Incluindo inicialização do deamon do Plex no rc.local $NC"
mirrorstxt="\e[ \t$GREEN mirror-slackware => Administracao dos mirros locais $NC"
inittabtxt="\e[ \t$GREEN Habilitando o init 4 $NC"


networkmanagertxt="\e[ \t$GREEN rc.4 => Inicialzando networkmanager $NC"
boinctxt="\e[ \t$GREEN boinc.sh => Arquivo de inicialização do BOIC $NC"
reccxtxt="\e[ \t$GREEN Cria pasta para os arquivos da CEF e dá permissão de execucao $NC"
brothertxt="\e[ \t$GREEN instalacao do driver da impressora $NC"
langtxt="\e[ \t$GREEN Configurando local pt-BR $NC"
thunderbirdtxt="\e[ \t$GREEN thunderbirdbackup.sh => Restauracao do Thunderbird $NC"
thunderbackuptxt="\e[ \t$GREEN thunderbackup.sh => Backup do Thunderbird $NC"
bbazetonicotxt="\e[ \t$GREEN bbazetonico.sh => Faz backup no Backblaze $NC"
bbazenet4youtxt="\e[ \t$GREEN bbazenet4you.sh => Faz backup no Backblaze $NC"
datatxt="\e[ \t$GREEN data.sh => Script de calculo data $NC"
pkgstxt="\e[ \t$GREEN Instalacao lista de pacotes $NC"
slackpkgtxt="\e[ \t$GREEN slackpkg => Configuracao do slackpkg e slackpkgplus $NC"
multilibtxt="\e[ \t$GREEN slackpkg => Aplicacao do layer multilib $NC"
konsoletxt="\e[ \t$GREEN Configura o profile do Konsole $NC"
winboxtxt="\e[ \t$GREEN winbox.sh => Cria a entrada do Winbox no mennu do KDE $NC"
skylinetxt="\e[ \t$GREEN skyline.sh => Cria a entrada do Skyline no mennu do KDE $NC"

bnbtxt="\e[ \t$GREEN bnb.sh => Busca arquivos de retorno da BNB $NC"
numLocktxt="\e[ \t$GREEN Ativando o NumLock $NC"
spotifytxt="\e[ \t$GREEN spotify.sh => Instala o Spotify $NC"




pkgs=yes


#Instalação dos programas listados no arquivo pkg.txt

	echo "Qual o caminho para o mirror local?"
	read caminho
	sed -i "s|# file://path/to/some/directory/|file://$caminho|g" /etc/slackpkg/mirrors




