#!/bin/bash
#
# Autor= Antonio Henrique (Fela)
# Bugs, Agradecimentos, Cr�ticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: ahlr_2000@yahoo.com
#
# Este programa � um software livre; voc� pode redistribui-lo e/ou
# modifica-lo dentro dos termos da GNU General Public License (Licen�a P�blica Geral GNU)
# como publicada pela Funda��o do Software Livre (FSF)
#
# GNU General Public License
# https://pt.wikipedia.org/wiki/GNU_General_Public_License
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Este programa � distribu�do na esperan�a que possa ser �til,
# mas SEM NENHUMA GARANTIA; sem uma garantia impl�cita de ADEQUA��O a
# qualquer MERCADO, APLICA��O EM PARTICULAR ou SUPORTE T�CNICO.
#
#
# Script: Cria��o e edi��o de arquivos de configura��o do Slackware-current_x86_64 GNU/Linux
#
# Last update: 01/08/2017
#


# --------- Teste se est� logado como root
if [ 'whoami' == 'root' ]; then


# --------- Teste se est� conectado na internet
ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]; then
  
echo -e "\e[ \t$CYAN Conectado! \e$NC"
sleep 3
echo
echo
echo


# --------- Inicio das Configura��es
echo -e "\e[ \t\e[1;33;40m Criando todos os arquivos de configura��o nas devidas pastas e executando processos de Configuracoes \e$NC"
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN bnb.sh => Busca arquivos de retorno da BNB \e$NC"
cp bnb.sh /usr/local/bin/
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN cleanret.sh => Mover os arquivos de retorno da caixa \e$NC"
touch /etc/cron.daily/cleanret.sh
echo "#!"$SHELL >> /etc/cron.daily/cleanret.sh
echo "#Move arquivos de retorno da CAIXA" >> /etc/cron.daily/cleanret.sh
echo "pasta_origem=/home/ahlr/Downloads" >> /etc/cron.daily/cleanret.sh
echo "pasta_destino=/opt/caixa/Recebidos" >> /etc/cron.daily/cleanret.sh
echo "cd $pasta_origem && mv *.ret $pasta_destino" >> /etc/cron.daily/cleanret.sh
chmod +x /etc/cron.daily/cleanret.sh
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN configsbackup.sh => Mover os arquivos de backup das configuracoes \e$NC"
touch /etc/cron.hourly/configsbackup.sh
echo "#!"$SHELL >> /etc/cron.hourly/configsbackup.sh
echo "rsync -azhv /mnt/sda3/Scripts/ /home/ahlr/Dropbox/TONICO/Scripts/" >> /etc/cron.hourly/configsbackup.sh
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN cleansai.sh => Mover os arquivos de retorno do bnb \e$NC"
touch /etc/cron.daily/cleansai.sh
echo "#!"$SHELL >> /etc/cron.daily/cleansai.sh
echo "#Movendo arquivos de retorno do BNB" >> /etc/cron.daily/cleansai.sh
echo "pasta_origem=/home/ahlr/.wine/drive_c/skyline/inbox" >> /etc/cron.daily/cleansai.sh
echo "pasta_destino=/home/ahlr/.wine/drive_c/skyline/recebidos" >> /etc/cron.daily/cleansai.sh
echo "cd $pasta_origem && mv *.SAI $pasta_destino" >> /etc/cron.daily/cleansai.sh
chmod +x /etc/cron.daily/cleansai.sh
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN cleancache.sh => Limpa o cache \e$NC"
touch /etc/cron.daily/cleancache.sh
echo "#!"$SHELL >> /etc/cron.daily/cleancache.sh
echo "echo 3 > /proc/sys/vm/drop_caches" >> /etc/cron.daily/cleancache.sh
chmod +x /etc/cron.daily/cleancache.sh
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Configuracoes do NTP \e$NC"
sed -i "s/pool.ntp.org/pool.ntp.br/g" /etc/ntp.conf
chmod +x /etc/rc.d/rc.ntpd
/etc/rc.d/rc.ntpd restart
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Inicializando do CUPS \e$NC"
chmod +x /etc/rc.d/rc.cups
/etc/rc.d/rc.cups restart
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Configuracoes do Samba \e$NC"
sed -i "s/MYGROUP/WORKGROUP/g" /etc/samba/smb.conf-sample
mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
chmod +x /etc/rc.d/rc.samba
/etc/rc.d/rc.samba restart
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Configuracoes de rc.local_shutdown \e$NC"
touch /etc/rc.d/rc.local_shutdown
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
echo
echo
echo

