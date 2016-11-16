#!/bin/sh

#Arthur Ribas
#Orientador: Diego Tumelero
#Escola Alcides Maya

#Instala servidor SSH
apt-get install openssh-server 
echo "tecle ENTER para continuar"

#Acessa a pasta sshd_config
nano /etc/ssh/sshd_config
/etc/init.d/ssh start
echo "tecle enter"
