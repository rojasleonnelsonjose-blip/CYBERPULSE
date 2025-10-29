#!/bin/bash


function obtener_red(){
	ip_local=$(ip addr show | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d/ -f1)

	red=$(ip addr show | grep "inet " | grep -v "127.0.0.1" |awk '{print $2}' |head -n 1)

	echo "La ip locar es: $ip_local"
	echo "la red local es: $red"
}

function agresividad_WIFI() {

	obtener_red
	Datos="escaneo_${red//\//_}_Agresivo_WIFI.txt"
	echo "Iniciando escaneo con Nmap.. "
	echo "Guardando resultados en el documento: $Datos"
	nmap -A -sS -O -sU -p- -T4 --reason --open --script="vuln and safe"  $ip_local -oN "/home/rojanels/Documentos/bash/wifi/informes/Escaneo_completo_wifi/$Datos" > /dev/null 2>&1 &
	
}

