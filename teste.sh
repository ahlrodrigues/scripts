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
pkgs=/tmp/pkgs.txt
rcd=/home/ahlr
ulbin=/home/ahlr
usa=/home/ahlr
blacklist=">> /etc/slackpkg/blacklist"
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs

# --------- Mensagens --------- #

aminilicensetxt="\e[ \t$GREEN minilicense.txt => Arquivo de licença a ser incluído nos spripts $NC"
apkgstxt="\e[ \t$GREEN pkgs.txt => Arquivo com lista de pacotes a serem instalados automaticamente $NC"
cleanrettxt="\e[ \t$GREEN cleanret.sh => Move os arquivos de retorno da caixa $NC"
mvrejsgrtxt="\e[ \t$GREEN mvrejsgr.sh => Move os arquivos de rejeitados e francesinha do BNB $NC"
cleansicitxt="\e[ \t$GREEN cleansici.sh => Move os arquivos declaração do SICI para o Dropbox $NC"
backupprojetostxt="\e[ \t$GREEN backupprojetos.sh => Mover os arquivos de backup das configuracoes $NC"
cleansaitxt="\e[ \t$GREEN cleansai.sh => Move os arquivos de retorno do bnb $NC"
cleancachetxt="\e[ \t$GREEN cleancache.sh => Limpa o cache $NC"
ntptxt="\e[ \t$GREEN ntp.sh => Habilita o NTP pool server brasileiro $NC"
sambatxt="\e[ \t$GREEN Configuraçoes do Samba $NC"
samba2txt="\e[ \t$GREEN Incluindo inicialização do daeamon do Samba no rc.local $NC"
cupstxt="\e[ \t$GREEN Inicializando do CUPS $NC"
shutdowntxt="\e[ \t$GREEN Configuracoes de rc.local_shutdown $NC"
teamviewerdtxt="\e[ \t$GREEN Incluindo inicialização do deamon do teamviewer no rc.local $NC"
plextxt="\e[ \t$GREEN Incluindo inicialização do deamon do Plex no rc.local $NC"
mirrorstxt="\e[ \t$GREEN mirror-slackware => Administracao dos mirros locais $NC"
inittabtxt="\e[ \t$GREEN Habilitando o init 4 $NC"


networkmanagertxt="\e[ \t$GREEN rc.4 => Inicialzando networkmanager $NC"
boinctxt="\e[ \t$GREEN boinc.sh => Arquivo de inicialização do BOIC $NC"
reccxtxt="\e[ \t$GREEN Cria pasta para os arquivos da CEF e dá permissão de execucao $NC"
brothertxt="\e[ \t$GREEN instalacao do driver da impressora $NC"
langtxt="\e[ \t$GREEN Configurando local pt-BR $NC"
thunderbirdtxt="\e[ \t$GREEN thunderbirdbackup.sh => Restauracao do Thunderbird $NC"
thunderbackuptxt="\e[ \t$GREEN thunderbackup.sh => Backup do Thunderbird $NC"
bbazetonicotxt="\e[ \t$GREEN bbazetonico.sh => Faz backup no Backblaze $NC"
bbazenet4you="\e[ \t$GREEN bbazenet4you.sh => Faz backup no Backblaze $NC"
datatxt="\e[ \t$GREEN data.sh => Script de calculo data $NC"
pkgstxt="\e[ \t$GREEN Instalacao lista de pacotes $NC"
slackpkgtxt="\e[ \t$GREEN slackpkg => Configuracao do slackpkg e slackpkgplus $NC"
multilibtxt="\e[ \t$GREEN slackpkg => Aplicacao do layer multilib $NC"
konsoletxt="\e[ \t$GREEN Configura o profile do Konsole $NC"
winboxtxt="\e[ \t$GREEN winbox.sh => Cria a entrada do Winbox no mennu do KDE $NC"
skylinetxt="\e[ \t$GREEN skyline.sh => Cria a entrada do Skyline no mennu do KDE $NC"

