#!/bin/bash

#Arthur Ribas 
#Orientador: Diego Tumelero
#Escola Alcides Maya

#Pega o nome de usuario para saber se é root ou normal
usuario=`id -u`

#Define tamanho da tela e os titulos do menu
HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=40
BACKTITLE="Seja bem vindo"
TITLE="Executar comandos remotos SSH"
MENU="Escolha uma das opcoes:"

#Tela de MENU com opcao 1 de listar o sistema e opcao 2 sair
while true
do
	OPTIONS=(1 "Lista o sistema operacional e a arquitetura"
       		 2 "Sair")

	CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" --stdout\
                )

	clear

#Criando case para as opcoes selecionadas
	case $CHOICE in
        	1)
			nome=$( dialog --stdout --inputbox 'Digite o nome do usuario da maquina do colega:' 10 60 )
			if [ -n "$nome" ]
			then
				ip=$( dialog --stdout --inputbox 'Digite o IP da maquina do colega:' 10 60 )
				if [ -n "$ip" ]
				then
					sisop=`ssh $nome@$ip uname -o`
					arquit=`ssh $nome@$ip uname -m`
					dialog --title 'Saida dos comandos' --msgbox "Sisop do colega: $sisop\nArquitetura: $arquit" 10 60
				else
					dialog --title 'Saida dos comandos' --msgbox "Voce nao digitou o IP..." 10 60
				fi
			else
				dialog --title 'Saida dos comandos' --msgbox "Voce nao digitou o nome..." 10 60
			fi
            		;;
        	2)
			break
            		;;
        	*)
			break
            		;;
	esac
done

exit 0
