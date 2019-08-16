#!/bin/bash

if [ ! -d /mnt/sda3/Slackware/pkg64 ]; then
mkdir /mnt/sda3/Slackware/pkg64
fi

cd /mnt/sda3/Slackware/pkg64

#chromium
lftp -c "open http://www.slackware.com/~alien/slackbuilds/chromium/pkg64/current/; mirror -n -i chromium --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"

#chromium
lftp -c "open http://www.slackware.com/~alien/slackbuilds/chromium-widevine-plugin/pkg64/current/; mirror -n -i chromium-widevine-plugin --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt -X *.dep"

#chromium
lftp -c "open http://www.slackware.com/~alien/slackbuilds/chromium-pepperflash-plugin/pkg64/current/; mirror -n -i chromium-pepperflash-plugin --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt -X *.dep"

#dropbox-client
lftp -c "open http://www.slackware.com/~alien/slackbuilds/dropbox-client/pkg64/current/; mirror -n -i dropbox-client --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"

#wine
lftp -c "open http://www.slackware.com/~alien/slackbuilds/wine/pkg64/current/; mirror -n -i wine --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"

#OpenAL
lftp -c "open http://www.slackware.com/~alien/slackbuilds/OpenAL/pkg64/current/; mirror -n -i OpenAL --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"

#flashplayer-plugin
lftp -c "open http://www.slackware.com/~alien/slackbuilds/flashplayer-plugin/pkg64/current/; mirror -n -i flashplayer-plugin --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"

#libreoffice
lftp -c "open http://www.slackware.com/~alien/slackbuilds/libreoffice/pkg64/current/; mirror -n -i libreoffice --delete-first -n -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt -X libreoffice-dict-a* -X libreoffice-dict-b* -X libreoffice-dict-c* -X libreoffice-dict-d* -X libreoffice-dict-e* -X libreoffice-dict-f* -X libreoffice-dict-g* -X libreoffice-dict-h* -X libreoffice-dict-i* -X libreoffice-dict-l* -X libreoffice-dict-n* -X libreoffice-dict-pl* -X libreoffice-dict-pt-PT* -X libreoffice-dict-r* -X libreoffice-dict-s* -X libreoffice-dict-t* -X libreoffice-dict-u* -X libreoffice-dict-v* -X libreoffice-dict-z* -X libreoffice-l10n-a* -X libreoffice-l10n-b* -X libreoffice-l10n-c* -X libreoffice-l10n-d* -X libreoffice-l10n-e* -X libreoffice-l10n-f* -X libreoffice-l10n-g* -X libreoffice-l10n-h* -X libreoffice-l10n-i* -X libreoffice-l10n-j* -X libreoffice-l10n-k* -X libreoffice-l10n-l* -X libreoffice-l10n-m* -X libreoffice-l10n-n* -X libreoffice-l10n-o* -X libreoffice-l10n-pa* -X libreoffice-l10n-pl* -X libreoffice-l10n-pt-* -X libreoffice-l10n-pt_PT* -X libreoffice-l10n-r* -X libreoffice-l10n-s* -X libreoffice-l10n-t* -X libreoffice-l10n-u* -X libreoffice-l10n-v* -X libreoffice-l10n-u* -X libreoffice-l10n-x* -X libreoffice-l10n-z*"

#openjdk
lftp -c "open http://www.slackware.com/~alien/slackbuilds/openjdk/pkg64/current/; mirror -n -i openjdk --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"

#qbittorrent
lftp -c "open http://www.slackware.com/~alien/slackbuilds/qbittorrent/pkg64/current/; mirror -n -i qbittorrent --delete-first -X *.md5 -X *.asc -X *.lst -X *.meta -X *.txt"
