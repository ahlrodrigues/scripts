#!/bin/bash
#
##
###
##################################################################################
# Autor: Antonio Henrique (Fela)                                                 #
# e-mail: ahlr_2000@yahoo.com                                                    #
#                                                                                #
# repositórios:                                                                  #
# github.com/ahlrodrigues/slackonfig                                             #
# bitbucket.org/ahlrodrigues/slackonfig                                          #
#                                                                                #
# Bugs, Agradecimentos, Críticas "construtivas"!                                 #
# Mande me um e-mail, que ficarei muito grato!                                   #
#                                                                                #
# Este scripts é disponibilizado na esperança que possa ser útil,                #
# mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A #
# QUALQUER SISTEMA, SEM NENHUMA GARANTIA DE APLICAÇÃO EM PARTICULAR e NENHUM     #
# SUPORTE TÉCNICO.                                                               #
#                                                                                #
# Estes scripts/programas são softwares livres, você pode redistribuí-los e/ou   #
# modifica-los dentro dos termos da Licença Pública Geral GNU.                   #
#                                                                                #
# GNU General Public License:                                                    #
# [GPL](https://pt.wikipedia.org/wiki/GNU_General_Public_License)                #
# Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,             #
# Boston, MA 02110-1301 USA                                                      #
##################################################################################
###
##
#
#
##
###
##################################################################################
#                                                                                #
# Script: Criação e edição de arquivos de configuração do Slackware GNU/Linux    #
#                                                                                #
# V0.current                                                                     #
#                                                                                #
# Last update: 2018/06/19                                                        #
#                                                                                #
##################################################################################
###
##
#
#
# PARA QUE O SCRIPT FUNCIONE TROCUE A VARIÁVEL slackonfig=nof PARA slackonfig=yes. Utilizado para aplicar funções pré configuradas.
slackonfig=no

# inittab | ntp | cups | konsole | lang | 

# Para ativar as funções deste script, troque as variábeis abaixo para "yes".
# Veja as funcões de cada script na página inicial do projeto slackonfig: 
# https://github.com/ahlrodrigues/slackonfig
mlocal=no
cleanret=no       
mvrejsgr=no
cleansici=no
cleansai=no
cleancache=no
ntp=no
samba=no
cups=no
shutdown=no
teamviewerd=no
plex=no
mirrorx86_64=no
mirrorarm=no  
inittab=no
networkmanager=no
konsole=no
reccx=no
brother=no
lang=no
thunderbackup=no
thunderbird=no
bblazetonico=no
bblazenet4you=no
data=no
winbox=no
cashflow=no
skyline=no
cobranca=no
slackpkg=no
slackpkgplus=no
pkgs=yes
hubiCNET4YOU=no
credhubiCNET4YOU=no
multilib=no
sshbackup=no
ktown=no
clamav=no
projetos=no
doplexpkg=no
doteamviewerpkg=no
dochangelog=yes

