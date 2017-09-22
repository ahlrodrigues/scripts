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
#
clear

# if [[ $(whoami) == ahlr ]]; then
# 
#    echo
#    echo
#    echo -e "\e[ \t\e[1;31;40m Troque de usuário, o ROOT não pode executar backups\e[0m"
#    echo
#    echo
#    exit 0
#    else

   #Ajustando permissões
   echo
   echo
   echo -e "\e[ \t\e[1;31;40m Ajustando as permissões dos dados... aguarde...\e[0m"
   echo
   echo

   find /home/ahlr/Dropbox/TONICO/ -type f -exec chmod 644 {} \;
   find /home/ahlr/Dropbox/TONICO/ -type d -exec chmod 755 {} \;

   #hubiC configuration variables
   LOCAL_DIR=/home/ahlr/Dropbox/TONICO/
   REMOTE_DIR=default

   # GPG key (last 8 characters)
   ENC_KEY=A2133DA2
   SGN_KEY=A2133DA2
   export PASSPHRASE="'xxxxxxxxxxxxxxxxx'"
   export SIGN_PASSPHRASE="'xxxxxxxxxxxxxxxxx'"

   # Remove files older than 90 days
   duplicity \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   remove-older-than 90D --force \
   cf+hubic://${REMOTE_DIR}

   # Perform the backup, make a full backup if it's been over 30 days
   duplicity \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   --full-if-older-than 30D \
   ${LOCAL_DIR} cf+hubic://${REMOTE_DIR}

   # Cleanup failures
   duplicity \
   cleanup --force \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   cf+hubic://${REMOTE_DIR}

   # Show collection-status
   duplicity collection-status \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   cf+hubic://${REMOTE_DIR}

   # Unset variables
   unset REMOTE_DIR
   unset LOCAL_DIR
   unset ENC_KEY
   unset SGN_KEY
   unset PASSPHRASE
   unset SIGN_PASSPHRASE
#fi
