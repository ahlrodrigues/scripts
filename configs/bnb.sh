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
arquivos1=`ls /home/ahlr/Downloads/ | awk '/.rem/ { print $0 }'` # REMESSAS
arquivos2=`ls /home/ahlr/.wine/drive_c/skyline/inbox/ | awk '/.SAI/ { print $0 }'` #RETORNOS
msm1=`cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "recebido como"` 
msm2=`cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Nenhum arquivo pendente"`
msm3=`cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Transmitindo arquivo 'C"`
msm4="Tente mais tarde!"

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
	sleep 5
	
	if [ "$arquivos1" != "" ]; then #Se existe arquivo de remessa

	    echo
	    echo
	    echo
	    echo -e "\e[ \t$GREEN Arquivo encontrado =>$CYAN $arquivos1 $NC" #Mostra arquivo de remessa
	    
	    echo
	    echo
	    echo
	    mv /home/ahlr/Downloads/$arquivos1 /home/ahlr/.wine/drive_c/skyline/outbox #Move para outbox
	    wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null #Abre o skyline
	    echo -e "\e[ \t$CYAN $msm3 $NC" #Arquivo transferido
	    sleep 05
	    echo
	    echo
	    echo
	    echo -e "\e[ \t$CYAN Arquivo transferido [$GREEN OK$NC $CYAN] $NC"
	    echo
	    echo
	    echo
	    sleep 10
	    exit 1
	    echo
	    echo
	    echo
	fi
	
		
	if [ "$arquivos2" == "" ]; then #Se não existe arquivo de retorno
		    
	    wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null
		    
		if [ "$arquivos2" == "" ]; then #Se não existe arquivo de retorno
			
		    echo
		    echo
		    echo
		    echo
		    echo -e "\e[ \t$RED $msm2 $NC" #Nenhum arquivo
		    echo
		    echo
		    echo -e "\e[ \t$RED $msm4 $NC" #Tente mais tarde
		    echo
		    sleep 10
		    exit 1
		
		else

		    echo -e "\e[ \t$GREEN Arquivo encontrado =>$CYAN $arquivos2 $NC" #Mostra o arquivo de retorno
		    echo
		    echo
		    echo
		    echo -e "\e[ \t$CYAN $msm1 $NC" #Recebido
		    echo
		    echo
		    echo
		    sleep 10

		fi
	else

	    echo -e "\e[ \t$GREEN Arquivo encontrado =>$CYAN $arquivos2 $NC" #Mostra o arquivo de retorno
	    echo
	    echo
	    echo
	    echo -e "\e[ \t$CYAN $msm1 $NC" #Recebido
	    echo
	    echo
	    echo
	    echo
	    sleep 10
	    exit 1
 	fi

fi

