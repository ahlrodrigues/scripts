#!/bin/bash
oteamviewerpkgtxt="teste"
doteamviewerpkg=yes
null=/dev/null
permix="chmod +x"
permi0="chmod 770"
rcd=/etc/rc.d
Downloads=/home/ahlr/Downloads

# Automatiza o SlackBuild Teamviewer
if [ $doteamviewerpkg == yes ]; then
    echo -e "$doteamviewerpkgtxt"
    clear
    nome=teamviewer
    formato=amd64.deb
    cd $Downloads
    if [ -e $nome*.tar.gz ] && [ -e $nome_*_$formato ]; then
    tar zvxf $nome*.tar.gz
    mv $nome_*$formato $nome
    else
    echo $nome_*_$formato
    echo
    echo -e "$PINK Algo deu errado, o SlackBuild ou o Fonte não foi encontrado! $NC"
    echo 
    echo
    echo
    echo 
    exit
    fi
    echo
    echo
    echo
    versao=`ls $nome/$nome_*$formato | awk -F '_' {'print \$2'}`
    sed -i "s/VERSION:-.*/VERSION:-$versao}/g" $nome/$nome.SlackBuild
    cd $nome
    ./$nome.SlackBuild
    echo
    echo
    echo
    echo -e "$GREEN Vamos instalar o programa $BBROWN $nome? Y|N $NC"
    read install
    case $install in
    Y|y)
    upgradepkg --install-new /tmp/$nome*
    ;;
    N|n)
    exit
    echo -e "$GREEN Pacote disponível noa pasta /tmp $NC"
    ;;
    *)
    echo
    echo
    echo
    echo -e "$BRED Ok, algo deu errado! $NC"
    exit
    sleep 5
    ;;
    esac
fi
