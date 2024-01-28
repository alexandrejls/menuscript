#!/bin/bash
export LC_CTYPE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8
force_color_prompt=yes # Permite ativar cores no prompt do terminal
export DEBIAN_FRONTEND="noninteractive" # Não solicitar telas de configuração
# iconv -f ISO-8859-1 -t UTF-8 menu.sh > menu2.sh
#Autor
SEPARADOR='echo -e "\e[0m#=========================================================================================#"'
AUTOR="Script feito por: Alexandre Jorge"
CRIACAO="Criado em: 13/01/2024"
ATUALIZACAO="Atualizado em: 16/01/2024"

############################################################################### autor
clear
$SEPARADOR
echo $AUTOR && echo $CRIACAO && echo $ATUALIZACAO
$SEPARADOR 

############################################################################### bash-completion
echo

install_bash_completion() {
    # Verifica se já está instalado
    if [ -x "$(command -v bash)" ] && [ -f /etc/bash_completion ]; then
        echo -e "bash-completion já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o bash-completion? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando bash-completion...\n"
        apt-get update &> /dev/null
        apt-get install -y bash-completion | egrep -i instalado | grep -v Lendo
        echo -e "\nbash-completion instalado.\n"
    else
        echo -e "\nInstalação do bash-completion cancelada.\n"
    fi
}

############################################################################### net-tools

install_net_tools() {
    # Verifica se já está instalado
    if [ -x "$(command -v ifconfig)" ]; then
        echo -e "net-tools já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o net-tools? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando net-tools...\n"
        apt-get update &> /dev/null
        apt-get install -y net-tools | egrep -i instalado | grep -v Lendo
        echo -e "\nnet-tools instalado.\n"
    else
        echo -e "\nInstalação do Net-tools cancelada.\n"
    fi
}

############################################################################### vim

install_vim() {
    # Verifica se já está instalado
    apt-get autoremove vim-tiny -y  &> /dev/null
    if [ -x "$(command -v vim)" ]; then
        echo -e "vim já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    read -p "Deseja instalar o vim? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando vim...\n"
        
        apt-get update &> /dev/null
        apt-get install -y vim | egrep -i instalado | grep -v Lendo
        echo -e "\nvim instalado.\n"
    else
        echo -e "\nInstalação do vim cancelada.\n"
    fi
}

############################################################################### htop

install_htop() {
    # Verifica se já está instalado
    if [ -x "$(command -v htop)" ]; then
        echo -e "htop já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o htop? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando htop...\n"
        apt-get update &> /dev/null
        apt-get install -y htop | egrep -i instalado | grep -v Lendo
        echo -e "\nhtop instalado.\n"
    else
        echo -e "\nInstalação do htop cancelada.\n"
    fi
}

############################################################################### wget

install_wget() {
    # Verifica se já está instalado
    if [ -x "$(command -v wget)" ]; then
        echo -e "wget já está instalado."
        return
    fi
    # Pergunta se deseja instalar
    read -p "Deseja instalar o wget? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando Wget...\n"
        apt-get update &> /dev/null
        apt-get install -y wget | egrep -i instalado | grep -v Lendo
        echo -e "\nwget instalado.\n"
    else
        echo -e "\nInstalação do Wget cancelada.\n"
    fi
}

############################################################################### nload

install_nload() {
    # Verifica se já está instalado
    if [ -x "$(command -v nload)" ]; then
        echo -e "\nnload já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    read -p "Deseja instalar o nload? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando nload...\n"
        apt-get update &> /dev/null
        apt-get install -y nload | egrep -i instalado | grep -v Lendo
        echo -e "\nnload instalado.\n"
    else
        echo -e "\nInstalação do nload cancelada.\n"
    fi
}

############################################################################### nmap

install_nmap() {
    # Verifica se já está instalado
    if [ -x "$(command -v nmap)" ]; then
        echo -e "nmap já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    read -p "Deseja instalar o nmap? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando nmap...\n"
        apt-get update &> /dev/null
        apt-get install -y nmap | egrep -i instalado | grep -v Lendo
        echo -e "\nnmap instalado.\n"
    else
        echo -e "\nInstalação do nmap cancelada.\n"
    fi
}

############################################################################### speedtest

install_speedtest() {
    # Verifica se já está instalado
    if [ -x "$(command -v speedtest-cli)" ]; then
        echo -e "speedtest já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o speedtest? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando speedtest...\n"
        apt-get update &> /dev/null
        apt-get install -y speedtest-cli | egrep -i instalado | grep -v Lendo
        echo -e "\nspeedtest instalado.\n"
    else
        echo -e "\nInstalação do speedtest cancelada.\n"
    fi
}

############################################################################### ssh

install_ssh() {
    if [ -e "/etc/ssh/sshd_config" ]; then
        
       
        echo -e "ssh já está instalado."
        echo -e "Será aberto o sshd_conf para edição"
        read -p "Modifique como necessário"
        echo
        vi /etc/ssh/sshd_config
    else
        apt-get install -y ssh openssh-server | egrep 'version|instal|instalados:'
        echo -e "Caso queira mudar as portas e permissões do ssh."
        read -p "Será aberto para edição."
        vi /etc/ssh/sshd_config
        echo -e "ssh instalado com sucesso.\n"
    systemctl restart ssh
    fi
    }

############################################################################### webmin

