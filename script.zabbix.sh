#!/bin/bash

echo '===============================Atualizando cliente Zabbix!===================================='
sed -i s/Server=10.10.2.50/Server=10.10.2.50,10.10.2.42/g /etc/zabbix/zabbix_agentd.conf && \ 
sed -i s/ServerActive=10.10.2.50/ServerActive=10.10.2.50,10.10.2.42/g /etc/zabbix/zabbix_agentd.conf && \
sed -i s/"Hostname=Zabbix server"/"Hostname=$NAME"/g /etc/zabbix/zabbix_agentd.conf && \
sleep 1
sudo systemctl enable zabbix-agent.service && \
sudo systemctl restart zabbix-agent.service && \
sleep 1
echo '===============================Cliente Zabbix atualizado com sucesso!===================================='
sleep 2
l
