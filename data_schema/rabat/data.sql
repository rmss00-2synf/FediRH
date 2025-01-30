-- Insertion dans la table departements
INSERT INTO
    departements (id_departement, nom_departement)
VALUES
    (1, 'Ressources Humaines');

INSERT INTO
    departements (id_departement, nom_departement)
VALUES
    (2, 'Ventes');

INSERT INTO
    departements (id_departement, nom_departement)
VALUES
    (3, 'Logistique');

INSERT INTO
    departements (id_departement, nom_departement)
VALUES
    (4, 'Informatique');

-- Insertion dans la table contrats
INSERT INTO
    contrats (id_contrat, type_contrat, duree, conditions)
VALUES
    (1, 'CDI', NULL, 'Contrat à durée indéterminée');

-- Insertion dans la table employes
INSERT INTO
    employes (
        id_employe,
        nom,
        prenom,
        date_embauche,
        poste,
        id_departement
    )
VALUES
    (
        101,
        'El Fassi',
        'Ahmed',
        TO_DATE('2015-03-12', 'YYYY-MM-DD'),
        'Manager',
        1
    );

INSERT INTO
    employes (
        id_employe,
        nom,
        prenom,
        date_embauche,
        poste,
        id_departement
    )
VALUES
    (
        102,
        'Bennani',
        'Fatima',
        TO_DATE('2018-06-01', 'YYYY-MM-DD'),
        'Responsable Ventes',
        2
    );

-- Insertion dans la table performances
INSERT INTO
    performances (
        id_performance,
        id_employe,
        date_realisation,
        montant_vente,
        commentaire
    )
VALUES
    (
        1,
        102,
        TO_DATE('2023-03-15', 'YYYY-MM-DD'),
        12000,
        'Performance exceptionnelle'
    );

-- Insertion dans la table conges
INSERT INTO
    conges (id_type_conge, nom_conge, description)
VALUES
    (1, 'Congé Annuel', 'Congé payé annuel');

-- Insertion dans la table employes_contrats
INSERT INTO
    employes_contrats (id_employe, id_contrat, date_debut, date_fin)
VALUES
    (101, 1, TO_DATE('2015-03-12', 'YYYY-MM-DD'), NULL);

-- Insertion dans la table absences
INSERT INTO
    absences (
        id_absence,
        id_employe,
        date_debut,
        date_fin,
        motif,
        type_absence,
        id_type_conge
    )
VALUES
    (
        1,
        101,
        TO_DATE('2023-03-01', 'YYYY-MM-DD'),
        TO_DATE('2023-03-05', 'YYYY-MM-DD'),
        'Congé annuel',
        'Congé',
        1
    );