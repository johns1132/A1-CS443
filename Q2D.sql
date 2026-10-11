CREATE TABLE Department(
  PhysDept INT,
  DeptName VARCHAR(30), --Added for clarity on which department is which
  DeptSupervisorID INT,
  CONSTRAINT PhysDeptPK PRIMARY KEY (PhysDept),
  CONSTRAINT DeptSupervisorFK
          FOREIGN KEY(DeptSupervisorID) 
              References Physician(PhysID)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
);
CREATE TABLE Physician(
  PhysID INT,
  PhysName VARCHAR(50),
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
                    ON DELETE CASCADE,    --Here to keep the database consistent.
);
CREATE TABLE Patient(
  PatientID INT,  --Added for a unique primary key for patients
  PatientName VARVHAR(50),
  PatientAddress VARCHAR(200),
  HospitalStayDays INT, 
  RoomNo INT,
  
);








