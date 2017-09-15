
![SLACKONFIG][logo]

[logo]: https://bytebucket.org/ahlrodrigues/slackonfig/raw/adca69d05d4b9db0ee9cfa65f54cad4e87dabad7/imgs/Slackware1.png




**SLACKONFIG** - o Scripts para configuração do Slackware GNU/Linux
--------------


```
Autor: Antonio Henrique (Fela)

E-mail: ahlr_2000@yahoo.com


Bugs, Agradecimentos, Críticas "construtivas", mande me um e-mail, ficarei Grato!
```


**Nota:**
----------
```
Os scripts deste diretório estão disponíveis na esperança que possam ser úteis, mas SEM NENHUMA GARANTIA
DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A QUALQUER MERCADO, SEM NENHUMA GARANTIA DE APLICAÇÃO
EM PARTICULAR e NENHUM SUPORTE TÉCNICO.
```


**Scripts e Funções:**
----------------------
```
Neste diretório, constam alguns scripts para configurações básicas, que 
normalmente realizamos a cada instalação/reinstalação do O.S. Slackware GNU/Linux:

- cleanret.sh => Move os arquivos de retorno da caixa;
- mvrejsgr.sh => Move os arquivos de rejeitados e francesinha do BNB;
- cleansici.sh => Move os recibo de declaração do SICI para o Dropbox;
- backupprojetos.sh => Mover os arquivos de backup das configurações;
- cleansai.sh => Move os arquivos de retorno do bnb;
- cleancache.sh => Limpa o cache;
- Inicializa o deamon do servidor de impressão CUPS;
- rc.local_shutdown => para limpeza dos /tmp's no shutdown;
- Acrescenta inicialização do "daemon" do TeamViewer no ../rc.local;
- Acrescenta inicialização do "daemon" do Plex no ../rc.local;
- mirror-slackware => Administracao dos mirros locais;
- Habilita o "init:4" para inicialização do KDM;
- Inicializa o servidor de rede Networkmanager;
- Configura o profile do Konsole para mostrar os diretórios;
- Cria a pasta /opt/caixa/Recebidos;
- Instalação do driver da impressora Brother-DCP7065;
- Configura o locale pt-BR nos arquivos lang.sh e lang.csh;
- thunderbirdbackup.sh => Restaur o Thunderbird;
- thunderbackup.sh => Faz backup do Thunderbird;
- backblaze_TONICO.sh => Faz backup no Backblaze;
- backblaze_NET4YOU.sh => Faz backup no Backblaze;
- data.sh => Cria script de calculo data;
- winbox.sh => Cria a entrada do Winbox no mennu do KDE;
- skyline.sh => Cria a entrada do Skyline no mennu do KDE;
- numlockon.sh => Ativando o NumLock na inicialização;
- Instalação e configuração do Slackpkg+;
- Instalando lista de pacotes do arquivo pkgs.txt;




- ntp.sh => Habilita o NTP pool server brasileiro;
- Configura o grupo de trabalho do Samba;
- Incluindo inicialização do daemon do Samba no rc.local;
- Cria pasta para os arquivos da CEF e dá permissão de usuário
- Instalação do Skyline administrador dos arquivos de remessa (.REM) e de  retorno (.SAI) do BNB;
- bnb.sh => Cria script de inicialização do Skyline; 
- Configura a data e hora do sistema acrescentando o pool.ntp.org  no arquivo /etc/ntp.conf;
- Configura o grupo de trabalho e inicializa o servidor de compartilhamento de arquivos Samba;
- Copia os scripts de administração dos mirros locais do Slackware-current, x86_64 e 86;

- Cria script de backups e restauracao das configurações do Thunderbird;
- Configuração do "/etc/rc.d/rc.4" para inicialização do KDE como ambiente gráfico;
- Cria o arquivo de inicialização do BOIC;
- Configuração do Slackpkg;

- Aplicação do layer para transformar Slackware => Slackware Multilib;
- Instalação do Dropbox;

- Compilando e Instalando pacotes: TeamViewer, Bogofilter,


```


Usage:
------
```
Baixe o SLACKONFIG e rode-o como root para realizar todas as funções programadas por padrão
ou escolha no diretório /Configs o script que mais lhe agradar.
```


Feature:
--------
```
- Documentação em cada script;
```


**GNU General Public License:**
-------------------------------
```
Estes scripts/programas são softwares livres, você pode redistribuí-los e/ou modifica-los dentro dos
termos da Licença Pública Geral GNU:
```
> [General Public License](https://pt.wikipedia.org/wiki/GNU_General_Public_License)
>
>Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA


![Sk][pe]

[pe]: https://bytebucket.org/ahlrodrigues/slackonfig/raw/adca69d05d4b9db0ee9cfa65f54cad4e87dabad7/imgs/poweredbyslack.gif