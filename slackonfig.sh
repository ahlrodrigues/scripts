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
#
#
##
###
##################################################################################
#                                                                                #
# Script: Criação e edição de arquivos de configuração do Slackware GNU/Linux    #
#                                                                                #
# V0.1                                                                           #
#                                                                                #
# Last update: 22/08/2017                                                        #
#                                                                                #
##################################################################################
###
##
#
# PARA QUE O SCRIPT FUNCIONE TROCUE A VARIÁVEL SLACKONFIG=OFF PARA SLACKONFIG=ON.
slackonfig=on 

# Para ativar as funções deste script, troque as variábeis abaixo para "yes".
# Veja as funcões de cada script na página inicial do projeto slackonfig: https://github.com/ahlrodrigues/slackonfig
bnb=no 
numLock=no
cleanret=no
mvrejsgr=no
cleansici=no
backupprojetos=no
cleansai=no
ntp=no
cleancache=no
cups=no
samba=no
shutdown=no
teamviewerd=no
plex=no
mirrors=no
inittab=no
networkmanager=no
boinc=no
reccx=no
brother=no
lang=no
thunderbird=no
thunderbackup=no
data=no
pkgs=no
slackpkg=no
multilib=no

# --------- Mensagens --------- #

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

# --------- Utilização de Cores  --------- #
BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\033$NC' # reset/no color
BLUE='\e[1;34m'
PINK='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'

# --------- Caminhos mais usados  --------- #
crondaily=/etc/cron.daily
cronhourly=/etc/cron.hourly
minilicense=/tmp/minilicense.txt

# --------- Limpa tudo --------- #
clear

# --------- Teste se está logado como root --------- #
if [[ $(whoami) == "root" ]]; then

# --------- Teste se está conectado na internet --------- #
  echo
  echo
  echo -e "\e[ \t\e[1;31;40m Testando conexão, aguarde... $NC"
  echo
  echo
  ping -q -c5 google.com > /dev/null
 
    if [ $? -eq 0 ]; then
    clear
    echo
    echo
    echo -e "\e[ \t $CYAN Você está conectado! $NC"
    echo
    echo
    sleep 3
    clear

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #
    echo
    echo
    echo -e "\e[ \t\e[1;31;40m Baixando os arquivos necessários:$NC"
    echo
    echo
    wget -q  -nv -e robots=0 -r -nd -cP /tmp \
    https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs/minilicense.txt \
    https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs/pkgs.txt
    sleep 3
    clear

# --------- Testando configurações --------- #
	if [ $slackonfig == on ]; then
	
# --------- Checando funções --------- #
echo -e "\e $WHITE Vamos executar as seguintes funções do script:$NC\n"  
echo
	
	if [ $bnb == yes ]; then
	  echo -e "$bnbtxt"
	fi
	
	if [ $numLock == yes ]; then
	  echo -e "$numLocktxt"
	fi
	
	if [ $cleanret == yes ]; then
	  echo -e "$cleanrettxt"
	fi
	
	if [ $mvrejsgr == yes ]; then
	  echo -e "$mvrejsgrtxt"
	fi	
	
	if [ $cleansici == yes ]; then
	  echo -e "$cleansicitxt"
	fi
	
	if [ $backupprojetos == yes ]; then
	  echo -e "$backupprojetostxt"
	fi
	
	if [ $cleansai == yes ]; then
	  echo -e "$cleansaitxt"
	fi
	
	if [ $cleancache == yes ]; then
	  echo -e "$cleancachetxt"
	fi
	
	if [ $cups == yes ]; then
	  echo -e "$cupstxt"
	fi
	
	if [ $samba == yes ]; then
	  echo -e "$sambatxt"
	fi
	
	if [ $shutdown == yes ]; then
	  echo -e "$shutdowntxt"
	fi
	
	if [ $teamviewerd == yes ]; then
	  echo -e "$teamviewerdtxt"
	fi
	
	if [ $plex == yes ]; then
	  echo -e "$plextxt"
	fi
	
	if [ $mirrors == yes ]; then
	  echo -e "$mirrorstxt"
	fi

	if [ $inittab == yes ]; then
	  echo -e "$inittabtxt"
	fi
	
	if [ $networkmanager == yes ]; then
	  echo -e "$networkmanagertxt"
	fi
	
	if [ $boinc == yes ]; then
	  echo -e "$boinctxt"
	fi
	
	if [ $reccx == yes ]; then
	  echo -e "$reccxtxt"
	fi
	
	if [ $thunderbird == yes ]; then
	  echo -e "$thunderbirdtxt"
	fi
		
	if [ $data == yes ]; then
	  echo -e "$datatxt"
	fi

	if [ $lang == yes ]; then
	  echo -e "$langtxt"
	fi
	if [ $thunderbackup == yes ]; then
	  echo -e "$thunderbackuptxt"
	fi

		
