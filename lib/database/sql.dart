import 'package:chat/database/sql_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;

Future<void> create(sql.Database db) async {
  await db.execute("""CREATE TABLE IF NOT EXISTS questions (
  questions_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  content VARCHAR(60) NOT NULL
)""");
  await db.execute("""CREATE TABLE IF NOT EXISTS user (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  username VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  phone_number VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL
)""");
  await db.execute("""CREATE TABLE IF NOT EXISTS hotel (
  hotel_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  nom_hotel VARCHAR(45) NOT NULL,
  ville_hotel VARCHAR(45) NOT NULL,
  lieu_hotel VARCHAR(45) NOT NULL,
  num_service_hotel INT NULL
)""");
  await db.execute("""CREATE TABLE IF NOT EXISTS agence (
  agence_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  nom_agence VARCHAR(50) NOT NULL,
  ville_agence VARCHAR(50) NOT NULL,
  num_service_agence INTEGER NOT NULL,
  moyen_transport TEXT CHECK(
    moyen_transport IN ('Bus', 'Train')
  ) NOT NULL DEFAULT 'Bus',
  lieu_agence VARCHAR(40) NOT NULL
)""");
  await db.execute("""CREATE TABLE IF NOT EXISTS responses (
  responses_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  hotel_id INTEGER NOT NULL,
  agence_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  moyen_transport TEXT CHECK(
    moyen_transport IN ('Bus', 'Train', 'Bus et Train')
  ) NOT NULL DEFAULT 'Bus',
  type_voyage TEXT CHECK(
    type_voyage IN ('Voyage Affaire', 'Voyage Sejour')
  ) NOT NULL DEFAULT 'Voyage Sejour',
  departure_agency TEXT CHECK(
    departure_agency IN (
      "Douala",
      "Yaounde",
      "Bafoussam",
      "Buea",
      "Kribi"
    )
  ),
  arrival_agency TEXT CHECK(
    arrival_agency IN (
      "Douala",
      "Yaounde",
      "Bafoussam",
      "Buea",
      "Kribi"
    )
  ),
  reservation BOOLEAN NOT NULL DEFAULT 0,
  FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
  FOREIGN KEY (agence_id) REFERENCES agence(agence_id)
)""");
  await db.execute("""CREATE TABLE IF NOT EXISTS synthese (
  synthese_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  responses_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (responses_id) REFERENCES respon ses(responses_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
)""");
}

