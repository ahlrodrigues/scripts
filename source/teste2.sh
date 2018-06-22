##########################################
#                                        #      
# ------------ REFERÊNCIAS ------------- #            
#                                        #      
##########################################


# --------- comenta determinada linhas --------- #
sed -i '/PKGS_PRIORITY=( multilib ktown )/s/^/#/g' /etc/slackpkg/slackpkgplus.conf

# --------- descomenta determinada linhas --------- #
sed -i '/PKGS_PRIORITY=( multilib )/s/^#//g' /etc/slackpkg/slackpkgplus.conf 

# --------- comenta todas as linhas --------- #
sed -i "s/^#*/#/" /etc/profile.d/lang.sh 

# --------- acrescente linha após determinado argumento/linhas --------- #
sed -i '/[0-9]+/ a Oi. Sou novo aqui' 

# --------- substitui parte de um linhas --------- #
sed -i "s/LocalZone=.*/LocalZone=America\/Fortaleza/g" /home/ahlr/.config/ktimezonedrc 

# --------- Discard the output --------- #
$rcd/rc.ntpd restart > /dev/null 

# --------- Condicional E --------- #
if [ cobranca == yes ] && [ skyline == yes ]; then 

# --------- Condicional OU --------- #
if [ cobranca == yes ] || [ skyline == yes ]; then 

# --------- Rodando todos os script de uma pasta --------- #
for sh in /home/ahlr/Downloads/*.sh ; do
source "$sh"
#echo "Este é o $sh"
done
