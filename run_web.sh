#!/bin/bash

# Mettre à jour les listes de paquets
echo "Mise à jour des listes de paquets..."
apt-get update

# Installer les dépendances système nécessaires
echo "Installation des dépendances système..."
apt-get install -y \
    libmariadb-dev \
    pkg-config \
    gcc \
    g++ \
    make \

# Installation lib Python
pip install django
pip install mysqlclient
pip install django-cors-headers
pip install collectstatic
pip install -r /app/requirements.txt

while true
do
    echo "Lancement du serveur web..."
    python /app/manage.py collectstatic --noinput
    python /app/manage.py makemigrations main --settings=app_web_django.settings_web
    python /app/manage.py migrate main --settings=app_web_django.settings_web
    python /app/manage.py runserver 0.0.0.0:8800 --settings=app_web_django.settings_web
    echo "Le serveur web a crashé. Redémarrage dans 30 secondes..."
    sleep 30
done
