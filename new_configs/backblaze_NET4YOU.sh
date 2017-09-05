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

#Teste de usuário
if [[ $(whoami) == ahlr ]]; then

   echo
   echo
   echo -e "\e[ \t\e[1;31;40m Troque de usuário, o ROOT não pode executar backups\e[0m"
   echo
   echo
   exit 0
   else

   #Ajustando permissões
   echo
   echo
   echo -e "\e[ \t\e[1;31;40m Ajustando as permissões dos dados... aguarde...\e[0m"
   echo
   echo

   find /home/ahlr/Dropbox/NET4YOU/ -type f -exec chmod 644 {} \;
   find /home/ahlr/Dropbox/NET4YOU/ -type d -exec chmod 755 {} \;

   #B2 configuration variables
   B2_ACCOUNT=d258ec9a83fb
   B2_KEY=001c5d99a010da54e85dee2bea586639a95da7b7f1
   B2_BUCKET=NET4YOU
   B2_DIR=

   # Local directory to backup
   LOCAL_DIR=/home/ahlr/Dropbox/NET4YOU/

   # GPG key (last 8 characters)
   ENC_KEY=A2133DA2
   SGN_KEY=A2133DA2
   export PASSPHRASE=*****************
   export SIGN_PASSPHRASE=***************** 

   # Remove files older than 90 days
   duplicity \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   remove-older-than 90D --force \
   b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}

   # Perform the backup, make a full backup if it's been over 30 days
   duplicity \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   --full-if-older-than 30D \
   ${LOCAL_DIR} b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}

   # Cleanup failures
   duplicity \
   cleanup --force \
   --sign-key  --encrypt-key  \
   b2://${B2_ACCOUNT}:@${B2_BUCKET}

   # Show collection-status
   duplicity collection-status \
   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
   b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}

   # Unset variables
   unset B2_ACCOUNT
   unset B2_KEY
   unset B2_BUCKET
   unset B2_DIR
   unset LOCAL_DIR
   unset ENC_KEY
   unset SGN_KEY
   unset PASSPHRASE
   unset SIGN_PASSPHRASE
fi
