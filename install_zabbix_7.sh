#!/bin/bash

# Captura o hostname atual da máquina
NAME=$(hostname)

echo "===============================Instalando Zabbix==============================="

echo "===============================Setando o hostname: $NAME==============================="
hostnamectl set-hostname "$NAME"

echo "===============================Instalando e configurando o cliente Zabbix na máquina: $NAME==============================="

# Baixar o pacote do repositório Zabbix e instalar
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.0+ubuntu22.04_all.deb && \
sleep 2

sudo dpkg -i zabbix-release_latest_7.0+ubuntu22.04_all.deb && \
sleep 2

apt-get update && \

# Instalar o Zabbix agent
apt-get install -y zabbix-agent

# Atualizar configurações do agente Zabbix
sed -i 's/Server=10.10.2.50/Server=10.10.2.50,10.10.2.42/g' /etc/zabbix/zabbix_agentd.conf && 
sed -i 's/ServerActive=10.10.2.50/ServerActive=10.10.2.50,10.10.2.42/g' /etc/zabbix/zabbix_agentd.conf && 
sed -i "s/Hostname=Zabbix server/Hostname=$NAME/g" /etc/zabbix/zabbix_agentd.conf && 

sleep 1

# Habilitar e reiniciar o serviço do agente
sudo systemctl enable zabbix-agent.service && \
sudo systemctl restart zabbix-agent.service && \
sleep 1

echo '===============================Cliente Zabbix configurado com sucesso!===================================='
sleep 2
