#!/bin/bash

# Cores;
BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
NC='\033[0m' # reset/no color
BLUE='\e[1;34m'
PINK='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'

# Buscar arquivos de remessa do BNB;
arquivos1=`ls /home/ahlr/Downloads/ | awk '/.rem/ { print $0 }'`
arquivos2=`ls /home/ahlr/.wine/drive_c/skyline/inbox/ | awk '/.SAI/ { print $0 }'`
msm1=`cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "recebido como"` 
msm2=`cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Nenhum arquivo pendente"`
msm3=`cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Transmitindo arquivo 'C"`

clear


if [[ $(whoami) == "root" ]]; then
   
    echo
    echo
    echo -e "\e[ \t\e[1;31;40m Troque de usuário, o ROOT não pode acessar o BNB\e[0m"
    echo
    echo
      exit 0
  else
    
	echo
	echo
	echo
	echo -e "\e[ \t\e[1;34;40m Buscando arquivos... \e[0m"
	echo
	echo
	echo
	
	if [ "$arquivos1" != "" ]; then
	    #cd /home/ahlr/Downloads/
	    echo
	    echo
	    echo
	    echo -e "\e[ \t$GREEN Arquivo encontrado => $arquivos1 $NC"
	    echo
	    echo
	    echo
	    mv /home/ahlr/Downloads/$arquivos1 /home/ahlr/.wine/drive_c/skyline/outbox
	    wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null
	    sleep 5
	    echo -e "\e[ \t$CYAN $msm3 $NC"
	    
	    echo
	    echo
	    echo
	    echo
	else
	
	
	echo
	echo
	echo
		
		if [ "$arquivos2" == "" ]; then
		    
		    wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null
		    
			if [ "$arquivos2" != "" ]; then

			    echo -e "\e[ \t$GREEN Arquivo encontrado => $arquivos2 $NC"
			    echo
			    echo
			    echo
			    echo -e "\e[ \t$CYAN $msm1 $NC"
			    echo
			    echo
			    echo
		
			else

			    echo
			    echo
			    echo
			    echo
			    echo -e "\e[ \t$RED $msm2 $NC"
			    echo
			    echo
			    echo
			    echo
			    sleep 10
			    exit 1
			fi
		else

		    echo -e "\e[ \t$GREEN Arquivo encontrado => $arquivos2 $NC"
		    echo
		    echo
		    echo
		    echo -e "\e[ \t$CYAN $msm1 $NC"
		    echo
		    echo
		    echo
		    echo
		    sleep 10
		    exit 1
	 	fi
	fi
fi