# --------- Listando funções --------- #
	echo
	echo
	echo -e "\e[ \t$CYAN Deseja executar as funções acima? Posso continuar? [Y|N] $NC"

	read RESPOSTA
  case $RESPOSTA in
    N|n) echo "Saindo!" 
	 echo
	 echo
	 exit;;
	
# --------- Texto 1 --------- #
    Y|y)echo
	echo
	echo -e "\e[ \t\e[1;33;40m Criando todos os arquivos de configuração nas devidas pastas e executando processos de configuração $NC"
	echo
	echo	
	sleep 3
      

##########################################
#                                        #      
# --------- Início das Funções --------- #      
#                                        #      
#   Não editar a partir deste ponto      #      
#                                        #      
##########################################      
      
# Ativa tecla NumLock antes do login
if [ $numLock == yes ]; then
    echo -e "\e[ \t$CYAN Ativando o NumLock $NC"
    sed -i "s/#NumLock=Off/NumLock=On/" /etc/kde/kdm/kdmrc
    sleep 3
fi

# Criar script que move os arquivos de retorno da CEF
# para uma pasta de backup no diretório /opt/caixa/Recebidos.
if [ $cleanret == yes ]; then
    echo "#!"$SHELL > $crondaily/cleanret.sh
    cat $minilicense >> $crondaily/cleanret.sh
    echo "# Move arquivos de retorno da CAIXA da pasta ~/Downloads para a pasta /opt/caixa/Recebidos" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "# Cria a pasta ../Recebidos" >> $crondaily/cleanret.sh
    echo "mkdir /opt/caixa/Recebidos" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "# Cria as variáveis" >> $crondaily/cleanret.sh
    echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/cleanret.sh
    echo "pasta_destino=/opt/caixa/Recebidos" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "# Move arquivos *.ret para a pasta de Recebidos" >> $crondaily/cleanret.sh
    echo "cd \$pasta_origem && mv *.ret \$pasta_destino" >> $crondaily/cleanret.sh
    chmod +x $crondaily/cleanret.sh
    sleep 3
fi

# Criar script que move os arquivos de Rejeitado e Francesinha do BNB
# para uma pasta de backup no diretório /opt/caixa/Recebidos.
if [ $mvrejsgr == yes ]; then
    echo -e "$mvrejsgrtxt"
    echo "#!"$SHELL > $crondaily/mvrejsgr.sh
    cat $minilicense >> $crondaily/mvrejsgr.sh
    echo "#Mover os arquivos de rejeitados e francesinha do BNB para a pasta ../BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Cria variáveis" >> $crondaily/mvrejsgr.sh
    echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/mvrejsgr.sh
    echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Renomeia os arquivos" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/rel*.pdf  \$pasta_origem/Rejeitados-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/sgr*.pdf  \$pasta_origem/Francesinha-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Move os arquivos da pasta ../Downloads para a pasta ../BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/Francesinha*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/Rejeitados*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
    chmod +x $crondaily/mvrejsgr.sh
    sleep 3
fi

# Criar script que move o recibo de entrehga do SICI
#  para a pasta de backup ../SCM/SICI.
if [ $cleansici == yes ]; then
    echo -e "$cleansicitxt"
    echo "#!"$SHELL > $crondaily//cleansici.sh
    cat $minilicense >> $crondaily/cleansici.sh
    echo "#Mover os arquivos declaração do SICI para a pasta /home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
    echo "#" >> $crondaily/cleansici.sh
    echo "# Cria variáveis" >> $crondaily/cleansici.sh
    echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/cleansici.sh
    echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
    echo "#" >> $crondaily/cleansici.sh
    echo "# Move o recibo de entrehga do SICI para a pasta de backup ../SCM/SICI" >> $crondaily/cleansici.sh
    echo "mv \$pasta_origem/sici*.xml \$pasta_destino 2> /dev/null" >> $crondaily/cleansici.sh
    chmod +x $crondaily/cleansici.sh
    sleep 3
