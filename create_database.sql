CREATE DATABASE ManufacturingQC;
GO

USE ManufacturingQC;
GO

CREATE TABLE Machines (
    MachineID INT PRIMARY KEY,
    MachineName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Shifts (
    ShiftID INT PRIMARY KEY,
    ShiftName VARCHAR(20),
    StartTime TIME,
    EndTime TIME
);

CREATE TABLE ProductionRuns (
    RunID INT PRIMARY KEY,
    MachineID INT FOREIGN KEY REFERENCES Machines(MachineID),
    ShiftID INT FOREIGN KEY REFERENCES Shifts(ShiftID),
    RunDate DATE,
    UnitsProduced INT
);

CREATE TABLE Defects (
    DefectID INT PRIMARY KEY,
    RunID INT FOREIGN KEY REFERENCES ProductionRuns(RunID),
    DefectType VARCHAR(50),
    DefectCount INT
);
GO

INSERT INTO Machines VALUES (1, 'CNC Mill A', 'Floor 1');
INSERT INTO Machines VALUES (2, 'CNC Mill B', 'Floor 1');
INSERT INTO Machines VALUES (3, 'Lathe X1', 'Floor 2');
INSERT INTO Machines VALUES (4, 'Lathe X2', 'Floor 2');
INSERT INTO Machines VALUES (5, 'Press 01', 'Floor 3');
GO

INSERT INTO Shifts VALUES (1, 'Morning', '06:00', '14:00');
INSERT INTO Shifts VALUES (2, 'Afternoon', '14:00', '22:00');
INSERT INTO Shifts VALUES (3, 'Night', '22:00', '06:00');
GO

INSERT INTO ProductionRuns VALUES (1, 1, 1, '2024-01-08', 500);
INSERT INTO ProductionRuns VALUES (2, 1, 2, '2024-01-08', 480);
INSERT INTO ProductionRuns VALUES (3, 2, 1, '2024-01-08', 520);
INSERT INTO ProductionRuns VALUES (4, 2, 3, '2024-01-08', 390);
INSERT INTO ProductionRuns VALUES (5, 3, 1, '2024-01-09', 450);
INSERT INTO ProductionRuns VALUES (6, 3, 2, '2024-01-09', 470);
INSERT INTO ProductionRuns VALUES (7, 4, 2, '2024-01-09', 510);
INSERT INTO ProductionRuns VALUES (8, 4, 3, '2024-01-09', 420);
INSERT INTO ProductionRuns VALUES (9, 5, 1, '2024-01-10', 600);
INSERT INTO ProductionRuns VALUES (10, 5, 3, '2024-01-10', 350);
INSERT INTO ProductionRuns VALUES (11, 1, 1, '2024-01-15', 490);
INSERT INTO ProductionRuns VALUES (12, 2, 2, '2024-01-15', 505);
INSERT INTO ProductionRuns VALUES (13, 3, 3, '2024-01-15', 410);
INSERT INTO ProductionRuns VALUES (14, 4, 1, '2024-01-16', 530);
INSERT INTO ProductionRuns VALUES (15, 5, 2, '2024-01-16', 580);
INSERT INTO ProductionRuns VALUES (16, 1, 3, '2024-02-01', 460);
INSERT INTO ProductionRuns VALUES (17, 2, 1, '2024-02-01', 515);
INSERT INTO ProductionRuns VALUES (18, 3, 2, '2024-02-02', 495);
INSERT INTO ProductionRuns VALUES (19, 4, 3, '2024-02-02', 405);
INSERT INTO ProductionRuns VALUES (20, 5, 1, '2024-02-03', 620);
GO

INSERT INTO Defects VALUES (1, 1, 'Surface Scratch', 5);
INSERT INTO Defects VALUES (2, 1, 'Dimension Error', 2);
INSERT INTO Defects VALUES (3, 2, 'Surface Scratch', 8);
INSERT INTO Defects VALUES (4, 3, 'Misalignment', 3);
INSERT INTO Defects VALUES (5, 4, 'Surface Scratch', 12);
INSERT INTO Defects VALUES (6, 4, 'Dimension Error', 6);
INSERT INTO Defects VALUES (7, 5, 'Surface Scratch', 4);
INSERT INTO Defects VALUES (8, 6, 'Misalignment', 7);
INSERT INTO Defects VALUES (9, 7, 'Dimension Error', 3);
INSERT INTO Defects VALUES (10, 8, 'Surface Scratch', 15);
INSERT INTO Defects VALUES (11, 8, 'Misalignment', 5);
INSERT INTO Defects VALUES (12, 9, 'Dimension Error', 2);
INSERT INTO Defects VALUES (13, 10, 'Surface Scratch', 18);
INSERT INTO Defects VALUES (14, 10, 'Misalignment', 9);
INSERT INTO Defects VALUES (15, 11, 'Surface Scratch', 6);
INSERT INTO Defects VALUES (16, 12, 'Dimension Error', 4);
INSERT INTO Defects VALUES (17, 13, 'Surface Scratch', 11);
INSERT INTO Defects VALUES (18, 14, 'Misalignment', 2);
INSERT INTO Defects VALUES (19, 15, 'Dimension Error', 3);
INSERT INTO Defects VALUES (20, 16, 'Surface Scratch', 9);
INSERT INTO Defects VALUES (21, 17, 'Misalignment', 4);
INSERT INTO Defects VALUES (22, 18, 'Surface Scratch', 7);
INSERT INTO Defects VALUES (23, 19, 'Dimension Error', 8);
INSERT INTO Defects VALUES (24, 19, 'Surface Scratch', 13);
INSERT INTO Defects VALUES (25, 20, 'Misalignment', 3);
GO