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
#Mover os arquivos de rejeitados e francesinha do BNB para a pasta ../BNB/Arquivos
#
# Cria variáveis
pasta_origem=/home/ahlr/Downloads
pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos
#
# Renomeia os arquivos
mv $pasta_origem/rel*.pdf  $pasta_origem/Rejeitados-`date +"%F"`.pdf 2> /dev/null
mv $pasta_origem/sgr*.pdf  $pasta_origem/Francesinha-`date +"%F"`.pdf 2> /dev/null
#
# Move os arquivos da pasta ../Downloads para a pasta ../BNB/Arquivos
mv $pasta_origem/Francesinha*.pdf $pasta_destino 2> /dev/null
mv $pasta_origem/Rejeitados*.pdf $pasta_destino 2> /dev/null
