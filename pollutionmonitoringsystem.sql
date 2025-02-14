-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2025 at 09:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pollutionmonitoringsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `AlertID` int(11) NOT NULL,
  `DataID` int(11) DEFAULT NULL,
  `AlertType` varchar(50) DEFAULT NULL,
  `SeverityLevel` enum('Low','Medium','High') DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Status` enum('Resolved','Unresolved') DEFAULT 'Unresolved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`AlertID`, `DataID`, `AlertType`, `SeverityLevel`, `Timestamp`, `Status`) VALUES
(1, 1, 'High Pollution', 'High', '2023-10-01 12:05:00', 'Unresolved'),
(2, 3, 'High Pollution', 'High', '2023-10-02 14:05:00', 'Unresolved'),
(3, 4, 'Noise Pollution', 'Medium', '2023-10-02 14:05:00', 'Unresolved'),
(4, 5, 'Sensor Failure', 'Low', '2023-10-02 14:05:00', 'Resolved'),
(5, 6, 'Moderate Pollution', 'Medium', '2023-10-02 14:05:00', 'Unresolved'),
(6, 7, 'Noise Pollution', 'High', '2023-10-02 14:05:00', 'Unresolved');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `Latitude` decimal(9,6) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Region` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationID`, `Latitude`, `Longitude`, `Address`, `City`, `Country`, `Region`) VALUES
(1, 40.712800, -74.006000, '123 Main St', 'New York', 'USA', 'Northeast'),
(2, 34.052200, -118.243700, '456 Elm St', 'Los Angeles', 'USA', 'West'),
(3, 51.507400, -0.127800, '10 Downing St', 'London', 'UK', 'Europe'),
(4, 48.856600, 2.352200, 'Champ de Mars', 'Paris', 'France', 'Europe'),
(5, 35.689500, 139.691700, '1 Chome', 'Tokyo', 'Japan', 'Asia'),
(6, 55.755800, 37.617600, 'Red Square', 'Moscow', 'Russia', 'Europe'),
(7, 37.774900, -122.419400, 'Golden Gate Bridge', 'San Francisco', 'USA', 'West');

-- --------------------------------------------------------

--
-- Table structure for table `pollutiondata`
--

CREATE TABLE `pollutiondata` (
  `DataID` int(11) NOT NULL,
  `SensorID` int(11) DEFAULT NULL,
  `Timestamp` datetime NOT NULL,
  `AirQualityIndex` int(11) DEFAULT NULL,
  `PM2_5` decimal(5,2) DEFAULT NULL,
  `PM10` decimal(5,2) DEFAULT NULL,
  `CO2Level` decimal(5,2) DEFAULT NULL,
  `SO2Level` decimal(5,2) DEFAULT NULL,
  `NO2Level` decimal(5,2) DEFAULT NULL,
  `NoiseLevel` decimal(5,2) DEFAULT NULL,
  `WaterQualityIndex` decimal(5,2) DEFAULT NULL,
  `Temperature` decimal(5,2) DEFAULT NULL,
  `Humidity` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pollutiondata`
--

INSERT INTO `pollutiondata` (`DataID`, `SensorID`, `Timestamp`, `AirQualityIndex`, `PM2_5`, `PM10`, `CO2Level`, `SO2Level`, `NO2Level`, `NoiseLevel`, `WaterQualityIndex`, `Temperature`, `Humidity`) VALUES
(1, 1, '2023-10-01 12:00:00', 85, 25.50, 40.20, 450.00, 10.30, 20.10, 55.00, NULL, 22.50, 60.00),
(2, 2, '2023-10-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.50, 18.50, 65.00),
(3, 3, '2023-10-02 14:00:00', 92, 28.70, 45.30, 480.00, 12.50, 22.30, NULL, NULL, 20.50, 58.00),
(4, 4, '2023-10-02 14:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 65.00, NULL, 19.00, 62.00),
(5, 5, '2023-10-02 14:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.50, 17.00, 70.00),
(6, 6, '2023-10-02 14:00:00', 78, 20.10, 35.00, 420.00, 8.70, 18.50, NULL, NULL, 21.00, 55.00),
(7, 7, '2023-10-02 14:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 70.50, NULL, 18.50, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `GeneratedDate` date DEFAULT NULL,
  `ReportType` varchar(50) DEFAULT NULL,
  `Content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ReportID`, `UserID`, `GeneratedDate`, `ReportType`, `Content`) VALUES
(1, 1, '2023-10-01', 'Daily', 'High pollution levels detected in New York.'),
(2, 2, '2023-10-01', 'Daily', 'Water quality within normal limits in Los Angeles.'),
(3, NULL, '2023-10-02', 'Weekly', 'Weekly air quality report for London.'),
(4, NULL, '2023-10-02', 'Monthly', 'Monthly noise pollution report for Paris.'),
(5, NULL, '2023-10-02', 'Daily', 'Daily water quality report for Tokyo.'),
(6, NULL, '2023-10-02', 'Weekly', 'Weekly air quality report for Moscow.'),
(7, NULL, '2023-10-02', 'Monthly', 'Monthly noise pollution report for San Francisco.');

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `SensorID` int(11) NOT NULL,
  `SensorType` varchar(50) NOT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `InstallationDate` date DEFAULT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  `LocationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`SensorID`, `SensorType`, `Manufacturer`, `InstallationDate`, `Status`, `LocationID`) VALUES
(1, 'Air Quality', 'SensorTech', '2023-01-15', 'Active', 1),
(2, 'Water Quality', 'AquaSense', '2023-02-20', 'Active', 2),
(3, 'Air Quality', 'EcoSense', '2023-03-10', 'Active', 3),
(4, 'Noise', 'SoundTech', '2023-04-05', 'Active', 4),
(5, 'Water Quality', 'AquaTech', '2023-05-12', 'Inactive', 5),
(6, 'Air Quality', 'SensorPro', '2023-06-18', 'Active', 6),
(7, 'Noise', 'NoiseMaster', '2023-07-22', 'Active', 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` enum('Admin','Operator','Public') NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Role`, `Email`, `PhoneNumber`) VALUES
(1, 'admin1', 'admin123', 'Admin', 'admin1@example.com', '123-456-7890'),
(2, 'operator1', 'operator123', 'Operator', 'operator1@example.com', '987-654-3210'),
(3, 'public1', 'public123', 'Public', 'public1@example.com', '111-222-3333'),
(4, 'operator2', 'operator456', 'Operator', 'operator2@example.com', '444-555-6666'),
(5, 'admin2', 'admin456', 'Admin', 'admin2@example.com', '777-888-9999'),
(6, 'public2', 'public456', 'Public', 'public2@example.com', '222-333-4444');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`AlertID`),
  ADD KEY `DataID` (`DataID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `pollutiondata`
--
ALTER TABLE `pollutiondata`
  ADD PRIMARY KEY (`DataID`),
  ADD KEY `SensorID` (`SensorID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`SensorID`),
  ADD KEY `LocationID` (`LocationID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `AlertID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pollutiondata`
--
ALTER TABLE `pollutiondata`
  MODIFY `DataID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `SensorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`DataID`) REFERENCES `pollutiondata` (`DataID`);

--
-- Constraints for table `pollutiondata`
--
ALTER TABLE `pollutiondata`
  ADD CONSTRAINT `pollutiondata_ibfk_1` FOREIGN KEY (`SensorID`) REFERENCES `sensor` (`SensorID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