# --------- Mensagens --------- #
mlocaltxt="$GREEN Configurando mirror local $NC"
aminilicensetxt="$GREEN Arquivo de licença a ser incluído nos spripts $NC"
acolorstxt="$GREEN Arquivo de cores a ser incluído nos spripts $NC"
apkgstxt="$GREEN Arquivo com lista de pacotes a serem instalados pelo slackpkg $NC"
cleanrettxt="$GREEN Move os arquivos de retorno da caixa; $NC"
mvrejsgrtxt="$GREEN Move os arquivos de rejeitados e francesinha do BNB; $NC"
cleansicitxt="$GREEN Move os recibo de declaração do SICI para o Dropbox; $NC"
cleansaitxt="$GREEN Move os arquivos de retorno do bnb; $NC"
cleancachetxt="$GREEN Limpa o cache; $NC"
ntptxt="$GREEN Habilita o NTP pool server brasileiro; $NC"
sambatxt="$GREEN Configura o grupo de trabalho do Samba; $NC"
samba2txt="$GREEN Incluindo inicialização do deamon do Samba no rc.local; $NC"
cupstxt="$GREEN Inicializa o deamon do servidor de impressão CUPS; $NC"
shutdowntxt="$GREEN Cria o rc.local_shutdown para limpeza dos /tmp's no shutdown; $NC"
teamviewerdtxt="$GREEN Incluindo inicialização do daemon do teamviewer no rc.local; $NC"
plextxt="$GREEN Incluindo inicialização do daemon do Plex no rc.local; $NC"
mirrorx86_64txt="$GREEN Administração do mirror x86_64 locail; $NC"
mirrorarmtxt="$GREEN Administração do mirror ARM locail; $NC"
inittabtxt="$GREEN Habilitando o init 4; $NC"
networkmanagertxt="$GREEN Inicialzando networkmanager; $NC"
konsoletxt="$GREEN Configura o profile do Konsole; $NC"
reccxtxt="$GREEN Cria pasta para os arquivos da CEF e dá permissão de usuário; $NC"
brothertxt="$GREEN instalacao do driver da impressora; $NC"
langtxt="$GREEN Configurando local pt-BR; $NC"
thunderbackuptxt="$GREEN Cria/Recupera backup do Thunderbird; $NC"
thunderbirdtxt="$GREEN Cria configurações do Thunderbird; $NC"
bblazetonicotxt="$GREEN Faz backup no Backblaze; $NC"
bblazenet4youtxt="$GREEN Faz backup no Backblaze; $NC"
datatxt="$GREEN Script de calculo data; $NC"
winboxtxt="$GREEN Cria a entrada do Winbox no menu do KDE; $NC"
cashflowtxt="$GREEN Cria a entrada do CashFlow no menu do KDE; $NC"
skylinetxt="$GREEN Cria a entrada do Skyline no menu do KDE; $NC"
cobrancatxt="$GREEN Cria script de administração da cobramça do BN; $NC"
slackpkgtxt="$GREEN Instala e configura o slackpkg; $NC"
slackpkgplustxt="$GREEN Instala e configura slackpkgplus; $NC"
pkgstxt="$GREEN Instalacao da lista de pacotes; $NC"
hubiCNET4YOUtxt="$GREEN Faz backup no hubic; $NC"
credhubiCNET4YOUtxt="$GREEN Cria as credenciais da conta hubiC_NET4YOU; $NC"
multilibtxt="$GREEN Aplica layer multilib; $NC"
sshbackuptxt="$GREEN Cria script de backup dos equipamentos mikrotik; $NC"
ktowntxt="$GREEN Cria o script rsync para o ktown do AlienBob; $NC"
clamavtxt="$GREEN Inicialzando do clamav; $NC"
projetostxt="$GREEN Atualiza pasta Projetos local; $NC"
doplexpkgtxt="$GREEN Automatiza o Slackbuild do Plexmediaserver; $NC"
doteamviewerpkgtxt="$GREEN Automatiza o Slackbuild do Teamviewer; $NC"
dochangelogtxt="$GREEN Cria o script para escerever no ChangeLog.txt; $NC"


# --------- Lista de dependências  --------- #
sshbackupdep="$PINK sshbackup=> sshpass; $NC"
blazehubicdep="$PINK duplicity=> librsync, lockfile, pip; $NC"



# --------- Caminhos mais usados  --------- #
crondaily=/etc/cron.daily
cronhourly=/etc/cron.hourly
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
lpkgs=/tmp/pkgs.txt
rcd=/etc/rc.d
ulbin=/usr/local/bin
usa=/usr/share/applications
blacklist=">> /etc/slackpkg/blacklist"
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs
imag="/home/ahlr/Dropbox/TONICO/Projetos/slackonfig/imgs"
drop=/home/ahlr/Dropbox
downloads=/home/ahlr/Downloads
permix="chmod +x"
permi0="chmod 770"
caminho=/mnt/sda3/Slackware
home=/home/ahlr
null="/dev/null"

 

