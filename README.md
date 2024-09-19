# FISA_Link
Site web django pour le projet "Architectures distribuées et application web" en FISA à TSP.

# Lancement du projet Django
`sudo docker-compose up --build --remove-orphans`

# Accéder au site web 
`http://localhost/`

# Essayer l'API du site web
`http://localhost/api/dashboard`
Note : Vous devriez avoir une erreur "Méthode non autorisée" en y accédant depuis un navigateur.

# Se connecter à la base de données
`mysql -u root -p mysql -h 127.0.0.1 -P 3306 -u root -pFISA_hcajbjaibh672983`

# Remplir la base de données
La base de données utilisée dans le site web :
`USE bd_django;`

Ajouter tout d'abord une année FISA :
`INSERT INTO fisa_years (year, nom_promotion) VALUES (2, 'Kilo'),(1, 'Lima'),(3, 'Juliet');`

Pour ajouter un étudiant pouvant se créer un compte sur le site web :
`INSERT INTO students (first_name, last_name, email_tsp, fisa_year) VALUES ('Corentin', 'R', 'corentin.r@tsp.com',2);`

Créer un compte depuis le site web (Les mots de passe sont hashés c'est pourquoi il faut créer un mot de passe directement sur ce lien ou insérer le hash du mot de passe dans la table "users").
`http://localhost/inscription`