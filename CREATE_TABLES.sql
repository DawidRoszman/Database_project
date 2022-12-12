CREATE TABLE Rodzaje_dostawy (
  id INT NOT NULL AUTO_INCREMENT,
  nazwa VARCHAR(30) NULL,
  sredni_czas_dostawy INT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Rodzaje_platnosci (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nazwa VARCHAR(30) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Adres (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nr_budynku VARCHAR(10) NULL,
  ulica VARCHAR(30) NULL,
  miejscowosc VARCHAR(30) NULL,
  kod_pocztowy VARCHAR(10) NULL,
  kraj VARCHAR(30) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Promocje (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  data_zakonczenia DATE NULL,
  nazwa VARCHAR(30) NULL,
  znizka_bez_premium FLOAT NULL,
  znizka_z_premium FLOAT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Uzytkownik (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Adres_id INTEGER UNSIGNED NOT NULL,
  imie VARCHAR(30) NULL,
  nazwisko VARCHAR(30) NULL,
  nr_telefonu VARCHAR(30) NULL,
  karta_platnicza VARCHAR(30) NULL,
  PRIMARY KEY(id),
  INDEX Uzytkownik_FKIndex1(Adres_id),
  FOREIGN KEY(Adres_id)
    REFERENCES Adres(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Sklep_stacjonarny (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Adres_id INTEGER UNSIGNED NOT NULL,
  nazwa INTEGER UNSIGNED NULL,
  PRIMARY KEY(id, Adres_id),
  INDEX Sklep_stacjonarny_FKIndex1(Adres_id),
  FOREIGN KEY(Adres_id)
    REFERENCES Adres(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Pracownik (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Sklep_stacjonarny_Adres_id INTEGER UNSIGNED NOT NULL,
  Sklep_stacjonarny_id INTEGER UNSIGNED NOT NULL,
  imie VARCHAR(20) NULL,
  nazwisko VARCHAR(20) NULL,
  data_zatrudnienia DATE NULL,
  rodzaj_umowy VARCHAR(20) NULL,
  pensja FLOAT NULL,
  dodatek FLOAT NULL,
  stanowisko INTEGER UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX Pracownik_FKIndex1(Sklep_stacjonarny_id, Sklep_stacjonarny_Adres_id),
  FOREIGN KEY(Sklep_stacjonarny_id, Sklep_stacjonarny_Adres_id)
    REFERENCES Sklep_stacjonarny(id, Adres_id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Konto_Premium (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Uzytkownik_id INTEGER UNSIGNED NOT NULL,
  data_rozpoczecia DATE NULL,
  data_zakonczenia DATE NULL,
  automatyczne_odnowienie BOOL NULL,
  PRIMARY KEY(id, Uzytkownik_id),
  INDEX Konto_Premium_FKIndex1(Uzytkownik_id),
  FOREIGN KEY(Uzytkownik_id)
    REFERENCES Uzytkownik(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Kategoria (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Promocje_id INTEGER UNSIGNED NOT NULL,
  nazwa INTEGER UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX Kategoria_FKIndex1(Promocje_id),
  FOREIGN KEY(Promocje_id)
    REFERENCES Promocje(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Produkt (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Promocje_id INTEGER UNSIGNED NOT NULL,
  Kategoria_id INTEGER UNSIGNED NOT NULL,
  nazwa VARCHAR(30) NULL,
  cena FLOAT NULL,
  opis VARCHAR(30) NULL,
  autor/producent VARCHAR(30) NULL,
  PRIMARY KEY(id),
  INDEX Produkt_FKIndex1(Kategoria_id),
  INDEX Produkt_FKIndex2(Promocje_id),
  FOREIGN KEY(Kategoria_id)
    REFERENCES Kategoria(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Promocje_id)
    REFERENCES Promocje(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Ocena (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Uzytkownik_id INTEGER UNSIGNED NOT NULL,
  Produkt_id INTEGER UNSIGNED NOT NULL,
  ocena(1-5) INT NULL,
  data_wystawienia DATE NULL,
  komentarz TEXT NULL,
  PRIMARY KEY(id),
  INDEX Ocena_FKIndex1(Produkt_id),
  INDEX Ocena_FKIndex2(Uzytkownik_id),
  FOREIGN KEY(Produkt_id)
    REFERENCES Produkt(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Uzytkownik_id)
    REFERENCES Uzytkownik(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Zamowienie (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pracownik_id INTEGER UNSIGNED NOT NULL,
  Sklep_stacjonarny_Adres_id INTEGER UNSIGNED NOT NULL,
  Sklep_stacjonarny_id INTEGER UNSIGNED NOT NULL,
  Uzytkownik_id INTEGER UNSIGNED NOT NULL,
  Rodzaje_dostawy_id INT NOT NULL,
  Rodzaje_platnosci_id INTEGER UNSIGNED NOT NULL,
  data_zlozenia_zamowienia DATE NULL,
  oplacone BOOL NULL,
  data_zakonczenia_zamowienia DATE NULL,
  PRIMARY KEY(id),
  INDEX Zamowienie_FKIndex1(Rodzaje_platnosci_id),
  INDEX Zamowienie_FKIndex4(Rodzaje_dostawy_id),
  INDEX Zamowienie_FKIndex4(Uzytkownik_id),
  INDEX Zamowienie_FKIndex4(Sklep_stacjonarny_id, Sklep_stacjonarny_Adres_id),
  INDEX Zamowienie_FKIndex5(Pracownik_id),
  FOREIGN KEY(Rodzaje_platnosci_id)
    REFERENCES Rodzaje_platnosci(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Rodzaje_dostawy_id)
    REFERENCES Rodzaje_dostawy(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Uzytkownik_id)
    REFERENCES Uzytkownik(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Sklep_stacjonarny_id, Sklep_stacjonarny_Adres_id)
    REFERENCES Sklep_stacjonarny(id, Adres_id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pracownik_id)
    REFERENCES Pracownik(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Faktura (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Zamowienie_id INTEGER UNSIGNED NOT NULL,
  data_wystawienia DATE NULL,
  NIP VARCHAR(30) NULL,
  netto FLOAT NULL,
  podatek_VAT FLOAT NULL,
  brutto FLOAT NULL,
  PRIMARY KEY(id, Zamowienie_id),
  INDEX Faktura_FKIndex1(Zamowienie_id),
  FOREIGN KEY(Zamowienie_id)
    REFERENCES Zamowienie(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

CREATE TABLE Koszyk (
  Produkt_id INTEGER UNSIGNED NOT NULL,
  Zamowienie_id INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Produkt_id, Zamowienie_id),
  INDEX Produkt_has_zamowienie_FKIndex1(Produkt_id),
  INDEX Produkt_has_zamowienie_FKIndex2(Zamowienie_id),
  FOREIGN KEY(Produkt_id)
    REFERENCES Produkt(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY(Zamowienie_id)
    REFERENCES Zamowienie(id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);