fi

# Criar script backup incremental da pasta ../Projetos para o dropbox
if [ $backupprojetos == yes ]; then
    echo -e "$backupprojetostxt"
    echo "#!"$SHELL > $cronhourly/backupprojetos.sh
    cat $minilicense >> $cronhourly/backupprojetos.sh
    echo "#Faz backup incremental da pasta ../Projetos para o dropbox" >> $cronhourly/backupprojetos.sh
    echo "#" >> $cronhourly/backupprojetos.sh
    echo "rsync -azhv /mnt/sda3/Projetos/ /home/ahlr/Dropbox/TONICO/Projetos/" >> $cronhourly/backupprojetos.sh
    chmod +x $cronhourly/backupprojetos.sh
fi

 if [ $cleansai == yes ]; then
    echo -e "$cleansaitxt"
    echo "#!"$SHELL >> $crondaily/cleansai.sh
    echo "#Movendo arquivos de retorno do BNB" >> $crondaily/cleansai.sh
    echo "mkdir /home/ahlr/.wine/drive_c/skyline/recebidos" >> $crondaily/cleansai.sh
    echo "pasta_origem=/home/ahlr/.wine/drive_c/skyline/inbox" >> $crondaily/cleansai.sh
    echo "pasta_destino=/home/ahlr/.wine/drive_c/skyline/recebidos" >> $crondaily/cleansai.sh
    echo "cd \$pasta_origem && mv *.SAI \$pasta_destino" >> $crondaily/cleansai.sh
    chmod +x $crondaily/cleansai.sh
    sleep 3
fi

if [ $cleancache == yes ]; then	
    echo -e "$cleancachetxt"
    echo "#!"$SHELL >> $crondaily/cleancache.sh
    cat $minilicense >> $crondaily/cleansici.sh
    echo "echo 3 > /proc/sys/vm/drop_caches" >> $crondaily/cleancache.sh
    chmod +x $crondaily/cleancache.sh
    sleep 3
fi

if [ $ntp == yes ]; then	
    echo -e "$ntptxt"
    sed -i "s/#server 3.pool.ntp.org/server pool.ntp.br/g" /etc/ntp.conf
    chmod +x /etc/rc.d/rc.ntpd
	if [ -x /etc/rc.d/rc.ntpd ]; then
	  /etc/rc.d/rc.ntpd start
	fi
    sleep 3
fi

if [ $cups == yes ]; then
    echo -e "$cupstxt"
    chmod +x /etc/rc.d/rc.cups
    /etc/rc.d/rc.cups restart
    sleep 3
fi
	
if [ $samba == yes ]; then
    echo -e "$sambatxt"
    sed -i "s/MYGROUP/workgroup/g" /etc/samba/smb.conf-sample
    mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
    chmod +x /etc/rc.d/rc.samba
	if [ -x /etc/rc.d/rc.plexmediaserver ]; then
	    /etc/rc.d/rc.plexmediaserver start
	fi
    sleep 3
fi

if [ $shutdown == yes ]; then
    echo -e "$shutdowntxt"
    echo "#!"$SHELL >> /etc/rc.d/rc.local_shutdown
    echo "cd /tmp && rm -rf -- *[!"ahlr"]* 2>/dev/null" >> /etc/rc.d/rc.local_shutdown
    echo "cd /var/tmp && rm -rf * 2>/dev/null" >> /etc/rc.d/rc.local_shutdown
    echo "/usr/bin/find /tmp -mindepth 1 -maxdepth 1 -exec /bin/rm -rf {} +;" >> /etc/rc.d/rc.local_shutdown
    echo "find /tmp/lost+found -exec /bin/touch {} \;" >> /etc/rc.d/rc.local_shutdown
    echo "find /tmp -type s -exec  /bin/touch {} \;" >> /etc/rc.d/rc.local_shutdown
    echo "find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;" >> /etc/rc.d/rc.local_shutdown
    echo "find /tmp -type f -mtime +37 -exec rm -rf {} \; " >> /etc/rc.d/rc.local_shutdown
    chmod +x /etc/rc.d/rc.local_shutdown
    sleep 3
