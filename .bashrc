# *********************************************
# * ~/.bashrc Personalizado                   *
# * local: /home/user/.bashrc                 *
# *                                           *
# * Author: Alexandre Jorge                   *
# * E-Mail: alexandrejls@gmail.com            *
# * Date: 16/11/2020                          *
# * Update: 22/01/2024                        *
# *********************************************
# ======================================================================
# Original de Edinaldo P. Silva para Arch Linux
# URL: http://gnu2all.blogspot.com.br/2011/10/arch-linux-bashrc.html
# ======================================================================
# script bash.sh 
#-----------------------------------------------
# Configurações Gerais
#-----------------------------------------------
force_color_prompt=yes

# Se não estiver rodando interativamente, não fazer nada
[ -z "$PS1" ] && return
HISTSIZE=1000           # Número máximo de comandos a serem mantidos no histórico
HISTFILESIZE=2000       # Tamanho máximo do arquivo de histórico
HISTCONTROL=ignoredups  # Evitar a inclusão de comandos duplicados
HISTCONTROL=ignoreboth  # Evitar a inclusão de comandos consecutivos duplicados
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # Permite definir o formato do timestamp no histórico
shopt -s histappend # Adicionar ao Historico e não substitui-lo
 
#===========================================
# Váriavies com as Cores
#===========================================
NONE="\[\033[0m\]" # Eliminar as Cores, deixar padrão)
 
## Cores de Fonte
K="\[\033[0;30m\]" # Black (Preto)
R="\[\033[0;31m\]" # Red (Vermelho)
G="\[\033[0;32m\]" # Green (Verde)
Y="\[\033[0;33m\]" # Yellow (Amarelo)
B="\[\033[0;34m\]" # Blue (Azul)
M="\[\033[0;35m\]" # Magenta (Vermelho Claro)
C="\[\033[0;36m\]" # Cyan (Ciano - Azul Claro)
W="\[\033[0;37m\]" # White (Branco)
 
## Efeito Negrito (bold) e cores
BK="\[\033[1;30m\]" # Bold+Black (Negrito+Preto)
BR="\[\033[1;31m\]" # Bold+Red (Negrito+Vermelho)
BG="\[\033[1;32m\]" # Bold+Green (Negrito+Verde)
BY="\[\033[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
BB="\[\033[1;34m\]" # Bold+Blue (Negrito+Azul)
BM="\[\033[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
BC="\[\033[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
BW="\[\033[1;37m\]" # Bold+White (Negrito+Branco)
 
## Cores de fundo (backgroud)
BGK="\[\033[40m\]" # Black (Preto)
BGR="\[\033[41m\]" # Red (Vermelho)
BGG="\[\033[42m\]" # Green (Verde)
BGY="\[\033[43m\]" # Yellow (Amarelo)
BGB="\[\033[44m\]" # Blue (Azul)
BGM="\[\033[45m\]" # Magenta (Vermelho Claro)
BGC="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
BGW="\[\033[47m\]" # White (Branco)
 
#=============================================
# Configurações referentes ao usuário
#=============================================
 
## Verifica se é usuário root (UUID=0) ou usuário comum
if [ $UID -eq "0" ]; then	 
## Cores e efeitos do Usuario root	 
#PS1="$G┌─[$BR\u$G]$BY@$G[$BW${HOSTNAME%%.*}$G]$B:\w\n$G└──>$BR \\$ $NONE"
PS1="$G┌─[$BR\u$G]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;2m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\]\[\033[38;5;2m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;2m\]-\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;4m\]\d\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] * \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;4m\]\A\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\n\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;166m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;1m\]$G└──>$BR \\$\[$(tput sgr0)\] $NONE"
	  
else 
## Cores e efeitos do usuário comum
PS1="$BR┌─[$BG\u$BR]$BY@$BR[$BW${HOSTNAME%%.*}$BR]$B:\w\n$BR└──>$BG \\$ $NONE"
fi # Fim da condição if
## Exemplos de PS1
# PS1="\e[01;31m┌─[\e[01;35m\u\e[01;31m]──[\e[00;37m${HOSTNAME%%.*}\e[01;32m]:\w$\e[01;31m\n\e[01;31m└──\e[01;36m>>\e[00m"
# PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '}
# PS1="\e[01;31m┌─[\e[01;35m\u\e[01;31m]──[\e[00;37m${HOSTNAME%%.*}\e[01;32m]:\w$\e[01;31m\n\e[01;31m└──\e[01;36m>>\e[00m"
# PS1="┌─[\[\e[34m\]\h\[\e[0m\]][\[\e[32m\]\w\[\e[0m\]]\n└─╼ "
# PS1='[\u@\h \W]\$ '
#==========================
# DIVERSOS
#==========================
## Habilitando suporte a cores para o ls e outros aliases
## Vê se o arquivo existe
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	   
	## Aliases (apelidos) para comandos
	alias ls='ls --color=auto'
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	fi 
	# Fim do if do dircolor
   
	## Aliases (apelidos) diversos
	alias c='clear'
	alias date='date +"%H:%M, %d-%m-%Y"'
	alias df='df -hT'
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'
	alias ls='ls -la'
  alias re='reboot'
	alias off='shutdown -h now'
  alias rm='rm -iv'
	alias cp='cp -aiv'
	alias mv='mv -iv'
	alias meuip='ip addr show | grep inet | grep -v "127" | grep -v "::1" | awk "{ print $2; }" | sed "s/\/.*$//"'
	alias vimbash='vim ~/.bashrc'
  	
  ## Aliases apt-get
  alias up='apt-get update'
  alias upg='apt-get upgrade'
  alias updg='apt-get update && apt-get upgrade'
  alias remove='apt-get remove -y'
  alias aptrepair='apt-get -f install'
  alias aptget='apt-get install -y' 
  alias comandosdebian='cat /root/.bashrc | grep apt'
	
	## Aliases asterisk
  alias astoff='/etc/init.d/asterisk stop'
  alias aston='/etc/init.d/asterisk start'
  alias aststatus='/etc/init.d/asterisk status'
  alias pbx='rasterisk -vvvvvrgci'
  alias astdir='cat /etc/asterisk/asterisk.conf | grep "=>"'
  alias comandosasterisk='cat /root/.bashrc | grep asterisk'

	## Aliases Instalação
	alias install='sudo mkdir -p /opt/install/ && sudo cd /opt/install/'

  # Editar sources.list
  alias lists='sudo vim /etc/apt/sources.list'
   
  # yum
  alias yumver='sudo clear && sudo cat ~/.bashrc | grep yum'
  alias yumc='sudo yum clean all'
  alias yumi='sudo yum install -y'
  alias yumcup='sudo yum check-update'
  alias yumup='sudo yum update -y'
  alias yumupg='sudo yum upgrade -y'
  alias yumrep='sudo yum repolist'
  alias yumatualiza='sudo yum check-update && sudo yum update -y && sudo yum upgrade -y'
  
  # Reparar o dpkg
  alias dpkgrepair='sudo dpkg --configure -a'
   
  # Testar conexão com ping
  alias google='ping www.google.com.br | while read pong; do echo "$(date): $pong"; done'
  alias uol='ping www.uol.com.br | while read pong; do echo "$(date): $pong"; done'
  alias terra='ping www.terra.com.br | while read pong; do echo "$(date): $pong"; done'
  
  # Export
  export vi=vim
  export HISTTIMEFORMAT="%h/%d - %H:%M:%S " 
  source /etc/bash_completion