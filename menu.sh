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
        echo -e "wget já está instalado.\n"
        return
    fi
    # Pergunta se deseja instalar
    echo
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
        
# Modificar a porta
    change_ssh_port() {
    read -p "Deseja alterar a porta ssh? (s/n): " choice
    if [ "$choice" == "s" ]; then
    read -p "Digite a nova porta SSH: " new_port
    sed -i "s/Port 22/Port $new_port/" /etc/ssh/sshd_config
        echo -e "Porta ssh alterada para $new_port.\n"
    else
        echo -e "Nenhuma alteração na porta ssh.\n"
    fi
    }
# Modificar a permissão    
    change_root() {
    read -p "Deseja alterar a permissão root no ssh? (s/n): " choice
    if [ "$choice" == "s" ]; then
    sed -i 's/#PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
        echo -e "Permissão root no ssh alterada.\n"
    else
        echo -e "Nenhuma alteração na permissão root no ssh.\n"
    fi
    }          
        echo -e "ssh já está instalado.\n"
    change_ssh_port 
    change_root
    else
        apt-get install -y ssh openssh-server | egrep 'version|instal'
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
    bash webmin.sh
    apt-get install -y --install-recommends webmin | egrep -i instalado | grep -v Lendo
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
    read -p "Deseja instalar o Git? (s/n): " choice
    if [ "$choice" = "s" ]; then
        echo -e "\nInstalando Git...\n"
        apt-get update &> /dev/null
        apt-get install -y git | egrep -i instalado | grep -v Lendo
        echo -e "\nGit instalado.\n"
    else
        echo -e "\nInstalação do Git cancelada.\n"
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
        echo -e "O arquivo .bashrc já foi alterado pelo script."
    else
        echo -e "O arquivo .bashrc ainda não foi alterado pelo script."
        cp .bashrc ~/.bashrc
        echo -e "\nScript executado.\n"
    fi
}

###############################################################################

###############################################################################

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



