#!/bin/bash
##
###
##################################################################################
# Autor: Antonio Henrique (Fela)                                                 #
# e-mail: ahlr_2000@yahoo.com                                                    #
# repositório: github.com/ahlrodrigues/slackonfig                                #
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
# V0.1                                                                           #
#                                                                                #
# Last update: 22/08/2017                                                        #
#                                                                                #
##################################################################################
###
##
#
# PARA QUE O SCRIPT FUNCIONE TROCUE A VARIÁVEL SLACKONFIG=OFF PARA SLACKONFIG=ON.
slackonfig=on 

# Para ativar as funções deste script, troque as variábeis abaixo para "yes".
# Veja as funcões de cada script na página inicial do projeto slackonfig: https://github.com/ahlrodrigues/slackonfig







  boinc=no



  pkgs=no

  teamviewer=no
  multilib=no


  bnb=no 






avisotxt="\e[ \t$GREEN Aviso.sh => Cria lembrete para baixar a cobrança $NC"



pkgstxt="\e[ \t$GREEN Instalacao lista de pacotes $NC"

multilibtxt="\e[ \t$GREEN slackpkg => Aplicacao do layer multilib $NC"

boinctxt="\e[ \t$GREEN boinc.sh => Arquivo de inicialização do BOIC $NC"

bnbtxt="\e[ \t$GREEN bnb.sh => Busca arquivos de retorno da BNB $NC"

# --------- Utilização de Cores  --------- #
BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\033[0m' # reset/no color
BLUE='\e[1;34m'
PINK='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'







	if [ $boinc == yes ]; then
	  echo -e "$boinctxt"
	fi

	if [ $thunderbackup == yes ]; then
	  echo -e "$thunderbackuptxt"
	fi

	if [ $bnb == yes ]; then
	  echo -e "$bnbtxt"
	fi

# --------- Listando funções --------- #
	echo
	echo
	echo -e "\e[ \t$CYAN Deseja executar as funções acima? Posso continuar? [Y|N] $NC"

	 read RESPOSTA
	 case $RESPOSTA in
	 N|n) echo "Saindo!" 
	 echo
	 echo
	 exit;;
	
# --------- Texto 1 --------- #
	Y|y)echo
	echo
	echo -e "\e[ \t\e[1;33;40m Criando todos os arquivos de configuração nas devidas pastas e executando processos de configuração $NC"
	echo
	echo	
	sleep 3
      

##########################################
#                                        #      
# --------- Início das Funções --------- #      
#                                        #      
#   Não editar a partir deste ponto      #      
#                                        #      
##########################################      









if [ $boinc == yes ]; then
    echo -e "$boinctxt"
    echo "#!"$SHELL >> $ulbin/boinc.sh
    echo "cd /mnt/sda3/BOINC/" >> $ulbin/boinc.sh
    echo "./boinc" >> $ulbin/boinc.sh
    chmod +x $ulbin/boinc.sh
    sleep 3
fi  

#Instalação do Teamviewer
if [ $teamviewer == yes ]; then
    echo -e "$teamviewertxt"
     wget -q -e robots=0 -r -nd -cP /tmp \
     https://download.teamviewer.com/download/teamviewer_i386.deb \
     http://slackbuilds.org/slackbuilds/14.2/network/teamviewer.tar.gz
     cd /tmp
     tar zvxf teamviewer.tar.gz
     mv teamviewer*.deb teamviewer/
     cd teamviewer
     ./teamviewer.SlackBuild
    installpkg /tmp/teamviewer*.tgz
    rm -fR /tmp/teamviewer*
    chmod +x /etc/rc.d/rc.teamviewerd
    /etc/rc.d/rc.teamviewerd start
    sleep 3
fi







