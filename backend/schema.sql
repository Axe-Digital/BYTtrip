DROP TABLE IF EXISTS AGENCE;
DROP TABLE IF EXISTS VILLE;
DROP TABLE IF EXISTS HOTEL;
DROP TABLE IF EXISTS LIEU;
DROP TABLE IF EXISTS HOTEL_LIEU;
DROP TABLE IF EXISTS AGENCE_LIEU;
DROP TABLE IF EXISTS QUESTION;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS TYPE_VOYAGE;
DROP TABLE IF EXISTS MOYEN_TRANSPORT;
DROP TABLE IF EXISTS RESERVATION;
DROP TABLE IF EXISTS AGENCE_VOYAGE;
DROP TABLE IF EXISTS HOTEL_VOYAGE;
DROP TABLE IF EXISTS QUESTIONS_REPONSES;







/*
CREATE TABLE AGENCE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom_agence TEXT NOT NULL
);


CREATE TABLE VILLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom_ville TEXT NOT NULL
);



CREATE TABLE HOTEL (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom_hotel TEXT NOT NULL
);

CREATE TABLE LIEU (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom_lieu TEXT NOT NULL,
    id_VILLE INTEGER,
    FOREIGN KEY(id_VILLE) REFERENCES VILLE(id)
);


CREATE TABLE HOTEL_LIEU (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_HOTEL INTEGER,
    id_LIEU INTEGER,
    num_service_hotel INTEGER NOT NULL,
    FOREIGN KEY(id_LIEU) REFERENCES LIEU(id),
    FOREIGN KEY(id_HOTEL) REFERENCES HOTEL(id)
);


CREATE TABLE AGENCE_LIEU (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_AGENCE INTEGER,
    id_LIEU INTEGER,
    num_service_agence INTEGER NOT NULL,
    FOREIGN KEY(id_LIEU) REFERENCES LIEU(id),
    FOREIGN KEY(id_AGENCE) REFERENCES AGENCE(id)
);

*/

CREATE TABLE AGENCE_VOYAGE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom_agence TEXT NOT NULL, 
    ville_agence TEXT NOT NULL, 
    lieu_agence  TEXT NOT NULL, 
    num_service_agence INTEGER,
    moyen_transport TEXT NOT NULL
);



CREATE TABLE HOTEL_VOYAGE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom_hotel TEXT NOT NULL, 
    ville_hotel TEXT NOT NULL, 
    lieu_hotel  TEXT NOT NULL, 
    num_service_hotel INTEGER
);




CREATE TABLE QUESTION (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    content TEXT NOT NULL
);



CREATE TABLE QUESTIONS_REPONSES (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_QUESTION INTEGER,
    id_REPONSES_CHOISIES INTEGER
);





CREATE TABLE USER (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number INTEGER,
    password TEXT NOT NULL
);

CREATE TABLE TYPE_VOYAGE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom TEXT NOT NULL
);

CREATE TABLE MOYEN_TRANSPORT (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nom TEXT NOT NULL
);

CREATE TABLE RESERVATION (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    content TEXT NOT NULL
);


