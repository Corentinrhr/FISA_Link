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

Ajouter des liens à présenter : 
`INSERT INTO data_link (fisa_year_id, type, link, title, `desc`, created_at) VALUES (0, 'WhatsApp', 'https://chat.whatsapp.com/EXnszNls8PN3ivAK2XTlmS', 'Whatsapp de l\'ASINT', 'Le groupe Whatsapp de l\'association sportive de TSP', '2024-09-12 13:16:56'),(0, 'Instagram', 'https://www.instagram.com/fipa_kilo?igsh=Nm8wZmZvN21lcGdn', 'Instagram FISA Kilo (2A)', 'Page Instagram des FISA Kilo. Abonnez-vous !', '2024-09-12 13:33:09'),(0, 'Web', 'https://ecampus.imtbs-tsp.eu/', 'Ecampus', 'Site web d\'accès à l\'espace personnel étudiant. Ici, vous pourrez consulter vos mails, accéder à Moodle, gérer vos impressions...', '2024-09-12 14:44:50');`


Pour ajouter un étudiant pouvant se créer un compte sur le site web :
`INSERT INTO students (first_name, last_name, email_tsp, fisa_year) VALUES ('Corentin', 'R', 'corentin.r@tsp.com',2);`

Créer un compte depuis le site web (Les mots de passe sont hashés c'est pourquoi il faut créer un mot de passe directement sur ce lien ou insérer le hash du mot de passe dans la table "users").
`http://localhost/inscription`
