create database Suwapiyasa;
Use Suwapiyasa;

   
-- Employee table
CREATE TABLE Employee (
    EmployeeNumber INTEGER PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Address VARCHAR(100),
    TelephoneNumber VARCHAR(20)
);

-- Doctor table
CREATE TABLE Doctor (
    EmployeeNumber INTEGER PRIMARY KEY,
    Specialty VARCHAR(50),
    FOREIGN KEY (EmployeeNumber) REFERENCES Employee(EmployeeNumber)
);

-- Doctor_HDnumber table
CREATE TABLE Doctor_HDnumber (
    EmployeeNumber INTEGER,
    HDNumber INTEGER,
    PRIMARY KEY (EmployeeNumber, HDNumber),
    FOREIGN KEY (EmployeeNumber) REFERENCES Employee(EmployeeNumber)
);



-- Surgeon table
CREATE TABLE Surgeon (
    EmployeeNumber INTEGER PRIMARY KEY,
    ContractType VARCHAR(20),
    ContractLength INTEGER,
    Specialty VARCHAR(50),
    FOREIGN KEY (EmployeeNumber) REFERENCES Employee(EmployeeNumber)
);

-- Nurse table
CREATE TABLE Nurse (
    EmployeeNumber INTEGER PRIMARY KEY,
    Grade VARCHAR(10),
    YearsOfExperience INTEGER,
    SurgerySkillType VARCHAR(50),
    FOREIGN KEY (EmployeeNumber) REFERENCES Employee(EmployeeNumber)
);



-- Location table
CREATE TABLE Location (
    BedNumber INTEGER,
    RoomNumber INTEGER,
    NursingUnit VARCHAR(50),
    PRIMARY KEY (BedNumber,RoomNumber)
);

-- Patient table
CREATE TABLE Patient (
    PatientID INTEGER PRIMARY KEY,
    Surname VARCHAR(50),
    Initial VARCHAR(5),
    Age INTEGER CHECK (age > 0 AND age < 150),
    Address VARCHAR(100),
    TelephoneNumber VARCHAR(20),
    BloodType VARCHAR(5) NOT NULL,
    DoctorID INTEGER,
    BedNumber INTEGER,
    RoomNumber INTEGER,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(EmployeeNumber),
    FOREIGN KEY (BedNumber,RoomNumber) REFERENCES Location(BedNumber,RoomNumber)
    
);

-- Surgery table
CREATE TABLE Surgery (
    SurgeryName VARCHAR(50),
    PatientID INTEGER ,
    Date DATE,
    Time TIME,
    Category VARCHAR(100),
    SpecialNeeds VARCHAR(200),
    Theater VARCHAR(50),
    SurgeonID INT,
    NurseID INT,
    PRIMARY KEY(SurgeryName, PatientID),
    FOREIGN KEY (NurseID) REFERENCES Nurse (EmployeeNumber),
    FOREIGN KEY (SurgeonID) REFERENCES Surgeon (EmployeeNumber),
    FOREIGN KEY (PatientID) REFERENCES Patient (PatientID)
);


-- patient participate surgery table
CREATE TABLE Patient_Participate_Surgery (
    PatientID INTEGER,
    SurgeryName VARCHAR(100),
    PRIMARY KEY (PatientID, SurgeryName),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (SurgeryName) REFERENCES Surgery(SurgeryName) 
);


-- Patient_Allergies table
CREATE TABLE Patient_Allergies (
    PatientID INTEGER,
    Allergies VARCHAR(100),
    PRIMARY KEY (PatientID, Allergies),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);



-- Medication table
CREATE TABLE Medication (
    MedicationCode INTEGER PRIMARY KEY,
    Name VARCHAR(50) UNIQUE,
    QuantityOnHand INTEGER,
    QuantityOrdered INTEGER,
    Cost DECIMAL(10, 2),
    ExpirationDate DATE
);

-- Take table
CREATE TABLE Patient_Take_Medicine(
    PatientID INTEGER,
    MedicationCode INTEGER
    
);

-- Medication_MedicineInteractions table
CREATE TABLE Medication_MedicineInteractions (
    MedicationCode INTEGER,
    MedicineInteractions VARCHAR(100),
    PRIMARY KEY (MedicationCode, MedicineInteractions),
    FOREIGN KEY (MedicationCode) REFERENCES Medication(MedicationCode)
);
    




