# 3. Créer une base de données « RNE »

CREATE DATABASE IF NOT EXISTS RNE;

/*
4. Y créer les tables destinées à accueillir les six fichiers cités plus haut. 
A vous de bien choisir la longueur des champs et les types adéquate. 
Utilisez pour noms de colonnes ceux renvoyer par r_names(). 
Le nom des tables doit être :
o elus
o population (La colonne population doit être en numérique) 
o nuancier
o villes
o categorie (Les colonnes doivent être numérique)
o departements.
*/

USE RNE
;

CREATE TABLE elus (
code_insee VARCHAR(99) COMMENT "code_insee"
,mode_de_scrutin VARCHAR(50) COMMENT "Mode_de_scrutin"
,numliste INT(2) COMMENT "numliste"
,code_nuance_de_la_liste VARCHAR(9) COMMENT "code_nuance_de_la_liste"
,numero_du_candidat_dans_la_liste INT(9) COMMENT "Numéro du numero_du_candidat_dans_la_liste"
,tour INT(9) COMMENT "Tour"
,nom VARCHAR(99) COMMENT "Nom"
,prenom VARCHAR(99) COMMENT "Prenom"
,sexe VARCHAR(9) COMMENT "Sexe"
,Date_de_naissance DATETIME COMMENT "Date de naissance"
,code_profession INT(9) COMMENT "Code profession"
,libelle_profession VARCHAR(99) COMMENT "Libellé profession"
,nationalite VARCHAR(9) COMMENT "Nationalité"
)
;

CREATE TABLE nuancier (
code VARCHAR(9) COMMENT "code"
,libelle VARCHAR(99) COMMENT "libelle"
,ordre INT(9) COMMENT "ordre"
,definition_ VARCHAR(255) COMMENT "definition"
)
;

CREATE TABLE population (
Code_insee VARCHAR(99) COMMENT "code_insee"
,Population_legale INT(99) COMMENT "Population_legale"
)
;

CREATE TABLE villes (
id INT(9) COMMENT "id"
,departement_code VARCHAR(99) COMMENT "departement_code"
,code_insee VARCHAR(99) COMMENT "code_insee"
,zip_code INT(9) COMMENT "zip_code"
,name VARCHAR(99) COMMENT "name"
)
;

CREATE TABLE categorie (
Code VARCHAR(99) COMMENT "Code"
,Nb_d_emplois INT(9) COMMENT "Nombre d'emploi"
,Artisans_commerçants_chefs_d_entreprise INT(9) COMMENT "artisant commercant chef dentreprise"
,Cadres_et_professions_intellectuelles_superieures INT(9) COMMENT "cadre et profession"
,Professions_intermedaires INT(9) COMMENT "prefession intermédiaire"
,Employes INT(9) COMMENT "Employe"
,Ouvriers INT(9) COMMENT "Ouvrier"
)
;

CREATE TABLE departements (
id INT(9) COMMENT "identifiant"
,region_code varchar(99) COMMENT "artisant commercant chef dentreprise"
,code varchar(99) COMMENT "cadre et profession"
,name VARCHAR(99) COMMENT "prefession intermédiaire"
,nom_normalise VARCHAR(99) COMMENT "Employe"
)
;

/*
5. Ecrire la requête qui va créer un nouvelle utilisateur MySQL « RNE_user » 
avec pour mot de passe « RNE_pasword » et lui accorder tous les droits sur la base RNE. 
Utiliser cette utilisateur pour la suite.
*/

CREATE USER 'RNE_user'@'localhost' IDENTIFIED BY 'RNE_pasword'
;
GRANT ALL PRIVILEGES ON * . * TO 'RNE_user'@'localhost'
;
FLUSH PRIVILEGES
;


