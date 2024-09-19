CREATE TABLE students (
    id INT(11) NOT NULL AUTO_INCREMENT,    
    first_name VARCHAR(30) NOT NULL,    
    last_name VARCHAR(150) NOT NULL,  
    email_tsp VARCHAR(254),
    PRIMARY KEY (id)  
);

CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT, 
    password VARCHAR(128) NOT NULL, 
    email_perso VARCHAR(254), 
    is_active TINYINT(1) DEFAULT 1, 
    is_superuser TINYINT(1) DEFAULT 0,
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP,
    student_id INT(11), 
    PRIMARY KEY (id), 
    FOREIGN KEY (student_id) REFERENCES students(id) 
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
    pizza VARCHAR(255),
    FOREIGN KEY (id_student) REFERENCES students(id)
);
