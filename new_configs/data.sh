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
##Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela
#opcao '-d' do comando date
data_inicial=`echo "$1" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`
data_final=`echo "$2" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`
#
#Cria a variável do valor da mensalidade
valor_mensalidade="$3"
#
#Converte a data para o formato timestamp que e mais preciso
data_inicial=`date -d "$data_inicial" "+%s"`
data_final=`date -d "$data_final" "+%s"`
dias_corridos=$((($data_final - $data_inicial) / 86400))
#
# Calculo do valor proporcional
echo "scale = 4; $valor_mensalidade / 30 * $dias_corridos" | bc
#
exit 1