fi

if [ $teamviewerd == yes ]; then	
    echo -e "$teamviewerdtxt"
    echo "# --------- Inicializando o deamon rc.teamviewerd --------- #" >> /etc/rc.d/rc.local
    echo "if [ -x /etc/rc.d/rc.teamviewerd ]; then" >> /etc/rc.d/rc.local
    echo "/etc/rc.d/rc.teamviewerd start" >> /etc/rc.d/rc.local
    echo "fi" >> /etc/rc.d/rc.local
    echo
    sleep 3
fi

if [ $plex == yes ]; then
    echo -e "$plextxt"
    echo
    echo "# --------- Inicializando o deamon rc.teamviewerd --------- #" >> /etc/rc.d/rc.local
    echo "if [ -x /etc/rc.d/rc.plexmediaserver ]; then" >> /etc/rc.d/rc.local
    echo "/etc/rc.d/rc.plexmediaserver start" >> /etc/rc.d/rc.local
    echo "fi" >> /etc/rc.d/rc.local
    sleep 3
fi

if [ $mirrors == yes ]; then
    echo -e "$mirrorstxt"
    wget -q  -nv -e robots=0 -r -nd -cP /usr/local/bin http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
    sed -i "s|BUILDER:-\"Eric Hameleers <alien@slackware.com>\"|BUILDER:-\"Fela  <ahlr_2000@yahoo.com>\"|g" /usr/local/bin/mirror-slackware-current.sh
    sed -i "s|/home/ftp/pub/Linux/Slackware|/mnt/sda3/Slackware|g" /usr/local/bin/mirror-slackware-current.sh
    sed -i "s|VERBOSE:-\"-q\"|VERBOSE:-\"-v --progress\"|g" /usr/local/bin/mirror-slackware-current.sh
    sed -i "s|ISO:-\"CDROM\"}|ISO:-\"DVD\"}|g" /usr/local/bin/mirror-slackware-current.sh
    sed -i "s|EXCLUDES:-\"--exclude pasture\"|EXCLUDES:-\"--exclude pasture --exclude source\"|g" /usr/local/bin/mirror-slackware-current.sh
    sed -i "s|DVD_EXCLUDES:-\"-x ./testing  -x ./source -x ./extra/source\"|DVD_EXCLUDES:-\"-x ./source -x ./extra/source\"|g" /usr/local/bin/mirror-slackware-current.sh
    cp /usr/local/bin/mirror-slackware-current.sh /usr/local/bin/mirror-slackware32-current.sh
    sed -i "s|ARCH:-\"x86\"|ARCH:-\"x86_64\"|g" /usr/local/bin/mirror-slackware-current.sh
    mv /usr/local/bin/mirror-slackware-current.sh /usr/local/bin/mirror-slackware64-current.sh
    chmod +x /usr/local/bin/mirror-slackware*
    sleep 3
fi

if [ $inittab == yes ]; then
    echo -e "$inittabtxt"
    sed -i "s/id:3/id:4/g" /etc/inittab
    sleep 3
fi
		 
if [ $lang == yes ]; then
    echo -e "$langtxt"
    sed -i "s/^#*/#/" /etc/profile.d/lang.sh # --------- comenta todas as linhas --------- #	
    echo "#Local Português Brasileiro" >> /etc/profile.d/lang.sh
    echo "export LINGUAS=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LANGUAGE=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LC_ALL=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LESSCHARSET=latin1" >> /etc/profile.d/lang.sh
    sed -i "s/^/#/g" /etc/profile.d/lang.csh
    cat /etc/profile.d/lang.sh | grep ^export | sed -e "s/export/setenv/g" -e "s/\=/\ /g" >> /etc/profile.d/lang.csh
    sleep 3
fi

if [ $networkmanager == yes ]; then
    echo -e "$networkmanagertxt"
    chmod +x /etc/rc.d/rc.networkmanager
   	if [ -x /etc/rc.d/rc.teamviewerd ]; then
	    /etc/rc.d/rc.teamviewerd start
	fi
    sleep 3
fi

