-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Kwi 2023, 22:25
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `komis`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admini`
--

CREATE TABLE `admini` (
  `id_admina` int(5) NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `telefon` int(9) NOT NULL,
  `email` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `data_zatrudnienia` date NOT NULL,
  `login` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `admini`
--

INSERT INTO `admini` (`id_admina`, `imie`, `nazwisko`, `data_urodzenia`, `telefon`, `email`, `data_zatrudnienia`, `login`, `haslo`) VALUES
(1, 'Adam', 'Janiszewski', '2000-04-04', 693077309, 'adamj@op.pl', '2023-01-09', 'adamjanis', '123321'),
(2, 'Arkadiusz', 'Woźniak', '1998-07-03', 890567812, 'arekwozniak@wp.pl', '2020-05-04', 'arekasd', 'asd321'),
(3, 'Jarosław', 'Filipkowski', '1989-04-09', 567456299, 'jffirma@gmail.com', '2018-01-02', 'jaroslaw', 'jarek123'),
(4, 'Marcin', 'Nowak', '1980-09-20', 636519123, 'marcin.nowak@o2.pl', '2019-10-01', 'admin123', 'admin0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auta`
--

CREATE TABLE `auta` (
  `id_auta` int(5) NOT NULL,
  `marka` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `model` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `rok_produkcji` int(4) NOT NULL,
  `kolor` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `silnik` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `pojemnosc_silnika` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `kraj_pochodzenia` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `id_komisu` int(5) NOT NULL,
  `id_admina` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `auta`
--

INSERT INTO `auta` (`id_auta`, `marka`, `model`, `rok_produkcji`, `kolor`, `silnik`, `pojemnosc_silnika`, `kraj_pochodzenia`, `id_komisu`, `id_admina`) VALUES
(1, 'BMW', 'X5', 2021, 'czarny', 'diesel', '3.0 l', 'Niemcy', 1, 3),
(2, 'Opel', 'Astra', 2017, 'szary', 'diesel', '1.6 l', 'Polska', 2, 1),
(3, 'Seat', 'Leon', 2015, 'niebieski', 'benzyna', '1.4 l', 'Hiszpania', 4, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komisy`
--

CREATE TABLE `komisy` (
  `id_komisu` int(5) NOT NULL,
  `miasto` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `ulica` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `numer_budynku` int(10) NOT NULL,
  `telefon` int(9) NOT NULL,
  `kod_pocztowy` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `data_otwarcia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `komisy`
--

INSERT INTO `komisy` (`id_komisu`, `miasto`, `ulica`, `numer_budynku`, `telefon`, `kod_pocztowy`, `data_otwarcia`) VALUES
(1, 'Białystok', 'Kopernika', 5, 567456289, '15-003', '2020-02-05'),
(2, 'Białystok', 'Wiejska', 20, 789352873, '15-018', '2010-06-09'),
(3, 'Olsztyn', 'Kwiatowa', 66, 678220123, '10-011', '2023-01-01'),
(4, 'Warszawa', 'Transportowa', 11, 666519099, '00-078', '2020-01-01');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admini`
--
ALTER TABLE `admini`
  ADD PRIMARY KEY (`id_admina`);

--
-- Indeksy dla tabeli `auta`
--
ALTER TABLE `auta`
  ADD PRIMARY KEY (`id_auta`),
  ADD KEY `id_komisu` (`id_komisu`),
  ADD KEY `id_admina` (`id_admina`);

--
-- Indeksy dla tabeli `komisy`
--
ALTER TABLE `komisy`
  ADD PRIMARY KEY (`id_komisu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `admini`
--
ALTER TABLE `admini`
  MODIFY `id_admina` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `auta`
--
ALTER TABLE `auta`
  MODIFY `id_auta` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `komisy`
--
ALTER TABLE `komisy`
  MODIFY `id_komisu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `auta`
--
ALTER TABLE `auta`
  ADD CONSTRAINT `auta_ibfk_1` FOREIGN KEY (`id_komisu`) REFERENCES `komisy` (`id_komisu`),
  ADD CONSTRAINT `auta_ibfk_2` FOREIGN KEY (`id_admina`) REFERENCES `admini` (`id_admina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
