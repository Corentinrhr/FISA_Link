CREATE TABLE fisa_years (
    year INT NOT NULL PRIMARY KEY,
    nom_promotion VARCHAR(255) NOT NULL
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email_tsp VARCHAR(254),
    fisa_year_id INT,
    FOREIGN KEY (fisa_year_id) REFERENCES fisa_years(year)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    email_perso VARCHAR(254),
    is_active TINYINT(1) DEFAULT 1,
    is_superuser TINYINT(1) DEFAULT 0,
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE data_link (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fisa_year_id INT,
    type VARCHAR(100) NOT NULL,
    link TEXT NOT NULL,
    title VARCHAR(255) NOT NULL,
    `desc` TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fisa_year_id) REFERENCES fisa_years(year)
);

CREATE TABLE SIF (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    bungalow INT,
    pizza VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES students(id)
);
