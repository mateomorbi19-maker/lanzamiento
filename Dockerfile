# Landing estatica: nginx sirviendo un unico index.html autocontenido.
# No hay build step, no hay dependencias: se copia el archivo y listo.
FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html teotec-logo.png /usr/share/nginx/html/

# nginx escucha en 80. En Easypanel, el puerto del servicio tiene que ser 80.
EXPOSE 80
