DROP DATABASE sklep;
CREATE DATABASE sklep;
use sklep;
CREATE TABLE Adres (
  id INTEGER NOT NULL IDENTITY(1,1) UNIQUE,
  nr_domu INT NOT NULL,
  ulica VARCHAR(30) NOT NULL,
  miejscowosc VARCHAR(30) NOT NULL,
  kod_pocztowy VARCHAR(10) NOT NULL,
  kraj VARCHAR(30) NOT NULL,
  CHECK (LEFT(kraj, 1)=UPPER(LEFT(kraj,1))),
  PRIMARY KEY(id)
);
CREATE TABLE Sklep_stacjonarny (
	id INTEGER NOT NULL IDENTITY(1,1) UNIQUE,
	Adres_id INTEGER NOT NULL FOREIGN KEY REFERENCES Adres(id),
	nazwa VARCHAR(30) NOT NULL
	PRIMARY KEY(id)
);
CREATE TABLE Pracownik (
	id INTEGER NOT NULL UNIQUE IDENTITY(1,1),
	Sklep_stacjonarny_id INTEGER NULL FOREIGN KEY REFERENCES Sklep_stacjonarny(id),
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(30) NOT NULL ,
	data_zatrudnienia DATE NOT NULL,
	rodzaj_umowy VARCHAR(20) NOT NULL,
	pensja FLOAT NOT NULL,
	dodatek FLOAT NULL,
	stanowisko VARCHAR(30) NOT NULL,
	PRIMARY KEY (id),
	CHECK (pensja>1999)
);
CREATE TABLE Promocje (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  data_rozpoczecia DATE NOT NULL,
  data_zakonczenia DATE NULL,
  nazwa VARCHAR(30) NOT NULL,
  znizka_bez_premium FLOAT NOT NULL,
  znizka_z_premium FLOAT NOT NULL,
  CHECK (znizka_z_premium>znizka_bez_premium),
  PRIMARY KEY(id)
);

CREATE TABLE Rodzaje_dostawy (
  id INT NOT NULL IDENTITY(1,1) UNIQUE,
  nazwa VARCHAR(30) NOT NULL,
  sredni_czas_dostawy INT NOT NULL,
  CHECK (sredni_czas_dostawy>-1),
  PRIMARY KEY(id)
);

CREATE TABLE Rodzaje_platnosci (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  nazwa VARCHAR(30) NOT NULL,
  CHECK (LEFT(nazwa, 1)=UPPER(LEFT(nazwa,1))),
  PRIMARY KEY(id)
);

CREATE TABLE Kategoria (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Promocje_id INTEGER  NULL FOREIGN KEY REFERENCES Promocje(id),
  nazwa VARCHAR(30)  NOT NULL,
  CHECK (LEFT(nazwa, 1)=UPPER(LEFT(nazwa,1))),
  PRIMARY KEY(id),
);

CREATE TABLE Produkt (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Promocje_id INTEGER  NULL FOREIGN KEY REFERENCES Promocje(id),
  Kategoria_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Kategoria(id),
  nazwa VARCHAR(30) NOT NULL,
  cena FLOAT NOT NULL,
  opis TEXT NOT NULL,
  autor_producent VARCHAR(30) NOT NULL,
  CHECK (cena > 0),
  PRIMARY KEY(id),
);

CREATE TABLE Uzytkownik (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Adres_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Adres(id),
  imie VARCHAR(30) NOT NULL,
  nazwisko VARCHAR(30) NOT NULL,
  nr_telefonu VARCHAR(30) UNIQUE NOT NULL,
  karta_platnicza VARCHAR(30) UNIQUE NOT NULL,
  CHECK (LEN(nr_telefonu)=11),
  PRIMARY KEY(id),
);

CREATE TABLE Zamowienie (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Uzytkownik_id INTEGER  NULL FOREIGN KEY REFERENCES Uzytkownik(id),
  Rodzaje_dostawy_id INT NULL FOREIGN KEY REFERENCES  Rodzaje_dostawy(id),
  Rodzaje_platnosci_id INTEGER  NOT NULL FOREIGN KEY REFERENCES  Rodzaje_platnosci(id),
  Pracownik_id INTEGER NULL FOREIGN KEY REFERENCES Pracownik(id),
  Sklep_stacjonarny_id INTEGER NULL FOREIGN KEY REFERENCES Sklep_stacjonarny(id),
  data_zlozenia_zamowienia DATE NOT NULL,
  oplacone BIT NOT NULL,
  data_zakonczenia_zamowienia DATE NULL,
  CHECK (data_zakonczenia_zamowienia<=data_zakonczenia_zamowienia),
  PRIMARY KEY(id)
);

CREATE TABLE Faktura (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Zamowienie_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Zamowienie(id),
  data_wystawienia DATE NOT NULL,
  NIP VARCHAR(30) NOT NULL,
  netto FLOAT NOT NULL,
  CHECK (LEN(NIP)=13),
  PRIMARY KEY(id, Zamowienie_id),
);

CREATE TABLE Konto_Premium (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Uzytkownik_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Uzytkownik(id),
  data_rozpoczecia DATE NOT NULL,
  data_zakonczenia DATE NULL,
  automatyczne_odnowienie BIT NOT NULL,
  CHECK (data_zakonczenia<=data_zakonczenia),
  PRIMARY KEY(id, Uzytkownik_id)
);

CREATE TABLE Ocena (
  id INTEGER  NOT NULL IDENTITY(1,1) UNIQUE,
  Uzytkownik_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Uzytkownik(id),
  Produkt_id INTEGER  NOT NULL FOREIGN KEY REFERENCES  Produkt(id),
  ocena INT NOT NULL,
  data_wystawienia DATE NOT NULL,
  komentarz TEXT NULL,
  CHECK (ocena<=5 OR ocena>=0),
  PRIMARY KEY(id)
);

CREATE TABLE Koszyk (
  id INTEGER NOT NULL IDENTITY(1,1) UNIQUE,
  Produkt_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Produkt(id),
  Zamowienie_id INTEGER  NOT NULL FOREIGN KEY REFERENCES Zamowienie(id),
  ilosc INT NOT NULL DEFAULT 1,
  CHECK (ilosc > 0),
  PRIMARY KEY(id)
);
