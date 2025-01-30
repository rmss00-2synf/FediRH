-- Création de la table departements
CREATE TABLE departements
(
    id_departement       INT PRIMARY KEY,
    nom_departement      VARCHAR(50),
    mail_chef_department VARCHAR(50) UNIQUE NOT NULL
);

-- Création de la table contrats
CREATE TABLE contrats
(
    id_contrats  VARCHAR(50) PRIMARY KEY,
    type_contrat VARCHAR(50),
    duree        DATE,
    conditions   VARCHAR(50)
);

-- Création de la table employes
CREATE TABLE employes
(
    id_employe     INT PRIMARY KEY,
    nom            VARCHAR(50),
    prenom         VARCHAR(50),
    date_embauche  DATE,
    responsabilite VARCHAR(50),
    date_naissance DATE,
    adresse        VARCHAR(50),
    mail           VARCHAR(50) UNIQUE NOT NULL,
    section        VARCHAR(50)        NOT NULL,
    id_departement INT REFERENCES departements (id_departement)
);

-- Création de la table absences
CREATE TABLE absences
(
    id_absence   INT PRIMARY KEY,
    motif        VARCHAR(50),
    date_debut   DATE,
    date_fin     DATE,
    type_absence VARCHAR(50),
    id_employe   INT REFERENCES employes (id_employe)
);

-- Création de la table performances
CREATE TABLE performances
(
    id_performance   INT PRIMARY KEY,
    date_realisation DATE,
    description      VARCHAR(50),
    id_employe       INT REFERENCES employes (id_employe)
);

-- Création de la table conges
CREATE TABLE conges
(
    id_type_conge INT PRIMARY KEY,
    nom           VARCHAR(50),
    description   VARCHAR(50),
    id_absence    INT REFERENCES absences (id_absence)
);

-- Création de la table employes_contrats (table de liaison pour la relation N:N)
CREATE TABLE employes_contrats
(
    id_employe  INT REFERENCES employes (id_employe),
    id_contrats VARCHAR(50) REFERENCES contrats (id_contrats),
    date_debut  DATE,
    date_fin    DATE,
    PRIMARY KEY (id_employe, id_contrats)
);

CREATE VIEW vue_employes_departements AS
SELECT e.id_employe, e.nom, e.prenom, e.section, d.nom_departement
FROM employes e
JOIN departements d ON e.id_departement = d.id_departement;

/* Vue des absences des employés avec leur motif et type de congé */
CREATE VIEW vue_absences AS
SELECT a.id_absence, e.nom, e.prenom, a.date_debut, a.date_fin, a.motif, c.nom AS type_conge
FROM absences a
JOIN employes e ON a.id_employe = e.id_employe
JOIN conges c ON a.id_absence = c.id_absence;

/* Vue des performances des employés*/
CREATE VIEW vue_performances AS
SELECT p.id_performance, e.nom, e.prenom, p.date_realisation, p.description
FROM performances p
JOIN employes e ON p.id_employe = e.id_employe;

/* Vue des contrats des employés*/
CREATE VIEW vue_employes_contrats AS
SELECT ec.id_employe, e.nom, e.prenom, c.type_contrat, ec.date_debut, ec.date_fin
FROM employes_contrats ec
JOIN employes e ON ec.id_employe = e.id_employe
JOIN contrats c ON ec.id_contrats = c.id_contrats;