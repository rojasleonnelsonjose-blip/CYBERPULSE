#!/usr/bin/env python3
# correro agresivo wifi
from email.message import EmailMessage
import smtplib
import os

# Carpeta donde se guardan los informes
informe = "/home/rojanels/Documentos/bash/wifi/informes/Escaneo_completo_wifi/"

# Credenciales y destinatarios
remitente = 'rojasleonnelsonjose@gmail.com'
destinatarios = ['1000733672@teinco.edu.co', '1022397080@teinco.edu.co']
mensaje_base = 'Escaneo Rápido de red wifi:\n\n'


archivos = [os.path.join(informe, f) for f in os.listdir(informe)]
archivos = [f for f in archivos if os.path.isfile(f)]

# Buscar el último archivo modificado
ultimo = max(archivos, key=os.path.getmtime)

# Leer el contenido del último archivo
with open(ultimo, "r") as f:
    contenido = f.read()

# Crear el correo
email = EmailMessage()
email["From"] = remitente
email["To"] = ", ".join(destinatarios)   # Para mostrar en el correo
email["Subject"] = 'Reporte - Escaneo Rápido de Red Wifi'
email.set_content(mensaje_base + contenido)

# Enviar el correo
with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
    smtp.login(remitente, "csfkmmgrblxqwxzn")  # contraseña de aplicación
    smtp.sendmail(remitente, destinatarios, email.as_string())
