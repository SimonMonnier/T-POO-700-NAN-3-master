# Mise en place du projet en local

## Installation de l'API
- Aller dans le dossier de l'api
```
$ cd ./api
```
- Installer les dépendences
```
$ mix deps get
```
- Lancer l'api
```
$ mix phx.server
```
- Mettre à jour la base de données
```
$ mix ecto.drop     # (si déjà existante)
$ mix ecto.create
$ mix ecto.migrate
```
---
## Installation du Front-end
- Aller dans le dossier de l'api
```
$ cd ./front
```
- Installer les dépendences
```
$ npm install
```
- Lancer l'application
```
$ npm run serve
```
