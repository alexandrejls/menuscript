#!/bin/bash

# Função para desabilitar o IPv6 em uma interface específica
desabilitar_ipv6_interface() {
    local interface="$1"
    
    # Verifica se a interface existe
    if ip link show "$interface" &> /dev/null; then
        # Desabilita o IPv6 na interface
        sysctl -w "net.ipv6.conf.$interface.disable_ipv6=1" > /dev/null
        echo "IPv6 desabilitado na interface $interface."
    else
        echo "Interface $interface não encontrada."
    fi
}

# Função para desabilitar o IPv6 no sistema
desabilitar_ipv6_sistema() {
    # Desabilita o IPv6 no sistema
    sysctl -w "net.ipv6.conf.all.disable_ipv6=1" > /dev/null
    sysctl -w "net.ipv6.conf.default.disable_ipv6=1" > /dev/null
    echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
    sysctl -p
    echo "IPv6 desabilitado no sistema."
}

# Pergunta se deseja desabilitar o IPv6 nas interfaces de rede
read -p "Deseja desabilitar o IPv6 em todas as interfaces de rede? (s/n): " choice_interfaces
if [ "$choice_interfaces" = "s" ]; then
    # Obtém a lista de interfaces de rede
    interfaces=$(ip link show | grep -E "^[0-9]+:" | awk -F': ' '{print $2}')

    # Desabilita o IPv6 em cada interface
    for interface in $interfaces; do
        desabilitar_ipv6_interface "$interface"
    done
    echo
fi

# Pergunta se deseja desabilitar o IPv6 no sistema
read -p "Deseja desabilitar o IPv6 no sistema? (s/n): " choice_sistema
if [ "$choice_sistema" = "s" ]; then
    desabilitar_ipv6_sistema
fi
