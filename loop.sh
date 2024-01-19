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
ATUALIZACAO="Atualizado em: 14/01/2024"
#Autor
$SEPARADOR
echo $AUTOR && echo $CRIACAO && echo $ATUALIZACAO
$SEPARADOR 

############################################################################### Função de instalação do Wget
install_wget() {
    if command -v wget &> /dev/null; then
        echo -e "Wget já está instalado.\n"
    else
        apt-get update &> /dev/null 
        apt-get autoclean -y &> /dev/null 
        apt-get autoremove -y &> /dev/null
        apt-get install -y wget
        echo -e "Wget instalado com sucesso.\n"
    fi
}

############################################################################### Função de instalação do SSH
install_ssh() {
    if [ -e "/etc/ssh/sshd_config" ]; then
        
# Modificar a porta
change_ssh_port() {
    read -p "Deseja alterar a porta SSH? (s/n): " choice
    if [ "$choice" == "s" ]; then
    read -p "Digite a nova porta SSH: " new_port
    sed -i "s/Port 22/Port $new_port/" /etc/ssh/sshd_config
echo -e "Porta SSH alterada para $new_port.\n"
    else
echo -e "Nenhuma alteração na porta SSH.\n"
    fi
    }
# Modificar a permissão    
    change_root() {
    read -p "Deseja alterar a permissão root no SSH? (s/n): " choice
    if [ "$choice" == "s" ]; then
    sed -i 's/#PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
echo -e "Permissão root no SSH alterada.\n"
    else
echo -e "Nenhuma alteração na permissão root no SSH.\n"
    fi
    }          
echo -e "SSH já está instalado.\n"
change_ssh_port 
change_root
    else
        apt-get install -y ssh openssh-server | egrep 'version|instal'
echo -e "SSH instalado com sucesso.\n"
systemctl restart ssh
    fi
    }

############################################################################### Função de instalação do Net-tools
install_net_tools() {
    if command -v ifconfig &> /dev/null; then
echo -e "Net-tools já está instalado.\n"
    else
        apt-get install -y net-tools | egrep 'version|instal'
echo -e "Net-tools instalado com sucesso.\n"
    fi
}

# Inicialização das flags
winget_installed=false
ssh_installed=false
net_tools_installed=false

while true; do
    clear  # Limpa a tela

    # Exibe o menu
    echo "Escolha uma opção:"
    echo "1 - Instalar wget"
    echo "2 - Instalar SSH"
    echo "3 - Instalar Net-Tools"
    echo "0 - Sair"

    # Lê a opção do usuário
    read option

    case $option in
        1)
            install_wget
            ;;
        2)
            install_ssh
            ;;
        3)
            install_net_tools
            ;;
        
        0)
            echo -e "\nSaindo do menu."
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    # Pausa para aguardar a leitura do usuário
    echo
    read -p "Pressione Enter para continuar..."
done
