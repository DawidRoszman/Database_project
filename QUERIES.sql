use sklep;

-- obliczenie lacznej ceny za produkt
SELECT Uzytkownik.imie, Produkt.nazwa, Koszyk.ilosc, Produkt.cena [Cena za sztuke] , Koszyk.ilosc*Produkt.cena [Łączna  cena] FROM Koszyk
JOIN Produkt ON Koszyk.Produkt_id=Produkt.id
JOIN Zamowienie ON Koszyk.Zamowienie_id=Zamowienie.id
JOIN Uzytkownik ON Zamowienie.Uzytkownik_id=Uzytkownik.id;


-- Ile kazdy z uzytkownikow wydal w sklepie
SELECT Uzytkownik.imie, SUM(Koszyk.ilosc*Produkt.cena) AS [Wydane]  FROM Koszyk
JOIN Produkt ON Koszyk.Produkt_id=Produkt.id
JOIN Zamowienie ON Koszyk.Zamowienie_id=Zamowienie.id
JOIN Uzytkownik ON Zamowienie.Uzytkownik_id=Uzytkownik.id
GROUP BY Uzytkownik.imie
ORDER BY Wydane DESC;

-- obliczenie podatku VAT i brutto przy fakturze
SELECT Uzytkownik.imie, Faktura.*, netto*0.23 AS [podatek VAT], netto-(netto*0.23) brutto FROM Faktura
JOIN Zamowienie ON Faktura.Zamowienie_id=Zamowienie.id
LEFT JOIN Uzytkownik ON Zamowienie.Uzytkownik_id=Uzytkownik.id;

--uzytkownik z najwieksza iloscia wystawionych ocen
use sklep2;
SELECT Uzytkownik.id, Uzytkownik.imie, COUNT(Ocena.id) [Ilosc ocen] FROM Uzytkownik
LEFT JOIN Ocena ON Uzytkownik.id=Ocena.Uzytkownik_id
GROUP BY Uzytkownik.id, Uzytkownik.imie
HAVING COUNT(Ocena.id)=(
	SELECT TOP 1 COUNT(Ocena.id) FROM Ocena
	GROUP BY Ocena.Uzytkownik_id
	ORDER BY COUNT(Ocena.id) DESC);

-- najczesciej kupowana kategoria
SELECT Kategoria.nazwa, COUNT(Zamowienie.id) FROM Kategoria
JOIN Produkt ON Produkt.Kategoria_id=Kategoria.id
LEFT JOIN Koszyk ON Koszyk.Produkt_id=Produkt.id
LEFT JOIN Zamowienie ON Koszyk.Zamowienie_id=Zamowienie.id
GROUP BY Kategoria.nazwa
ORDER BY COUNT(Zamowienie.id) DESC;

--
SELECT * FROM Pracownik;
