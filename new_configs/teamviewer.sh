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
# Instala o TeamViewer
#
#Baixando os pacotes
wget -q -e robots=0 -r -nd -cP /tmp https://download.teamviewer.com/download/teamviewer_i386.deb
wget -q -e robots=0 -r -nd -cP /tmp http://slackbuilds.org/slackbuilds/14.2/network/teamviewer.tar.gz
cd /tmp
#
#Preparando para compilação
tar zvxf teamviewer.tar.gz
mv teamviewer*.deb teamviewer/
cd teamviewer
#
#Compilando
./teamviewer.SlackBuild
#
#Instalando
installpkg /tmp/teamviewer-*.tgz
#
#Limpando 
rm -fR /tmp/teamviewer*
#
#Iniciando o daemon
chmod +x /etc/rc.d/rc.teamviewerd
/etc/rc.d/rc.teamviewerd start
