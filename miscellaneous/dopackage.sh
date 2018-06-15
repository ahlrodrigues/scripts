#!/bin/bash
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
#Usage: ./dopackage [namepkg] [formatpkg]


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
PINK='\e[1;33m'
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

#Teste de permissão
if [[ $(whoami) == "root" ]]; then

#Nome do pacote
nome=$1

#Formato do pacote
formato=$2

#Descompactando e movendo os pacotes
cd /home/ahlr/Downloads/

if [ -e $nome*.tar.gz ] && [ -e $nome*.$formato ]; then
tar zvxf $nome*.tar.gz
mv $nome*.$formato $nome
else
echo
echo
echo
echo -e "$PINK Ok, algo deu errado, o SlackBuild ou o Fonte não foi encontrado! $NC"
echo
echo
echo
exit
fi

#Obtendo a versão do pacote
versao=`ls $nome/$nome*.$formato | awk -F '_' {'print $2'}`


#Editando o SlackBuilds
sed -i "s/VERSION:-.*/VERSION:-$versao}/g" $nome/$nome.SlackBuild

#Rodando o SlackBuilds
cd $nome
./$nome.SlackBuild

#Instalar programa
echo
echo
echo
echo -e "$GREEN Vamos instalar o programa  $BBROWN $nome? Y|N $NC"
echo
echo
echo
read install

if [ $install == Y ]; then
upgradepkg --install-new /tmp/$nome*
else
echo
echo
echo
echo -e "$BRED Ok, algo deu errado! $NC"
exit
fi

#Apagando fontes
echo
echo
echo
echo -e "$PINK Posso apagar o arquivos utilizados? Y|N $NC"
echo
echo
echo
read lixo

if [ $lixo == Y ]; then
rm -fr $nome*
else
echo
echo
echo
echo -e "$BRED Ok, algo deu errado! $NC"
echo
echo
echo
fi

#Logue-se como root
else
echo
echo
echo -e "$BRED Logue-se como ROOT! $NC"
echo
echo

fi

