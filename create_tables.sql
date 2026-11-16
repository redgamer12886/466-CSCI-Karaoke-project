-- =====================================================================
-- CSCI 466 Group Project: Karaoke Management System
-- File: create_tables.sql
-- Description: DDL script to create database tables derived from the 3NF ER Diagram.
-- Suitable for running in MariaDB using: \. create_tables.sql
-- =====================================================================

-- Step 1: Clean teardown of existing tables in reverse dependency order
DROP TABLE IF EXISTS AcceleratedQueue;
DROP TABLE IF EXISTS FreeQueue;
DROP TABLE IF EXISTS ContributesTo;
DROP TABLE IF EXISTS KaraokeFile;
DROP TABLE IF EXISTS Contributor;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Song;

-- =====================================================================
-- Step 2: Create Strong Entities (Parent Tables)
-- =====================================================================

-- Table 1: Song
-- Represents a musical work with its primary title and main artist/band.
CREATE TABLE Song (
    SongID INT AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Artist VARCHAR(100) NOT NULL,
    PRIMARY KEY (SongID)
) ENGINE=InnoDB;

-- Table 2: Contributor
-- Represents individuals or band members who contribute to songs (e.g. writers, vocalists, instrumentalists).
CREATE TABLE Contributor (
    ContributorID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (ContributorID)
) ENGINE=InnoDB;

-- Table 3: User
-- Represents patrons/singers who request songs in the venue.
CREATE TABLE User (
    UserID INT AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    PRIMARY KEY (UserID)
) ENGINE=InnoDB;

-- =====================================================================
-- Step 3: Create Tables with Foreign Keys (Child & Intersection Tables)
-- =====================================================================

-- Table 4: KaraokeFile
-- Represents a specific audio/video performance file for a song (e.g., Solo, Duet, Instrumental).
-- Resolves the 1:M relationship between Song and KaraokeFile.
CREATE TABLE KaraokeFile (
    FileID INT AUTO_INCREMENT,
    SongID INT NOT NULL,
    VersionType VARCHAR(50) NOT NULL DEFAULT 'Solo',
    FileName VARCHAR(150) NOT NULL,
    PRIMARY KEY (FileID),
    FOREIGN KEY (SongID) REFERENCES Song(SongID)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table 5: ContributesTo
-- Represents the M:N relationship between Contributor and Song.
-- Includes intersection attribute 'Role' (e.g., Singer, Songwriter, Lead Guitarist).
CREATE TABLE ContributesTo (
    SongID INT NOT NULL,
    ContributorID INT NOT NULL,
    Role VARCHAR(50) NOT NULL,
    PRIMARY KEY (SongID, ContributorID, Role),
    FOREIGN KEY (SongID) REFERENCES Song(SongID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ContributorID) REFERENCES Contributor(ContributorID)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table 6: FreeQueue
-- Free, first-come first-served queue (FIFO).
-- Resolves the M:N relationship between User and KaraokeFile for free requests.
CREATE TABLE FreeQueue (
    QueueID INT AUTO_INCREMENT,
    UserID INT NOT NULL,
    FileID INT NOT NULL,
    SignUpTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (QueueID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FileID) REFERENCES KaraokeFile(FileID)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table 7: AcceleratedQueue
-- Priority queue where patrons pay an extra fee to jump ahead in the performance lineup.
-- Includes intersection attribute 'AmountPaid' ($).
CREATE TABLE AcceleratedQueue (
    QueueID INT AUTO_INCREMENT,
    UserID INT NOT NULL,
    FileID INT NOT NULL,
    SignUpTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    AmountPaid DECIMAL(6,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (QueueID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FileID) REFERENCES KaraokeFile(FileID)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- =====================================================================
-- Step 4: Verification Commands
-- =====================================================================
SHOW TABLES;
DESCRIBE Song;
DESCRIBE Contributor;
DESCRIBE User;
DESCRIBE KaraokeFile;
DESCRIBE ContributesTo;
DESCRIBE FreeQueue;
DESCRIBE AcceleratedQueue;
