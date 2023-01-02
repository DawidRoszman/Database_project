use sklep;
INSERT INTO Adres (nr_domu, ulica, miejscowosc, kod_pocztowy, kraj) VALUES
(432, 'Krakowska', 'Kraków', '31-123', 'Polska'),
(12, 'Warszawska', 'Warszawa', '00-123', 'Polska'),
(35, 'Poznańska', 'Poznań', '61-123', 'Polska'),
(64, 'Gdańska', 'Gdańsk', '80-123', 'Polska'),
(51, 'Katowicka', 'Katowice', '40-123', 'Polska'),
(61, 'Wrocławska', 'Wrocław', '50-123', 'Polska'),
(97, 'Lubelska', 'Lublin', '20-123', 'Polska'),
(68, 'Łódzka', 'Łódź', '91-123', 'Polska'),
(79, 'Szczecińska', 'Szczecin', '70-123', 'Polska'),
(11, 'Białostocka', 'Białystok', '15-123', 'Polska'),
(43, 'Kwiatowa', 'Gdańsk', '80-001', 'Polska'),
(23, 'Różana', 'Gdańsk', '80-002', 'Polska'),
(654, 'Brzoskwiniowa', 'Gdańsk', '80-003', 'Polska'),
(43, 'Jabłkowa', 'Gdańsk', '80-004', 'Polska'),
(12, 'Truskawkowa', 'Gdańsk', '80-005', 'Polska'),
(7, 'Borówkowa', 'Gdańsk', '80-006', 'Polska'),
(54, 'Śliwkowa', 'Gdańsk', '80-007', 'Polska'),
(9, 'Czereśniowa', 'Gdańsk', '80-008', 'Polska'),
(53, 'Malinowa', 'Gdańsk', '80-009', 'Polska'),
(99, 'Agrestowa', 'Gdańsk', '80-010', 'Polska');

INSERT INTO Sklep_stacjonarny (Adres_id, nazwa)
VALUES
(2, 'Słoneczny Sklep'),
(4, 'Sklep na Równinie'),
(1, 'Sklep pod Górą'),
(8, 'Sklep u Stóp Góry'),
(10, 'Sklep w Dołku'),
(3, 'Sklep na Szczycie Góry'),
(5, 'Sklep na Równinie 2'),
(9, 'Sklep pod Górą 2'),
(7, 'Sklep u Stóp Góry 2'),
(6, 'Sklep w Dołku 2');

INSERT INTO Pracownik (Sklep_stacjonarny_id, imie, nazwisko, data_zatrudnienia, rodzaj_umowy, pensja, dodatek, stanowisko)
VALUES
(1, 'Anna', 'Kowalska', '2022-01-01', 'umowa o pracę', 2000, 400, 'kasjer'),
(2, 'Piotr', 'Nowak', '2022-03-01', 'umowa o pracę', 2500, 200, 'ekspedient'),
(3, 'Tomasz', 'Wiśniewski', '2022-05-01', 'umowa o pracę', 2200, 300, 'kasjer'),
(4, 'Katarzyna', 'Dąbrowska', '2022-07-01', 'umowa o pracę', 2700, NULL, 'ekspedient'),
(5, 'Jan', 'Kozłowski', '2022-09-01', 'umowa o pracę', 2100, NULL, 'kasjer'),
(6, 'Agnieszka', 'Wojciechowska', '2022-11-01', 'umowa o pracę', 2900, NULL, 'ekspedient'),
(7, 'Adam', 'Mazur', '2022-01-01', 'umowa o pracę', 2200, NULL, 'kasjer'),
(8, 'Marta', 'Piotrowska', '2022-03-01', 'umowa o pracę', 2600, NULL, 'ekspedient'),
(9, 'Dawid', 'Jankowski', '2022-05-01', 'umowa o pracę', 2400, 100, 'kasjer'),
(10, 'Beata', 'Kwiatkowska', '2022-07-01', 'umowa o pracę', 2800, 400, 'ekspedient');




