FROM node:lts-alpine as build-stage

####################################################################
# Variables : récupère les variables de .gitlab-ci.yml
####################################################################

ARG BUILD_ENVIRONMENT=BUILD_ENVIRONMENT

####################################################################
# étape de build
####################################################################

# définit le dossier 'app' comme dossier de travail
WORKDIR /app

# copie 'package.json' et 'package-lock.json' (si disponible)
COPY package.json ./

# installe les dépendances du projet
RUN npm install

# copie les fichiers et dossiers du projet dans le dossier de travail (par exemple : le dossier 'app')
COPY . .

# construit l'app pour la production en la minifiant
RUN npm run build:$BUILD_ENVIRONMENT

# ####################################################################
# # étape de production
# ####################################################################
FROM nginx:stable-alpine as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf