# Sklep internetowy - diagram ERD

Baza danych sklepu internetowego. Sklep oferuje różne produkty takie jak książki, filmy i gry. Użytkownik musi posiadać konto w serwisie żeby mieć możliwość zakupu produktu. Adres nie jest wymagany, ponieważ klient może zamówić produkt do paczkomatu. Sklep oferuje różne promocje które różnią się w zależności od posiadania konta premium przez użytkownika. Sklep obsługuje różne rodzaje dostawy(tj. dostawa kurierem czy dostawa do paczkomatu) oraz różne rodzaje płatności(tj. karta płatnicza, przelew BLIK). Użytkownik może wystawiać oceny do produktów. Sklep ma możliwość wystawiania faktur

<!-- ## Tabele

- Użytkownik
  - id
  - imie
  - nazwisko
  - nr_telefonu
-Adres
  - id
  - nr_domu
  - ulica
  - miejscowosc
  - kod-pocztowy
  - kraj
- Produkt
  - id
  - nazwa
  - cena
  - opis
  - autor/producent
- Stan_magazynu
  - id
  - ilosc
- Kategoria
  - id
  - nazwa
- Zamówienie
  - id
  - data_zamowienia
  - oplacone
- Konto Premium
  - id
  - data_rozpoczecia
  - data_zakonczenia
  - automatyczne_odnowienie
- Promocje
  - id
  - data_zakonczenia
  - nazwa
  - znizka_bez_premium
  - znizka_z_premium
- Rodzaje Płatności
  - id
  - nazwa
- Rodzaje Dostawy
  - id
  - nazwa
  - sredni_czas_dostawy
- Koszyk
  - id
- Historia Zakupow
  - id
  - data_zakupu -->

## Założenia

- Promocje mogą dotyczyć kategorii i produktów (np. druga książka 50% taniej albo konkretna gra 30% taniej)
- Kilka produktów/kategorii może mieć tą samą promocję, ale produkt/kategoria nie może mieć więcej niż jednej promocji na raz
- Każda kategoria ma przynajmniej jeden produkt
- Produkt musi miec kategorie
