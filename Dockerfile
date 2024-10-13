# Utilise l'image de base Nginx
FROM nginx:alpine

# Copie le fichier index.html dans le répertoire par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Expose le port 80 pour accéder à l'application web
EXPOSE 80
