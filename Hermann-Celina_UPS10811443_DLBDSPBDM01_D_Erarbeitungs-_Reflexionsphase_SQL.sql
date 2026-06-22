-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Jun 2026 um 01:18
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `buchtausch-app`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausleihe`
--

CREATE TABLE `ausleihe` (
  `idAusleihe` int(11) NOT NULL,
  `Rückgabedatum` date DEFAULT NULL,
  `Anzahl_Verlängerungen` int(11) DEFAULT NULL,
  `idAusleihstatus` int(11) DEFAULT NULL,
  `idAusleiher` int(11) DEFAULT NULL,
  `idExemplar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ausleihe`
--

INSERT INTO `ausleihe` (`idAusleihe`, `Rückgabedatum`, `Anzahl_Verlängerungen`, `idAusleihstatus`, `idAusleiher`, `idExemplar`) VALUES
(1, '2026-07-01', 0, 1, 2, 1),
(2, '2026-06-20', 1, 2, 3, 2),
(3, '2026-06-10', 0, 3, 4, 3),
(4, '2026-07-15', 2, 1, 5, 4),
(5, '2026-06-25', 0, 5, 6, 5),
(6, '2026-06-05', 1, 6, 7, 6),
(7, '2026-05-30', 0, 7, 8, 7),
(8, '2026-07-20', 0, 8, 9, 8),
(9, '2026-06-12', 0, 9, 10, 9),
(10, '2026-06-18', 1, 10, 1, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausleihstatus`
--

