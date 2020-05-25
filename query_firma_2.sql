--A)
UPDATE ksiegowosc.pracownicy prac SET telefon='(+48)'|| prac.telefon
--B)
UPDATE ksiegowosc.pracownicy prac SET telefon=SUBSTRING(prac.telefon,1,8)
||'-'||SUBSTRING(prac.telefon,9,3)||'-'||SUBSTRING(prac.telefon,12,3)
--C)
SELECT UPPER(prac.imie), UPPER(prac.nazwisko), UPPER(prac.adres), UPPER(prac.telefon), LENGTH(prac.nazwisko) 
FROM ksiegowosc.pracownicy prac 
ORDER BY LENGTH(prac.nazwisko) DESC LIMIT 1
--D)
SELECT prac.*, MD5(CAST(pen.kwota AS VARCHAR)) AS md5_kwota FROM ksiegowosc.pracownicy prac 
JOIN ksiegowosc.wynagrodzenie wyn ON wyn.id_pracownika = prac.id_pracownika 
JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji 
--F)
SELECT prac.imie,prac.nazwisko, pen.kwota, prem.kwota 
FROM ksiegowosc.wynagrodzenie wyn 
LEFT JOIN ksiegowosc.pracownicy prac ON prac.id_pracownika = wyn.id_pracownika
LEFT JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji
LEFT JOIN ksiegowosc.premia prem ON wyn.id_premii = prem.id_premii
--G)
SELECT CONCAT('Pracownik ',prac.imie,prac.nazwisko,', w dniu ',
godz.data,' otrzymał pensję całkowitą na kwotę ',COALESCE(prem.kwota,0)+COALESCE(pen.kwota,0),
', gdzie wynagrodzenie zasadnicze wynosiło: ',pen.kwota,', premia: ',prem.kwota,
', nadgodziny: ',godz.liczba_godzin) AS Informacja
FROM ksiegowosc.wynagrodzenie wyn
LEFT JOIN ksiegowosc.pensja pen ON wyn.id_pensji = pen.id_pensji
LEFT JOIN ksiegowosc.premia prem ON wyn.id_premii = prem.id_premii 
LEFT JOIN ksiegowosc.pracownicy prac ON wyn.id_pracownika = prac.id_pracownika
LEFT JOIN ksiegowosc.godziny godz ON prac.id_pracownika = godz.id_pracownika

