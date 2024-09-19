#!/bin/bash

# Installation lib Python
source ~/.bashrc 
pip install django
pip install mysql-connector-python
pip install mysqlclient
pip install django-cors-headers
pip install collectstatic
pip install -r /app/requirements.txt

while true
do
    echo "Lancement du serveur web..."
    python ./manage.py collectstatic --noinput
    python ./manage.py makemigrations main --settings=app_web_django.settings_web
    python ./manage.py migrate main --settings=app_web_django.settings_web
    python ./manage.py runserver 0.0.0.0:8800 --settings=app_web_django.settings_web
    echo "Le serveur web a crashé. Redémarrage dans 30 secondes..."
    sleep 30
done
