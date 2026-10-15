--Script for Question 2d

--Department table with Primary key of PhysDept, attribute of DeptName, and foreign key 
--of DeptSupervisorID  
CREATE TABLE Department(
  PhysDept INT,
  DeptName VARCHAR(30), --Added for clarity on which department is which
  DeptSupervisorID INT,
  CONSTRAINT PhysDeptPK PRIMARY KEY (PhysDept)
  --Adding foreign key constraint later on as Physician hasn't been created yet
);

--Treatment table with primary key of TreatID, attribute of TreatDesc and TreatCost
CREATE TABLE Treatment(
  TreatID INT,
  TreatDesc VARCHAR(200),
  TreatCost INT,
  CONSTRAINT TreatPK PRIMARY KEY (TreatID),
  CONSTRAINT TreatCostCHECK
    CHECK(TreatCost >=50.0)
);

--Room table with primary key of RoomNo, and attributes of RoomPhone and RoomRate
CREATE TABLE Room(
  RoomNo INT,
  RoomPhone VARCHAR(8),
  RoomRate DECIMAL(4,2),
  CONSTRAINT RoomPK PRIMARY KEY (RoomNo),
  CONSTRAINT RoomNoCHECK
    CHECK (RoomNo >= 100 && RoomNo <= 999),
  CONSTRAINT RoomRateCHECK
    CHECK (RoomRate >= 30.00 && RoomRate <= 100.00)
);

--Physician table with primary key of PhyID, attribute of PhysName, and foreign keys of PhysDebt
--and TreatID
CREATE TABLE Physician(
  PhysID INT,
  PhysName VARCHAR(50)
    CONSTRAINT PhysName NOT NULL,
  PhysDept INT,
  TreatID INT,
  CONSTRAINT PhysIDPK PRIMARY KEY (PhysID),
  CONSTRAINT PhysDeptFK
          FOREIGN KEY(PhysDept) 
              References Department(PhysDept)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
  CONSTRAINT TreatIDFK
          FOREIGN KEY(TreatID) 
              References Treatment(TreatID)
                    ON DELETE CASCADE    --Here to keep the database consistent.
);

--Adding foreign key to department after the creation of Physician as they are mutually dependent
--foreign key-wise. 
ALTER TABLE Department 
  ADD CONSTRAINT DeptSupervisorFK FOREIGN KEY(DeptSupervisorID) 
      References Physician(PhysID)
          ON DELETE CASCADE;    --Here to keep the database consistent.


CREATE TABLE Patient(
  PatientID INT,  --Added for a unique primary key for patients
  PatientName VARVHAR(50)
    CONSTRAINT NameNULL NOT NULL,
  PatientAddress VARCHAR(200)
    CONSTRAINT AddressNULL NOT NULL,
  AdmitDate DATE,
  HospitalStayDays INT, 
  RoomNo INT,
  PhysID INT,
  CONSTRAINT PatientPK PRIMARY KEY(PatientID),
  CONSTRAINT HospitalStayCHECK
    CHECK (HospitalStayDays >= 0),
  CONSTRAINT RoomFK
          FOREIGN KEY(RoomNo) 
              References Room(RoomNo)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
  CONSTRAINT PhysFK
          FOREIGN KEY(PhysID) 
              References Physician(PhysID)
                    ON DELETE CASCADE    --Here to keep the database consistent.
);