-- Insert data into Employee table
INSERT INTO Employee (EmployeeNumber, Name, Gender, Address, TelephoneNumber)
VALUES
    (101, 'Oshadhi Yasanga', 'Female', 'Pihimbiya,Hettipola', '071-8967341'),
    (102, 'Anjalee Shashiprbha', 'Female', 'Melsiripura,Kurunegala', '070-5872183'),
    (103, 'Mahinda Lekam','Male', 'Moragolla,Nagollagoda','074-5679282'),
    (104, 'Chithra Menike', 'Female', 'Malabe,Colombo', '081-67456218'),
    (105, 'Ayesh Madhusanka', 'Male', 'Anuradhapura','074-6741902'),
    (106,'Dinal Shanaka', 'Male', 'Wariyapola','072-7928375'),
    (107,'Imash Eshan', 'Male','Nawala,Colombo', '071-89628862'),
    (108, 'Naveen Pramuditha', 'Male', 'Kandy', '081-7845699'),
    (109, 'Ayodya Jayakodi', 'Female', 'Umandawa,Kurunegala','071-6732541'),
    (110, 'Adithi Rathnayake', 'Female', 'Dodangaslanda','072-7844390');
   
    

-- Insert data into Doctor table
INSERT INTO Doctor (EmployeeNumber, Specialty)
VALUES
    (101, 'Cardiology'),
    (102, 'Orthopedics'),
    (103, 'Neurology');

-- Insert data into Doctor_HDnumber table
INSERT INTO Doctor_HDnumber (EmployeeNumber, HDNumber)
VALUES
    (101, 123456),
    (103, 789012);



-- Insert data into Surgeon table
INSERT INTO Surgeon (EmployeeNumber, ContractType, ContractLength, Specialty)
VALUES
    (104, 'Full-time', 2, 'Cardiology'),
    (105, 'Part-time', 1, 'Orthopedics');

  
    
   -- Insert data into Location table
INSERT INTO Location (BedNumber, RoomNumber, NursingUnit)
VALUES
    (210, 23, 'Cardiology'),
    (211,23,'Cardiology'),
    (212,30,'Cardiology'),
    (213,10,'Orthopedics'),
    (214,10,'Orthopedics'),
    (215,10,'Orthopedics'),
    (216,30,'Cardiology'),
    (217,23,'Cardiology'),
    (218,23,'Cardiology'),
    (219, 30, 'Cardiology'); 

-- Insert data into Patient table
INSERT INTO Patient (PatientID, Surname, Initial, Age, Address, TelephoneNumber, BloodType, DoctorID, BedNumber, RoomNumber)
VALUES
    (001, 'Wijethilaka', 'W.A.', 40, 'Kubukwewa', '072-3456782', 'O+', 101, 210, 23),
    (002, 'Jinadasa', 'B.M.', 30, 'Kurunegala', '081-5629883', 'A+', 102, 211, 23),
    (003, 'Kumari', 'K.B.', 54, 'Kotte', '072-7892204', 'A-', 102, 214, 10),
    (004, 'Hemachndra', 'H.M.', 48, 'Chilaw', '077-5689920', 'O-', 103, 212, 30),
    (005, 'Lakshan', 'K.M', 20, 'Anuradhapura', '037-7944382', 'B+', 102, 213, 10),
    (006, 'Kasthuri', 'R.M.', 60, 'Bandarawela', '032-8977262', 'B-', 102, 214, 10),
    (007, 'Perera', 'K.P.', 50, 'Rambukkana', '077-6692373', 'O-', 101, 215, 10),
    (008, 'Gunadasa', 'G.M.', 43, 'Thorayaya', '071-6722912', 'A+', 103, 216, 30),
    (009, 'Gunawardana', 'G.N.', 28, 'Yakalla', '072-7798321', 'O+', 101, 217, 23),
    (010, 'Dharmasena', 'M.D.', 69, 'Wariyapola', '070-2834551', 'o+', 102, 218, 23);
    
  -- Insert data into Nurse table
INSERT INTO Nurse (EmployeeNumber, Grade, YearsOfExperience, SurgerySkillType)
VALUES
    (106, 'Senior',10, 'Cardiac'),
    (107, 'Junior', 9, 'Orthopedic'),
    (108, 'Senior', 11, 'Neurology');  
    
    
INSERT INTO Surgery (SurgeryName,PatientID, Date, Time, Category, SpecialNeeds, Theater, SurgeonID, NurseID)
VALUES
    ('Thyroidectomy',010, '2023-07-28', '10:00:00', 'Cardiac', 'None', 'Theater A', 105, 108),
    ('Heart transplantation',005, '2023-07-30', '15:00:00', 'Orthopedic', 'Knee surgery', 'Theater B', 104, 106);    

-- Insert data into Participate table
INSERT INTO Patient_Participate_Surgery(PatientID, SurgeryName)
VALUES
    (010, 'Thyroidectomy'),
    (005, 'Heart transplantation');

-- Insert data into Patient_Allergies table
INSERT INTO Patient_Allergies (PatientID, Allergies)
VALUES
    (001, 'Penicillin'),
    (002, 'Latex');

