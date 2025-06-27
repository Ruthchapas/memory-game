# indicar qué versión de node y linux vamos a utilizar
FROM node:24-alpine3.22

# Indicar la carpeta de trabajo en la imagen 
WORKDIR /app

# COPIAR los package al directorio de trabajo (/app)
    #el punto equivale a la barra para el directorio
COPY package*.json .

# Obtener los módulos (dependencias)
RUN npm install && npm cache clean --force && rm -rf /tmp/ /root/.npm/_cacache

# COPIAR el resto de ficheros (de todo a todo)
COPY . .

# Exponer PUERTO SALIDA (interno del contenedor)
EXPOSE 3000

# Arrancar la app en el contenedor
# CMD ["node", "app.js"]
CMD ["npm", "start"]


