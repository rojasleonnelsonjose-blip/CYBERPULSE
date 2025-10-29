#!/bin/bash

source "/home/rojanels/Documentos/bash/wifi/escaneo_wifi.sh"
source "/home/rojanels/Documentos/bash/wifi/escaneo_wifi_completo.sh"



function Presentacion(){
	echo "======================================"
	echo "=           Auditoria de redes:      ="
	echo "= creado: por Nelson rojas,          ="
	echo "=                   Jairo Romero     ="
	echo "======================================"

	echo "================================================================================================="
	echo "=Muchas de estas herrameientas son bastante agresivas y es necesario contar con la autorizacion ="
	echo "=de la organizacion para evitar conflictos legales y penales de lo contrario abstenerse de      ="
	echo "=utilizarla. 																					  ="
	echo "================================================================================================="

	echo "================================================================================================="
	echo "=Los creadores no se hacen resposables del uso indevido de la herremienta                       ="
	echo "================================================================================================="

}

Presentacion



select opcion in "Auditoria en redes" "Buscador de dispositivos" "opcion 3" "salir"; do
	case $REPLY in
		1)
			echo "Escaneo de Red: "
			select Puerto in "Escaneo de red" "dos" "volver"; do
				case $REPLY in
					1)
						echo "Escaneo de red"
						select Puerto in "Escaneo rapido" "Escaneo Completo"  "volver";do
							case $REPLY in
								1)
									echo "Escaneo red rapido"
									escaneo_red_wifi
									echo "Esperar un momento"
									echo "Informacion: "
									echo "================================================================================================="
									echo "=La informacion recolectada en este escaneo mostrara todos los dispositivos conectados en la red="
									echo "=identificando los puertos abiertos de cada dispositivo.                                        ="
									echo "================================================================================================="
									sleep 60

									read -p "Desea enviar el informe por correo (1 = si/ 2= no):" pregunta

									if [[ "$pregunta" == "1" ]]; then
										echo "Enviando informe Rapido"
										/home/rojanels/Documentos/bash/menu/proceso_envio/correo_escaneo_basico_v2.py
										
									elif [[ "$pregunta" == "2" ]]; then
										echo "Informe no enviado"
									else
										echo "respuesta no valida, solo escribir 1 o 2"
									fi
									;;
								2) 
									echo "Escaneo de red completa"
									agresividad_WIFI
									echo "Esperar un momento"
									echo "Informacion: "
									echo "================================================================================================="
									echo "=                                                                                               ="
									echo "= Este escaneo se ejeutara de manera minuciosa y agresiva opteniendo informacion como:          ="
									echo "= sS envio de paquetes tcp                                                                      ="
									echo "= O detencion de sistemas operativos,                                                           ="
									echo "= sU busqueda de puertos UDP                                                                    ="
									echo "= -p- escaneo de todos los puesrtos 1-65535                                                     ="
									echo "= T4 escaneo con velocidad alta pero mayor creacion de ruidos en los sistemas                   ="
									echo "= --reason muestra la razon por la cual el puerto esta abierto -open solo puertos abiertos      ="
									echo "= -script="vul and safe" muestra la categoria de las vulnerabilidades encontradas               ="
									echo "=                                                                                               ="
									echo "================================================================================================="

									echo "================================================================================================="
									echo "=Los creadores no se hacen resposables del uso indevido de la herremienta                       ="
									echo "================================================================================================="
									sleep 300

									read -p "Desea enviar el informe por correo (1 = si/ 2= no):" pregunta

									if [[ "$pregunta" == "1" ]]; then
										echo "Enviando informe Rapido"
										/home/rojanels/Documentos/bash/menu/proceso_envio/correo_escaneo_agresivo_v6.py
										
									elif [[ "$pregunta" == "2" ]]; then
										echo "Informe no enviado"
									else
										echo "respuesta no valida, solo escribir 1 o 2"
									fi
				
									;;
								3)
									echo "Volver"
									break
									;;
							esac	
						done
						;;
					2)

						;;
					3) 
						echo "Hola 3"
						;;
					4)
						echo "volver"
						break
		
				
						;; 	

				esac
			done	
			;;		



		2)
			echo "Explotacion de vulnerabilidades"
			echo "Selecione el sistema operativo"

			select opcion in "windows" "android" "macos" "linux"; do
				case $REPLY in
					1)
						echo "selecione la version del sistema operativo  windows"

						select opcion in "win 7" "win 8" "win 10" "win 11"; do 
							case $REPLY in 
								1)
									echo "windows 7"

									read -p "quiere generar el lanzamiento de miltiple sploit [si = 1] [No = 2]: " win_7

									if [[ "$win_7" == "1" ]]; then
										echo "corriendo"

									elif [[ "$win_7" == "2" ]]; then
										echo "usted canselo la interaccion"
									else
										echo "opcion errada"
									fi
									;;

								2)
									echo "windows 8"

									read -p "quiere generar el lanzamiento de miltiple sploit [si = 1] [No = 2]: " win_8

									if [[ "$win_8" == "1" ]]; then
										echo "corriendo"

									elif [[ "$win_8" == "2" ]]; then
										echo "usted canselo la interaccion"
									else
										echo "opcion errada"
									fi
									;;

								3)
									echo "windows 10"

									read -p "quiere generar el lanzamiento de miltiple sploit [si = 1] [No = 2] " win_10

									if [[ "$win_10" == "1" ]]; then
										echo "corriendo"

									elif [[ "$win_10" == "2" ]]; then
										echo "usted canselo la interaccion"
									else
										echo "opcion errada"
									fi
									;;

								4)
									echo "windows 11"

									read -p "quiere generar el lanzamiento de miltiple sploit [si = 1] [No = 2] " win_11
									
									if [[ "$win_11" == "1" ]]; then
										echo "corriendo"

									elif [[ "$win_11" == "2" ]]; then
										echo "usted canselo la interaccion"
									else
										echo "opcion errada"
									fi
									;;
								
							esac
						done
						;;

				esac	
			done						
			;;
     
			
	esac
done
;;


