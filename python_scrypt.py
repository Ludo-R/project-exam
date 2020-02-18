#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Feb 17 09:23:38 2020

@author: ludodata
"""
from re import findall
from sqlalchemy import create_engine
import pandas as pd
import pymysql
import time
"""
1. Ecrire une fonction python r_names() qui admet pour entrer une de ces chaînes de caractères et qui retourne une liste de nom de colonnes.
 Les espaces, les « ‘ » et les « . » doivent être remplacé par des « _ ».
 Les « é » et « è » doivent être remplacé par des « e ».
 Les « , », « ) » et « ( » doivent être supprimées.
"""

def r_names(x):
    x = x.replace(" ", "_")
    x = x.replace("'", "_")
    x = x.replace(".", "_")
    x = x.replace("é", "e")
    x = x.replace("è", "e")
    x = x.replace("(", "")
    x = x.replace(")", "")
    x = x.replace(",", "")
    y = x.split()
    return(y)

"""
2. Ecrire une fonction python parse_dates() qui admet pour entrer la liste renvoyer par r_names() et qui retourne une liste contenant seulement les noms de colonnes commençant par « Date ».
"""

def parses_dates(x):
    return [i for i in x if i.startswith('Date')]
    



"""
6. Les fichiers ayant la même structure, écrire une fonction chargement() pour alimenter la base « RNE » avec ces fichiers. Cette fonction utilisera les fonction r_names et parses_dates(). Elle aura pour entrer la chaîne de caractère contenant le nom des colonnes, le chemin d’accès vers le fichier et le nom de la table dans la quel écrire. Alimenter la base avec les fichiers.
"""
engine = create_engine("mysql+pymysql://RNE_user:RNE_pasword@localhost/RNE")

def chargement(x, link, table):
    y = r_names(x)
    dates = parses_dates(y)
    print("Lecture des données")
    start_time = time.time()
    df = pd.read_excel(link, skiprows = [0,1])
    df.columns = y
    df.parse_dates = dates
    print("Données lu")
    df.to_sql(table, con = engine, if_exists='append', index = False)
    return print("Temps d execution : %s secondes ---" % (time.time() - start_time))
    
    
             
#Elus municipaux              
a = "code (insee)	mode de scrutin	numliste	code (nuance de la liste)	numéro du candidat dans la liste	tour	nom	prénom	sexe	Date de naissance	code (profession)	libellé profession	nationalité"

#Nuancier politiques
b = "code	libellé	ordre	définition_"

#Villes
c = "id	departement_code	code_insee	zip_code	name"

#Catégorie
d = "Code	Nb d'emplois	Artisans, commerçants, chefs d'entreprise	Cadres et professions intellectuelles supérieures	Professions intermédaires	Employés	Ouvriers"

#Population
e = "Code insée	Population légale"

#Departement
f = "id	region_code	code	name	nom normalisé"

#Exercice 1
y = r_names(a)
print(y)
print("\n")

#Exercice 2
z = parses_dates(y)
print(z)
print("\n")

#Exercice 6

chargement(f, '/Users/ludodata/departments.xlsx', 'departements') 


