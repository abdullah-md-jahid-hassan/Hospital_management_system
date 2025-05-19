-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 21, 2024 at 04:07 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL,
  `DoctorID` int DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`AppointmentID`, `DoctorID`, `PatientID`, `Date`, `Time`, `Status`) VALUES
(1, 1, 1, '2024-12-22', '10:00:00', 'Scheduled'),
(2, 2, 2, '2024-12-23', '11:00:00', 'Completed'),
(3, 3, 3, '2024-12-24', '12:00:00', 'Cancelled'),
(4, 4, 4, '2024-12-25', '13:00:00', 'Scheduled'),
(5, 5, 5, '2024-12-26', '14:00:00', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DepartmentID`, `Name`, `Location`) VALUES
(1, 'Cardiology', 'Building A'),
(2, 'Neurology', 'Building B'),
(3, 'Orthopedics', 'Building C'),
(4, 'Pediatrics', 'Building D'),
(5, 'General Medicine', 'Building E');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `DoctorID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `Name`, `Specialization`, `Phone`, `DepartmentID`) VALUES
(1, 'Dr. Alice', 'Cardiologist', '1234567890', 1),
(2, 'Dr. Bob', 'Neurologist', '1234567891', 2),
(3, 'Dr. Charlie', 'Orthopedic', '1234567892', 3),
(4, 'Dr. Diana', 'Pediatrician', '1234567893', 4),
(5, 'Dr. Eve', 'General Physician', '1234567894', 5);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatientID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientID`, `Name`, `Age`, `Gender`, `Phone`) VALUES
(1, 'John Doe', 25, 'Male', '9876543210'),
(2, 'Jane Smith', 30, 'Female', '9876543211'),
(3, 'Alice Brown', 40, 'Female', '9876543212'),
(4, 'Bob White', 35, 'Male', '9876543213'),
(5, 'Charlie Black', 50, 'Male', '9876543214');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`PatientID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
