CREATE SCHEMA stomatolog;

CREATE TABLE stomatolog.pracownicy(
ID_Pracownika varchar(7) unique not null PRIMARY KEY,
Imie_Pracownika varchar(20),
Nazwisko_Pracownika varchar(30)
);

INSERT INTO stomatolog.pracownicy values
('S1011','Maria','Nowak'),
('S1024','Jan','Kowalski'),
('S1034','Marek','Potocki'),
('S1045','Anna','Jabłoński');

CREATE TABLE stomatolog.pacjenci(
ID_Pacjenta varchar(10) unique not null PRIMARY KEY,
Imie_Pacjenta varchar(20),
Nazwisko_Pacjenta varchar(30)
);

INSERT INTO stomatolog.pacjenci values
('P100','Anna','Jeleń'),
('P105','Jarosław','Nicpoń'),
('P108','Joanna','Nosek'),
('P120','Jan','Kałuża'),
('P123','Olga','Nowacka'),
('P130','Jerzy','Lis');

CREATE TABLE stomatolog.zabiegi(
ID_Zabiegu varchar(7) unique not null PRIMARY KEY,
Nazwa_Zabiegu varchar(20)
);

INSERT INTO stomatolog.zabiegi values
('Z496','Lakowanie'),
('Z500','Borowanie'),
('Z503','Usuwanie kamienia');

CREATE TABLE stomatolog.wizyty(
ID_Wizyty int unique not null PRIMARY KEY,
Data date,
Godzina time,
ID_Pacjenta varchar(10)not null REFERENCES stomatolog.pacjenci(ID_Pacjenta),
ID_Pracownika varchar(7) not null REFERENCES stomatolog.pracownicy(ID_Pracownika),
ID_Zabiegu varchar(7)not null REFERENCES stomatolog.zabiegi(ID_Zabiegu)
);

INSERT INTO stomatolog.wizyty values
(1,'2020-03-12','10:00','P100','S1011','Z500'),
(2,'2020-03-12','13:00','P105','S1011','Z496'),
(3,'2020-03-14','10:00','P108','S1011','Z500'),
(4,'2020-03-16','17:00','P108','S1024','Z503'),
(5,'2020-03-18','09:00','P120','S1045','Z500'),
(6,'2020-03-20','08:00','P130','S1034','Z496'),
(7,'2020-03-12','15:00','P123','S1034','Z503');
