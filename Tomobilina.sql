CREATE DATABASE tomobilina;

\c tomobilina;


CREATE SEQUENCE seq_paysmarque;
CREATE SEQUENCE seq_marque;
CREATE SEQUENCE seq_categorie;
CREATE SEQUENCE seq_modele;
CREATE SEQUENCE seq_energie;
CREATE SEQUENCE seq_boite_vitesse;
CREATE SEQUENCE seq_couleur;
CREATE SEQUENCE seq_consommation;
CREATE SEQUENCE seq_equipement;
CREATE SEQUENCE seq_voiture;


CREATE TABLE paysmarque (
    idPays VARCHAR(15) DEFAULT 'PAYS'||nextval('seq_paysmarque') PRIMARY KEY,
    nomPays VARCHAR(100) NOT NULL
);

CREATE TABLE marque (
    idMarque VARCHAR(15) DEFAULT 'MRQ'||nextval('seq_marque') PRIMARY KEY,
    nomMarque VARCHAR(100) NOT NULL,
    idpays VARCHAR(15) REFERENCES paysmarque
);

CREATE TABLE categorie (
    idCategorie VARCHAR(15) DEFAULT 'CAT'||nextval('seq_categorie') PRIMARY KEY,
    nomCategorie VARCHAR(100) NOT NULL
);

CREATE TABLE modele (
    idModele VARCHAR(15) DEFAULT 'MOD'||nextval('seq_modele') PRIMARY KEY,
    idmarque VARCHAR(15) REFERENCES marque,
    idcategorie VARCHAR(15) REFERENCES categorie,
    nomModele VARCHAR(100) NOT NULL,
    annee INT NOT NULL,
    nbrPlaces INT NOT NULL,
    nbrPortes INT NOT NULL
);

CREATE TABLE energie (
    idEnergie VARCHAR(15) DEFAULT 'ENE'||nextval('seq_energie') PRIMARY KEY,
    nomEnergie VARCHAR(100) NOT NULL
);

CREATE TABLE boite_vitesse (
    idBoite_vitesse VARCHAR(15) DEFAULT 'BTV'||nextval('seq_boite_vitesse') PRIMARY KEY,
    nomBoite_vitesse VARCHAR(100) NOT NULL
);

CREATE TABLE couleurs (
    idCouleur VARCHAR(15) DEFAULT 'COL'||nextval('seq_couleur') PRIMARY KEY,
    nomCouleur VARCHAR(100) NOT NULL
);

CREATE TABLE equipement (
    idEquipement VARCHAR(15) DEFAULT 'EQP'||nextval('seq_equipement') PRIMARY KEY,  
    nomEquipement VARCHAR(100) NOT NULL
);

CREATE TABLE voiture (
    idVoiture VARCHAR(15) DEFAULT 'VTR'||nextval('seq_voiture') PRIMARY KEY,  
    idmodele VARCHAR(15) REFERENCES modele,
    kilometrage FLOAT,
    idenergie VARCHAR(15) REFERENCES energie,
    idboite_vitesse VARCHAR(15) REFERENCES boite_vitesse,
    idcouleur VARCHAR(15) REFERENCES couleurs,
    consommation FLOAT
);

CREATE TABLE equipementVoiture (
    idvoiture VARCHAR(15) REFERENCES voiture,
    idequipement VARCHAR(15) REFERENCES equipement
);