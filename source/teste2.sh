#!/bin/bash

dialog --title 'Termos da Licença Pública Geral GNU' --yesno \
'Autor: Antonio Henrique (Fela)
e-mail: ahlr_2000@yahoo.com
repositório: github.com/ahlrodrigues/slackonfig
                                              
Bugs, Agradecimentos, Críticas "construtivas"!
Mande me um e-mail, que ficarei muito grato!
                                    
Este scripts é disponibilizado na esperança que possa ser útil,
mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA
DE ADEQUAÇÃO A QUALQUER SISTEMA, SEM NENHUMA GARANTIA DE APLICAÇÃO
EM PARTICULAR e NENHUM SUPORTE TÉCNICO.
                                              
Estes scripts/programas são softwares livres, você pode redistribuí-los
e/ou modifica-los dentro dos termos da Licença Pública Geral GNU.
                                          
GNU General Public License:
[GPL](https://pt.wikipedia.org/wiki/GNU_General_Public_License)
Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,
Boston, MA 02110-1301 USA


PODEMOS começar?' 0 0

if [ $? = 0 ]; then
   
   dialog --title 'Aguarde' \
   --sleep 1 \
   --infobox '\nEntão vamos começar!' 0 0
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
else
    
   dialog --title 'Aguarde' \
   --sleep 1 \
   --infobox '\noK, finalizando em 5 segundos.' 5 50
   dialog --title 'Aguarde' \
   --sleep 1 \
   --infobox '\noK, finalizando em 4 segundos..' 5 50
   dialog --title 'Aguarde' \
   --sleep 1 \
   --infobox '\noK, finalizando em 3 segundos...' 5 50
   dialog --title 'Aguarde' \
   --sleep 1 \
   --infobox '\noK, finalizando em 2 segundos....' 5 50
   dialog --title 'Aguarde' \
   --sleep 1 \
   --infobox '\noK, finalizando em 1 segundos.....' 5 50

fi