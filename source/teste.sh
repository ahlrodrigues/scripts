#!/bin/bash
plextxt="teste"
plex=yes
null=/dev/null
permix="chmod +x"
permi0="chmod 770"
rcd=/etc/rc.d

# Iniciando do deamon Teamviewer
if [ $teamviewerd == yes ]; then	
    echo -e "$teamviewerdtxt"
    echo
    echo "Testando se o Teamviewer esta instalado"
    if [ ! -f "$rcd/rc.teamviewerd" ]; then
    echo
    echo "O Teamviewer nao esta instalado!"
    echo
    if [ grep teamviewerd /etc/rc.d/rc.local > $null ]; then
    $permix $rcd/rc.teamviewerd
    $permi0 $rcd/rc.teamviewerd
    $rcd/rc.teamviewerd start > $null
    else
    echo "#Inicializando o deamon rc.teamviewerd" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.teamviewerd ]; then" >> $rcd/rc.local
    echo "$rcd/rc.teamviewerd start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    $permix $rcd/rc.teamviewerd
    $permi0 $rcd/rc.teamviewerd
    $rcd/rc.teamviewerd start > $null
    sleep 5
    fi
fi
fi

#Iniciando do deamon Plex
if [ $plex == yes ]; then
    echo -e "$plextxt"
    echo
    echo "Testando se o Plex esta instalado"
    if [ ! -f "$rcd/rc.plexmediaserver" ]; then
    echo
    echo "O Plex nao esta instalado!"
    echo
    if [ grep plexmediaserver /etc/rc.d/rc.local > $null ]; then
    $permix $rcd/rc.plexmediaserver
    $permi0 $rcd/rc.plexmediaserver
    $rcd/rc.plexmediaserver start > $null
    else 
    echo "#Inicializando o deamon rc.plexmediaserver" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.plexmediaserver ]; then" >> $rcd/rc.local
    echo "$rcd/rc.plexmediaserver start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    $permix $rcd/rc.plexmediaserver
    $permi0 $rcd/rc.plexmediaserver
    $rcd/rc.plexmediaserver start > $null
    fi
    sleep 5
fi
fi