INSERT INTO Promocje (data_rozpoczecia, data_zakonczenia, nazwa, znizka_bez_premium, znizka_z_premium) VALUES
('2022-01-01', '2022-01-29', 'Zimowa wyprzedaż', 0.1, 0.2),
('2022-02-01', '2022-02-28', 'Walentynkowa promocja', 0.15, 0.25),
('2022-03-01', '2022-03-30', 'Wiosenna obniżka', 0.2, 0.3),
('2022-04-01', '2022-04-30', 'Promocja na majówkę', 0.25, 0.55),
('2022-05-01', '2022-05-30', 'Letnia wyprzedaż', 0.3, 0.4),
('2022-06-01', '2022-06-30', 'Promocja na Dzień Dziecka', 0.35, 0.45),
('2022-07-01', '2022-07-30', 'Lato z rabatem', 0.4, 0.5),
('2022-08-01', '2022-08-30', 'Promocja na Wakacje', 0.45, 0.65),
('2022-09-01', '2022-09-30', 'Jesienna obniżka', 0.5, 0.6),
('2022-10-01', '2022-10-30', 'Promocja na Halloween', 0.55, 0.65);

INSERT INTO Rodzaje_platnosci (nazwa) VALUES
('Przelew bankowy'),
('Płatność kartą'),
('Gotówka'),
('PayPal'),
('Blik'),
('Apple Pay'),
('Google Pay'),
('PayU'),
('Santander Pay'),
('Masterpass');

INSERT INTO Kategoria (Promocje_id, nazwa) VALUES
(3, 'Foto'),
(1, 'Odzież'),
(2, 'Obuwie'),
(3, 'Książki'),
(4, 'Elektronika'),
(5, 'Zabawki'),
(6, 'AGD'),
(7, 'RTV'),
(8, 'Meble'),
(9, 'Kosmetyki'),
(10, 'Zdrowie i uroda');

INSERT INTO Produkt (Promocje_id, Kategoria_id, nazwa, cena, opis, autor_producent) VALUES
(4, 11, 'Aparat Canon', 2099.99, 'Aparat fotograficzny firmy Canon', 'Firma Canon'),
(5, 3, 'Learn SQL', 249.99, 'Szybka nauka SQL', 'Autor LQS'),
(3, 3, 'Książka kucharska', 39.99, 'Książka z przepisami na dania z różnych stron świata', 'Autor XYZ'),
(2, 3, 'Thriller', 49.99, 'Niepokojąca powieść kryminalna z zagadką do rozwiązania', 'Autor ABC'),
(5, 3, 'Komiks', 29.99, 'Zabawna historia o przygodach bohaterów w komiksowym stylu', 'Autor DEF'),
(5, 4, 'Telefon komórkowy', 999.99, 'Nowoczesny telefon z 5G i dużym wyświetlaczem', 'Firma GHI'),
(6, 5, 'Lalka Barbie', 49.99, 'Lalka z modnym strojem i akcesoriami', 'Firma JKL'),
(8, 6, 'Lodówka', 999.99, 'Energooszczędna lodówka z dużym pojemnością', 'Firma MNO'),
(9, 7, 'Telewizor', 2999.99, 'Telewizor z dużym 4K ekranem i głośnikami surround', 'Firma PQR'),
(1, 8, 'Krzesło biurowe', 199.99, 'Ergonomiczne krzesło biurowe z regulacją wysokości', 'Firma STU'),
(2, 10, 'Podkład do twarzy', 59.99, 'Podkład o naturalnym kolorze i dobrej kryjącości', 'Firma VWX');


INSERT INTO Rodzaje_dostawy (nazwa, sredni_czas_dostawy) VALUES
('Kurier', 2),
('Poczta', 5),
('Odbiór osobisty', 0),
('Paczkomat', 1),
('Dostawa za pobraniem', 3),
('DHL', 2),
('UPS', 3),
('FedEx', 3),
('DPD', 2),
('InPost', 1);

