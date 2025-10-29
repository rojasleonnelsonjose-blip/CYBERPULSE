import xmltodict 
import json

# Leer el archivo XML
with open("archivo.xml", "r", encoding="utf-8") as xml_file:
    xml_data = xml_file.read()

# Convertir XML a diccionario
dict_data = xmltodict.parse(xml_data)

# Convertir diccionario a JSON (con formato legible)
json_data = json.dumps(dict_data, indent=4, ensure_ascii=False)

# Guardar el resultado en un archivo JSON
with open("resultado.json", "w", encoding="utf-8") as json_file:
    json_file.write(json_data)

print(" Conversión completada. Archivo guardado como 'resultado.json'")
