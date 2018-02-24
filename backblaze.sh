#!/bin/sh

clear


if [[ $(whoami) == "ahlr" ]]; then
   
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
B2_ACCOUNT="d258ec9a83fb"
B2_KEY="001c5d99a010da54e85dee2bea586639a95da7b7f1"
B2_BUCKET="NET4YOU"
B2_DIR=""

# Local directory to backup
LOCAL_DIR="/home/ahlr/Dropbox/NET4YOU/"

# GPG key (last 8 characters)
ENC_KEY="A2133DA2"
SGN_KEY="A2133DA2"
export PASSPHRASE="&ntu\$1@\$M0"
export SIGN_PASSPHRASE="&ntu\$1@\$M0" 

# Remove files older than 90 days
duplicity \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 remove-older-than 90D --force \
 b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}  #/${B2_DIR}

# Perform the backup, make a full backup if it's been over 30 days
duplicity \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 --full-if-older-than 30D \
 ${LOCAL_DIR} b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}  #/${B2_DIR}

# Cleanup failures
duplicity \
 cleanup --force \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}  #/${B2_DIR}

# Show collection-status
duplicity collection-status \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
  b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}  #/${B2_DIR}

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