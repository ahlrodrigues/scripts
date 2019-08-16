#!/bin/bash
set -ex
if [ "$(whoami)" != "root" ]; then
    echo -e "$RED Troque de usuário para o root para continuar $NC"
    exit 0
else
    nomeProg="skypeforlinux"
    linkProg="https://repo.skype.com/deb/pool/main/s/skypeforlinux"
    linkSlackbuilds142Prog="https://slackbuilds.org/slackbuilds/14.2/network/skypeforlinux.tar.gz"

    wget "$linkProg" -O "${nomeProg}-latest"
    linkDownlad=$(grep "deb" "${nomeProg}-latest" | cut -d '"' -f8 | tail -n1)

    rm -r "${nomeProg}-latest"

    wget -c "$linkSlackbuilds142Prog"
    wget -c "$linkProg/$linkDownlad"

    if [ -e "$nomeProg.tar.gz" ] && [ -e "${nomeProg}"_*"deb" ]; then
        tar zvxf "$nomeProg.tar.gz"
        cp "${nomeProg}"_*"deb" "$nomeProg"
    else
        echo -e "$PINK Algo deu errado, o Fonte não foi encontrado! $NC"
        exit
    fi

    versaoProg=$(find "$nomeProg"/"${nomeProg}"_*"deb" | cut -d '_' -f2)
    sed -i "s/VERSION:-.*/VERSION:-$versaoProg}/g" $nomeProg/$nomeProg.SlackBuild
    sed -i "s/tgz/txz/g" $nomeProg/$nomeProg.SlackBuild

    cd "$nomeProg" || exit
    ./"$nomeProg.SlackBuild"

    echo -e "$GREEN Vamos instalar o programa $BBROWN $nomeProg? Y|N $NC"
    read -r install

    cd ../ || exit
    rm -r "$nomeProg"

    case $install in
    Y|y)
        upgradepkg --install-new /tmp/"$nomeProg*"
        ;;
    *)
        echo -e "$GREEN Pacote disponível na pasta /tmp $NC"
        ;;
    esac
fi
