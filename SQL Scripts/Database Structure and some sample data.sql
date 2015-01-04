-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2015 at 07:42 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `smash`
--

-- --------------------------------------------------------

--
-- Table structure for table `character`
--

CREATE TABLE IF NOT EXISTS `character` (
`character_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `character`
--

INSERT INTO `character` (`character_id`, `name`) VALUES
(1, 'Mario'),
(2, 'Luigi'),
(3, 'Peach'),
(4, 'Bowser'),
(5, 'Yoshi'),
(6, 'Rosalina & Luma'),
(7, 'Bowser Jr/Alts'),
(8, 'Wario'),
(9, 'Mr Game & Watch'),
(10, 'Donkey Kong'),
(11, 'Diddy Kong'),
(12, 'Link'),
(13, 'Zelda '),
(14, 'Shiek'),
(15, 'Ganondorf'),
(16, 'Toon Link'),
(17, 'Samus'),
(18, 'Zero Suit Samus'),
(19, 'Pit'),
(20, 'Dark Pit'),
(21, 'Palutena'),
(22, 'Marth'),
(23, 'Lucina'),
(24, 'Ike'),
(25, 'Robin'),
(26, 'Kirby'),
(27, 'Dedede'),
(28, 'Metaknight'),
(29, 'Little Mac'),
(30, 'Fox'),
(31, 'Falco'),
(32, 'Pikachu'),
(33, 'Charizard'),
(34, 'Lucario'),
(35, 'Jigglypuff'),
(36, 'Greninja'),
(37, 'Dog Hunt Duo'),
(38, 'ROB'),
(39, 'Ness'),
(40, 'Captain Falcon'),
(41, 'Villager'),
(42, 'Pikmin & Olimar'),
(43, 'Wii Fit Trainer'),
(44, 'Dr Mario'),
(45, 'Shulk'),
(46, 'Pacman'),
(47, 'Megaman'),
(48, 'Sonic'),
(49, 'Mii Fighters'),
(50, 'Mewtwo');

-- --------------------------------------------------------

--
-- Table structure for table `character_elo`
--

CREATE TABLE IF NOT EXISTS `character_elo` (
`character_elo_id` int(11) NOT NULL,
  `player_game_id` int(11) NOT NULL,
  `elo_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
`game_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `winner_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`game_id`, `stage_id`, `match_id`, `winner_id`) VALUES
(1, 48, 1, 1),
(2, 48, 1, 1),
(3, 68, 1, 2),
(4, 71, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE IF NOT EXISTS `match` (
`match_id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `software_id` int(11) NOT NULL,
  `winner_id` int(11) NOT NULL,
  `winner_ratio` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`match_id`, `timestamp`, `location`, `software_id`, `winner_id`, `winner_ratio`) VALUES
(1, '2015-01-03 16:48:00', 'The Bungalow', 1, 1, 0.6);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
`player_id` int(11) NOT NULL,
  `firstname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `firstname`, `surname`, `handle`) VALUES
(1, 'Arden', 'O''Connell', 'MrBlenis'),
(2, 'Liam', 'Stevens', 'Lime'),
(3, 'Callum', 'Press', 'Bruce'),
(4, 'David', 'Bishop', 'Stole'),
(5, 'Phil', 'Lantzsch', 'Clit'),
(6, 'Nick', 'Wright', 'Sweating'),
(7, 'Lachlan', 'Firth', 'Lef'),
(8, 'Isaac', 'Bretherton', 'Bear'),
(9, 'Mitchell', 'Dransfield', 'Dope'),
(10, 'Bradley', 'Stoner', 'Beardley');

-- --------------------------------------------------------

--
-- Table structure for table `player_elo`
--

CREATE TABLE IF NOT EXISTS `player_elo` (
`player_elo_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `elo_rating` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `player_elo`
--

INSERT INTO `player_elo` (`player_elo_id`, `match_id`, `elo_rating`, `player_id`) VALUES
(1, 1, 1584, 1),
(2, 1, 1513, 2);

-- --------------------------------------------------------

--
-- Table structure for table `player_game`
--

CREATE TABLE IF NOT EXISTS `player_game` (
`player_game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `character_elo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `player_game`
--

INSERT INTO `player_game` (`player_game_id`, `player_id`, `character_id`, `game_id`, `character_elo`) VALUES
(2, 1, 47, 2, 1454),
(3, 2, 40, 2, 1446),
(4, 1, 18, 3, 1446),
(5, 2, 40, 3, 1450),
(6, 1, 47, 4, 1458),
(7, 2, 40, 4, 1446);

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE IF NOT EXISTS `software` (
`software_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `platform` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `software`
--

INSERT INTO `software` (`software_id`, `name`, `platform`) VALUES
(1, 'Smash Bros', 'Wii U');

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
`stage_id` int(11) NOT NULL,
  `name` varchar(21) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`stage_id`, `name`) VALUES
(49, 'Battlefield'),
(58, 'Boxing Ring'),
(72, 'Bridge of Eldin'),
(64, 'Castle Siege'),
(71, 'Delfino Plaza'),
(55, 'Dr Wily''s Castle'),
(48, 'Final Destination'),
(53, 'Fire Emblem Coliseum '),
(63, 'Flat Zone'),
(66, 'Halberd'),
(67, 'Luigi''s Mansion'),
(70, 'Lylat Cruise'),
(54, 'Mario Kart 8 Circuit'),
(68, 'Mario Kart Circuit (B'),
(74, 'Norfair'),
(50, 'Omega (any stage)'),
(65, 'Onett'),
(59, 'Orbital Gate Assault'),
(56, 'Pac-Land'),
(57, 'Pilot Wings'),
(69, 'Pokemon Stadium 2'),
(62, 'Port Town Aero Drive'),
(61, 'Smashville (Animal Cr'),
(73, 'Temple'),
(52, 'Town and City (Animal'),
(51, 'Yoshi''s Island'),
(60, 'Yoshi''s Wooly World');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `character`
--
ALTER TABLE `character`
 ADD PRIMARY KEY (`character_id`);

--
-- Indexes for table `character_elo`
--
ALTER TABLE `character_elo`
 ADD PRIMARY KEY (`character_elo_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
 ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
 ADD PRIMARY KEY (`match_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`player_id`), ADD UNIQUE KEY `handle` (`handle`);

--
-- Indexes for table `player_elo`
--
ALTER TABLE `player_elo`
 ADD PRIMARY KEY (`player_elo_id`);

--
-- Indexes for table `player_game`
--
ALTER TABLE `player_game`
 ADD PRIMARY KEY (`player_game_id`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
 ADD PRIMARY KEY (`software_id`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
 ADD PRIMARY KEY (`stage_id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `character`
--
ALTER TABLE `character`
MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `character_elo`
--
ALTER TABLE `character_elo`
MODIFY `character_elo_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `player_elo`
--
ALTER TABLE `player_elo`
MODIFY `player_elo_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `player_game`
--
ALTER TABLE `player_game`
MODIFY `player_game_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `software`
--
ALTER TABLE `software`
MODIFY `software_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
MODIFY `stage_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
