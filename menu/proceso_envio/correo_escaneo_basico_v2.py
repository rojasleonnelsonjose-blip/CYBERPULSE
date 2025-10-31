#!/usr/bin/env python3

from email.message import EmailMessage
import smtplib
import os

# Carpeta donde se guardan los informes (ruta relativa al script)
base_dir = os.path.dirname(os.path.abspath(__file__))
informe = os.path.normpath(os.path.join(base_dir, '..', '..', 'wifi', 'informes', 'escaneo_rapido_wifi'))

# Verificar que exista el directorio de informes
if not os.path.isdir(informe):
    raise FileNotFoundError(f"Directorio de informes no encontrado: {informe}")

# Credenciales y destinatarios
remitente = 'rojasleonnelsonjose@gmail.com'
#ever.cardenas@teinco.edu.co
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
# Leer contraseña desde variable de entorno si está disponible (más seguro)
smtp_password = os.environ.get('SMTP_APP_PASSWORD', 'jualpulbnvmmvmkn')

with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
    smtp.login(remitente, smtp_password)
    smtp.sendmail(remitente, destinatarios, email.as_string())
