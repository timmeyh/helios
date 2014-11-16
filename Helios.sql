-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 16 nov 2014 om 17:33
-- Serverversie: 5.5.40
-- PHP-Versie: 5.4.34-0+deb7u1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `Helios`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cpu`
--

DROP TABLE IF EXISTS `cpu`;
CREATE TABLE IF NOT EXISTS `cpu` (
  `objid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) NOT NULL,
  `speed` int(11) NOT NULL,
  `server_objid` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `server_objid` (`server_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ram`
--

DROP TABLE IF EXISTS `ram`;
CREATE TABLE IF NOT EXISTS `ram` (
  `objid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) NOT NULL,
  `speed` int(11) NOT NULL,
  `server_objid` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `server_objid` (`server_objid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `server`
--

DROP TABLE IF EXISTS `server`;
CREATE TABLE IF NOT EXISTS `server` (
  `objid` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `fqdn` varchar(100) NOT NULL,
  `diskspace` int(11) NOT NULL,
  `ram_banks` int(11) NOT NULL,
  `ips` varchar(500) NOT NULL,
  `location` varchar(200) NOT NULL,
  `user` varchar(20) NOT NULL,
  `key` varchar(2000) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `cpu`
--
ALTER TABLE `cpu`
  ADD CONSTRAINT `cpu_ibfk_1` FOREIGN KEY (`server_objid`) REFERENCES `server` (`objid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `ram`
--
ALTER TABLE `ram`
  ADD CONSTRAINT `ram_ibfk_1` FOREIGN KEY (`server_objid`) REFERENCES `server` (`objid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
