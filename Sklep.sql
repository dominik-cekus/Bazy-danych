CREATE SCHEMA produkty;
CREATE SCHEMA dostawcy;
CREATE SCHEMA dostawy;

CREATE TABLE produkty.produkty (
Id_Produktu varchar(3) unique not null PRIMARY KEY,
Nazwa_Produktu varchar(30),
Cena_Brutto float REFERENCES produkty.cena(Cena_Brutto)
);

CREATE TABLE produkty.cena (
Cena_Brutto float not null PRIMARY KEY,
Cena_Netto float
);

CREATE TABLE dostawcy.dostawcy (
	Id_Dostawcy varchar(3) unique not null PRIMARY KEY,
	Dostawca varchar(30),
	Kod_Dostawcy varchar(6) REFERENCES dostawcy.miejscowosc(Kod_Dostawcy),
	Ulica varchar(30),
	NrBudynku varchar(10)
);

CREATE TABLE dostawcy.miejscowosc(
	Kod_Dostawcy varchar(6) not null unique PRIMARY KEY,
	Miejscowosc varchar(30)
);

CREATE TABLE dostawy.dostawy(
	Id_Dostawy int unique PRIMARY KEY,
	Id_Produktu varchar(3) REFERENCES produkty.produkty(Id_Produktu),
	Id_Dostawcy varchar(3) REFERENCES dostawcy.dostawcy(Id_Dostawcy)
);

INSERT INTO produkty.produkty values 
('MN','Makaron Nitki',150),
('KP','Keczup pikantny',220),
('SP','Sos pomidorowy',110);

INSERT INTO produkty.cena values 
(150,130),
(220,200),
(110,89);

INSERT INTO dostawcy.miejscowosc values
('31-435','Kraków'),
('31-342','Kraków'),
('04-242','Lublin'),
('30-243','Tarnów'),
('35-434','Nowy Targ');

INSERT INTO dostawcy.dostawcy values 
('MP','Makarony Polskie','31-435','Turystyczna','40'),
('PP','Polskie przetwory','31-342','Wojska Polskiego','44a'),
('LM','Lubelski Makaron','04-242','Piłsudskiego','332a'),
('PPm','Przetwory pomidorowe','30-243','Rolnicza','22/4'),
('MS','Małopolskie Smaki','35-434','Mickiewicza','223/77');

INSERT INTO dostawy.dostawy values
(1,'MN','MP'),
(2,'KP','PP'),
(3,'SP','PP'),
(4,'MN','LM'),
(5,'KP','PPm'),
(6,'SP','MS');