bnbtxt="\e[ \t$GREEN bnb.sh => Busca arquivos de retorno da BNB $NC"
numLocktxt="\e[ \t$GREEN Ativando o NumLock $NC"
spotifytxt="\e[ \t$GREEN spotify.sh => Instala o Spotify $NC"


# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

#     echo
#     echo
#     echo -e "\e[ \t\e[1;31;40m Baixando os arquivos necessários:$NC"
#     echo
#     echo
#     if [ ! -f "$minilicense" ]; then
# 	echo -e "$aminilicensetxt"
# 	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
# 	$rawdocs/minilicense.txt
# 	sleep 5
#     fi
#     
#     if [ ! -f "$pkgs" ]; then
# 	echo -e "$apkgstxt"
# 	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
# 	$rawconfigs/pkgs.txt
# 	sleep 5
#     fi

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
#     chmod +x $cronhourly/backupprojetos.sh
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
#     echo -e "$sambatxt"
#     sed -i "s/MYGROUP/workgroup/g" /etc/samba/smb.conf-sample
#     mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
#     chmod +x $rcd/rc.samba
# 	if [ -x $rcd/rc.samba ]; then
# 	    $rcd/rc.samba start
# 	fi
#     
#     
#     echo -e "$samba2txt"
#     echo "#Inicializando o deamon rc.samba" >> $rcd/rc.local
#     echo "if [ -x $rcd/rc.samba ]; then" >> $rcd/rc.local
#     echo "$rcd/rc.samba start" >> $rcd/rc.local
#     echo "fi" >> $rcd/rc.local
#
#
#     echo -e "$shutdowntxt"
#     echo "#!"$SHELL > $rcd/rc.local_shutdown
#     cat $minilicense >> $rcd/rc.local_shutdown
#     echo "Limpeza geral nos diretórios temporários" >> $rcd/rc.local_shutdown
#     echo "cd /tmp && rm -rf -- *[!"ahlr"]* 2>/dev/null" >> $rcd/rc.local_shutdown
#     echo "cd /var/tmp && rm -rf * 2>/dev/null" >> $rcd/rc.local_shutdown
#     echo "/usr/bin/find /tmp -mindepth 1 -maxdepth 1 -exec /bin/rm -rf {} +;" >> $rcd/rc.local_shutdown
#     echo "find /tmp/lost+found -exec /bin/touch {} \;" >> $rcd/rc.local_shutdown
#     echo "find /tmp -type s -exec  /bin/touch {} \;" >> $rcd/rc.local_shutdown
#     echo "find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;" >> $rcd/rc.local_shutdown
#     echo "find /tmp -type f -mtime +37 -exec rm -rf {} \; " >> $rcd/rc.local_shutdown
#     chmod +x $rcd/rc.local_shutdown
# 
# 
#     echo -e "$teamviewerdtxt"
#     echo "#Inicializando o deamon rc.teamviewerd" >> $rcd/rc.local
#     echo "if [ -x $rcd/rc.teamviewerd ]; then" >> $rcd/rc.local
#     echo "$rcd/rc.teamviewerd start" >> $rcd/rc.local
#     echo "fi" >> $rcd/rc.local
#     
#     
#     echo -e "$plextxt"
#     echo "#Inicializando o deamon rc.plexmediaserver" >> $rcd/rc.local
#     echo "if [ -x $rcd/rc.plexmediaserver ]; then" >> $rcd/rc.local
#     echo "$rcd/rc.plexmediaserver start" >> $rcd/rc.local
#     echo "fi" >> $rcd/rc.local

