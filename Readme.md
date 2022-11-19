# Sklep internetowy - diagram ERD

Baza danych sklepu internetowego. Sklep oferuje różne produkty takie jak książki, filmy i gry. Użytkownik musi posiadać konto w serwisie żeby mieć możliwość zakupu produktu. Adres nie jest wymagany, ponieważ klient może zamówić produkt do paczkomatu. Sklep oferuje różne promocje które różnią się w zależności od posiadania konta premium przez użytkownika. Sklep obsługuje różne rodzaje dostawy(tj. dostawa kurierem czy dostawa do paczkomatu) oraz różne rodzaje płatności(tj. karta płatnicza, przelew BLIK).

## Tabele

- Użytkownik
  - id
  - imie
  - nazwisko
  - nr_telefonu
- Produkt
  - id
  - nazwa
  - cena
  - ilosc
  - opis
  - autor/producent
- Kategoria
  - id
  - nazwa
- Zamówienie
  - id
  - data_zamowienia
- Konto Premium
  - id
  - data_rozpoczecia
  - data_zakonczenia
  - automatyczne_odnowienie
- Promocje
  - id
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
  - data_zakupu
