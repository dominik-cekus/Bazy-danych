DROP TABLE ksiegowosc.pracownicy CASCADE;
DROP TABLE ksiegowosc.godziny CASCADE;
DROP TABLE ksiegowosc.wynagrodzenie CASCADE;
DROP TABLE ksiegowosc.pensja CASCADE;
DROP TABLE ksiegowosc.premia CASCADE;
DROP SCHEMA ksiegowosc;
SELECT * FROM ksiegowosc.wynagrodzenie;
SELECT * FROM ksiegowosc.pracownicy;
SELECT * FROM ksiegowosc.pensja;
SELECT * FROM ksiegowosc.premia;
SELECT * FROM ksiegowosc.godziny;
TRUNCATE ksiegowosc.wynagrodzenie;


--QUERY

--A)
SELECT id_pracownika,nazwisko FROM ksiegowosc.pracownicy;
--B)
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji 
WHERE kwota >1000;
--C)
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji 
WHERE kwota >2000 AND id_premii IS NULL;
--D)
--Nie posiadam osób na literę J więc szukam na literę M
SELECT imie,nazwisko FROM ksiegowosc.pracownicy WHERE imie LIKE 'M%';
--E)
SELECT imie,nazwisko FROM ksiegowosc.pracownicy WHERE imie LIKE'%n%a';
--F)
SELECT imie,nazwisko,liczba_godzin - 160 AS nadgodziny
FROM ksiegowosc.pracownicy prac JOIN ksiegowosc.godziny godz ON prac.id_pracownika = godz.id_pracownika;
--G)
--Wypisuje kwote, aby sprawdzić poprawność zapytania
SELECT imie,nazwisko,kwota FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pracownicy prac ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji  WHERE kwota >=1500 AND kwota <=3000;
--H)
--Wypisuje godziny i premie, aby sprawdzić poprawność zapytania
SELECT imie,nazwisko,liczba_godzin -160 AS nadgodziny,id_premii FROM
ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pracownicy prac ON wyn.id_pracownika = prac.id_pracownika 
JOIN ksiegowosc.godziny godz ON wyn.id_godziny = godz.id_godziny  WHERE liczba_godzin -160 >0 AND id_premii IS NULL;
--I)
SELECT imie,nazwisko,kwota FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji 
JOIN ksiegowosc.pracownicy prac ON wyn.id_pracownika = prac.id_pracownika ORDER BY kwota ASC;
--J)
SELECT imie,nazwisko,pen.kwota AS kwota_pensji, prem.kwota AS kwota_premii FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji 
JOIN ksiegowosc.pracownicy prac ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.premia prem ON prem.id_premii = wyn.id_premii ORDER BY  (pen.kwota ,prem.kwota) DESC;
--K)
SELECT COUNT(stanowisko),stanowisko FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji
GROUP BY stanowisko
--L)
SELECT stanowisko,ROUND(AVG(kwota)) AS srednia_płaca, MIN(kwota) AS płaca_min, MAX(kwota) AS płaca_max FROM ksiegowosc.pensja
GROUP BY stanowisko HAVING stanowisko LIKE 'kierownik';
--M)
SELECT SUM(kwota) FROM ksiegowosc.pensja 
--F)
SELECT stanowisko,SUM(kwota) AS kwota_wg_stanowiska FROM ksiegowosc.pensja GROUP BY stanowisko;
--G)
SELECT COUNT(id_premii),stanowisko FROM ksiegowosc.wynagrodzenie wyn JOIN ksiegowosc.pensja pen ON pen.id_pensji = wyn.id_pensji
GROUP BY stanowisko
--H)
DELETE FROM ksiegowosc.wynagrodzenie USING ksiegowosc.pensja WHERE pensja.kwota <1200 AND wynagrodzenie.id_pensji = pensja.id_pensji

