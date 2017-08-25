#!/bin/bash

# --------- Cores  --------- #
BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\033[0m' # reset/no color
BLUE='\e[1;34m'
PINK='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'


# --------- Caminhos mais usados  --------- #
crondaily=/home/ahlr
cronhourly=/home/ahlr
minilicense=/tmp/minilicense.txt
rcd=/home/ahlr



bnbtxt="\e[ \t$GREEN bnb.sh => Busca arquivos de retorno da BNB $NC"
numLocktxt="\e[ \t$GREEN Ativando o NumLock $NC"
cleanrettxt="\e[ \t$GREEN cleanret.sh => Move os arquivos de retorno da caixa $NC"
mvrejsgrtxt="\e[ \t$GREEN mvrejsgr.sh => Move os arquivos de rejeitados e francesinha do BNB $NC"
cleansicitxt="\e[ \t$GREEN cleansici.sh => Move os arquivos declaração do SICI para o Dropbox $NC"
backupprojetostxt="\e[ \t$GREEN backupprojetos.sh => Mover os arquivos de backup das configuracoes $NC"
cleansaitxt="\e[ \t$GREEN cleansai.sh => Move os arquivos de retorno do bnb $NC"
cleancachetxt="\e[ \t$GREEN cleancache.sh => Limpa o cache $NC"
ntptxt="\e[ \t$GREEN Sincronizando com o pool.ntp.br $NC"
cupstxt="\e[ \t$GREEN Inicializando do CUPS $NC"
sambatxt="\e[ \t$GREEN Configuracoes do Samba $NC"
shutdowntxt="\e[ \t$GREEN Configuracoes de rc.local_shutdown $NC"
teamviewerdtxt="\e[ \t$GREEN Incluindo inicialização do deamon do teamviewer no rc.local $NC"
plextxt="\e[ \t$GREEN Incluindo inicialização do deamon no Plex rc.local $NC"
mirrorstxt="\e[ \t$GREEN mirror-slackware => Administracao dos mirros locais $NC"
inittabtxt="\e[ \t$GREEN Habilitando o init 4 $NC"
networkmanagertxt="\e[ \t$GREEN rc.4 => Inicialzando networkmanager $NC"
boinctxt="\e[ \t$GREEN boinc.sh => Arquivo de inicialização do BOIC $NC"
reccxtxt="\e[ \t$GREEN Cria pasta para os arquivos da CEF e dá permissão de execucao $NC"
brothertxt="\e[ \t$GREEN instalacao do driver da impressora $NC"
langtxt="\e[ \t$GREEN Configurando local pt-BR $NC"
thunderbirdtxt="\e[ \t$GREEN thunderbirdbackup.sh => Restauracao do Thunderbird $NC"
thunderbackup="\e[ \t$GREEN thunderbackup.sh => Backup do Thunderbird $NC"
datatxt="\e[ \t$GREEN data.sh => Script de calculo data $NC"
pkgstxt="\e[ \t$GREEN Instalacao lista de pacotes $NC"
slackpkgtxt="\e[ \t$GREEN slackpkg => Configuracao do slackpkg e slackpkgplus $NC"
multilibtxt="\e[ \t$GREEN slackpkg => Aplicacao do layer multilib $NC"



#echo "#" >>
# --------- Testando script  --------- #


#     echo -e "$cleanrettxt"
#     echo "#!"$SHELL > $crondaily/cleanret.sh
#     cat $minilicense >> $crondaily/cleanret.sh
#     echo "# Move arquivos de retorno da CAIXA da pasta ~/Downloads para a pasta /opt/caixa/Recebidos" >> $crondaily/cleanret.sh
#     echo "#" >> $crondaily/cleanret.sh
#     echo "# Cria as variáveis" >> $crondaily/cleanret.sh
#     echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/cleanret.sh
#     echo "pasta_destino=/opt/caixa/Recebidos" >> $crondaily/cleanret.sh
#     echo "#" >> $crondaily/cleanret.sh
#     echo "# Cria a pasta ../Recebidos" >> $crondaily/cleanret.sh
#     echo "mkdir /opt/caixa/Recebidos" >> $crondaily/cleanret.sh
#     echo "#" >> $crondaily/cleanret.sh
#     echo "# Move arquivos *.ret para a pasta de Recebidos" >> $crondaily/cleanret.sh
#     echo "mv \$pasta_origem/*.ret \$pasta_destino" >> $crondaily/cleanret.sh
# 
#     
#     echo -e "$mvrejsgrtxt"
#     echo "#!"$SHELL > $crondaily/mvrejsgr.sh
#     cat $minilicense >> $crondaily/mvrejsgr.sh
#     echo "#" >> $crondaily/mvrejsgr.sh
#     echo "# Cria variáveis" >> $crondaily/mvrejsgr.sh
#     echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/mvrejsgr.sh
#     echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos" >> $crondaily/mvrejsgr.sh
#     echo "#" >> $crondaily/mvrejsgr.sh
#     echo "# Renomeia os arquivos" >> $crondaily/mvrejsgr.sh
#     echo "mv \$pasta_origem/rel*.pdf  \$pasta_origem/Rejeitados-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
#     echo "mv \$pasta_origem/sgr*.pdf  \$pasta_origem/Francesinha-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
#     echo "#" >> $crondaily/mvrejsgr.sh
#     echo "# Move os arquivos da pasta ../Downloads para a pasta ../BNB/Arquivos" >> $crondaily/mvrejsgr.sh
#     echo "mv \$pasta_origem/Francesinha*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
#     echo "mv \$pasta_origem/Rejeitados*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
#     
#     
#     echo -e "$cleansicitxt"
#     echo "#!"$SHELL > $crondaily//cleansici.sh
#     cat $minilicense >> $crondaily/cleansici.sh
#     echo "#Mover os arquivos declaração do SICI para a pasta /home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
#     echo "#" >> $crondaily/cleansici.sh
#     echo "# Cria variáveis" >> $crondaily/cleansici.sh
#     echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/cleansici.sh
#     echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
#     echo "#" >> $crondaily/cleansici.sh
#     echo "# Move o recibo de entrehga do SICI para a pasta de backup ../SCM/SICI" >> $crondaily/cleansici.sh
#     echo "mv \$pasta_origem/sici*.xml \$pasta_destino 2> /dev/null" >> $crondaily/cleansici.sh
#     
#     
#     echo -e "$backupprojetostxt"
#     echo "#!"$SHELL > $cronhourly/backupprojetos.sh
#     cat $minilicense >> $cronhourly/backupprojetos.sh
#     echo "#Faz backup incremental da pasta ../Projetos para o dropbox" >> $cronhourly/backupprojetos.sh
#     echo "#" >> $cronhourly/backupprojetos.sh
#     echo "rsync -azhv /mnt/sda3/Projetos/ /home/ahlr/Dropbox/TONICO/Projetos/" >> $cronhourly/backupprojetos.sh
# 
#     
#     echo -e "$cleansaitxt"
#     echo "#!"$SHELL > $crondaily/cleansai.sh
#     cat $minilicense >> $crondaily/cleansai.sh
#     echo "#Move arquivos de retorno do BNB" >> $crondaily/cleansai.sh
#     echo "#" >> $crondaily/cleansai.sh
#     echo "#Cria as variáveis" >> $crondaily/cleansai.sh
#     echo "pasta_origem=/home/ahlr/.wine/drive_c/skyline/inbox" >> $crondaily/cleansai.sh
#     echo "pasta_destino=/home/ahlr/.wine/drive_c/skyline/recebidos" >> $crondaily/cleansai.sh
#     echo "#" >> $crondaily/cleansai.sh
#     echo "#Cria a pasta ../skyline/recebidos para backup" >> $crondaily/cleansai.sh
#     echo "#dos arquivos de retorno do BNB" >> $crondaily/cleansai.sh
#     echo "mkdir /home/ahlr/.wine/drive_c/skyline/recebidos" >> $crondaily/cleansai.sh
#     echo "#" >> $crondaily/cleansai.sh
#     echo "#Copia os arquivos de retorno para a pasta de backup" >> $crondaily/cleansai.sh
#     echo "mv \$pasta_origem/*.SAI \$pasta_destino" >> $crondaily/cleansai.sh
#
#
#     echo -e "$cleancachetxt"
#     echo "#!"$SHELL > $crondaily/cleancache.sh
#     cat $minilicense >> $crondaily/cleancache.sh
#     echo "#Apaga o cache" >> $crondaily/cleancache.sh
#     echo "#" >> $crondaily/cleancache.sh
#     echo "#Move tudo para o lixo" >> $crondaily/cleancache.sh
#     echo "echo 3 > /proc/sys/vm/drop_caches" >> $crondaily/cleancache.sh
# 
#     echo -e "$ntptxt"
#     sed -i "s/^#*/#/" /etc/ntp.conf # --------- comenta todas as linhas --------- #	
#     sed -i "s/#server 3.pool.ntp.org/server pool.ntp.br/g" /etc/ntp.conf
#     chmod +x $rcd/rc.ntpd
# 	if [ -x $rcd/rc.ntpd ]; then
# 	  $rcd/rc.ntpd start
# 	fi
#
#
#     echo -e "$sambatxt"
#     sed -i "s/MYGROUP/workgroup/g" /etc/samba/smb.conf-sample
#     mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
#     chmod +x $rcd/rc.samba
# 	if [ -x $rcd/rc.samba ]; then
# 	    $rcd/rc.samba start
# 	fi
#
#
    echo -e "$shutdowntxt"
    echo "#!"$SHELL > $rcd/rc.local_shutdown
    cat $minilicense >> $rcd/rc.local_shutdown
    echo "Limpeza geram nos diretórios temporários" >> $rcd/rc.local_shutdown
    echo "cd /tmp && rm -rf -- *[!"ahlr"]* 2>/dev/null" >> $rcd/rc.local_shutdown
    echo "cd /var/tmp && rm -rf * 2>/dev/null" >> $rcd/rc.local_shutdown
    echo "/usr/bin/find /tmp -mindepth 1 -maxdepth 1 -exec /bin/rm -rf {} +;" >> $rcd/rc.local_shutdown
    echo "find /tmp/lost+found -exec /bin/touch {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type s -exec  /bin/touch {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type f -mtime +37 -exec rm -rf {} \; " >> $rcd/rc.local_shutdown
    chmod +x $rcd/rc.local_shutdown