echo -e "\e[ \t$CYAN Configura��es do rc.local \e$NC"
echo "if [ -x /etc/rc.d/rc.teamviewerd ]; then" >> /etc/rc.d/rc.local
echo "/etc/rc.d/rc.teamviewerd start" >> /etc/rc.d/rc.local
echo "fi" >> /etc/rc.d/rc.local
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN mirror-slackware => Administracao dos mirros locais \e$NC"
cp mirror-slackware32-current.sh /usr/local/bin/
cp mirror-slackware64-current.sh /usr/local/bin/
#cp mirror-slackware-live.sh /usr/local/bin/
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Habilitando o init 4 \e$NC"
sed -i "s/id:3/id:4/g" /etc/inittab
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN rc.4 => Inicialzando networkmanager \e$NC"
chmod +x /etc/rc.d/rc.networkmanager
/etc/rc.d/rc.networkmanager start
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN data.sh => Script de calculo data \e$NC"
touch /usr/local/bin/data.sh
echo "#!"$SHELL >> /usr/local/bin/data.sh
echo "# Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela" >> /usr/local/bin/data.sh
echo "# opcao '-d' do comando date" >> /usr/local/bin/data.sh
echo "data_inicial=`echo "$1" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`" >> /usr/local/bin/data.sh
echo "data_final=`echo "$2" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`" >> /usr/local/bin/data.sh
echo "valor_mensalidade="$3"" >> /usr/local/bin/data.sh
echo "# Converte a data para o formato timestamp que e mais preciso" >> /usr/local/bin/data.sh
echo "data_inicial=`date -d "$data_inicial" "+%s"`" >> /usr/local/bin/data.sh
echo "data_final=`date -d "$data_final" "+%s"`" >> /usr/local/bin/data.sh
echo "dias_corridos=$((($data_final - $data_inicial) / 86400))" >> /usr/local/bin/data.sh
echo "# Calculo do valor proporcional" >> /usr/local/bin/data.sh
echo "echo "scale = 4; $valor_mensalidade / 30 * $dias_corridos" | bc" >> /usr/local/bin/data.sh
echo "exit 1" >> /usr/local/bin/data.sh
chmod +x /usr/local/bin/data.sh
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN thunderbirdbackup.sh => Backup e Restauracao do Thunderbird \e$NC"
touch /etc/cron.daily/thunderbirdbackup.sh
echo "#!"$SHELL >> /etc/cron.daily/thunderbirdbackup.sh
echo "rsync -azhv /home/ahlr/.thunderbird/ /mnt/sda3/Thunderbird/" >> /etc/cron.daily/thunderbirdbackup.sh
mkdir /home/ahlr/.thunderbird
chown -R ahlr /home/ahlr/.thunderbird/
ls -s /mnt/sda3/Thunderbird/profile.ini /home/ahlr/.thunderbird/
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN rc.4 => Configuracao do init com KDE \e$NC"
cp rc.4 /etc/rc.d/
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN boinc.sh => Arquivo de inicializa��o do BOIC \e$NC"
touch /usr/local/bin/boinc.sh
echo "#!"$SHELL >> /usr/local/bin/boinc.sh
echo "cd /mnt/sda3/BOINC/" >> /usr/local/bin/boinc.sh
echo "./boinc" >> /usr/local/bin/boinc.sh
chmod +x /usr/local/bin/boinc.sh
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Cria pasta para os arquivos da CEF e d� permiss�o de execucao \e$NC"
mkdir -p /opt/caixa/Recebidos
chmod -R 777 /opt/caixa
sleep 3
echo
echo
echo


# --------- Instala��o de Packages --------- 