INSERT INTO Uzytkownik (Adres_id, imie, nazwisko, nr_telefonu, karta_platnicza) VALUES
(15, 'Jan', 'Kowalski', '123-456-789', '1234 5678 9012 3456'),
(12, 'Anna', 'Nowak', '987-654-321', '9876 5432 1098 7654'),
(13, 'Piotr', 'Wiśniewski', '246-135-795', '2468 1357 9135 7924'),
(14, 'Agnieszka', 'Wójcik', '135-792-468', '1357 9214 6813 5792'),
(15, 'Marek', 'Krawczyk', '795-246-138', '7952 4613 8246 1379'),
(16, 'Magdalena', 'Zielińska', '468-793-251', '4687 7935 1258 9321'),
(17, 'Tomasz', 'Dąbrowski', '251-846-379', '2518 4637 9379 8416'),
(18, 'Karolina', 'Mazur', '379-251-864', '3792 5184 6251 8463'),
(19, 'Dominik', 'Jankowski', '864-379-152', '8647 3791 5238 7915'),
(20, 'Ewelina', 'Kaczmarek', '152-864-739', '1528 6479 3846 7391');

INSERT INTO Zamowienie (Uzytkownik_id, Rodzaje_dostawy_id, Rodzaje_platnosci_id, Pracownik_id , Sklep_stacjonarny_id , data_zlozenia_zamowienia, oplacone, data_zakonczenia_zamowienia) VALUES
(1, 7, 5, NULL, NULL, '2022-01-01', 1, '2022-01-03'),
(2, 10, 4, NULL, NULL, '2022-02-01', 0, NULL),
(3, 10, 7, NULL, NULL, '2022-03-01', 1, '2022-03-05'),
(4, 10, 2, NULL, NULL, '2022-04-01', 1, '2022-04-02'),
(5, 2, 2, NULL, NULL, '2022-05-01', 0, NULL),
(6, 2, 5, NULL, NULL, '2022-06-01', 1, '2022-06-04'),
(7, 10, 9, NULL, NULL, '2022-07-01', 1, '2022-07-03'),
(8, 9, 2, NULL, NULL, '2022-08-01', 0, NULL),
(9, 9, 1, NULL, NULL, '2022-09-01', 1, '2022-09-02'),
(5, 8, 2, 4, 6, '2022-01-01', 1, '2022-01-02'),
(9, 3, 7, 2, 1, '2022-02-01', 1, '2022-02-02'),
(8, 4, 6, 9, 5, '2022-03-01', 1, '2022-03-02'),
(3, 2, 1, 7, 9, '2022-04-01', 1, '2022-04-02'),
(7, 9, 5, 3, 2, '2022-05-01', 1, '2022-05-02'),
(1, 6, 9, 5, 4, '2022-06-01', 1, '2022-06-02'),
(2, 5, 3, 8, 7, '2022-07-01', 1, '2022-07-02'),
(6, 1, 8, 6, 3, '2022-08-01', 1, '2022-08-02'),
(4, 7, 4, 1, 8, '2022-09-01', 1, '2022-09-02'),
(10, 10, 1, NULL, NULL, '2022-10-01', 1, '2022-10-03');

INSERT INTO Faktura (Zamowienie_id, data_wystawienia, NIP, netto) VALUES
(1, '2022-01-01', '123-456-78-90', 100.00),
(2, '2022-02-01', '123-456-78-91', 200.00),
(3, '2022-03-01', '123-456-78-92', 300.00),
(4, '2022-04-01', '123-456-78-93', 400.00),
(5, '2022-05-01', '123-456-78-94', 500.00),
(6, '2022-06-01', '123-456-78-95', 600.00),
(7, '2022-07-01', '123-456-78-96', 700.00),
(8, '2022-08-01', '123-456-78-97', 800.00),
(9, '2022-09-01', '123-456-78-98', 900.00),
(10, '2022-10-01', '123-456-78-99', 1000.00);

INSERT INTO Koszyk(Zamowienie_id, Produkt_id, ilosc) VALUES
(1, 1, 2),
(1, 2, 1),
(1, 3, 3),
(2, 4, 1),
(2, 5, 2),
(3, 6, 1),
(3, 7, 1),
(4, 8, 2),
(4, 9, 1),
(5, 10, 3),
(5, 1, 1),
(6, 2, 2),
(6, 3, 1),
(7, 4, 3),
(7, 5, 1),
(8, 6, 2),
(8, 7, 1),
(9, 8, 1),
(9, 9, 2),
(10, 10, 1),
(10, 1, 2);

