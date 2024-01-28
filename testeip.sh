#!/bin/bash
clear
# Definindo um array associativo para mapear IPs para nomes de equipamentos
# Teste ping rede Hexag
declare -A equipamentos=(
  ["192.168.0.1"]="Draytek"
  ["192.168.0.2"]="Switch"
  ["192.168.0.3"]="Sw1-Unifi"
  ["192.168.0.4"]="Sw2-Unifi"
  ["192.168.0.101"]="Equipamento101"
  ["192.168.0.102"]="Equipamento102"
  ["192.168.0.103"]="Equipamento103"
  ["192.168.0.104"]="Equipamento104"
  ["192.168.0.105"]="Equipamento105"
  ["192.168.0.106"]="Equipamento106"
  ["192.168.0.107"]="Equipamento107"
  ["192.168.0.108"]="Equipamento108"
  ["192.168.0.109"]="Equipamento109"
  ["192.168.0.110"]="Equipamento110"
  ["192.168.0.111"]="Equipamento111"
)

# Função para testar a conectividade com ping
testar_ping() {
  for ip in "${!equipamentos[@]}"; do
    ping -c 1 -W 1 "$ip" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo -e "${equipamentos[$ip]} ($ip) está online.\n"
    else
      echo -e "${equipamentos[$ip]} ($ip) está offline.\n"
    fi
  done
}

# Testar a conectividade para todos os IPs
echo -e "Testando...\n"
testar_ping
