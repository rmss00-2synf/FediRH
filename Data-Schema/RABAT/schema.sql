-- Création de la table departements
CREATE TABLE departements
(
    id_departement  NUMBER PRIMARY KEY,
    nom_departement VARCHAR2(100) NOT NULL
);

CREATE TABLE employes
(
    id_employe     NUMBER PRIMARY KEY,
    nom            VARCHAR2(50) NOT NULL,
    prenom         VARCHAR2(50) NOT NULL,
    date_embauche  DATE NOT NULL,
    poste          VARCHAR2(50) NOT NULL,
    id_departement NUMBER,
    local          VARCHAR2(50) DEFAULT 'Rabat' NOT NULL,
    CONSTRAINT fk_departement FOREIGN KEY (id_departement) REFERENCES departements (id_departement)
);

CREATE TABLE conges
(
    id_type_conge NUMBER PRIMARY KEY,
    nom_conge     VARCHAR2(50) NOT NULL,
    description   VARCHAR2(255)
);

CREATE TABLE absences
(
    id_absence    NUMBER PRIMARY KEY,
    id_employe    NUMBER,
    date_debut    DATE NOT NULL,
    date_fin      DATE NOT NULL,
    motif         VARCHAR2(100),
    type_absence  VARCHAR2(50) NOT NULL,
    id_type_conge NUMBER,
    CONSTRAINT fk_employe FOREIGN KEY (id_employe) REFERENCES employes (id_employe),
    CONSTRAINT fk_type_conge FOREIGN KEY (id_type_conge) REFERENCES conges (id_type_conge)
);


CREATE TABLE performances
(
    id_performance   NUMBER PRIMARY KEY,
    id_employe       NUMBER,
    date_realisation DATE NOT NULL,
    montant_vente    NUMBER,
    commentaire      VARCHAR2(255),
    CONSTRAINT fk_performance_employe FOREIGN KEY (id_employe) REFERENCES employes (id_employe)
);

CREATE TABLE contrats
(
    id_contrat   NUMBER PRIMARY KEY,
    type_contrat VARCHAR2(50) NOT NULL,
    duree        NUMBER,
    conditions   VARCHAR2(255)
);

CREATE TABLE employes_contrats
(
    id_employe NUMBER,
    id_contrat NUMBER,
    date_debut DATE NOT NULL,
    date_fin   DATE,
    PRIMARY KEY (id_employe, id_contrat),
    CONSTRAINT fk_employes FOREIGN KEY (id_employe) REFERENCES employes (id_employe),
    CONSTRAINT fk_contrats FOREIGN KEY (id_contrat) REFERENCES contrats (id_contrat)
);





