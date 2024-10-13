# Étape 1 : Construction de l'application
FROM node:14 AS build


# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de configuration de npm
COPY package.json package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier tout le reste des fichiers de l'application
COPY . .

RUN npm run build

# Lancer la construction de l'application

# Étape 2 : Préparation de l'application dans Nginx
FROM nginx:alpine

# Copier les fichiers construits depuis l'étape précédente vers Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80
