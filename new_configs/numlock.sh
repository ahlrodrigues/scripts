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
# Ativa o NumLock antes do login
#
echo -e "\e[ \t$CYAN Ativando o NumLock $NC"
#
# Troca NumLock=Off por NumLock=On no arquivo de configs do KDE
sed -i "s/#NumLock=Off/NumLock=On/" /etc/kde/kdm/kdmrc
