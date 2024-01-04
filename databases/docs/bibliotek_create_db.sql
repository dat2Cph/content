-- Table structure for table postnummer

DROP TABLE IF EXISTS postnummer;

CREATE TABLE postnummer (
  postnr INT NOT NULL PRIMARY KEY,
  by VARCHAR(45) DEFAULT NULL
);

-- Dumping data for table postnummer

INSERT INTO postnummer (postnr, by) VALUES (7490, 'Aulum'), (7500, 'Hobro'), (8520, 'Lystrup');

-- Table structure for table forfatter

DROP TABLE IF EXISTS forfatter;

CREATE TABLE forfatter (
  forfatter_id SERIAL PRIMARY KEY,
  navn VARCHAR(45) DEFAULT NULL
);

-- Dumping data for table forfatter

INSERT INTO forfatter (navn) VALUES ('Karen Blixen'), ('Johannes V. Jensen'), ('Jostein Gaader');

-- Table structure for table laaner

DROP TABLE IF EXISTS laaner;

CREATE TABLE laaner (
  laaner_id SERIAL PRIMARY KEY,
  navn VARCHAR(45) DEFAULT NULL,
  adresse VARCHAR(45) DEFAULT NULL,
  postnr INT DEFAULT NULL,
  CONSTRAINT fk_laaner_postnummer FOREIGN KEY (postnr) REFERENCES postnummer (postnr)
);

-- Dumping data for table laaner

INSERT INTO laaner (navn, adresse, postnr) VALUES ('Peter Jensen', 'Ringgaden 10', 7500), ('Mathilde Nielsen', 'Østervej 22', 7500), ('Mattias Bruun', 'Ellevang 12', 7490), ('Ole Jensen', 'Ahlgade 48', 7500);

-- Table structure for table bog

DROP TABLE IF EXISTS bog;

CREATE TABLE bog (
  bog_id SERIAL PRIMARY KEY,
  titel VARCHAR(45) DEFAULT NULL,
  udgivelsesaar INT DEFAULT NULL,
  forfatter_id INT DEFAULT NULL,
  CONSTRAINT fk_bog_forfatter1 FOREIGN KEY (forfatter_id) REFERENCES forfatter (forfatter_id)
);

-- Inserting data into table bog

INSERT INTO bog (titel, udgivelsesaar, forfatter_id) VALUES ('Den lange rejse', 1977, 2), ('Vintereventyr', 1964, 1), ('Sofies Verden for små filosoffer', 1981, 3);

-- Table structure for table bruger

DROP TABLE IF EXISTS bruger;

CREATE TABLE bruger (
  email VARCHAR(45) NOT NULL PRIMARY KEY,
  kodeord VARCHAR(45) NOT NULL,
  rolle VARCHAR(10) NOT NULL
);

-- Dumping data for table bruger

INSERT INTO bruger (email, kodeord, rolle) VALUES ('a@a.dk', '1234', 'laaner'), ('b@b.dk', '1234', 'admin');

-- Table structure for table udlan

DROP TABLE IF EXISTS udlan;

CREATE TABLE udlaan (
  bog_id INT NOT NULL,
  laaner_id INT NOT NULL,
  dato DATE DEFAULT NULL,
  PRIMARY KEY (bog_id, laaner_id),
  CONSTRAINT fk_udlaan_bog1 FOREIGN KEY (bog_id) REFERENCES bog (bog_id),
  CONSTRAINT fk_udlaan_laaner1 FOREIGN KEY (laaner_id) REFERENCES laaner (laaner_id)
);

-- Dumping data for table udlaan

INSERT INTO udlaan (bog_id, laaner_id, dato) VALUES (1, 1, '2000-11-21'), (1, 2, '2000-11-24'), (2, 1, '2000-11-21'), (2, 3, '2000-11-25'), (3, 1, '2000-11-21'), (3, 2, '2000-11-24');