CREATE TABLE `ausleihstatus` (
  `idAusleihstatus` int(11) NOT NULL,
  `Ausleihstatus` enum('AUSGELIEHEN','ABGESCHLOSSEN','ÜBERFÄLLIG','STORNIERT') DEFAULT NULL,
  `restliche_Ausleihzeit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ausleihstatus`
--

INSERT INTO `ausleihstatus` (`idAusleihstatus`, `Ausleihstatus`, `restliche_Ausleihzeit`) VALUES
(1, 'AUSGELIEHEN', 14),
(2, 'ABGESCHLOSSEN', 0),
(3, 'ÜBERFÄLLIG', -5),
(4, 'STORNIERT', 0),
(5, 'AUSGELIEHEN', 7),
(6, 'ABGESCHLOSSEN', 0),
(7, 'ÜBERFÄLLIG', -2),
(8, 'AUSGELIEHEN', 21),
(9, 'STORNIERT', 0),
(10, 'ABGESCHLOSSEN', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  `Nachname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `autor`
--

INSERT INTO `autor` (`idAutor`, `Vorname`, `Nachname`) VALUES
(1, 'Franz', 'Kafka'),
(2, 'Agatha', 'Christie'),
(3, 'J.K.', 'Rowling'),
(4, 'Stephen', 'King'),
(5, 'Hermann', 'Hesse'),
(6, 'Margaret', 'Atwood'),
(7, 'George', 'Orwell'),
(8, 'Isabel', 'Allende'),
(9, 'Haruki', 'Murakami'),
(10, 'Cornelia', 'Funke');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bankverbindung`
--

CREATE TABLE `bankverbindung` (
  `idBankverbindung` int(11) NOT NULL,
  `Kontoinhaber Name` varchar(45) DEFAULT NULL,
  `IBAN` varchar(45) DEFAULT NULL,
  `BIC` varchar(45) DEFAULT NULL,
  `Name_der_Bank` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `bankverbindung`
--

INSERT INTO `bankverbindung` (`idBankverbindung`, `Kontoinhaber Name`, `IBAN`, `BIC`, `Name_der_Bank`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, 'Lena Schmidt', 'DE89370400440532013000', 'COBADEFFXXX', 'Commerzbank'),
(3, 'Tim Weber', 'DE12500105170648489890', 'INGDDEFFXXX', 'ING'),
(4, 'Sarah Klein', 'DE27100777770209299700', 'DEUTDEFFXXX', 'Deutsche Bank'),
(5, 'Max Becker', 'DE91100000000123456789', 'PBNKDEFF', 'Postbank'),
(6, 'Julia Hoffmann', 'DE05500105172934856951', 'GENODEFF', 'Volksbank'),
(7, 'Felix Wolf', 'DE44500105175407324931', 'COBADEFFXXX', 'Commerzbank'),
(8, 'Anna Schäfer', 'DE73500105179348562930', 'INGDDEFFXXX', 'ING'),
(9, 'Paul Richter', 'DE16500105172983746521', 'DEUTDEFFXXX', 'Deutsche Bank'),
(10, 'Lisa Neumann', 'DE82500105174857293610', 'PBNKDEFF', 'Postbank'),
(11, 'David Vogel', 'DE39500105178293746102', 'GENODEFF', 'Volksbank');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bewertung`
--

CREATE TABLE `bewertung` (
  `idBewertung` int(11) NOT NULL,
  `Bewertung` int(11) DEFAULT NULL,
  `Kommentar` varchar(45) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `idBuch` int(11) DEFAULT NULL,
  `idBewerter` int(11) DEFAULT NULL,
  `idBewerteter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `bewertung`
--

INSERT INTO `bewertung` (`idBewertung`, `Bewertung`, `Kommentar`, `Datum`, `idBuch`, `idBewerter`, `idBewerteter`) VALUES
(1, 5, 'Sehr zuverlässig und freundlich', '2026-06-15', 1, 2, 1),
(2, 4, 'Buch war gut verpackt', '2026-06-20', 2, 3, 2),
(3, 3, 'Etwas verspätet abgeholt', '2026-06-25', 3, 4, 3),
(4, 5, 'Top Kommunikation', '2026-06-28', 4, 5, 4),
(5, 4, 'Alles bestens', '2026-07-01', 5, 6, 5),
(6, 5, 'Schnelle Abwicklung', '2026-07-03', 6, 7, 6),
(7, 2, 'Buch kam beschädigt zurück', '2026-07-05', 7, 8, 7),
(8, 5, 'Sehr empfehlenswert', '2026-07-08', 8, 9, 8),
(9, 4, 'Gerne wieder', '2026-07-10', 9, 10, 9),
(10, 5, 'Perfekter Austausch', '2026-07-12', 10, 1, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buch`
--

CREATE TABLE `buch` (
  `idBuch` int(11) NOT NULL,
  `Titel` varchar(45) DEFAULT NULL,
  `JahrVeröffentlichung` date DEFAULT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `Bild` varchar(45) DEFAULT NULL,
  `idVerlag` int(11) DEFAULT NULL,
  `idGenre` int(11) DEFAULT NULL,
  `idAutor` int(11) DEFAULT NULL,
  `idSprache` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `buch`
--

INSERT INTO `buch` (`idBuch`, `Titel`, `JahrVeröffentlichung`, `ISBN`, `Bild`, `idVerlag`, `idGenre`, `idAutor`, `idSprache`) VALUES
(1, 'Die Verwandlung', '1915-01-01', '978-3-15-009900-0', 'verwandlung.jpg', 1, 1, 1, 1),
(2, 'Mord im Orientexpress', '1934-01-01', '978-3-502-51234-0', 'orientexpress.jpg', 6, 2, 2, 1),
(3, 'Harry Potter und der Stein der Weisen', '1997-06-26', '978-3-551-55167-2', 'harrypotter1.jpg', 9, 4, 3, 1),
(4, 'Es', '1986-09-15', '978-3-453-43567-8', 'es.jpg', 5, 7, 4, 1),
(5, 'Siddhartha', '1922-01-01', '978-3-518-46161-0', 'siddhartha.jpg', 4, 1, 5, 1),
(6, 'Der Report der Magd', '1985-01-01', '978-3-492-30445-1', 'magd.jpg', 7, 5, 6, 1),
(7, '1984', '1949-06-08', '978-3-548-23456-1', '1984.jpg', 3, 5, 7, 1),
(8, 'Das Geisterhaus', '1982-01-01', '978-3-518-39876-5', 'geisterhaus.jpg', 4, 1, 8, 1),
(9, 'Kafka am Strand', '2002-01-01', '978-3-8321-7890-3', 'kafka_strand.jpg', 3, 1, 9, 1),
(10, 'Tintenherz', '2003-01-01', '978-3-7915-0456-7', 'tintenherz.jpg', 9, 4, 10, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exemplar`
--

CREATE TABLE `exemplar` (
  `idExemplar` int(11) NOT NULL,
  `PfandwertBerechnet` int(11) DEFAULT NULL,
  `Versand` tinyint(1) DEFAULT NULL,
  `Abholung` tinyint(1) DEFAULT NULL,
  `Verfügar_ab` date DEFAULT NULL,
  `Verfügar_bis` date DEFAULT NULL,
  `idBuch` int(11) DEFAULT NULL,
  `idBesitzer` int(11) DEFAULT NULL,
  `idZustand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `exemplar`
--

INSERT INTO `exemplar` (`idExemplar`, `PfandwertBerechnet`, `Versand`, `Abholung`, `Verfügar_ab`, `Verfügar_bis`, `idBuch`, `idBesitzer`, `idZustand`) VALUES
(1, 10, 1, 1, '2026-01-01', '2026-12-31', 1, 1, 1),
(2, 8, 0, 1, '2026-01-15', '2026-12-31', 2, 2, 2),
(3, 15, 1, 0, '2026-02-01', '2026-12-31', 3, 3, 3),
(4, 12, 1, 1, '2026-02-10', '2026-12-31', 4, 4, 4),
(5, 9, 0, 1, '2026-03-01', '2026-12-31', 5, 5, 5),
(6, 11, 1, 1, '2026-03-05', '2026-12-31', 6, 6, 6),
(7, 7, 1, 0, '2026-03-12', '2026-12-31', 7, 7, 7),
(8, 13, 0, 1, '2026-04-01', '2026-12-31', 8, 8, 8),
(9, 6, 1, 1, '2026-04-05', '2026-12-31', 9, 9, 9),
(10, 14, 1, 0, '2026-04-10', '2026-12-31', 10, 10, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `genre`
--

CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL,
  `Genre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `genre`
--

INSERT INTO `genre` (`idGenre`, `Genre`) VALUES
(1, 'Roman'),
(2, 'Krimi'),
(3, 'Sachbuch'),
(4, 'Fantasy'),
(5, 'Science-Fiction'),
(6, 'Biografie'),
(7, 'Thriller'),
(8, 'Kinderbuch'),
(9, 'Lyrik'),
(10, 'Comic');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nachricht`
--

CREATE TABLE `nachricht` (
  `idNachricht` int(11) NOT NULL,
  `Nachricht` varchar(255) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `gelesen` tinyint(1) DEFAULT NULL,
  `idSender` int(11) DEFAULT NULL,
  `idEmpänger` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `nachricht`
--

INSERT INTO `nachricht` (`idNachricht`, `Nachricht`, `Datum`, `gelesen`, `idSender`, `idEmpänger`) VALUES
(1, 'Hallo, ist das Buch noch verfügbar?', '2026-06-01', 1, 2, 1),
(2, 'Ja, du kannst es gerne abholen.', '2026-06-01', 1, 1, 2),
(3, 'Wann passt es dir am besten?', '2026-06-02', 1, 3, 2),
(4, 'Samstag um 14 Uhr wäre super.', '2026-06-02', 0, 2, 3),
(5, 'Können wir den Versand klären?', '2026-06-05', 1, 4, 5),
(6, 'Klar, ich schicke dir die Adresse.', '2026-06-05', 1, 5, 4),
(7, 'Danke für die schnelle Rückgabe!', '2026-06-10', 0, 6, 7),
(8, 'Gerne, hat super geklappt.', '2026-06-10', 1, 7, 6),
(9, 'Ist das Buch noch in gutem Zustand?', '2026-06-15', 0, 8, 9),
(10, 'Ja, nur leichte Lesespuren.', '2026-06-15', 0, 9, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer`
--

CREATE TABLE `nutzer` (
  `idNutzer` int(11) NOT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  `Nachname` varchar(45) DEFAULT NULL,
  `Straße` varchar(45) DEFAULT NULL,
  `Hausnummer` varchar(45) DEFAULT NULL,
  `PLZ` int(11) DEFAULT NULL,
  `Stadt` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Passwort` varchar(255) DEFAULT NULL,
  `Latitude` decimal(9,6) DEFAULT NULL,
  `Longitude` decimal(9,6) DEFAULT NULL,
  `idBankverbindung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `nutzer`
--

INSERT INTO `nutzer` (`idNutzer`, `Vorname`, `Nachname`, `Straße`, `Hausnummer`, `PLZ`, `Stadt`, `Email`, `Passwort`, `Latitude`, `Longitude`, `idBankverbindung`) VALUES
(1, 'Lena', 'Schmidt', 'Hauptstraße', '12', 20095, 'Hamburg', 'lena.schmidt@mail.de', 'hashedpw1', 53.550341, 10.000654, 2),
(2, 'Tim', 'Weber', 'Gartenweg', '5', 22765, 'Hamburg', 'tim.weber@mail.de', 'hashedpw2', 53.560123, 9.953456, 3),
(3, 'Sarah', 'Klein', 'Bahnhofstraße', '8', 20354, 'Hamburg', 'sarah.klein@mail.de', 'hashedpw3', 53.563210, 9.985432, 4),
(4, 'Max', 'Becker', 'Lindenallee', '21', 22085, 'Hamburg', 'max.becker@mail.de', 'hashedpw4', 53.572345, 10.034567, 5),
(5, 'Julia', 'Hoffmann', 'Birkenweg', '3', 20457, 'Hamburg', 'julia.hoffmann@mail.de', 'hashedpw5', 53.545678, 9.998765, 6),
(6, 'Felix', 'Wolf', 'Schulstraße', '17', 22305, 'Hamburg', 'felix.wolf@mail.de', 'hashedpw6', 53.589012, 10.045678, 7),
(7, 'Anna', 'Schäfer', 'Kirchweg', '9', 20146, 'Hamburg', 'anna.schaefer@mail.de', 'hashedpw7', 53.567890, 9.976543, 8),
(8, 'Paul', 'Richter', 'Wiesenstraße', '14', 22529, 'Hamburg', 'paul.richter@mail.de', 'hashedpw8', 53.598765, 9.912345, 9),
(9, 'Lisa', 'Neumann', 'Feldweg', '6', 20255, 'Hamburg', 'lisa.neumann@mail.de', 'hashedpw9', 53.578901, 10.012345, 10),
(10, 'David', 'Vogel', 'Marktplatz', '2', 20457, 'Hamburg', 'david.vogel@mail.de', 'hashedpw10', 53.551234, 9.989012, 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzerrolle`
--

CREATE TABLE `nutzerrolle` (
  `idNutzerrolle` int(11) NOT NULL,
  `Rolle` enum('VERLEIHER','AUSLEIHER','ADMIN') DEFAULT NULL,
  `Gültig_ab` date DEFAULT NULL,
  `Gültig_bis` date DEFAULT NULL,
  `idNutzer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `nutzerrolle`
--

INSERT INTO `nutzerrolle` (`idNutzerrolle`, `Rolle`, `Gültig_ab`, `Gültig_bis`, `idNutzer`) VALUES
(1, 'VERLEIHER', '2026-01-01', NULL, 1),
(2, 'AUSLEIHER', '2026-01-01', NULL, 2),
(3, 'VERLEIHER', '2026-02-15', NULL, 3),
(4, 'AUSLEIHER', '2026-02-15', NULL, 4),
(5, 'ADMIN', '2026-01-01', NULL, 5),
(6, 'VERLEIHER', '2026-03-01', NULL, 6),
(7, 'AUSLEIHER', '2026-03-01', NULL, 7),
(8, 'VERLEIHER', '2026-03-10', NULL, 8),
(9, 'AUSLEIHER', '2026-03-10', NULL, 9),
(10, 'VERLEIHER', '2026-04-01', NULL, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sprache`
--

CREATE TABLE `sprache` (
  `idSprache` int(11) NOT NULL,
  `Sprache` varchar(45) DEFAULT NULL,
  `ISO_Code` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `sprache`
--

INSERT INTO `sprache` (`idSprache`, `Sprache`, `ISO_Code`) VALUES
(1, 'Deutsch', 'de'),
(2, 'Englisch', 'en'),
(3, 'Französisch', 'fr'),
(4, 'Spanisch', 'es'),
(5, 'Italienisch', 'it'),
(6, 'Niederländisch', 'nl'),
(7, 'Polnisch', 'pl'),
(8, 'Russisch', 'ru'),
(9, 'Türkisch', 'tr'),
(10, 'Schwedisch', 'sv');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `verlag`
--

CREATE TABLE `verlag` (
  `idVerlag` int(11) NOT NULL,
  `Verlagname` varchar(45) DEFAULT NULL,
  `Land` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `verlag`
--

INSERT INTO `verlag` (`idVerlag`, `Verlagname`, `Land`) VALUES
(1, 'Rowohlt', 'Deutschland'),
(2, 'Penguin Random House', 'USA'),
(3, 'Hanser', 'Deutschland'),
(4, 'Suhrkamp', 'Deutschland'),
(5, 'HarperCollins', 'USA'),
(6, 'Diogenes', 'Schweiz'),
(7, 'Fischer Verlag', 'Deutschland'),
(8, 'Gallimard', 'Frankreich'),
(9, 'Carlsen', 'Deutschland'),
(10, 'dtv', 'Deutschland');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warteliste`
--

CREATE TABLE `warteliste` (
  `idWarteliste` int(11) NOT NULL,
  `Position` int(11) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `idBuch` int(11) DEFAULT NULL,
  `idNutzer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `warteliste`
--

INSERT INTO `warteliste` (`idWarteliste`, `Position`, `Datum`, `idBuch`, `idNutzer`) VALUES
(1, 1, '2026-06-01', 1, 3),
(2, 2, '2026-06-02', 1, 5),
(3, 1, '2026-06-03', 2, 4),
(4, 1, '2026-06-05', 3, 6),
(5, 2, '2026-06-06', 3, 7),
(6, 1, '2026-06-08', 4, 8),
(7, 1, '2026-06-10', 5, 9),
(8, 1, '2026-06-12', 6, 10),
(9, 1, '2026-06-15', 7, 1),
(10, 1, '2026-06-18', 8, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zustand`
--

CREATE TABLE `zustand` (
  `idZustand` int(11) NOT NULL,
  `Beschreibung` varchar(45) DEFAULT NULL,
  `SchadensgradBerechnet` int(11) DEFAULT NULL,
  `EntschädigungBerechnet` tinyint(1) DEFAULT NULL,
  `Fleck` tinyint(1) DEFAULT NULL,
  `Eselsohr` tinyint(1) DEFAULT NULL,
  `Seite_eingerissen` tinyint(1) DEFAULT NULL,
  `reingeschrieben` tinyint(1) DEFAULT NULL,
  `Seite_fehlen` tinyint(1) DEFAULT NULL,
  `idNutzer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zustand`
--

INSERT INTO `zustand` (`idZustand`, `Beschreibung`, `SchadensgradBerechnet`, `EntschädigungBerechnet`, `Fleck`, `Eselsohr`, `Seite_eingerissen`, `reingeschrieben`, `Seite_fehlen`, `idNutzer`) VALUES
(1, 'Neuwertig', 0, 0, 0, 0, 0, 0, 0, 1),
(2, 'Gut, leichte Lesespuren', 1, 0, 0, 1, 0, 0, 0, 2),
(3, 'Gebraucht, Eselsohren', 2, 0, 0, 1, 0, 0, 0, 3),
(4, 'Stark gebraucht, Flecken', 3, 1, 1, 1, 0, 0, 0, 4),
(5, 'Beschädigt, Seite eingerissen', 4, 1, 0, 0, 1, 0, 0, 5),
(6, 'Neuwertig', 0, 0, 0, 0, 0, 0, 0, 6),
(7, 'Gut, leichte Lesespuren', 1, 0, 0, 1, 0, 0, 0, 7),
(8, 'Beschriftet im Innentitel', 2, 0, 0, 0, 0, 1, 0, 8),
(9, 'Seiten fehlen', 5, 1, 0, 0, 0, 0, 1, 9),
(10, 'Neuwertig', 0, 0, 0, 0, 0, 0, 0, 10);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ausleihe`
--
ALTER TABLE `ausleihe`
  ADD PRIMARY KEY (`idAusleihe`),
  ADD KEY `idAusleihstatus` (`idAusleihstatus`),
  ADD KEY `idAusleiher` (`idAusleiher`),
  ADD KEY `idExemplar` (`idExemplar`);

--
-- Indizes für die Tabelle `ausleihstatus`
--
ALTER TABLE `ausleihstatus`
  ADD PRIMARY KEY (`idAusleihstatus`);

--
-- Indizes für die Tabelle `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indizes für die Tabelle `bankverbindung`
--
ALTER TABLE `bankverbindung`
  ADD PRIMARY KEY (`idBankverbindung`);

--
-- Indizes für die Tabelle `bewertung`
--
ALTER TABLE `bewertung`
  ADD PRIMARY KEY (`idBewertung`),
  ADD KEY `idBuch` (`idBuch`),
  ADD KEY `idBewerter` (`idBewerter`),
  ADD KEY `idBewerteter` (`idBewerteter`);

--
-- Indizes für die Tabelle `buch`
--
ALTER TABLE `buch`
  ADD PRIMARY KEY (`idBuch`),
  ADD KEY `idVerlag` (`idVerlag`),
  ADD KEY `idGenre` (`idGenre`),
  ADD KEY `idAutor` (`idAutor`),
  ADD KEY `idSprache` (`idSprache`);

--
-- Indizes für die Tabelle `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`idExemplar`),
  ADD KEY `idBuch` (`idBuch`),
  ADD KEY `idBesitzer` (`idBesitzer`),
  ADD KEY `idZustand` (`idZustand`);

--
-- Indizes für die Tabelle `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`idGenre`);

--
-- Indizes für die Tabelle `nachricht`
--
ALTER TABLE `nachricht`
  ADD PRIMARY KEY (`idNachricht`),
  ADD KEY `idEmpänger` (`idEmpänger`),
  ADD KEY `idSender` (`idSender`);

--
-- Indizes für die Tabelle `nutzer`
--
ALTER TABLE `nutzer`
  ADD PRIMARY KEY (`idNutzer`),
  ADD KEY `idBankverbindung` (`idBankverbindung`);

--
-- Indizes für die Tabelle `nutzerrolle`
--
ALTER TABLE `nutzerrolle`
  ADD PRIMARY KEY (`idNutzerrolle`),
  ADD KEY `idNutzer` (`idNutzer`);

--
-- Indizes für die Tabelle `sprache`
--
ALTER TABLE `sprache`
  ADD PRIMARY KEY (`idSprache`);

--
-- Indizes für die Tabelle `verlag`
--
ALTER TABLE `verlag`
  ADD PRIMARY KEY (`idVerlag`);

--
-- Indizes für die Tabelle `warteliste`
--
ALTER TABLE `warteliste`
  ADD PRIMARY KEY (`idWarteliste`),
  ADD KEY `idBuch` (`idBuch`),
  ADD KEY `idBenutzenden` (`idNutzer`);

--
-- Indizes für die Tabelle `zustand`
--
ALTER TABLE `zustand`
  ADD PRIMARY KEY (`idZustand`),
  ADD KEY `idNutzer` (`idNutzer`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ausleihe`
--
ALTER TABLE `ausleihe`
  MODIFY `idAusleihe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `ausleihstatus`
--
ALTER TABLE `ausleihstatus`
  MODIFY `idAusleihstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `autor`
--
ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `bankverbindung`
--
ALTER TABLE `bankverbindung`
  MODIFY `idBankverbindung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `bewertung`
--
ALTER TABLE `bewertung`
  MODIFY `idBewertung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `buch`
--
ALTER TABLE `buch`
  MODIFY `idBuch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `exemplar`
--
ALTER TABLE `exemplar`
  MODIFY `idExemplar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `genre`
--
ALTER TABLE `genre`
  MODIFY `idGenre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `nachricht`
--
ALTER TABLE `nachricht`
  MODIFY `idNachricht` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `nutzer`
--
ALTER TABLE `nutzer`
  MODIFY `idNutzer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `nutzerrolle`
--
ALTER TABLE `nutzerrolle`
  MODIFY `idNutzerrolle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `sprache`
--
ALTER TABLE `sprache`
  MODIFY `idSprache` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `verlag`
--
ALTER TABLE `verlag`
  MODIFY `idVerlag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `warteliste`
--
ALTER TABLE `warteliste`
  MODIFY `idWarteliste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `zustand`
--
ALTER TABLE `zustand`
  MODIFY `idZustand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `ausleihe`
--
ALTER TABLE `ausleihe`
  ADD CONSTRAINT `ausleihe_ibfk_1` FOREIGN KEY (`idAusleihstatus`) REFERENCES `ausleihstatus` (`idAusleihstatus`),
  ADD CONSTRAINT `ausleihe_ibfk_2` FOREIGN KEY (`idAusleiher`) REFERENCES `nutzer` (`idNutzer`),
  ADD CONSTRAINT `ausleihe_ibfk_3` FOREIGN KEY (`idExemplar`) REFERENCES `exemplar` (`idExemplar`);

--
-- Constraints der Tabelle `bewertung`
--
ALTER TABLE `bewertung`
  ADD CONSTRAINT `bewertung_ibfk_1` FOREIGN KEY (`idBuch`) REFERENCES `buch` (`idBuch`),
  ADD CONSTRAINT `bewertung_ibfk_2` FOREIGN KEY (`idBewerter`) REFERENCES `nutzer` (`idNutzer`),
  ADD CONSTRAINT `bewertung_ibfk_3` FOREIGN KEY (`idBewerteter`) REFERENCES `nutzer` (`idNutzer`);

--
-- Constraints der Tabelle `buch`
--
ALTER TABLE `buch`
  ADD CONSTRAINT `buch_ibfk_1` FOREIGN KEY (`idVerlag`) REFERENCES `verlag` (`idVerlag`),
  ADD CONSTRAINT `buch_ibfk_2` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`idGenre`),
  ADD CONSTRAINT `buch_ibfk_7` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  ADD CONSTRAINT `buch_ibfk_8` FOREIGN KEY (`idSprache`) REFERENCES `sprache` (`idSprache`);

--
-- Constraints der Tabelle `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `exemplar_ibfk_1` FOREIGN KEY (`idBuch`) REFERENCES `buch` (`idBuch`),
  ADD CONSTRAINT `exemplar_ibfk_2` FOREIGN KEY (`idBesitzer`) REFERENCES `nutzer` (`idNutzer`),
  ADD CONSTRAINT `exemplar_ibfk_3` FOREIGN KEY (`idZustand`) REFERENCES `zustand` (`idZustand`);

--
-- Constraints der Tabelle `nachricht`
--
ALTER TABLE `nachricht`
  ADD CONSTRAINT `nachricht_ibfk_1` FOREIGN KEY (`idEmpänger`) REFERENCES `nutzer` (`idNutzer`),
  ADD CONSTRAINT `nachricht_ibfk_2` FOREIGN KEY (`idSender`) REFERENCES `nutzer` (`idNutzer`);

--
-- Constraints der Tabelle `nutzer`
--
ALTER TABLE `nutzer`
  ADD CONSTRAINT `nutzer_ibfk_1` FOREIGN KEY (`idBankverbindung`) REFERENCES `bankverbindung` (`idBankverbindung`);

--
-- Constraints der Tabelle `nutzerrolle`
--
ALTER TABLE `nutzerrolle`
  ADD CONSTRAINT `nutzerrolle_ibfk_1` FOREIGN KEY (`idNutzer`) REFERENCES `nutzer` (`idNutzer`);

--
-- Constraints der Tabelle `warteliste`
--
ALTER TABLE `warteliste`
  ADD CONSTRAINT `warteliste_ibfk_1` FOREIGN KEY (`idBuch`) REFERENCES `buch` (`idBuch`),
  ADD CONSTRAINT `warteliste_ibfk_2` FOREIGN KEY (`idNutzer`) REFERENCES `nutzer` (`idNutzer`);

--
-- Constraints der Tabelle `zustand`
--
ALTER TABLE `zustand`
  ADD CONSTRAINT `zustand_ibfk_1` FOREIGN KEY (`idNutzer`) REFERENCES `nutzer` (`idNutzer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