#     echo -e "$mirrorstxt"
#     wget -q  -nv -e robots=0 -r -nd -cP $crondaily http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
#     sed -i "s|BUILDER:-\"Eric Hameleers <alien@slackware.com>\"|BUILDER:-\"Fela  <ahlr_2000@yahoo.com>\"|g" $crondaily/mirror-slackware-current.sh
#     sed -i "s|/home/ftp/pub/Linux/Slackware|/mnt/sda3/Slackware|g" $crondaily/mirror-slackware-current.sh
#     sed -i "s|VERBOSE:-\"-q\"|VERBOSE:-\"-v --progress\"|g" $crondaily/mirror-slackware-current.sh
#     sed -i "s|ISO:-\"CDROM\"}|ISO:-\"DVD\"}|g" $crondaily/mirror-slackware-current.sh
#     sed -i "s|EXCLUDES:-\"--exclude pasture\"|EXCLUDES:-\"--exclude pasture --exclude source\"|g" $crondaily/mirror-slackware-current.sh
#     sed -i "s|DVD_EXCLUDES:-\"-x ./testing  -x ./source -x ./extra/source\"|DVD_EXCLUDES:-\"-x ./source -x ./extra/source\"|g" $crondaily/mirror-slackware-current.sh
#     cp $crondaily/mirror-slackware-current.sh $crondaily/mirror-slackware32-current.sh
#     sed -i "s|ARCH:-\"x86\"|ARCH:-\"x86_64\"|g" $crondaily/mirror-slackware-current.sh
#     mv $crondaily/mirror-slackware-current.sh $crondaily/mirror-slackware64-current.sh
#
#
#     echo -e "$datatxt"
#     echo "#!"$SHELL > $ulbin/data.sh
#     cat $minilicense >> $ulbin/data.sh
#     echo "#Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela" >> $ulbin/data.sh
#     echo "#opcao '-d' do comando date" >> $ulbin/data.sh
#     echo "data_inicial=\`echo \"\$1\" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'\`" >> $ulbin/data.sh
#     echo "data_final=\`echo \"\$2\" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'\`" >> $ulbin/data.sh
#     echo "#" >> $ulbin/data.sh
#     echo "#Cria a variável do valor da mensalidade" >> $ulbin/data.sh
#     echo "valor_mensalidade=\"\$3\"" >> $ulbin/data.sh
#     echo "#" >> $ulbin/data.sh
#     echo "#Converte a data para o formato timestamp que e mais preciso" >> $ulbin/data.sh
#     echo "data_inicial=\`date -d \"\$data_inicial\" \"+%s\"\`" >> $ulbin/data.sh
#     echo "data_final=\`date -d \"\$data_final\" \"+%s\"\`" >> $ulbin/data.sh
#     echo "dias_corridos=\$(((\$data_final - \$data_inicial) / 86400))" >> $ulbin/data.sh
#     echo "#" >> $ulbin/data.sh
#     echo "# Calculo do valor proporcional" >> $ulbin/data.sh
#     echo "echo \"scale = 4; \$valor_mensalidade / 30 * \$dias_corridos\" | bc" >> $ulbin/data.sh
#     echo "#" >> $ulbin/data.sh
#     echo "exit 1" >> $ulbin/data.sh
#     chmod +x $ulbin/data.sh
#
#
#     echo "[Desktop Entry]" > $usa/winbox.desktop
#     echo "Exec=wine /home/ahlr/Dropbox/NET4YOU/NET4YOU/Packages/winbox.exe" >> $usa/winbox.desktop
#     echo "GenericName=Winbox" >> $usa/winbox.desktop
#     echo "Icon=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Imagens/winbox.png" >> $usa/winbox.desktop
#     echo "Name=Permite acesso ao Servidor" >> $usa/winbox.desktop
#     echo "Categories=Network;" >> $usa/winbox.desktop
#     echo "NoDisplay=false" >> $usa/winbox.desktop
#     echo "StartupNotify=true" >> $usa/winbox.desktop
#     echo "Terminal=0" >> $usa/winbox.desktop
#     echo "X-KDE-SubstituteUID=false" >> $usa/winbox.desktop
# 
# 
#     echo "[Desktop Entry]" > $usa/bnb.desktop
#     echo "Exec=/usr/local/bin/bnb.sh" >> $usa/bnb.desktop
#     echo "GenericName=BNB" >> $usa/bnb.desktop
#     echo "Icon=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Packages/skyline.png" >> $usa/bnb.desktop
#     echo "Name=Comunicação da cobrança BNB" >> $usa/bnb.desktop
#     echo "Categories=Network;" >> $usa/bnb.desktop
#     echo "NoDisplay=false" >> $usa/bnb.desktop
#     echo "StartupNotify=true" >> $usa/bnb.desktop
#     echo "Terminal=1" >> $usa/bnb.desktop
#     echo "X-KDE-SubstituteUID=false" >> $usa/bnb.desktop
# 
# 
#     wget -q -e robots=0 -r -nd -cP /tmp \
#     https://download.teamviewer.com/download/teamviewer_i386.deb \
#     http://slackbuilds.org/slackbuilds/14.2/network/teamviewer.tar.gz
#     cd /tmp
#     tar zvxf teamviewer.tar.gz
#     mv teamviewer*.deb teamviewer/
#     cd teamviewer
#     ./teamviewer.SlackBuild
#     installpkg /tmp/teamviewer-*.tgz
#     rm -fR /tmp/teamviewer*
#     chmod +x /etc/rc.d/rc.teamviewerd
#     /etc/rc.d/rc.teamviewerd start
#     echo "teamviewer" $blacklist
#
#
#     echo -e "$thunderbackuptxt"
#     echo "#!"$SHELL > $crondaily/thunderbirdbackup.sh
#     cat $minilicense >> $crondaily/thunderbirdbackup.sh
#     echo "#Faz cópia incremental do diretório de configurações" >> $crondaily/thunderbirdbackup.sh
#     echo "#do tunderbird para a pasta /mnt/sda3/Thunderbird" >> $crondaily/thunderbirdbackup.sh
#     echo "rsync -azhv /home/ahlr/.thunderbird/ /mnt/sda3/Thunderbird/" >> $crondaily/thunderbirdbackup.sh
#
#
#     echo "#!"$SHELL > $crondaily/backblaze_TONICO.sh
#     cat $minilicense >> $crondaily/backblaze_TONICO.sh
#     echo "clear" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "if [[ \$(whoami) == "ahlr" ]]; then" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo -e "'"\e[ \t\e[1;31;40m Troque de usuário, o ROOT não pode executar backups\e[0m"'"" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   exit 0" >> $crondaily/backblaze_TONICO.sh
#     echo "   else" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   #Ajustando permissões" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo -e "'"\e[ \t\e[1;31;40m Ajustando as permissões dos dados... aguarde...\e[0m"'"" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "   echo" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   find /home/ahlr/Dropbox/TONICO/ -type f -exec chmod 644 {} \;" >> $crondaily/backblaze_TONICO.sh
#     echo "   find /home/ahlr/Dropbox/TONICO/ -type d -exec chmod 755 {} \;" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   #B2 configuration variables" >> $crondaily/backblaze_TONICO.sh
#     echo "   B2_ACCOUNT="cd0c87d370b7"" >> $crondaily/backblaze_TONICO.sh
#     echo "   B2_KEY="0010db1dde3b5edd54f9890392d42d089c782a4457"" >> $crondaily/backblaze_TONICO.sh
#     echo "   B2_BUCKET="TONICO"" >> $crondaily/backblaze_TONICO.sh
#     echo "   B2_DIR=""" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # Local directory to backup" >> $crondaily/backblaze_TONICO.sh
#     echo "   LOCAL_DIR="/home/ahlr/Dropbox/TONICO/"" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # GPG key (last 8 characters)" >> $crondaily/backblaze_TONICO.sh
#     echo "   ENC_KEY="A2133DA2"" >> $crondaily/backblaze_TONICO.sh
#     echo "   SGN_KEY="A2133DA2"" >> $crondaily/backblaze_TONICO.sh
#     echo "   export PASSPHRASE="\&ntu\$1@\$M0"" >> $crondaily/backblaze_TONICO.sh
#     echo "   export SIGN_PASSPHRASE="\&ntu\$1@\$M0" " >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # Remove files older than 90 days" >> $crondaily/backblaze_TONICO.sh
#     echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   remove-older-than 90D --force \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # Perform the backup, make a full backup if it's been over 30 days" >> $crondaily/backblaze_TONICO.sh
#     echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   --full-if-older-than 30D \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   \${LOCAL_DIR} b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # Cleanup failures" >> $crondaily/backblaze_TONICO.sh
#     echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   cleanup --force \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   b2://\${B2_ACCOUNT}:${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # Show collection-status" >> $crondaily/backblaze_TONICO.sh
#     echo "   duplicity collection-status \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
#     echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
#     echo "" >> $crondaily/backblaze_TONICO.sh
#     echo "   # Unset variables" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset B2_ACCOUNT" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset B2_KEY" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset B2_BUCKET" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset B2_DIR" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset LOCAL_DIR" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset ENC_KEY" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset SGN_KEY" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset PASSPHRASE" >> $crondaily/backblaze_TONICO.sh
#     echo "   unset SIGN_PASSPHRASE" >> $crondaily/backblaze_TONICO.sh 
#     echo "fi" >> $crondaily/backblaze_TONICO.sh
#
#
#     echo "#!"$SHELL > $crondaily/backblaze_NET4YOU.sh
#     cat $minilicense >> $crondaily/backblaze_NET4YOU.sh
#     echo "clear" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "if [[ \$(whoami) == "ahlr" ]]; then" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo -e "'"\e[ \t\e[1;31;40m Troque de usuário, o ROOT não pode executar backups\e[0m"'"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   exit 0" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   else" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   #Ajustando permissões" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo -e "'"\e[ \t\e[1;31;40m Ajustando as permissões dos dados... aguarde...\e[0m"'"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   find /home/ahlr/Dropbox/NET4YOU/ -type f -exec chmod 644 {} \;" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   find /home/ahlr/Dropbox/NET4YOU/ -type d -exec chmod 755 {} \;" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   #B2 configuration variables" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   B2_ACCOUNT="d258ec9a83fb"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   B2_KEY="001c5d99a010da54e85dee2bea586639a95da7b7f1"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   B2_BUCKET="NET4YOU"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   B2_DIR=""" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # Local directory to backup" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   LOCAL_DIR="/home/ahlr/Dropbox/NET4YOU/"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # GPG key (last 8 characters)" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   ENC_KEY="A2133DA2"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   SGN_KEY="A2133DA2"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   export PASSPHRASE="\&ntu\$1@\$M0"" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   export SIGN_PASSPHRASE="\&ntu\$1@\$M0" " >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # Remove files older than 90 days" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   duplicity \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   remove-older-than 90D --force \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # Perform the backup, make a full backup if it's been over 30 days" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   duplicity \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   --full-if-older-than 30D \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   \${LOCAL_DIR} b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # Cleanup failures" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   duplicity \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   cleanup --force \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   b2://\${B2_ACCOUNT}:${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # Show collection-status" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   duplicity collection-status \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
#     echo "" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   # Unset variables" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset B2_ACCOUNT" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset B2_KEY" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset B2_BUCKET" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset B2_DIR" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset LOCAL_DIR" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset ENC_KEY" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset SGN_KEY" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset PASSPHRASE" >> $crondaily/backblaze_NET4YOU.sh
#     echo "   unset SIGN_PASSPHRASE" >> $crondaily/backblaze_NET4YOU.sh 
#     echo "fi" >> $crondaily/backblaze_NET4YOU.sh
#
#
#     echo "#!"$SHELL > $ulbin/aviso.sh
#     cat $minilicense >> $ulbin/aviso.sh
#     echo "kdialog --title \"Baixa dos Títulos de Cobrança\" --warningyesno \"Você já baixou os títulos hoje?\"" >> $ulbin/aviso.sh
#     echo "#" >> $ulbin/aviso.sh
#     echo "if [ "\$?" = "1" ]; then" >> $ulbin/aviso.sh
#     echo "	/usr/local/bin/bnb.sh" >> $ulbin/aviso.sh
#     echo "else" >> $ulbin/aviso.sh
#     echo "	exit 0" >> $ulbin/aviso.sh
#     echo "#" >> $ulbin/aviso.sh
#     echo "fi" >> $ulbin/aviso.sh
#     chmod +x $ulbin/aviso.sh

