-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jul 01, 2023 at 07:49 PM
-- Server version: 10.10.3-MariaDB-1:10.10.3+maria~ubu2204
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wbijam`
--

-- --------------------------------------------------------

--
-- Table structure for table `odcinki`
--

CREATE TABLE `odcinki` (
  `id` uuid NOT NULL,
  `seria` int(128) NOT NULL,
  `sezon` int(32) NOT NULL DEFAULT 0,
  `odcinek` int(32) NOT NULL DEFAULT 0,
  `opis` varchar(2048) DEFAULT NULL,
  `czas_trwania` varchar(128) DEFAULT NULL,
  `data_premiery` varchar(128) DEFAULT NULL,
  `tytul_pl` varchar(128) DEFAULT NULL,
  `tytul_jp` varchar(256) DEFAULT NULL,
  `odtwarzacze` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`odtwarzacze`)),
  `ostatni` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `odcinki`
--

INSERT INTO `odcinki` (`id`, `seria`, `sezon`, `odcinek`, `opis`, `czas_trwania`, `data_premiery`, `tytul_pl`, `tytul_jp`, `odtwarzacze`, `ostatni`) VALUES
('f2c04a1f-1811-11ee-839f-0242ac060003', 1, 1, 1, NULL, NULL, NULL, 'Świat mieczy', '', '[]', 0),
('8b13f3da-1812-11ee-839f-0242ac060003', 2, 1, 1, 'Do Gorou Amemiyi, młodego ginekologa pracującego w małej, wiejskiej klinice, zgłasza się dziewczyna w ciąży. Gdy lekarz rozpoznaje w niej wschodzącą gwiazdę muzyki i swoją ulubioną idolkę, Ai Hoshino, postanawia odebrać poród i dotrzymać tajemnicy, by uchronić nastolatkę przed konsekwencjami z rąk bezwzględnego show-biznesu. Niestety, chwilę później dochodzi do tragicznych zdarzeń, w wyniku których wprawione zostają w ruch potężne tryby przeznaczenia...', 'około 90 minut', '12.04.2023', 'Matka i dzieci', 'mother and children (mother and children)', '[\"2cadc53e-1805-11ee-839f-0242ac060003\"]', 0),
('bb829be5-cef2-4e5f-84ca-088b24da2b80', 2, 1, 2, 'Lekarz ginekologii, Gorou, oraz jego chora na raka pacjentka, dwunastoletnia Sarina, odradzają się jako dzieci swojej idolki, jednak nadal posiadają wspomnienia z poprzedniego życia. Gdy ginie ich ukochana matka, Ruby postanawia pójść w jej ślady, a Aqua zemścić się na osobie odpowiedzialnej za jej cierpienie. Od śmierci Ai mija dziesięć lat. Nowe wcielenie Sariny próbuje dostać się do show-biznesu, jednak zostaje pozbawiona tej szansy przez swojego brata bliźniaka. Mimo tego tęsknota dziewczyny za matką nie ustaje...', 'około 25 minut', '19.04.2023', 'Trzecia opcja', '三つ目の選択肢 (mittsume no sentakushi)', '[]', 0),
('a6ec8e24-4ab3-43ab-b5d1-2bde20a60481', 2, 1, 4, 'Aquamarine, który postanawia wrócić do aktorstwa, razem z Kaną udaje się na plan Słodkiego Dzisiaj, gdzie zdobywa próbki DNA Kaburagiego. Czy mężczyzna, którego numer figurował w starym telefonie Ai, okaże się być biologicznym ojcem bliźniaków? Chłopak jest rozczarowany fatalnym występem głównego aktora oraz reżyserami, którzy przykładają do tego rękę. I wtedy jego gra całkowicie odmienia scenę...', 'około 25 minut', '03.05.2023', 'Aktor', '役者 (yakusha)', '[]', 0),
('a6e64057-d1f0-4641-88c5-5da4659aee6b', 2, 1, 5, 'Choć okazuje się, że producent serialu, w którym zagrał Aqua, nie jest jego biologicznym ojcem, chłopak zdobywa nowy trop. W zamian za informacje musi jednak wziąć udział w randkowym reality show. W tym samym czasie jego siostra bliźniaczka, Ruby, która chce jak najszybciej rozpocząć swoją karierę idolki, próbuje zrekrutować do zespołu Kanę. Choć dziewczyna widzi w projekcie potencjał, dostrzega również ryzyko z nim związane i próbuje odmówić. Jednak wtedy zostaje namiętnie namówiona przez Aquę?!', 'około 25 minut', '10.05.2023', 'Randkowe reality show', '恋愛リアリティショー (ren\'ai riariti shou)', '[]', 0),
('894209fa-9f73-4c6e-8295-a22e894b2292', 2, 1, 3, 'Aqua, po latach rozbratu, ponownie spotyka Kanę, byłą genialną aktorkę dziecięcą. Początkowo odrzuca jej propozycję wystąpienia w serialu telewizyjnym na podstawie mangi, jednak gdy tylko słyszy nazwisko producenta, natychmiast zmienia zdanie. Przypomina sobie bowiem, że widział numer tego człowieka w telefonie komórkowym swojej tragicznej zmarłej matki...', 'około 25 minut', '26.04.2023', 'Drama na podstawie mangi', '漫画原作ドラマ (manga gensaku dorama)', '[]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `odtwarzacze`
--

CREATE TABLE `odtwarzacze` (
  `id` uuid NOT NULL,
  `link` varchar(512) NOT NULL,
  `seria` int(128) NOT NULL,
  `typ` varchar(32) NOT NULL,
  `oficjalny` tinyint(1) NOT NULL DEFAULT 0,
  `odcinek` int(32) NOT NULL,
  `sezon` int(32) NOT NULL,
  `tlumaczenie` varchar(128) DEFAULT NULL,
  `jakosc` varchar(128) NOT NULL DEFAULT '[HD]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `odtwarzacze`
--

INSERT INTO `odtwarzacze` (`id`, `link`, `seria`, `typ`, `oficjalny`, `odcinek`, `sezon`, `tlumaczenie`, `jakosc`) VALUES
('2cadc53e-1805-11ee-839f-0242ac060003', 'https://www.cda.pl/video/1407430840', 2, 'cda', 0, 1, 1, '[TMJ] Oozora', '[FHD]'),
('5afa5632-4794-4f56-8c18-5aefb0793585', 'https://www.cda.pl/video/14086808fb', 2, 'cda', 0, 2, 1, '[TMJ] Oozora', '[FHD]'),
('8ebbd6cc-3587-4aa2-9993-a9078a584aa3', 'https://www.cda.pl/video/143730732c', 2, 'cda', 0, 5, 1, '[TMJ] Oozora', '[FHD]');

-- --------------------------------------------------------

--
-- Table structure for table `serie`
--

CREATE TABLE `serie` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(512) NOT NULL,
  `link` varchar(512) DEFAULT NULL,
  `nazwa_jp` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serie`