# --------- Limpa tudo --------- #
clear

# --------- Efeito nas Cores  --------- #
#0 Normal Characters
#1 Bold Characters
#4 Underlined Characters
#5 Blinking Characters
#7 Reverse video Characters

# --------- Cores  --------- #
BLACK='\e[1;30m'
BBLACK='\e[5;30m'
RED='\e[1;31m'
BRED='\e[5;31m' # bink color
GREEN='\e[1;32m'
BGREEN='\e[1;32m'
BROWN='\e[1;33m'
BBROWN='\e[5;33m'
BLUE='\e[1;34m'
BBLUE='\e[5;34m'
PINK='\e[1;35m'
BPINK='\e[5;35m'
CYAN='\e[1;36m'
BCYAN='\e[5;36m'
WHITE='\e[1;37m'
BWHITE='\e[5;37m'
NC='\033[0m' # reset/no color

# #Instalação dos programas listados no arquivo pkg.txt
# if [ $pkgs == yes ]; then
#     grep -q '^file' '/etc/slackpkg/mirrors'
#     if [ $? = 0 ]; then
#     grep -q '^MIRRORPLUS['multilib']' '/etc/slackpkg/slackpkgplus.conf' echo $?
#     if [ $? = 0 ]; then
#     grep -q '^MIRRORPLUS['alienbob']' '/etc/slackpkg/slackpkgplus.conf'
#     if [ $? = 0 ]; then
#     if [ ! -f "$pkgs" ]; then
# 	echo -e "$apkgstxt"
# 	wget -q  -nv -e robots=0 -r -nd -cP /tmp $rawdocs/pkgs.txt
#     else
# 	echo -e "$RED Arquivo $GREEN $apkgstxt $RED foi encontrado. $NC"
# 	sleep 5
#     fi
#     echo -e "$pkgstxt"
#     echo "pacotes instalados"
#     else
#     echo -e "$RED Configure o MIRRORPLUS['alienbob'] $NC"
#     exit
#     fi
#     else
#     echo -e "$RED Configure o MIRRORPLUS['multilib'] $NC"
#     exit
#     fi
#     else
#     echo -e "$RED Configure o /etc/slackpkg/mirrors $NC"
#     exit
#     fi
#     sleep 5
# fi


# Criar script que move os arquivos da CEF
if [ $cleanret == yes ]; then
    echo -e "$cleanrettxt"
    echo "#!"$SHELL > $crondaily/cleanret.sh
    cat $minilicense >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "pasta_origem=$downloads" >> $crondaily/cleanret.sh
    echo "pasta_retorno=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos" >> $crondaily/cleanret.sh
    echo "pasta_remessa=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
      if [ ! -d $pasta_retorno ]; then
	mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos/
      fi
      if [ ! -d $pasta_remessa ]; then
	mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa/
      fi
    echo "arquivos=`ls $downloads | awk '/R*.ret/ { print \$0 }'`" >> $crondaily/cleanret.sh
    echo "if [ \"\$arquivos\" != \"\" ]; then" >> $crondaily/cleanret.sh
    echo "mv \$pasta_origem/R*.ret \$pasta_retorno" >> $crondaily/cleanret.sh
    echo "fi" >> $crondaily/cleanret.sh
    echo "arquivos2=ls $downloads | awk '/E*.rem/ { print \$0 }'" >> $crondaily/cleanret.sh
    echo "" >> $crondaily/cleanret.sh
    echo "if [ \"\$arquivos\" != \"\" ]; then" >> $crondaily/cleanret.sh
    echo "mv \$pasta_origem2/E*.rem \$pasta_remessa" >> $crondaily/cleanret.sh
    echo "fi" >> $crondaily/cleanret.sh
    $permix $crondaily/cleanret.sh
    #$permi0 $crondaily/cleanret.sh    
    sleep 5
fi