/*
CREATE TABLE USER_TYPE_VOYAGE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_TYPE_VOYAGE INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_TYPE_VOYAGE) REFERENCES TYPE_VOYAGE(id)
);



CREATE TABLE USER_VILLE_DEPART (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_VILLE INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_VILLE) REFERENCES VILLE(id)
);


CREATE TABLE USER_VILLE_ARRIVEE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_VILLE INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_VILLE) REFERENCES VILLE(id)
);



CREATE TABLE USER_MOYEN_TRANSPORT (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_MOYEN_TRANSPORT INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_MOYEN_TRANSPORT) REFERENCES MOYEN_TRANSPORT(id)
);



CREATE TABLE USER_AGENCE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_AGENCE INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_AGENCE) REFERENCES AGENCE(id)
);



CREATE TABLE USER_RESERVATION (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_RESERVATION INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_RESERVATION) REFERENCES RESERVATION(id)
);




CREATE TABLE USER_AGENCE_LIEU (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_AGENCE_LIEU INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_AGENCE_LIEU) REFERENCES AGENCE_LIEU(id)
);



CREATE TABLE USER_HOTEL (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_HOTEL INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_HOTEL) REFERENCES HOTEL(id)
);






CREATE TABLE USER_HOTEL_LIEU (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_USER INTEGER,
    id_HOTEL_LIEU INTEGER,
    FOREIGN KEY(id_USER) REFERENCES USER(id),
    FOREIGN KEY(id_HOTEL_LIEU) REFERENCES HOTEL_LIEU(id)
);

/*









/*

INSERT INTO AGENCE (nom_agence) VALUES
    'Amour Mezam',
    'Buca Voyage',
    'Etoile Star',
    'Finex Voyage',
    'General Express',
    'Global Voyage',
    'Musango Voyage',
    'Princesse Voyage',
    'Real Express',
    'Touristique Express',
    'Trans-Cam',
    'Trans-Ouest';



INSERT INTO VILLE (nom_ville) VALUES
    ('Bafoussam'),
    ('Buea'),
    ('Douala'),
    ('Kribi'),
    ('Yaounde');


INSERT INTO HOTEL (nom_hotel) VALUES
    ('Best Wester Plus Soaho'),
    ('Double twins hotel'),
    ('Hilton'),
    ('Hotel Akwa palace'),
    ('Hotel Altitel'),
    ('Hotel la Falaise'),
    ('Indra hotel'),
    ('Kristal palace '),
    ('Platinium Lounge hotel'),
    ('Residence Sare'),
    ('Voak Home'),
    ('WDC Aparthotel'),
    ('Hotel du Phare'),
    ('Hotel Lomba'),
    ('Hotel Residence'),
    ('La Villa de Kribi'),
    ('Zingana Hotel');



INSERT INTO LIEU (nom_lieu, id_Ville) VALUES
    ('Akwa',3),
    ('Bepanda',3),
    ('Biyem Assi',5),
    ('Bonaberi',3),
    ('Entree ville Bafoussam',1),
    ('Mboppi',3),
    ('Mvan',5),
    ('Tongolo',5),
    ('Etoameki',5),
    ('Ndogsibi',3),
    ('Buea',2),
    ('Marche Bafoussam',1),
    ('005602 Douala',3),
    ('nkoldongo',5),
    ('bd du 20 Mai',5),
    ('bd de la liberte',3),
    ('College Tankou', 1),
    ('carrefour BASTOS',5),
    ('B.P3633',3),
    ('6FPF3PAV', 3),
    ('rte Bafoussam', 1),
    ('Fun Center',3),
    ('mil 16 Bollifana',2),
    ('Bafoussam II',1),
    ('WWR6',4),
    ('Lycee Technique de Ng',4),
    ('B.P305 kribi',4),
    ('WWQ3',4),
    ('Kribi',4),
    ('Bessengue',3),
    ('Ndokoti',3),
    ('Fouda',5);


INSERT INTO HOTEL_LIEU (id_HOTEL, id_LIEU, num_service_hotel) VALUES
    (1,13, 233506500),
    (2,14, 692220335),
    (3,15, 222233646),
    (4, 16, 233422601),
    (5, 17, 233445111),
    (6, 1, 233432822),
    (7, 18, 222205350),
    (8, 19, 233506800),
    (9, 20, 677589240),
    (10, 21, 697636133),
    (11, 22, 691971781),
    (12, 23, 683708350),
    (17, 24, 698179638),
    (13,28, 675640464),
    (14,27, 699912923),
    (15, 26, 694186696),
    (16, 25, 690108059);  


INSERT into AGENCE_LIEU (id_AGENCE, id_LIEU, num_service_agence) VALUES
        (1, 3, 678330932),
        (1, 2, 670521889),
        (1, 5, 657009574),
        (2, 6, 699387609),
        (2, 7, 695463975),
        (3, 4, 651146845),
        (3, 3, 699189635),
        (3, 12, 651146845),
        (4, 7, 696943131),
        (4, 1, 657867519),
        (5, 7, 691629307),
        (5, 3, 655520708),
        (5, 8, 655530253),
        (5, 5, 651311821),
        (5, 6, 691630293),
        (5, 2, 690614436),
        (6, 6, 658595989),
        (6, 7, 680896075),
        (6, 5, 658588383),
        (7, 7, 657845654),
        (7, 11, 671162611),
        (7, 4, 673000800),
        (8, 6, 690529802),
        (8, 7, 695583556),
        (8, 29, 690029412),
        (9, 3, 679250384),
        (9, 2, 690614456),
        (10, 9, 698985555),
        (10, 10, 692213289),
        (10, 29, 692982465),
        (11, 30, 262),
        (11, 32, 662),
        (12, 31, 74);
        
 */  


INSERT INTO QUESTION (content) VALUES 
        ('Quel type de voyage souhaitez-vous effectuer ?'),
        ('Quel est votre ville de depart ?'),
        ('Dans quelle ville desirez-vous aller ?'),
        ('Quel moyen de transport souhaiteriez-vous utiliser pour vous deplacer ?'),
        ('Par quelle agence voulez-vous vous deplacer ?'),
        ('voici le lieu où se situe votre agence'),
        ('Aimeriez-vous reserver votre billet ?'),
        ('Voici un contact qui vous aidera à le faire :'),
        ('Où souhaitez-vous loger une fois que vous serez arrivé à destination ?'),
        ('voici le lieu ou se situe votre hotel'),
        ('Aimeriez-vous reserver votre logement ?'),
        ('Voici un contact qui vous aidera a reserver votre logement :'),
        ('Nous allons vous envoyer un resume de vos reponses');

INSERT INTO TYPE_VOYAGE (nom) VALUES
        ('Voyage Affaire'),
        ('Voyage Sejour');

INSERT INTO MOYEN_TRANSPORT (nom) VALUES
        ('Bus'),
        ('Train');