--

INSERT INTO `serie` (`id`, `nazwa`, `link`, `nazwa_jp`) VALUES
(1, 'Sword Art Online', NULL, ''),
(2, 'Oshi no Ko', NULL, ''),
(3, '86', NULL, ''),
(4, 'Accel World', NULL, ''),
(5, 'Akudama Drive', NULL, ''),
(6, 'Appare Ranman', NULL, ''),
(7, 'Arifureta', NULL, ''),
(8, 'Assassins Pride', NULL, ''),
(9, 'Black Clover', NULL, ''),
(10, 'Bleach', NULL, ''),
(11, 'Blue Lock', NULL, ''),
(12, 'Chainsaw Man', NULL, ''),
(13, 'Clannad', NULL, ''),
(14, 'Code Geass', NULL, ''),
(15, 'Danmachi', NULL, ''),
(16, 'Darwin\'s Game', NULL, ''),
(17, 'Decadence', NULL, ''),
(18, 'Dr. Stone', NULL, ''),
(19, 'Enen no Shouboutai', NULL, ''),
(20, 'Fairy Tail', NULL, ''),
(21, 'Fumetsu no Anata e', NULL, ''),
(22, 'Full Dive', NULL, ''),
(23, 'Genkoku', NULL, ''),
(24, 'Gintama', NULL, ''),
(25, 'Gleipnir', NULL, ''),
(26, 'Goblin Slayer', NULL, ''),
(27, 'Hachinan', NULL, ''),
(28, 'HunterxHunter', NULL, ''),
(29, 'Idaten', NULL, ''),
(30, 'Infinite Dendrogram', NULL, ''),
(31, 'Jigokuraku', NULL, ''),
(32, 'Jujutsu Kaisen', NULL, ''),
(33, 'Kami no Tou', NULL, ''),
(34, 'Kenja no Mago', NULL, ''),
(35, 'Kimetsu no Yaiba', NULL, ''),
(36, 'Kimisen', NULL, ''),
(37, 'Kill la Kill', NULL, ''),
(38, 'Kyokou Suiri (In/Spectre)', NULL, ''),
(39, 'Log Horizon', NULL, ''),
(40, 'Made in Abyss', NULL, ''),
(41, 'Magi', NULL, ''),
(42, 'Mashle', NULL, ''),
(43, 'Mushoku Tensei', NULL, ''),
(44, 'Naruto', NULL, ''),
(45, 'No game no life', NULL, ''),
(46, 'One Piece', NULL, ''),
(47, 'Ousama Ranking', NULL, ''),
(48, 'Overlord', NULL, ''),
(49, 'Plunderer', NULL, ''),
(50, 'Re:Zero', NULL, ''),
(51, 'Sentouin Hakenshimasu', NULL, ''),
(52, 'Shinchou Yuusha', NULL, ''),
(53, 'Shingeki no Kyojin', NULL, ''),
(54, 'Solo Leveling', NULL, ''),
(55, 'Somali to Mori no Kamisama', NULL, ''),
(56, 'SpyxFamily', NULL, ''),
(57, 'Suisei no Gargantia', NULL, ''),
(58, 'Tate no Yuusha no Niragari', NULL, ''),
(59, 'Tensei Shitara Slime Datta Ken', NULL, ''),
(60, 'The God of High School', NULL, ''),
(61, 'Yakusoku no Neverland', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `typy_odtwarzaczy`
--

CREATE TABLE `typy_odtwarzaczy` (
  `id` int(11) NOT NULL,
  `typ` varchar(128) NOT NULL,
  `regex` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `typy_odtwarzaczy`
--

INSERT INTO `typy_odtwarzaczy` (`id`, `typ`, `regex`) VALUES
(1, 'cda', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odcinki`
--
ALTER TABLE `odcinki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seria` (`seria`),
  ADD KEY `sezon` (`sezon`),
  ADD KEY `odcinek` (`odcinek`);

--
-- Indexes for table `odtwarzacze`
--
ALTER TABLE `odtwarzacze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seria` (`seria`),
  ADD KEY `typ` (`typ`),
  ADD KEY `odcinek` (`odcinek`),
  ADD KEY `sezon` (`sezon`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nazwa` (`nazwa`);

--
-- Indexes for table `typy_odtwarzaczy`
--
ALTER TABLE `typy_odtwarzaczy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typ` (`typ`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `typy_odtwarzaczy`
--
ALTER TABLE `typy_odtwarzaczy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `odcinki`
--
ALTER TABLE `odcinki`
  ADD CONSTRAINT `odcinki_ibfk_1` FOREIGN KEY (`seria`) REFERENCES `serie` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `odtwarzacze`
--
ALTER TABLE `odtwarzacze`
  ADD CONSTRAINT `odtwarzacze_ibfk_2` FOREIGN KEY (`typ`) REFERENCES `typy_odtwarzaczy` (`typ`) ON UPDATE CASCADE,
  ADD CONSTRAINT `odtwarzacze_ibfk_3` FOREIGN KEY (`seria`) REFERENCES `serie` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `odtwarzacze_ibfk_4` FOREIGN KEY (`sezon`) REFERENCES `odcinki` (`sezon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `odtwarzacze_ibfk_5` FOREIGN KEY (`odcinek`) REFERENCES `odcinki` (`odcinek`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
