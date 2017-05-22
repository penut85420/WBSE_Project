-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-05-22 18:16:15
-- 伺服器版本: 10.1.21-MariaDB
-- PHP 版本： 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `yelp`
--

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

CREATE TABLE `account` (
  `userID` varchar(10) NOT NULL,
  `account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `account`
--

INSERT INTO `account` (`userID`, `account`, `password`, `name`) VALUES
('1', '123', '123456', '海綿寶寶'),
('2', '456', '123456', '派大星');

-- --------------------------------------------------------

--
-- 資料表結構 `favorite`
--

CREATE TABLE `favorite` (
  `userID` varchar(10) NOT NULL,
  `keep` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `favorite`
--

INSERT INTO `favorite` (`userID`, `keep`) VALUES
('1', '{\"keep\": [\"老地方\", \"金圓\"]}');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`userID`);

--
-- 資料表索引 `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userID` (`userID`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
