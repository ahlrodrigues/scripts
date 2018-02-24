#!/bin/bash
#
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
##Cria entrada do Winbox no Kick
#
#Criação do arquivo winbox.desktop
echo "[Desktop Entry]" > /usr/share/applications/winbox.desktop
echo "Exec=wine /home/ahlr/Dropbox/NET4YOU/NET4YOU/Packages/winbox.exe" >> /usr/share/applications/winbox.desktop
echo "GenericName=Winbox" >> /usr/share/applications/winbox.desktop
echo "Icon=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Imagens/winbox.png" >> /usr/share/applications/winbox.desktop
echo "Name=Permite acesso ao Servidor" >> /usr/share/applications/winbox.desktop
echo "Categories=Network;" >> /usr/share/applications/winbox.desktop
echo "NoDisplay=false" >> /usr/share/applications/winbox.desktop
echo "StartupNotify=true" >> /usr/share/applications/winbox.desktop
echo "Terminal=0" >> /usr/share/applications/winbox.desktop
echo "X-KDE-SubstituteUID=false" >> /usr/share/applications/winbox.desktop
#
#Atualiza o banco de dados do KDE
update-desktop-database -q