-- Insert data into Medication table
INSERT INTO Medication (MedicationCode, Name, QuantityOnHand, QuantityOrdered, Cost, ExpirationDate)
VALUES
    (1010, 'Aspirin', 100, 50, 5.99, '2024-12-31'),
    (1020, 'Ibuprofen', 75, 25, 4.50, '2023-09-15'),
    (1030, 'Doxycycline',34,23,6.99,'2024-02-17');
    

-- Insert data into Take table
INSERT INTO Patient_Take_Medicine (PatientID, MedicationCode)
VALUES
    (001, 1010),
    (001,1030),
    (002, 1020);

-- Insert data into Medication_MedicineInteractions table
INSERT INTO Medication_MedicineInteractions (MedicationCode, MedicineInteractions)
VALUES
    (1010, 'None'),
    (1020, 'Avoid alcohol while taking this medication');
    
    
-- MINI PROJECT  
 
-- <Q1 - 421437113> 
CREATE VIEW PatientSurgeryView AS
SELECT 
    p.PatientID,
    CONCAT(p.Initial, ' ', p.Surname) AS PatientName,
    CONCAT(l.BedNumber, '/', l.RoomNumber) AS Location,
    s.SurgeryName,
    s.Date AS SurgeryDate
FROM Patient p
JOIN Surgery s ON p.PatientID = s.PatientID
JOIN Location l ON p.BedNumber = l.BedNumber AND p.RoomNumber = l.RoomNumber;
 
select*from  PatientSurgeryView;

-- <Q2 - 421437113>
CREATE TABLE MedInfo (
    MedName VARCHAR(50) PRIMARY KEY,
    QuantityAvailable INTEGER,
    ExpirationDate DATE
);
 
-- Trigger to insert data into MedInfo 
DELIMITER //
CREATE TRIGGER AfterMedicationInsert
AFTER INSERT ON Medication
FOR EACH ROW
BEGIN
    INSERT INTO MedInfo (MedName, QuantityAvailable, ExpirationDate)
    VALUES (NEW.Name, NEW.QuantityOnHand, NEW.ExpirationDate);
END;
//
DELIMITER ;

-- Trigger to update data in MedInfo 
DELIMITER //
CREATE TRIGGER UpdateMedicationTrigger
AFTER UPDATE ON Medication
FOR EACH ROW
BEGIN
    UPDATE MedInfo
    SET QuantityAvailable = NEW.QuantityOnHand, ExpirationDate = NEW.ExpirationDate
    WHERE MedName = NEW.Name;
END;
//
DELIMITER ;

-- Trigger to delete data from MedInfo 
DELIMITER //
CREATE TRIGGER DeleteMedicationTrigger
AFTER DELETE ON Medication
FOR EACH ROW
BEGIN
    DELETE FROM MedInfo WHERE MedName = OLD.Name;
END;
//
DELIMITER ;

-- Insert query for Medication table after trigger 
INSERT INTO Medication (MedicationCode, Name, QuantityOnHand, QuantityOrdered, Cost, ExpirationDate)
VALUES
    (1040,'Adderall',130, 36,3.66,'2022-07-30'),
    (1050,'Amlodipine',120,45,3.66,'2023-09-27');
    
select* from MedInfo;


-- UPDATE query for Medication table after trigger
UPDATE Medication
SET Name = 'Adderall',
    QuantityOnHand = 100,
    QuantityOrdered = 20,
    Cost = 10.40,
    ExpirationDate = '2025-07-05'
WHERE MedicationCode = 1040;

select* from MedInfo;

-- DELETE query for Medication table after trigger
DELETE FROM Medication
WHERE MedicationCode = 1050;

select* from MedInfo;

    

-- <Q3 - 421437113>
DELIMITER //
CREATE PROCEDURE GetMedicationsCount(
    IN patientIDParam INT,
    INOUT medicationsCount INT
)
BEGIN
    SELECT COUNT(*) INTO medicationsCount
    FROM Patient_Take_Medicine
    WHERE PatientID = patientIDParam;
END;
//
DELIMITER ;

SET @output := 0;
CALL GetMedicationsCount(001, @output);
SELECT @output AS MedicationsCount;



-- <Q4 - 421437113>
DELIMITER //
CREATE FUNCTION DaysUntilExpiration(expirationDate DATE) RETURNS INT NO SQL
BEGIN
    RETURN DATEDIFF(expirationDate, CURDATE());
END;
//
DELIMITER ;


DELIMITER ;
-- Query to display information about medicines with less than 30 days remaining for expiry
SELECT
    m.MedicationCode,
    m.Name AS MedName,
    m.QuantityOnHand,
    m.ExpirationDate,
    DaysUntilExpiration(m.ExpirationDate) AS DaysRemaining
FROM Medication m
WHERE DaysUntilExpiration(m.ExpirationDate) < 30;





-- <Q6 - 421437113>
select*from Employee;
select*from Patient;
