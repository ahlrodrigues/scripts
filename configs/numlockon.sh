#!/bin/bash
####################################################################################
# Autor= Antonio Henrique (Fela)                                                   #
# e-mail: ahlr_2000@yahoo.com                                                      #
#                                                                                  #
# Bugs, Agradecimentos, Críticas "construtivas"                                    #
# Mande me um e-mail. Ficarei Grato!                                               #
#                                                                                  #
# Os scripts deste diretório estão disponíveis na esperança que possam ser úteis,  #
# mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A   #
# QUALQUER MERCADO, SEM NENHUMA GARANTIA DE APLICAÇÃO EM PARTICULAR e NENHUM       #
# SUPORTE TÉCNICO.                                                                 #
####################################################################################
#Ativando o NumLock \e$NC"
sed -i "s/#NumLock=Off/NumLock=On/" /etc/kde/kdm/kdmrc