#!/bin/bash
#
##
###
##################################################################################
#                                                                                #
# Copyright 2018; Antonio Henrique (Fela); <ahlr_2000@yahoo.com>                 #
#                                                                                #
#                                                                                #
#                                                                                #
# Redistribution and use of this script, with or without modification, is        #
# permitted provided that the following conditions are met:                      #
#                                                                                #
# 1. Redistributions of this script must retain the above copyright              #
#    notice, this list of conditions and the following disclaimer.               #
#                                                                                #
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED    #
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF          #
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO   #
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,        #
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,  #
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;   #
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,      #
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR       #
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF        #
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                                    #
#                                                                                #
##################################################################################
#                                                                                #
# Repositry:                                                                     #
# github.com/ahlrodrigues/slackonfig                                             #
# bitbucket.org/ahlrodrigues/slackonfig                                          #
#                                                                                #
# Bugs, Thanks, "Constructive" reviews!                                          #
# Send me an email, I'll be very grateful!                                       #
#                                                                                #
##################################################################################
#                                                                                #
# This scripts is a free softwares, you can redistribute it and/or modifies it   #
# within the terms of the GNU General Public License.                            #
#                                                                                #
# GNU General Public License:                                                    #
# [GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License)                #
# Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,             #
# Boston, MA 02110-1301 USA                                                      #
#                                                                                #
##################################################################################
###
##
# 
#
##
###
# --------- Variáveis --------- #
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
minilicense=/tmp/minilicense.txt
name=/etc/cron.daily/backup.plex.sh

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

if [ ! -f "$minilicense" ]; then
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawdocs/minilicense.txt
fi


# --------- Checando permissão - INÍCIO --------- #
if [[ $(whoami) == "root" ]]; then

# --------- Documentação --------- #
echo "#!"$SHELL > $name
cat $minilicense >> $name

# --------- Criando script - INÍCIO --------- #

echo "DATA=\`date +%Y-%m-%d-%H.%M\`" >> $name
echo "cd /mnt/sda3/Dropbox/TONICO/Plex/Backups/" >> $name
echo "rm backup.plex*" >> $name
echo "tar -zcvf backup.plex-"\$DATA".tar.gz /opt/plexmediaserver/" >> $name
chmod +x $name
# --------- Criando script - FIM --------- #
else
    echo
    echo
    echo -e "$BRED Logue-se como ROOT! $NC"
    echo
    echo
fi
