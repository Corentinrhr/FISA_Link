#!/bin/bash

# Chemin vers le répertoire du projet
PROJECT_DIR="/home/corentinrhr/Documents/FISA_Link/FISA Link"

# Nom de l'environnement virtuel
ENV_NAME="FISA_Link_py_env"

# Aller dans le répertoire du projet
cd "$PROJECT_DIR" || { echo "Répertoire du projet non trouvé"; exit 1; }

# Vérifier si l'environnement virtuel existe
if [ ! -d "$ENV_NAME" ]; then
    echo "Création de l'environnement virtuel..."
    python3 -m venv "$ENV_NAME"
fi

# Activer l'environnement virtuel
source "$ENV_NAME/bin/activate"

# Installer les dépendances
echo "Installation des dépendances..."
pip install --upgrade pip
pip install -r requirements.txt

# Boucle pour lancer le serveur web
while true
do
    echo "Lancement du serveur web..."
    python manage.py collectstatic --noinput
    python manage.py makemigrations main --settings=app_web_django.settings_web
    python manage.py migrate main --settings=app_web_django.settings_web
    python manage.py runserver 0.0.0.0:8800 --settings=app_web_django.settings_web
    echo "Le serveur web a crashé. Redémarrage dans 30 secondes..."
    sleep 30
done