Future<void> insert(sql.Database db) async {
  await db.transaction((txn) async {
    int questions = await txn.rawInsert("""INSERT INTO questions (content)
VALUES ('Quel type de voyage souhaitez-vous effectuer ?'),
  ('Quel est votre ville de depart ?'),
  ('Dans quelle ville desirez-vous aller ?'),
  (
    'Quel moyen de transport souhaiteriez-vous utiliser pour vous deplacer ?'
  ),
  ('Par quelle agence voulez-vous vous deplacer ?'),
  ('voici le lieu où se situe votre agence'),
  ('Aimeriez-vous reserver votre billet ?'),
  ('Voici un contact qui vous aidera à le faire :'),
  (
    'Où souhaitez-vous loger une fois que vous serez arrivé à destination ?'
  ),
  ('voici le lieu ou se situe votre hotel'),
  ('Aimeriez-vous reserver votre logement ?'),
  (
    'Voici un contact qui vous aidera a reserver votre logement :'
  ),
  (
    'Nous allons vous envoyer un resume de vos reponses'
  )""");
    // print(questions);
    int agence = await txn.rawInsert("""INSERT INTO agence (
    nom_agence,
    ville_agence,
    lieu_agence,
    num_service_agence,
    moyen_transport
  )
VALUES (
    'Amour Mezam',
    'Yaounde',
    'Biym Assi',
    678330932,
    'Bus'
  ),
  (
    'Amour Mezam',
    'Douala',
    'Bepanda',
    670521889,
    'Bus'
  ),
  (
    'Amour Mezam',
    'Bafoussam',
    'Entree ville',
    657009574,
    'Bus'
  ),
  (
    'Buca Voyage',
    'Douala',
    'Mboppi',
    699387609,
    'Bus'
  ),
  (
    'Buca Voyage',
    'Yaounde',
    'Mvan',
    695463975,
    'Bus'
  ),
  (
    'Etoile Star',
    'Douala',
    'Bonaberi',
    651146845,
    'Bus'
  ),
  (
    'Etoile Star',
    'Yaounde',
    'Biyem Assi',
    699189635,
    'Bus'
  ),
  (
    'Etoile Star',
    'Bafousam',
    'Marche',
    651146845,
    'Bus'
  ),
  (
    'Finex Voyage',
    'Yaounde',
    'Mvan',
    696943131,
    'Bus'
  ),
  (
    'Finex Voyage',
    'Douala',
    'Akwa',
    657867519,
    'Bus'
  ),
  (
    'General Express',
    'Yaounde',
    'Mvan',
    691629307,
    'Bus'
  ),
  (
    'General Express',
    'Yaounde',
    'Biyem-assi',
    655520708,
    'Bus'
  ),
  (
    'General Express',
    'Yaonde',
    'Tongolo',
    655530253,
    'Bus'
  ),
  (
    'General Express',
    'Bafoussam',
    'Entree Bafoussam',
    651311821,
    'Bus'
  ),
  (
    'General Express',
    'Douala',
    'Mboppi',
    691630293,
    'Bus'
  ),
  (
    'General Express',
    'Douala',
    'Bepanda',
    690614436,
    'Bus'
  ),
  (
    'Global Voyage',
    'Douala',
    'Mboppi',
    658595989,
    'Bus'
  ),
  (
    'Global Voyage',
    'Yaounde',
    'Mvan',
    680896075,
    'Bus'
  ),
  (
    'Global Voyage',
    'Bafoussam',
    'bafoussam',
    658588383,
    'Bus'
  ),
  (
    'Musango Voyage',
    'Yaounde',
    'Mvan',
    657845654,
    'Bus'
  ),
  (
    'Musango Voyage',
    'Buea',
    'buea',
    671162611,
    'Bus'
  ),
  (
    'Musango Voyage',
    'Douala',
    'Bonaberi',
    673000800,
    'Bus'
  ),
  (
    'Princesse Voyage',
    'Douala',
    'Mboppi',
    690529802,
    'Bus'
  ),
  (
    'Princesse Voyage',
    'Yaounde',
    'Mvan',
    695583556,
    'Bus'
  ),
  (
    'Princesse Voyage',
    'Kribi',
    'kribi',
    690029412,
    'Bus'
  ),
  (
    'Real Express',
    'Yaounde',
    'biyem Assi',
    679250384,
    'Bus'
  ),
  (
    'Real Express',
    'Douala',
    'Bepanda',
    690614456,
    'Bus'
  ),
  (
    'Touristique Express',
    'Yaounde',
    'Etoameki',
    698985555,
    'Bus'
  ),
  (
    'Touristique Express',
    'Douala',
    'Ndoogsimi',
    692213289,
    'Bus'
  ),
  (
    'Touristique Express',
    'Kribi',
    'Kribi',
    692982465,
    'Bus'
  ),
  ('Transcam ', 'Douala', 'Bessengue', 262, 'Train'),
  ('Transcam ', 'Yaounde', 'Fouda', 662, 'Train'),
  ('Trans_Oust', 'Douala', 'Ndokoti', 74, 'Train')""");
    print(agence);
    int hotel = await txn.rawInsert("""INSERT INTO hotel(
    nom_hotel,
    ville_hotel,
    lieu_hotel,
    num_service_hotel
  )
VALUES (
    'Best Wester Plus Soaho',
    'Douala',
    '005602 Douala',
    233506500
  ),
  (
    'Double twins hotel',
    'Yaounde',
    'nkoldongo',
    692220335
  ),
  ('Hilton', 'Yaounde', 'bd du 20 Mai', 222233646),
  (
    'Hotel Akwa palace',
    'Douala',
    'bd de la liberte',
    233422601
  ),
  (
    'Hotel Altitel',
    'Bafoussam',
    'College Tankou',
    233445111
  ),
  ('Hotel du Phare', 'Kribi', 'WWQ3', 675640464),
  ('Hotel la Falaise', 'Douala', 'Akwa', 233432822),
  (
    'Hotel Lomba',
    'Kribi',
    'B.P305 kribi',
    699912923
  ),
  (
    'Hotel Residence',
    'Kribi',
    'Lycee Technque de Ng',
    694186696
  ),
  (
    'Indra hotel',
    'Yaounde',
    'carrefour BASTOS',
    222205350
  ),
  (
    'Kristal palace ',
    'Douala',
    'B.P3633',
    233506800
  ),
  ('La Villa de Kribi', 'Kribi', 'WWR6', 690108059),
  (
    'Platinium Lounge hotel',
    'Douala',
    '6FPF3PAV',
    677589240
  ),
  (
    'Residence Sare',
    'Bafoussam',
    'rte Bafoussam',
    697636133
  ),
  ('Voak Home', 'douala', 'Fun Center', 691971781),
  (
    'WDC Aparthotel',
    'Bua',
    'mil 16 Bollifana',
    683708350
  ),
  (
    'Zingana Hotel',
    'Bafoussam',
    'Bafoussam II',
    698179638
  )""");
    // print(hotel);
  });
}

void close(sql.Database db) async {
  final db = await SQLHelper.db();
  await sql.deleteDatabase('dbtech.db');
}