echo -e "\e[ \t$CYAN slackpkg => Configuracao do slackpkg e slackpkgplus \e$NC"
wget -q -e robots=0 -A .txz -r -nd http://www.slakfinder.org/slackpkg+/pkg/
installpkg slackpkg+*
rm slackpkg+*
echo -e "\e[ \t$CYAN slackpkg => Configuracao do slackpkg e slackpkgplus \e$NC"
sed -i "s|^file://path/to/some/diretory|file://mnt/sda3/Slackware/slackware64-current/|g" /etc/slackpkg/mirrors
sed -i "s|^# Slackware|# Slackware x86_64|g" /etc/slackpkg/slackpkgplus.conf
sed -i "/REPOPLUS=(/ c\REPOPLUS=( slackpkgplus restricted alienbob multilib )" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ c\MIRRORPLUS[\'alienbob\']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ a\MIRRORPLUS['alienbob\']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ a\MIRRORPLUS[\'restricted\']=http://taper.alienbase.nl/mirrors/people/alien/restricted_sbrepos/current/x86_64/" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ a\MIRRORPLUS[\'multilib\']=http://taper.alienbase.nl/mirrors/people/alien/multilib/current/" /etc/slackpkg/slackpkgplus.conf
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN slackpkg blacklist=> Configuracao do blacklist \e$NC"
sed -i "/_SBo/ a\[0-9]+alien/" /etc/slackpkg/blacklist
sed -i "/_SBo/ a\[0-9]+compat32" /etc/slackpkg/blacklist
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN slackpkg => Aplicacao do layer multilib \e$NC"
slackpkg update gpg
slackpkg update
slackpkg upgrade multilib
slackpkg install multilib
rm uninstaller_*
rm brscan*
rm cupswr*
rm dcp7065*
sleep 3

echo
echo
echo -e "\e[ \t$CYAN Instalacao lista de pacotes \e$NC"
echo
slackpkg install $(cat /mnt/sda3/Scripts/configs/pkgs.txt)
sleep 3

echo
echo
echo -e "\e[ \t$CYAN Instalacao do Dropbox \e$NC"
echo
#dropbox start -i (executar com outro usuario)
#dropbox autostart y
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN Instalacao e configurando o Skyline \e$NC"
wine /home/ahlr/Dropbox/NET4YOU/NET4YOU/Packages/Skyline.exe 
sed -i "s|^# Slackware|# Slackware x86_64|g" >> /home/ahlr/.wine/drive_c/skyline/wtcm.ini

wine /home/ahlr/.wine/drive_c/skyline/skyline.exe
mkdir -p /home/ahlr/.wine/drive_c/skyline/recebidos
chown ahlr -R /home/ahlr/.wine/
sleep 3
echo
echo
echo

echo -e "\e[ \t$CYAN instalacao do driver da impressora \e$NC"
echo
./linux-brprinter-installer-2.1.1-1
sleep 3
echo
echo
echo


echo -e "\e[ \t$CYAN Configurando local pt-BR \e$NC"
echo
sed -i "s/^#*/#/" /etc/profile.d/lang.sh
echo "#Local Portugu�s Brasileiro" >> /etc/profile.d/lang.sh
echo "export LINGUAS=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LANGUAGE=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LC_ALL=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LESSCHARSET=latin1" >> /etc/profile.d/lang.sh
sed -i "s/^/#/g" /etc/profile.d/lang.csh
cat /etc/profile.d/lang.sh | grep ^export | sed -e "s/export/setenv/g" -e "s/\=/\ /g" >> /etc/profile.d/lang.csh
sleep 3
echo
echo
echo

echo                                                                                       
echo "Compilando e Instalando pacotes"                            
echo                                                                                       
echo
sleep 3

echo
echo
echo "Instalando TeamViewer"
wget -q -e robots=0 -r -nd https://download.teamviewer.com/download/teamviewer_i386.deb
wget -q -e robots=0 -r -nd http://slackbuilds.org/slackbuilds/14.2/network/teamviewer.tar.gz
tar zvxf teamviewer.tar.gz
mv teamviewer_i386.deb teamviewer/
cd teamviewer
./teamviewer.SlackBuild
installpkg /tmp/teamviewer-*.tgz
rm teamviewer*
sleep 3


#echo
#echo
#echo "Instalando Spotify"
#wget -q -e robots=0 -A _amd64.deb -r -nd http://repository.spotify.com/pool/non-free/s/spotify-client/
#wget -q -e robots=0 -A .tar.gz -r -nd http://slackbuilds.org/slackbuilds/14.2/multimedia/spotify.tar.gz
#tar zvxf
#sleep 3



echo
echo
echo "Instalando Bogofilter"
wget -q -e robots=0 -r -nd http://downloads.sourceforge.net/bogofilter/bogofilter-1.2.4.tar.bz2
wget -q -e robots=0 -r -nd http://slackbuilds.org/slackbuilds/14.2/system/bogofilter.tar.gz
tar zvxf bogofilter.tar.gz
mv bogofilter-1.2.4.tar.bz2 bogofilter/
cd bogofilter
./bogofilter.SlackBuild
installpkg /tmp/bogofilter-*tgz
sleep 3

echo
echo
echo
echo
echo
echo -e "\e[ \t$CYAN Pacotes instalado e Configura��es copiadas!! \e$NC"
echo
echo
echo
echo
else
echo -e "\e[ \t\e[1;31;40m Voce nao esta Conectado! \e$NC"

fi

else
    echo -e "\e[ \t\e[1;31;40m Logue-se como ROOT! \e$NC"

fi