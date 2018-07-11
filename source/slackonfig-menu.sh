#!/bin/bash

funcoes=$( dialog --stdout \
    --separate-output \
	--checklist 'Você gosta de:' 0 0 0 \
    mlocal '' off \
    cleanret '' off \
    mvrejsgr '' off \
    cleansici '' off \
    cleansai '' off \
    cleancache '' off \
    ntp '' off \
    samba '' off \
    cups '' off \
    shutdown '' off \
    teamviewerd '' off \
    plex '' off \
    mirrorx86_64 '' off \
    mirrorarm '' off \
    inittab '' off \
    networkmanager '' off \
    konsole '' off \
    reccx '' off \
    brother '' off \
    lang '' off \
    thunderbackup '' off \
    thunderbird '' off \
    bblazetonico '' off \
    bblazenet4you '' off \
    data '' off \
    winbox '' off \
    cashflow '' off \
    cobranca '' off \
    slackpkg '' off \
    slackpkgplus '' off \
    pkgs '' off \
    hubiCNET4YOU '' off \
    credhubiCNET4YOU '' off \
    multilib '' off \
    sshbackup '' off \
    ktown '' off \
    clamav '' off \
    projetos '' off \
    doplexpkg '' off \
    doteamviewerpkg '' off \
    dochangelog '' off \
    wallpaper '' off \
    localerc '' off \
    variables '' off \
    updatemirrors '' off \
    mmultilib '' off )

return_value=$?

case $return_value in
  $mlocal)
    echo "Result";;
  $DIALOG_CANCEL)
    echo "Cancel pressed.";;
  $DIALOG_HELP)
    echo "Help pressed.";;
  $DIALOG_EXTRA)
    echo "Extra button pressed.";;
  $DIALOG_ITEM_HELP)
    echo "Item-help button pressed.";;
  $DIALOG_ESC)
    if test -s $tmp_file ; then
      cat $tmp_file
    else
      echo "ESC pressed."
    fi
    ;;
esac
