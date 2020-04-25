-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Ápr 21. 16:30
-- Kiszolgáló verziója: 10.4.11-MariaDB
-- PHP verzió: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webshop_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adminok`
--

CREATE TABLE `adminok` (
  `felh_id` int(10) UNSIGNED NOT NULL,
  `felh_nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `jelszo` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `termek_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felh_id` int(10) UNSIGNED NOT NULL,
  `felh_nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `jelszo` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `vnev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `knev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `tel_szam` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `varos` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `utca` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `hazszam` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `szuldat` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `kedvenc_kategoriak` varchar(30) COLLATE utf8_hungarian_ci,
  `kedvenc_kategoriak_2` varchar(30) COLLATE utf8_hungarian_ci 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `kosar_id` int(10) UNSIGNED NOT NULL,
  `felh_id` int(10) UNSIGNED NOT NULL,
  `termek_id` int(10) UNSIGNED NOT NULL,
  `tarolt_termekek` varchar(500) COLLATE utf8_hungarian_ci NOT NULL,
  `vegosszeg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `licitek`
--

CREATE TABLE `licitek` (
  `termek_id` int(10) UNSIGNED NOT NULL,
  `min_ar` int(10) UNSIGNED NOT NULL,
  `akt_licit_ar` int(10) UNSIGNED NOT NULL,
  `licit_id` int(10) UNSIGNED NOT NULL,
  `idotartam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `termek_id` int(10) UNSIGNED NOT NULL,
  `nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `kategoria` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `leiras` varchar(200) COLLATE utf8_hungarian_ci NOT NULL,
  `allapot` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(10) UNSIGNED NOT NULL,
  `licit_id` int(10) UNSIGNED NOT NULL,
  `kep1` mediumblob NOT NULL,
  `kep2` mediumblob NOT NULL,
  `kep3` mediumblob NOT NULL,
  `kep4` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlas`
--

CREATE TABLE `vasarlas` (
  `kosar_id` int(10) UNSIGNED NOT NULL,
  `fizetesi_mod` varchar(30) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adminok`
--
ALTER TABLE `adminok`
  ADD KEY `felh_id` (`felh_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felh_id`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`kosar_id`),
  ADD KEY `felh_id` (`felh_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `licitek`
--
ALTER TABLE `licitek`
  ADD PRIMARY KEY (`licit_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`termek_id`),
  ADD KEY `licit_id` (`licit_id`);

--
-- A tábla indexei `vasarlas`
--
ALTER TABLE `vasarlas`
  ADD KEY `kosar_id` (`kosar_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kosar`
--
ALTER TABLE `kosar`
  MODIFY `kosar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `licitek`
--
ALTER TABLE `licitek`
  MODIFY `licit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `termek_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `adminok`
--
ALTER TABLE `adminok`
  ADD CONSTRAINT `fk6` FOREIGN KEY (`felh_id`) REFERENCES `felhasznalok` (`felh_id`),
  ADD CONSTRAINT `fk7` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`termek_id`);

--
-- Megkötések a táblához `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `fk` FOREIGN KEY (`felh_id`) REFERENCES `felhasznalok` (`felh_id`),
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`termek_id`);

--
-- Megkötések a táblához `licitek`
--
ALTER TABLE `licitek`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`termek_id`);

--
-- Megkötések a táblához `termekek`
--
ALTER TABLE `termekek`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`licit_id`) REFERENCES `licitek` (`licit_id`);

--
-- Megkötések a táblához `vasarlas`
--
ALTER TABLE `vasarlas`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`kosar_id`) REFERENCES `kosar` (`kosar_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
