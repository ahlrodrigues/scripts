#!/bin/bash
#
##
###
##################################################################################
#                                                                                #
# Copyright 2018; Antonio Henrique (Fela); <ahlr_2000@yahoo.com>                 #
# Todos os direitos reservados.                                                  #
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
# [GPL](https://pt.wikipedia.org/wiki/GNU_General_Public_License)                #
# Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,             #
# Boston, MA 02110-1301 USA                                                      #
#                                                                                #
##################################################################################
###
##
#

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

    if [ ! -f "/tmp/minilicense.txt" ]; then
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs/minilicense.txt
    fi
# --------- Criando script cobrancabnb.sh --------- #

    echo "#!"$SHELL > /usr/local/bin/cobrancabnb.sh
    cat /tmp/minilicense.txt >> /usr/local/bin/cobrancabnb.sh 
    
    echo "arquivos_CB=`ls \$pasta_origem | awk '/C*.rem/ { print \$0 }'`" >> /usr/local/bin/cobrancabnb.sh 
    echo "pasta_origem=/home/ahlr/Downloads/" >> /usr/local/bin/cobrancabnb.sh 
    echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/outbox/" >> /usr/local/bin/cobrancabnb.sh 
    echo "" >> /usr/local/bin/cobrancabnb.sh
    echo "if [ ! -e "\$arquivos_CB" ]; then" >> /usr/local/bin/cobrancabnb.sh 
    echo "	mv \$pasta_origem/C*.rem \$pasta_destino" >> /usr/local/bin/cobrancabnb.sh
    echo "fi" >> /usr/local/bin/cobrancabnb.sh
    echo "" >> /usr/local/bin/cobrancabnb.sh
    echo "wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null" >> /usr/local/bin/cobrancabnb.sh
    echo "" >> /usr/local/bin/cobrancabnb.sh
    echo "cp /home/ahlr/.wine/drive_c/skyline/*.LOG /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/" >> /usr/local/bin/cobrancabnb.sh