install_webmin() {
    # Verifica se o Webmin já está instalado
    if [ -x "$(command -v webmin)" ]; then
        echo -e "Webmin já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o Webmin? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando Webmin...\n"
    bash /root/menuscript/webmin.sh
    apt-get install -y --install-recommends webmin | egrep 'version|instal|instalados:'
    echo -e "\nWebmin instalado.\n"
    else
        echo -e "\nInstalação do Webmin cancelada.\n"
    fi
}

############################################################################### git-hub

install_github() {
    # Verifica se já está instalado
    if [ -x "$(command -v git)" ]; then
        echo -e "Git já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o git? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando git...\n"
        apt-get update &> /dev/null
        apt-get install -y git | egrep -i instalado | egrep 'version|instal|instalados:'
        echo -e "\ngit instalado.\n"
    else
        echo -e "\nInstalação do git cancelada.\n"
    fi
}

############################################################################### cdrom

# Função para remover a linha contendo "cdrom" no arquivo sources.list
remove_cdrom_source() {
    # Verifica se a palavra "cdrom" existe no arquivo
    if grep -q "cdrom" /etc/apt/sources.list; then
        echo -e "A linha contendo 'cdrom' foi encontrada no arquivo sources.list."
        sed -i '/cdrom/d' /etc/apt/sources.list
        echo -e "\nLinha 'cdrom' removida do arquivo sources.list.\n"
    else
        echo -e "A palavra 'cdrom' não foi encontrada no arquivo sources.list.\n"
    fi
}

############################################################################### bashrc

# Função para verificar
bashrc_script() {
    # Verifica se o arquivo .bashrc já foi alterado
    if grep -q "script bash.sh" ~/.bashrc; then
        echo -e "O arquivo .bashrc já foi alterado pelo script.\n"
    else
        echo -e "O arquivo .bashrc ainda não foi alterado pelo script."
        mv ~/.bashrc ~/.bashrc.old
        cp /root/menuscript/.bashrc ~/.bashrc
        source ~/.bashrc
        source ~/.bashrc
        echo -e "\nbash alterado.\n"
    fi
}

############################################################################### man

install_man() {
    # Verifica se já está instalado
    if [ -x "$(command -v man)" ]; then
        echo -e "man já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o man? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando man...\n"
        apt-get update &> /dev/null
        apt-get install -y man | egrep -i instalado | egrep 'version|instal|instalados:'
        echo -e "\nman instalado.\n"
    else
        echo -e "\nInstalação do man cancelada.\n"
    fi
}

############################################################################### ipv6

disable_ipv6() {
    # Verifica o estado atual do IPv6
    ipv6_status=$(sysctl -n net.ipv6.conf.all.disable_ipv6)

    # Verifica se o IPv6 está ativado (valor 0)
    if [ "$ipv6_status" -eq 0 ]; then
        read -p "O IPv6 está habilitado. Deseja desativá-lo? (s/n): " choice
        if [ "$choice" = "s" ]; then
            # Desativa o IPv6
            bash /root/menuscript/ipv6.sh
            echo -e "IPv6 desativado com sucesso.\n"
        else
            echo -e "Nenhuma alteração feita.\n"
        fi
    else
        echo -e "O IPv6 já está desativado.\n"
    fi
}

############################################################################### rsyslog


install_rsyslog() {
    # Verifica se já está instalado
    if [ -x "$(command -v rsyslogd)" ]; then
    echo -e "rsyslog já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o rsyslog? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando rsyslog...\n"
        apt-get update &> /dev/null
        apt-get install -y rsyslog | egrep 'version|instal|instalados:'
        echo
        echo -e "Após apertar ENTER, será aberto o rsyslog.conf para edição." 
        read -p "Remova os logs desnecessários."
        vi /etc/rsyslog.conf
        systemctl restart rsyslog.service
        echo -e "\nrsyslog instalado.\n"
    else
        echo -e "\nInstalação do rsyslog cancelada.\n"
    fi
}

############################################################################### journald


journal_script() {
    # Verifica
    if grep -q "script" /etc/systemd/journald.conf; then
        echo -e "O arquivo journal já foi alterado pelo script.\n"
    else
        echo -e "O arquivo journal ainda não foi alterado pelo script."
        mv /etc/systemd/journald.conf /etc/systemd/journald.conf.old
        cp -a /root/menuscript/journald.conf /etc/systemd/journald.conf
        systemctl restart systemd-journald
        echo -e "journal alterado.\n"
    fi
} 

############################################################################### checkmk

install_checkmk() {
    # Verifica 
    if [ -x "$(command -v omd)" ]; then
        echo -e "checkmk já está instalado.\n"
        return
    fi

    # Pergunta se deseja instalar
    echo
    read -p "Deseja instalar o checkmk, para versão Debian 12? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando checkmk...\n"
        wget https://download.checkmk.com/checkmk/2.2.0p20/check-mk-cloud-2.2.0p20_0.bookworm_amd64.deb
        apt install ./check-mk-cloud-2.2.0p20_0.bookworm_amd64.deb | egrep 'version|instal|instalados:'
        omd version
        omd create monitoramento
        omd start monitoramento
        echo -e "\ncheckmk instalado.\n"
    else
        echo -e "\nInstalação do checkmk cancelada.\n"
    fi
}

###############################################################################

###############################################################################

###############################################################################











# Executa as instalações
install_bash_completion
install_net_tools
install_vim
install_htop
install_wget
install_nload
install_nmap
install_speedtest
install_ssh
install_webmin
install_github
remove_cdrom_source
bashrc_script
install_man
disable_ipv6
install_rsyslog
journal_script
install_checkmk
