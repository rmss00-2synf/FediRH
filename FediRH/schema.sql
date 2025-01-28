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