INSERT INTO RESERVATION ('content') VALUES
        ('Oui'),
        ('Non');

INSERT INTO AGENCE_VOYAGE (nom_agence, ville_agence, lieu_agence, num_service_agence, moyen_transport) VALUES
        ('Amour Mezam', 'Yaounde', 'Biym Assi', 678330932, 'Bus'),
        ('Amour Mezam', 'Douala', 'Bepanda', 670521889, 'Bus' ),
        ('Amour Mezam', 'Bafoussam', 'Entree ville', 657009574, 'Bus'),
        ('Buca Voyage', 'Douala', 'Mboppi', 699387609, 'Bus'),
        ('Buca Voyage', 'Yaounde', 'Mvan', 695463975, 'Bus'),
        ('Etoile Star', 'Douala', 'Bonaberi', 651146845, 'Bus'),
        ('Etoile Star', 'Yaounde', 'Biyem Assi', 699189635, 'Bus'),
        ('Etoile Star', 'Bafousam', 'Marche', 651146845, 'Bus'),
        ('Finex Voyage', 'Yaounde', 'Mvan', 696943131, 'Bus'),
        ('Finex Voyage', 'Douala', 'Akwa', 657867519, 'Bus'),
        ('General Express', 'Yaounde', 'Mvan', 691629307, 'Bus'),
        ('General Express', 'Yaounde', 'Biyem-assi', 655520708, 'Bus'),
        ('General Express', 'Yaonde', 'Tongolo', 655530253, 'Bus'),
        ('General Express', 'Bafoussam', 'Entree Bafoussam', 651311821, 'Bus'),
        ('General Express', 'Douala', 'Mboppi', 691630293, 'Bus'),
        ('General Express', 'Douala', 'Bepanda', 690614436, 'Bus'),
        ('Global Voyage', 'Douala', 'Mboppi', 658595989, 'Bus'),
        ('Global Voyage', 'Yaounde', 'Mvan', 680896075, 'Bus'),
        ('Global Voyage', 'Bafoussam', 'bafoussam', 658588383, 'Bus'),
        ('Musango Voyage', 'Yaounde', 'Mvan', 657845654, 'Bus'),
        ('Musango Voyage', 'Buea', 'buea', 671162611, 'Bus'),
        ('Musango Voyage', 'Douala', 'Bonaberi', 673000800, 'Bus'),
        ('Princesse Voyage', 'Douala', 'Mboppi', 690529802, 'Bus'),
        ('Princesse Voyage', 'Yaounde', 'Mvan', 695583556, 'Bus'),
        ('Princesse Voyage', 'Kribi', 'kribi', 690029412, 'Bus'),
        ('Real Express', 'Yaounde', 'biyem Assi', 679250384, 'Bus'),
        ('Real Express', 'Douala', 'Bepanda', 690614456, 'Bus'),
        ('Touristique Express', 'Yaounde', 'Etoameki', 698985555, 'Bus'),
        ('Touristique Express', 'Douala', 'Ndoogsimi', 692213289, 'Bus'),
        ('Touristique Express', 'Kribi', 'Kribi', 692982465, 'Bus'),
        ('Transcam ', 'Douala','Bessengue', 262, 'Train'),
        ('Transcam ', 'Yaounde', 'Fouda', 662, 'Train'),
        ('Trans_Oust', 'Douala','Ndokoti', 74, 'Train');



 INSERT INTO HOTEL_VOYAGE (nom_hotel, ville_hotel, lieu_hotel, num_service_hotel) VALUES
        ('Best Wester Plus Soaho', 'Douala', '005602 Douala', 233506500),
        ('Double twins hotel', 'Yaounde', 'nkoldongo', 692220335),
        ('Hilton', 'Yaounde', 'bd du 20 Mai', 222233646),
        ('Hotel Akwa palace', 'Douala', 'bd de la liberte', 233422601),
        ('Hotel Altitel', 'Bafoussam', 'College Tankou', 233445111),
        ('Hotel du Phare', 'Kribi', 'WWQ3', 675640464),
        ('Hotel la Falaise', 'Douala', 'Akwa', 233432822),
        ('Hotel Lomba', 'Kribi', 'B.P305 kribi', 699912923),
        ('Hotel Residence', 'Kribi', 'Lycee Technque de Ng', 694186696),
        ('Indra hotel', 'Yaounde', 'carrefour BASTOS', 222205350),
        ('Kristal palace ', 'Douala', 'B.P3633', 233506800),
        ('La Villa de Kribi', 'Kribi', 'WWR6', 690108059),
        ('Platinium Lounge hotel', 'Douala', '6FPF3PAV', 677589240),
        ('Residence Sare', 'Bafoussam', 'rte Bafoussam', 697636133),
        ('Voak Home', 'douala', 'Fun Center', 691971781),
        ('WDC Aparthotel', 'Bua', 'mil 16 Bollifana', 683708350),
        ('Zingana Hotel', 'Bafoussam', 'Bafoussam II', 698179638);     










        