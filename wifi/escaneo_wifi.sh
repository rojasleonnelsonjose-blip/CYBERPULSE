#!/bin/bash

function obtener_red_wifi(){
	ip_local=$(ip addr show | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d/ -f1)

	red=$(ip addr show | grep "inet " | grep -v "127.0.0.1" |awk '{print $2}' |head -n 1)

	echo "La ip locar es: $ip_local"
	echo "la red local wifi es: $red"
}

function escaneo_red_wifi() {

	obtener_red
	Datos="escaneo_${red//\//_}_wifi.txt"
	Datos2="escaneo_${red//\//_}_wifi.xml"
	echo "Iniciando escaneo con Nmap.. "
	echo "Guardando resultados en el documento: $Datos"
	nmap  -vv $red -oN "/home/rojanels/Documentos/bash/wifi/informes/escaneo_rapido_wifi/$Datos" -oX "/home/rojanels/Documentos/bash/wifi/informes/escaneo_rapido_wifi/XML/$Datos2" > /dev/null 2>&1 &
}



