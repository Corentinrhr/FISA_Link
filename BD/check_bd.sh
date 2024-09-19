#!/bin/bash

# Commande pour vérifier la connexion à MariaDB
mysqladmin ping -h 127.0.0.1 -u root -pFISA_hcajbjaibh672983 > /dev/null 2>&1

# Vérifier le code de retour de la commande
if [ $? -eq 0 ]; then
  echo "MariaDB est prêt."
  exit 0
else
  echo "MariaDB n'est pas prêt."
  exit 1
fi