INSERT INTO Konto_Premium(Uzytkownik_id, data_rozpoczecia, data_zakonczenia, automatyczne_odnowienie) VALUES
(1, '2020-06-06', '2023-01-01',  1),
(4, '2021-02-01', '2023-01-01',  0),
(5, '2019-02-06', '2023-01-01',  1),
(1, '2022-12-01', '2023-01-01',  0),
(8, '2022-11-01', '2023-01-01', 1);

use sklep2;
INSERT INTO Ocena (Uzytkownik_id, Produkt_id, ocena, data_wystawienia, komentarz) VALUES
(1, 1, 5, '2022-11-11' , 'Bardzo fajna książka, szybko nauczyłam się podstaw SQL dzięki niej.'),
(1, 2, 4, '2022-10-01' , 'Książka była pomocna, ale miałam wrażenie, że brakuje kilku ważnych informacji.'),
(1, 3, 5, '2022-01-01', 'Świetna książka, polecam ją osobom, które chcą szybko opanować SQL.'),
(1, 4, 5, '2021-03-03', 'Rewelacyjna książka, po jej przeczytaniu miałam już dobry pogląd na temat SQL.'),
(1, 5, 4, '2021-04-23', 'Książka była bardzo pomocna, ale myślę, że mogłaby być nieco obszerniejsza.'),
(2, 6, 5, '2021-07-05', 'Ta książka kucharska to prawdziwe skarby! Znalazłam w niej wiele ciekawych przepisów.'),
(2, 7, 4, '2022-02-04', 'Książka jest świetna, ale niektóre przepisy są dla mnie za skomplikowane.'),
(2, 8, 5, '2022-02-08', 'Książka jest super, zawsze znajdę w niej coś ciekawego do zrobienia.'),
(2, 9, 3, '2022-07-04', 'Książka jest dobra, ale nie zachwyciła mnie aż tak bardzo.'),
(2, 10, 5, '2022-09-08', 'Książka jest rewelacyjna, polecam ją osobom lubiącym eksperymentować w kuchni.'),
(3, 1, 4, '2021-02-04', 'Thriller był bardzo emocjonujący, ale zakończenie mnie trochę zawiodło.'),
(3, 2, 5, '2022-02-08', 'Świetna powieść, nie mogłam się oderwać od czytania!'),
(3, 3, 4, '2020-01-14', 'Książka była bardzo dobra, ale miałam wrażenie, że zakończenie było nieco sztuczne.'),
(3, 4, 3, '2022-02-27', 'Thriller był przyzwoity, ale nie zachwycił mnie aż tak bardzo.'),
(4, 5, 2, '2022-08-04', 'Komiks był niezły, ale miałam wrażenie, że brakowało mi głębszego sensu.'),
(4, 6, 4, '2022-07-14', 'Komiks był zabawny, ale niektóre dowcipy mi nie przypadły do gustu.'),
(4, 7, 5, '2022-04-23', 'Komiks był rewelacyjny, nie mogłam się od niego oderwać!'),
(4, 8, 3, '2022-08-12', 'Komiks był dobry, ale nie zachwycił mnie aż tak bardzo.'),
(5, 9, 1, '2022-03-23', 'Telefon komórkowy był bardzo drogi, a jego funkcje nie były aż tak imponujące.'),
(5, 10, 2, '2022-01-07', 'Telefon jest OK, ale miałam wyższe oczekiwania wobec niego.'),
(6, 1, 4, '2022-03-09', 'Lalka Barbie jest fajna, ale niektóre akcesoria są zbyt delikatne.'),
(6, 2, 3, '2022-09-16', 'Lalka jest OK, ale nie jestem zachwycona.'),
(7, 3, 5, '2022-02-02', 'Lodówka jest świetna, ma dużo miejsca i jest bardzo oszczędna.'),
(7, 4, 4, '2022-12-12', 'Lodówka jest fajna, ale niektóre schowki są zbyt małe.');