if [ $data == yes ]; then
    echo -e "$datatxt"
    echo "#!"$SHELL > data.sh
    echo "# Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela" >> data.sh
    echo "# opcao '-d' do comando date" >> data.sh
    echo "data_inicial=\`echo \"\$1\" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'\`" >> data.sh
    echo "data_final=\`echo \"\$2\" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'\`" >> data.sh
    echo "valor_mensalidade=\"\$3\"" >> data.sh
    echo "# Converte a data para o formato timestamp que e mais preciso" >> data.sh
    echo "data_inicial=\`date -d \"\$data_inicial\" \"+%s\"\`" >> data.sh
    echo "data_final=\`date -d \"\$data_final\" \"+%s\"\`" >> data.sh
    echo "dias_corridos=\$(((\$data_final - \$data_inicial) / 86400))" >> data.sh
    echo "# Calculo do valor proporcional" >> data.sh
    echo "echo \"scale = 4; \$valor_mensalidade / 30 * \$dias_corridos\" | bc" >> data.sh
    echo "exit 1" >> data.sh
    chmod +x teste2.sh
    sleep 3
fi  

if [ $thunderbackup == yes ]; then
    echo -e "$thunderbackuptxt"
    echo "#!"$SHELL >> $crondaily/thunderbirdbackup.sh
    echo "rsync -azhv /home/ahlr/.thunderbird/ /mnt/sda3/Thunderbird/" >> $crondaily/thunderbirdbackup.sh
   
if [ $thunderbird == yes ]; then
    mkdir /home/ahlr/.thunderbird
    chown -R ahlr /home/ahlr/.thunderbird/
    echo "[General]" >> /home/ahlr/.thunderbird/profiles.ini
    echo "StartWithLastProfile=1" >> /home/ahlr/.thunderbird/profiles.ini
    echo
    echo "[Profile0]" >> /home/ahlr/.thunderbird/profiles.ini
    echo "Name=default" >> /home/ahlr/.thunderbird/profiles.ini
    echo "IsRelative=0" >> /home/ahlr/.thunderbird/profiles.ini
    echo "Path=/mnt/sda3/Thunderbird/fsz8qgw4.default" >> /home/ahlr/.thunderbird/profiles.ini
    echo "Default=1" >> /home/ahlr/.thunderbird/profiles.ini



    sleep 3
fi

if [ $boinc == yes ]; then
    echo -e "$boinctxt"
    echo "#!"$SHELL >> /usr/local/bin/boinc.sh
    echo "cd /mnt/sda3/BOINC/" >> /usr/local/bin/boinc.sh
    echo "./boinc" >> /usr/local/bin/boinc.sh
    chmod +x /usr/local/bin/boinc.sh
    sleep 3
fi  

if [ $reccx == yes ]; then
    echo -e "$reccxtxt"
    mkdir -p /opt/caixa/Recebidos
    chmod -R 777 /opt/caixa
    sleep 3
fi  
    if [ $slackpkg == yes ]; then
    echo -e "$slackpkgtxt"
    echo "Baixando slackpkg+"
    sleep 3
    wget -q  -nv -e robots=0 -A .txz -r -nd -cP /tmp http://www.slakfinder.org/slackpkg+/pkg/
    sleep 3
    installpkg /tmp/slackpkg+*
    rm /tmp/slackpkg+*
    sleep 3
fi
	
# --------- Fim das funções --------- #	
echo
echo
echo -e "\e[ \t$CYAN Pacotes instalados e Configurações copiadas!! $NC"
echo
echo
	  
# --------- Apagando arquivos auxiliares no diretório /tmp --------- #
	  rm $minilicense
	  rm /tmp/pkgs.txt
    
    ;;
    
    * ) exit;; ## Add whatever other tests you need
  esac
	else
	echo -e "\e[ \t$CYAN Deseja rodar o script novamente? [yes/no] $NC"
	read RESPOSTA2
	test "$RESPOSTA2" = "no" && echo && echo && echo "OK Até mais!" && exit
	 sh teste.sh
      fi


      else
      echo
      echo
      echo -e "\e[ \t\e[1;31;40m Voce nao esta Conectado! $NC"
      echo
      echo
    fi


else
echo
echo
echo -e "\e[ \t\e[1;31;40m Logue-se como ROOT! $NC"
echo
echo

fi





