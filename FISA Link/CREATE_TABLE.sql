CREATE TABLE students (
    id INT(11) NOT NULL AUTO_INCREMENT,    -- Identifiant unique pour chaque étudiant
    first_name VARCHAR(30) NOT NULL,       -- Prénom de l'étudiant
    last_name VARCHAR(150) NOT NULL,       -- Nom de l'étudiant
    email_tsp VARCHAR(254),                -- Email spécifique à l'étudiant
    PRIMARY KEY (id)                       -- Clé primaire sur la colonne "id"
);

CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT,    -- Identifiant unique pour chaque utilisateur
    password VARCHAR(128) NOT NULL,        -- Mot de passe
    email_perso VARCHAR(254),              -- Email perso de l'utilisateur
    is_active TINYINT(1) DEFAULT 1,        -- Statut actif ou non
    is_superuser TINYINT(1) DEFAULT 0,     -- Statut superutilisateur
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP, -- Date d'inscription
    student_id INT(11),                    -- Référence vers l'étudiant (clé étrangère)
    PRIMARY KEY (id),                      -- Clé primaire sur la colonne "id"
    FOREIGN KEY (student_id) REFERENCES students(id)  -- Clé étrangère vers "students"
);

CREATE TABLE data_link (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fisa_year INT NOT NULL,
    type VARCHAR(100) NOT NULL,
    link TEXT NOT NULL,
    title VARCHAR(255) NOT NULL,
    `desc` TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SIF (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_student INT,
    bungalow INT,
    FOREIGN KEY (id_student) REFERENCES students(id)
);
