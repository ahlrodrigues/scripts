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
##Configura um servidor NTP brasileiro
#
rcd=/etc/rc.d
#
# Comenta todas as linhas do arquivo 
sed -i "s/^#*/#/" /etc/ntp.conf # --------- comenta todas as linhas --------- #	
#
# Troca o servidor atual pelo servidor br
sed -i "s/#server 3.pool.ntp.org/server pool.ntp.br/g" /etc/ntp.conf
#
# Inicia o deamon $rcd/rc.ntpd
chmod +x $rcd/rc.ntpd
    if [ -x $rcd/rc.ntpd ]; then
       $rcd/rc.ntpd start
    fi