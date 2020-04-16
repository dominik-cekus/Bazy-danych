CREATE TABLE pracownicy (
	ID_pracownika SERIAL unique primary key NOT NULL,
	imie VARCHAR(20) NOT NULL,
	nazwisko VARCHAR(20) NOT NULL,
	adres VARCHAR(30),
	telefon VARCHAR(12)
);

CREATE TABLE godziny (
	ID_godziny SERIAL unique primary key NOT NULL,
	termin DATE,
	liczba_godzin INT NOT NULL,
	ID_pracownika SERIAL NOT NULL
);

CREATE TABLE pensje (
	ID_pensji SERIAL unique primary key NOT NULL,
	stanowisko VARCHAR(40),
	kwota INT,
	ID_premii SERIAL unique NOT NULL
);

CREATE TABLE premie (
 	ID_premii SERIAL unique primary key NOT NULL,
	rodzaj VARCHAR(40),
	kwota INT
);

ALTER TABLE premie
ADD FOREIGN KEY (ID_premii) REFERENCES pensje(ID_premii);

ALTER TABLE godziny
ADD FOREIGN KEY(ID_pracownika) REFERENCES pracownicy(ID_pracownika);



INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Adam','Nowak','Adamów','111222333');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Marian','Banaś','Warszawa','777888999');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Andrzej','Nowak','Poznań','275493722');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Adam','Adamczyk','Grójec','263847265');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Krzysztof','Cebula','Warszawa','987654321');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Ewa','Chodakowska','Białystok','100293128');
INSERT INTO pracownicy (imie, nazwisko, adres)
VALUES ('Marek','Gołota','Lublin');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Wacław','Dudek','Białystok','734657922');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Marta','Gruszka','Częstochowa','164937492');
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Ludmiła','Rebrow','Wrocław','654789654');




INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-12-03',65,1);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-03-23',22,2);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-02-17',65,3);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-01-19',23,4);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-01-30',54,5);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-07-13',23,6);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-11-02',11,7);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-11-24',23,8);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-11-13',34,9);
INSERT INTO godziny(termin, liczba_godzin , ID_pracownika)
VALUES ('2020-11-12',12,10);





INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('księgowa',2500,1);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('dyrektor finansowy',5000,2);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('za-prezesa',11000,3);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('sprzątacz',1500,4);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('kierowca',3400,5);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('informatyk',7000,6);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('prezes',15000,7);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('sekretarka',2000,8);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('przedstawiciel handlowy',4000,9);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('sprzedawca',4000,10);

INSERT INTO premie(rodzaj,kwota)
VALUES ('dodatek miesięczny',300);
INSERT INTO premie(rodzaj,kwota)
VALUES ('zapomoga losowa',450);
INSERT INTO premie(rodzaj,kwota)
VALUES ('pracownik miesiąca',100);
INSERT INTO premie(rodzaj,kwota)
VALUES ('świąteczna',200);
INSERT INTO premie(rodzaj,kwota)
VALUES ('dodatek roczny',850);
INSERT INTO premie(rodzaj,kwota)
VALUES ('okolicznościowa',500);
INSERT INTO premie(rodzaj,kwota)
VALUES ('emerytalna',5000);
INSERT INTO premie(rodzaj,kwota)
VALUES ('wysoki obrót',500);
INSERT INTO premie(rodzaj,kwota)
VALUES ('kwartalna',1500);
INSERT INTO premie(rodzaj,kwota)
VALUES ('frekwencyjna',400);
