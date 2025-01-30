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

/* Vue des employés avec leur département */
CREATE VIEW vue_employes_departements AS
SELECT e.id_employe, e.nom, e.prenom, e.poste, d.nom_departement
FROM employes e
JOIN departements d ON e.id_departement = d.id_departement;

/* Vue des absences des employés avec leur motif et type de congé */
CREATE VIEW vue_absences AS
SELECT a.id_absence, e.nom, e.prenom, a.date_debut, a.date_fin, a.motif, c.nom_conge
FROM absences a
JOIN employes e ON a.id_employe = e.id_employe
JOIN conges c ON a.id_type_conge = c.id_type_conge;

/* Vue des performances des employés*/
CREATE VIEW vue_performances AS
SELECT p.id_performance, e.nom, e.prenom, p.date_realisation, p.commentaire
FROM performances p
JOIN employes e ON p.id_employe = e.id_employe;

/* Vue des contrats des employés*/
CREATE VIEW vue_employes_contrats AS
SELECT ec.id_employe, e.nom, e.prenom, c.type_contrat, ec.date_debut, ec.date_fin
FROM employes_contrats ec
JOIN employes e ON ec.id_employe = e.id_employe
JOIN contrats c ON ec.id_contrat = c.id_contrat;