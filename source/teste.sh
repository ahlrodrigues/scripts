#!/bin/bash

plex=yes
null=/dev/null
permix="chmod +x"
permi0="chmod 770"
rcd=/etc/rc.d

#Iniciando do deamon Plex
if [ $plex == yes ]; then
    echo -e "$plextxt"
    if grep plexmediaserver /etc/rc.d/rc.local > $null
    then
    $permix $rcd/rc.plexmediaserver
    $permi0 $rcd/rc.plexmediaserver
    $rcd/rc.plexmediaserver start > $null
    else 
    echo "#Inicializando o deamon rc.plexmediaserver" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.plexmediaserver ]; then" >> $rcd/rc.local
    echo "$rcd/rc.plexmediaserver start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    fi
    sleep 5
fi
