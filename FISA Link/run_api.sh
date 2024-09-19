#!/bin/bash

# Installation lib Python
source ~/.bashrc 
pip install django
pip install mysqlclient
pip install django-cors-headers
pip install collectstatic
pip install -r /app/requirements.txt

while true
do
    echo "Lancement du serveur API..."
    python ./manage.py collectstatic --noinput
    python ./manage.py makemigrations myapi --settings=app_web_django.settings_api
    python ./manage.py migrate myapi --settings=app_web_django.settings_api
    python ./manage.py runserver 0.0.0.0:8801 --settings=app_web_django.settings_api
    echo "Le serveur API a crashé. Redémarrage dans 30 secondes..."
    sleep 30
done
