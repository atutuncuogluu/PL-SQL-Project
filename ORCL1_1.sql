/* departman*/
CREATE TABLE Department (
  dep_id NUMBER(10) NOT NULL PRIMARY KEY,
  dep_name VARCHAR2(50) NOT NULL,
  place VARCHAR2(50) NOT NULL  
);

/* doctor*/
CREATE TABLE DOCTOR (
    doc_id NUMBER(10) NOT NULL PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    profession VARCHAR(50) NOT NULL
);

/* dep_doctor*/
CREATE TABLE Dep_Doctor (
  dep_id NUMBER(10) NOT NULL,
  doc_id NUMBER(10) NOT NULL,
  dep_name VARCHAR2(50) NOT NULL,
  PRIMARY KEY (dep_id, doc_id),
  FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
  FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id)
);

/* Nurse*/
CREATE TABLE NURSE (
    nurse_id NUMBER(10) NOT NULL PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    age NUMBER(10) NOT NULL
);

/* dep_Nurse*/
CREATE TABLE Dep_Nurse (
  dep_id NUMBER(10) NOT NULL,
  nurse_id NUMBER(10) NOT NULL,
  dep_name VARCHAR2(50) NOT NULL,
  PRIMARY KEY (dep_id, nurse_id),
  FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
  FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id)
);

/* Patient */
CREATE TABLE Patient (
  patient_id NUMBER(10) NOT NULL PRIMARY KEY,
  fname VARCHAR2(50) NOT NULL,
  lname VARCHAR2(50) NOT NULL,
  age NUMBER(3) NOT NULL,
  phone VARCHAR2(20) NOT NULL
);

CREATE TABLE Appointment (
  patient_id NUMBER(10) NOT NULL,
  doc_id NUMBER(10) NOT NULL,
  appointment_date DATE NOT NULL,
  PRIMARY KEY (patient_id, doc_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id)
);

CREATE TABLE Tests (
  test_id NUMBER(10) NOT NULL PRIMARY KEY,
  test_name VARCHAR2(50) NOT NULL
);

CREATE TABLE Doc_Test (
  doc_id NUMBER(10) NOT NULL,
  test_id NUMBER(10) NOT NULL,
  quantity NUMBER(10) DEFAULT 1,
  PRIMARY KEY (doc_id, test_id),
  FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id),
  FOREIGN KEY (test_id) REFERENCES Tests(test_id)
);

CREATE TABLE Admissions (
    room_id NUMBER(10) NOT NULL PRIMARY KEY,                                                    
    dept_name VARCHAR2(50) NOT NULL,
    admis_date DATE NOT NULL
);

CREATE TABLE Patient_Admis (
  patient_id NUMBER(10) NOT NULL,
  admis_day NUMBER(10) NOT NULL,
  room_id NUMBER(10) NOT NULL,
  PRIMARY KEY (patient_id, room_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (room_id) REFERENCES Admissions(room_id)
);

CREATE TABLE SGK(
    sgk_id NUMBER(10) NOT NULL PRIMARY KEY,
    patient_id NUMBER(10) NOT NULL,
    sgk_entry DATE NOT NULL,
    sgk_finish DATE NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES Patient(patient_id)
);


CREATE OR REPLACE PACKAGE Data_Entry_Package AS
  /* Departman ekleme prosedürü */
  PROCEDURE Add_Department(
    dep_id_in NUMBER,
    dep_name_in VARCHAR2,
    place_in VARCHAR2
  );

  /* Departman güncelleme prosedürü */
  PROCEDURE Update_Department(
    dep_id_in NUMBER,
    dep_name_in VARCHAR2,
    place_in VARCHAR2
  );

  /* Departman silme prosedürü */
  PROCEDURE Delete_Department(
    dep_id_in NUMBER
  );

  /* Doktor ekleme prosedürü */
  PROCEDURE Add_Doctor(
    doc_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    profession_in VARCHAR2
  );

  /* Doktor güncelleme prosedürü */
  PROCEDURE Update_Doctor(
    doc_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    profession_in VARCHAR2
  );

  /* Doktor silme prosedürü */
  PROCEDURE Delete_Doctor(
    doc_id_in NUMBER
  );

  /* Hemşire ekleme prosedürü */
  PROCEDURE Add_Nurse(
    nurse_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER
  );

  /* Hemşire güncelleme prosedürü */
  PROCEDURE Update_Nurse(
    nurse_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER
  );

  /* Hemşire silme prosedürü */
  PROCEDURE Delete_Nurse(
    nurse_id_in NUMBER
  );

  /* Hasta ekleme prosedürü */
  PROCEDURE Add_Patient(
    patient_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER,
    phone_in VARCHAR2
  );

  /* Hasta güncelleme prosedürü */
  PROCEDURE Update_Patient(
    patient_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER,
    phone_in VARCHAR2
  );

  /* Hasta silme prosedürü */
  PROCEDURE Delete_Patient(
    patient_id_in NUMBER
  );

  /* Randevu ekleme prosedürü */
  PROCEDURE Add_Appointment(
    patient_id_in NUMBER,
    doc_id_in NUMBER,
    appointment_date_in DATE
  );

  /* Randevu güncelleme prosedürü */
  PROCEDURE Update_Appointment(
    patient_id_in NUMBER,
    doc_id_in NUMBER,
    appointment_date_in DATE
  );

  /* Randevu silme prosedürü */
  PROCEDURE Delete_Appointment(
    patient_id_in NUMBER,
    doc_id_in NUMBER
  );

  /* Test ekleme prosedürü */
  PROCEDURE Add_Test(
    test_id_in NUMBER,
    test_name_in VARCHAR2
  );

  /* Test güncelleme prosedürü */
  PROCEDURE Update_Test(
    test_id_in NUMBER,
    test_name_in VARCHAR2
  );

  /* Test silme prosedürü */
  PROCEDURE Delete_Test(
    test_id_in NUMBER
  );

  /* Doktor Test ilişkisi ekleme prosedürü */
  PROCEDURE Add_Doc_Test(
    doc_id_in NUMBER,
    test_id_in NUMBER,
    quantity_in NUMBER DEFAULT 1
  );

  /* Doktor Test ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Doc_Test(
    doc_id_in NUMBER,
    test_id_in NUMBER,
    quantity_in NUMBER
  );

  /* Doktor Test ilişkisi silme prosedürü */
  PROCEDURE Delete_Doc_Test(
    doc_id_in NUMBER,
    test_id_in NUMBER
  );

  /* Yatış ekleme prosedürü */
  PROCEDURE Add_Admissions(
    room_id_in NUMBER,
    dept_name_in VARCHAR2,
    admis_date_in DATE
  );

  /* Yatış güncelleme prosedürü */
  PROCEDURE Update_Admissions(
    room_id_in NUMBER,
    dept_name_in VARCHAR2,
    admis_date_in DATE
  );

  /* Yatış silme prosedürü */
  PROCEDURE Delete_Admissions(
    room_id_in NUMBER
  );

  /* Hasta Yatış ilişkisi ekleme prosedürü */
  PROCEDURE Add_Patient_Admis(
    patient_id_in NUMBER,
    admis_day_in NUMBER,
    room_id_in NUMBER
  );

  /* Hasta Yatış ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Patient_Admis(
    patient_id_in NUMBER,
    admis_day_in NUMBER,
    room_id_in NUMBER
  );

  /* Hasta Yatış ilişkisi silme prosedürü */
  PROCEDURE Delete_Patient_Admis(
    patient_id_in NUMBER,
    room_id_in NUMBER
  );

  /* SGK ekleme prosedürü */
  PROCEDURE Add_SGK(
    sgk_id_in NUMBER,
    patient_id_in NUMBER,
    sgk_entry_in DATE,
    sgk_finish_in DATE
  );

  /* SGK güncelleme prosedürü */
  PROCEDURE Update_SGK(
    sgk_id_in NUMBER,
    patient_id_in NUMBER,
    sgk_entry_in DATE,
    sgk_finish_in DATE
  );

  /* SGK silme prosedürü */
  PROCEDURE Delete_SGK(
    sgk_id_in NUMBER
  );
  /* SGK ekleme prosedürü */
  PROCEDURE Add_Dep_Doctor(
    dep_id_in NUMBER,
    doc_id_in NUMBER,
    dep_name_in VARCHAR2
  );

  /* Departman Doktor ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Dep_Doctor(
    dep_id_in NUMBER,
    doc_id_in NUMBER,
    dep_name_in VARCHAR2
  );

  /* Departman Doktor ilişkisi silme prosedürü */
  PROCEDURE Delete_Dep_Doctor(
    dep_id_in NUMBER,
    doc_id_in NUMBER
  );
  
  /* Departman Hemşire ilişkisi add prosedürü */
  PROCEDURE Add_Dep_Nurse(
    dep_id_in NUMBER,
    nurse_id_in NUMBER,
    dep_name_in VARCHAR2
  );

  /* Departman Hemşire ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Dep_Nurse(
    dep_id_in NUMBER,
    nurse_id_in NUMBER,
    dep_name_in VARCHAR2
  );

  /* Departman Hemşire ilişkisi silme prosedürü */
  PROCEDURE Delete_Dep_Nurse(
    dep_id_in NUMBER,
    nurse_id_in NUMBER
  );

END Data_Entry_Package;
/

CREATE OR REPLACE PACKAGE BODY Data_Entry_Package AS
  /* Departman ekleme prosedürü */
  PROCEDURE Add_Department(
    dep_id_in NUMBER,
    dep_name_in VARCHAR2,
    place_in VARCHAR2
  ) AS
  BEGIN
    INSERT INTO Department(dep_id, dep_name, place)
    VALUES(dep_id_in, dep_name_in, place_in);
  END Add_Department;

  /* Departman güncelleme prosedürü */
  PROCEDURE Update_Department(
    dep_id_in NUMBER,
    dep_name_in VARCHAR2,
    place_in VARCHAR2
  ) AS
  BEGIN
    UPDATE Department
    SET dep_name = dep_name_in,
        place = place_in
    WHERE dep_id = dep_id_in;
  END Update_Department;

  /* Departman silme prosedürü */
  PROCEDURE Delete_Department(
    dep_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Department
    WHERE dep_id = dep_id_in;
  END Delete_Department;

  /* Doktor ekleme prosedürü */
  PROCEDURE Add_Doctor(
    doc_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    profession_in VARCHAR2
  ) AS
  BEGIN
    INSERT INTO Doctor(doc_id, fname, lname, profession)
    VALUES(doc_id_in, fname_in, lname_in, profession_in);
  END Add_Doctor;

  /* Doktor güncelleme prosedürü */
  PROCEDURE Update_Doctor(
    doc_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    profession_in VARCHAR2
  ) AS
  BEGIN
    UPDATE Doctor
    SET fname = fname_in,
        lname = lname_in,
        profession = profession_in
    WHERE doc_id = doc_id_in;
  END Update_Doctor;

  /* Doktor silme prosedürü */
  PROCEDURE Delete_Doctor(
    doc_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Doctor
    WHERE doc_id = doc_id_in;
  END Delete_Doctor;

  /* Hemşire ekleme prosedürü */
  PROCEDURE Add_Nurse(
    nurse_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER
  ) AS
  BEGIN
    INSERT INTO Nurse(nurse_id, fname, lname, age)
    VALUES(nurse_id_in, fname_in, lname_in, age_in);
  END Add_Nurse;

  /* Hemşire güncelleme prosedürü */
  PROCEDURE Update_Nurse(
    nurse_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER
  ) AS
  BEGIN
    UPDATE Nurse
    SET fname = fname_in,
        lname = lname_in,
        age = age_in
    WHERE nurse_id = nurse_id_in;
  END Update_Nurse;

  /* Hemşire silme prosedürü */
  PROCEDURE Delete_Nurse(
    nurse_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Nurse
    WHERE nurse_id = nurse_id_in;
  END Delete_Nurse;

  /* Hasta ekleme prosedürü */
  PROCEDURE Add_Patient(
    patient_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER,
    phone_in VARCHAR2
  ) AS
  BEGIN
    INSERT INTO Patient(patient_id, fname, lname, age, phone)
    VALUES(patient_id_in, fname_in, lname_in, age_in, phone_in);
  END Add_Patient;

  /* Hasta güncelleme prosedürü */
  PROCEDURE Update_Patient(
    patient_id_in NUMBER,
    fname_in VARCHAR2,
    lname_in VARCHAR2,
    age_in NUMBER,
    phone_in VARCHAR2
  ) AS
  BEGIN
    UPDATE Patient
    SET fname = fname_in,
        lname = lname_in,
        age = age_in,
        phone = phone_in
    WHERE patient_id = patient_id_in;
  END Update_Patient;

  /* Hasta silme prosedürü */
  PROCEDURE Delete_Patient(
    patient_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Patient
    WHERE patient_id = patient_id_in;
  END Delete_Patient;

  /* Randevu ekleme prosedürü */
  PROCEDURE Add_Appointment(
    patient_id_in NUMBER,
    doc_id_in NUMBER,
    appointment_date_in DATE
  ) AS
  BEGIN
    INSERT INTO Appointment(patient_id, doc_id, appointment_date)
    VALUES(patient_id_in, doc_id_in, appointment_date_in);
  END Add_Appointment;

  /* Randevu güncelleme prosedürü */
  PROCEDURE Update_Appointment(
    patient_id_in NUMBER,
    doc_id_in NUMBER,
    appointment_date_in DATE
  ) AS
  BEGIN
    UPDATE Appointment
    SET patient_id = patient_id_in,
        doc_id = doc_id_in,
        appointment_date = appointment_date_in
    WHERE doc_id = doc_id_in and patient_id = patient_id_in;
  END Update_Appointment;

  /* Randevu silme prosedürü */
  PROCEDURE Delete_Appointment(
    patient_id_in NUMBER,
    doc_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Appointment
    WHERE doc_id = doc_id_in and patient_id = patient_id_in;
  END Delete_Appointment;

  /* Test ekleme prosedürü */
  PROCEDURE Add_Test(
    test_id_in NUMBER,
    test_name_in VARCHAR2
  ) AS
  BEGIN
    INSERT INTO Tests(test_id, test_name)
    VALUES(test_id_in, test_name_in);
  END Add_Test;

  /* Test güncelleme prosedürü */
  PROCEDURE Update_Test(
    test_id_in NUMBER,
    test_name_in VARCHAR2
  ) AS
  BEGIN
    UPDATE Tests
    SET test_name = test_name_in
    WHERE test_id = test_id_in;
  END Update_Test;

  /* Test silme prosedürü */
  PROCEDURE Delete_Test(
    test_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Tests
    WHERE test_id = test_id_in;
  END Delete_Test;

  /* Doktor Test ilişkisi ekleme prosedürü */
  PROCEDURE Add_Doc_Test(
    doc_id_in NUMBER,
    test_id_in NUMBER,
    quantity_in NUMBER DEFAULT 1
  ) AS
  BEGIN
    INSERT INTO Doc_Test(doc_id, test_id, quantity)
    VALUES(doc_id_in, test_id_in, quantity_in);
  END Add_Doc_Test;

  /* Doktor Test ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Doc_Test(
    doc_id_in NUMBER,
    test_id_in NUMBER,
    quantity_in NUMBER
  ) AS
  BEGIN
    UPDATE Doc_Test
    SET doc_id = doc_id_in,
        test_id = test_id_in,
        quantity = quantity_in
    WHERE doc_id = doc_id_in and test_id = test_id_in;
  END Update_Doc_Test;

  /* Doktor Test ilişkisi silme prosedürü */
  PROCEDURE Delete_Doc_Test(
    doc_id_in NUMBER,
    test_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Doc_Test
    WHERE doc_id = doc_id_in and test_id = test_id_in;
  END Delete_Doc_Test;

  /* Yatış ekleme prosedürü */
  PROCEDURE Add_Admissions(
    room_id_in NUMBER,
    dept_name_in VARCHAR2,
    admis_date_in DATE
  ) AS
  BEGIN
    INSERT INTO Admissions(room_id, dept_name, admis_date)
    VALUES(room_id_in, dept_name_in, admis_date_in);
  END Add_Admissions;

  /* Yatış güncelleme prosedürü */
  PROCEDURE Update_Admissions(
    room_id_in NUMBER,
    dept_name_in VARCHAR2,
    admis_date_in DATE
  ) AS
  BEGIN
    UPDATE Admissions
    SET room_id = room_id_in,
        dept_name = dept_name_in,
        admis_date = admis_date_in
    WHERE room_id = room_id_in;
  END Update_Admissions;

  /* Yatış silme prosedürü */
  PROCEDURE Delete_Admissions(
    room_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Admissions
    WHERE room_id = room_id_in;
  END Delete_Admissions;

  /* Hasta Yatış ilişkisi ekleme prosedürü */
  PROCEDURE Add_Patient_Admis(
    patient_id_in NUMBER,
    admis_day_in NUMBER,
    room_id_in NUMBER
  ) AS
  BEGIN
    INSERT INTO Patient_Admis(patient_id, admis_day, room_id)
    VALUES(patient_id_in, admis_day_in, room_id_in);
  END Add_Patient_Admis;

  /* Hasta Yatış ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Patient_Admis(
    patient_id_in NUMBER,
    admis_day_in NUMBER,
    room_id_in NUMBER
  ) AS
  BEGIN
    UPDATE Patient_Admis
    SET patient_id = patient_id_in,
        admis_day = admis_day_in,
        room_id = room_id_in
    WHERE patient_id = patient_id_in and room_id = room_id_in;
  END Update_Patient_Admis;

  /* Hasta Yatış ilişkisi silme prosedürü */
  PROCEDURE Delete_Patient_Admis(
    patient_id_in NUMBER,
    room_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Patient_Admis
    WHERE patient_id = patient_id_in and room_id = room_id_in;
  END Delete_Patient_Admis;

  /* SGK ekleme prosedürü */
  PROCEDURE Add_SGK(
    sgk_id_in NUMBER,
    patient_id_in NUMBER,
    sgk_entry_in DATE,
    sgk_finish_in DATE
  ) AS
  BEGIN
    INSERT INTO SGK(sgk_id, patient_id, sgk_entry, sgk_finish)
    VALUES(sgk_id_in, patient_id_in, sgk_entry_in, sgk_finish_in);
  END Add_SGK;

  /* SGK güncelleme prosedürü */
  PROCEDURE Update_SGK(
    sgk_id_in NUMBER,
    patient_id_in NUMBER,
    sgk_entry_in DATE,
    sgk_finish_in DATE
  ) AS
  BEGIN
    UPDATE SGK
    SET patient_id = patient_id_in,
        sgk_entry = sgk_entry_in,
        sgk_finish = sgk_finish_in
    WHERE sgk_id = sgk_id_in;
  END Update_SGK;

  /* SGK silme prosedürü */
  PROCEDURE Delete_SGK(
    sgk_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM SGK
    WHERE sgk_id = sgk_id_in;
  END Delete_SGK;
  
  /* SGK ekleme prosedürü */
  PROCEDURE Add_Dep_Doctor(
    dep_id_in NUMBER,
    doc_id_in NUMBER,
    dep_name_in VARCHAR2
  ) AS
  BEGIN
    INSERT INTO Dep_Doctor(dep_id, doc_id,dep_name)
    VALUES(dep_id_in, doc_id_in, dep_name_in);
  END Add_Dep_Doctor;

  /* Departman Doktor ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Dep_Doctor(
    dep_id_in NUMBER,
    doc_id_in NUMBER,
    dep_name_in VARCHAR2
  ) AS
  BEGIN
    UPDATE Dep_Doctor
    SET dep_id = dep_id_in,
        doc_id = doc_id_in,
        dep_name = dep_name_in
    WHERE dep_id = dep_id_in and doc_id = doc_id_in;
  END Update_Dep_Doctor;

  /* Departman Doktor ilişkisi silme prosedürü */
  PROCEDURE Delete_Dep_Doctor(
    dep_id_in NUMBER,
    doc_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Dep_Doctor
    WHERE dep_id = dep_id_in and doc_id = doc_id_in;
  END Delete_Dep_Doctor;

  /* Nurse ekleme prosedürü */
  PROCEDURE Add_Dep_Nurse(
    dep_id_in NUMBER,
    nurse_id_in NUMBER,
    dep_name_in VARCHAR2
  ) AS
  BEGIN
    INSERT INTO Dep_Nurse(dep_id, nurse_id,dep_name)
    VALUES(dep_id_in, nurse_id_in, dep_name_in);
  END Add_Dep_Nurse;

  /* Departman Hemşire ilişkisi güncelleme prosedürü */
  PROCEDURE Update_Dep_Nurse(
    dep_id_in NUMBER,
    nurse_id_in NUMBER,
    dep_name_in VARCHAR2
  ) AS
  BEGIN
    UPDATE Dep_Nurse
    SET dep_id = dep_id_in,
        nurse_id = nurse_id_in,
        dep_name = dep_name_in
    WHERE dep_id = dep_id_in and nurse_id = nurse_id_in;
  END Update_Dep_Nurse;

  /* Departman Hemşire ilişkisi silme prosedürü */
  PROCEDURE Delete_Dep_Nurse(
    dep_id_in NUMBER,
    nurse_id_in NUMBER
  ) AS
  BEGIN
    DELETE FROM Dep_Nurse
    WHERE dep_id = dep_id_in and nurse_id = nurse_id_in;
  END Delete_Dep_Nurse;

END Data_Entry_Package;
/

-- Departman
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Department(dep_id_in => 1, dep_name_in => 'Surgery', place_in => 'Building A');
  Data_Entry_Package.Add_Department(dep_id_in => 2, dep_name_in => 'Pediatrics', place_in => 'Building B');
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Department(dep_id_in => 1, dep_name_in => 'Cardiology', place_in => 'Building C');
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Department(dep_id_in => 2);
END;
/
----------------------------------------------------------
-- Doktor
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Doctor(doc_id_in => 1, fname_in => 'John', lname_in => 'Doe', profession_in => 'Cardiologist');
  Data_Entry_Package.Add_Doctor(doc_id_in => 2, fname_in => 'Jane', lname_in => 'Smith', profession_in => 'Pediatrician');
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Doctor(doc_id_in => 1, fname_in => 'Michael', lname_in => 'Johnson', profession_in => 'Surgeon');
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Doctor(doc_id_in => 2);
END;
/
-------------------------------------------------------------------------------
-- Hemşire
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Nurse(nurse_id_in => 1, fname_in => 'Emily', lname_in => 'White', age_in => 30);
  Data_Entry_Package.Add_Nurse(nurse_id_in => 2, fname_in => 'Daniel', lname_in => 'Brown', age_in => 28);
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Nurse(nurse_id_in => 1, fname_in => 'Emma', lname_in => 'Williams', age_in => 32);
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Nurse(nurse_id_in => 2);
END;
/
--------------------------------
-- Hasta
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Patient(patient_id_in => 1, fname_in => 'Alice', lname_in => 'Johnson', age_in => 40, phone_in => '123-456-7890');
  Data_Entry_Package.Add_Patient(patient_id_in => 2, fname_in => 'Bob', lname_in => 'Smith', age_in => 35, phone_in => '456-789-0123');
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Patient(patient_id_in => 1, fname_in => 'Alice', lname_in => 'Johnson', age_in => 41, phone_in => '123-456-7890');
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Patient(patient_id_in => 2);
END;
/
---------------------
-- Randevu
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Doctor(doc_id_in => 2, fname_in => 'Jane', lname_in => 'Smith', profession_in => 'Pediatrician');
  Data_Entry_Package.Add_Appointment(patient_id_in => 1, doc_id_in => 1, appointment_date_in => TO_DATE('2024-05-15', 'YYYY-MM-DD'));
  Data_Entry_Package.Add_Appointment(patient_id_in => 1, doc_id_in => 2, appointment_date_in => TO_DATE('2024-05-20', 'YYYY-MM-DD'));
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Appointment(patient_id_in => 1, doc_id_in => 2, appointment_date_in => TO_DATE('2024-05-16', 'YYYY-MM-DD'));
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Appointment(patient_id_in => 1, doc_id_in => 2);
END;
/
-------------------------------------
-- Test
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Test(test_id_in => 1, test_name_in => 'Blood Test');
  Data_Entry_Package.Add_Test(test_id_in => 2, test_name_in => 'X-Ray');
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Test(test_id_in => 1, test_name_in => 'Complete Blood Count');
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Test(test_id_in => 2);
END;
/
-------------------------------------------------------------------------
-- Doktor Test ilişkisi
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Doc_Test(doc_id_in => 1, test_id_in => 1, quantity_in => 3);
  Data_Entry_Package.Add_Doc_Test(doc_id_in => 2, test_id_in => 1, quantity_in => 2);
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Doc_Test(doc_id_in => 1, test_id_in => 1, quantity_in => 1);
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Doc_Test(doc_id_in => 2, test_id_in => 1);
END;
/
-----------------------------------------------------------------------
-- Yatış
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Admissions(room_id_in => 1, dept_name_in => 'Surgery', admis_date_in => TO_DATE('2024-05-15', 'YYYY-MM-DD'));
  Data_Entry_Package.Add_Admissions(room_id_in => 2, dept_name_in => 'Pediatrics', admis_date_in => TO_DATE('2024-05-20', 'YYYY-MM-DD'));
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Admissions(room_id_in => 2, dept_name_in => 'Cardiology', admis_date_in => TO_DATE('2024-05-16', 'YYYY-MM-DD'));
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Admissions(room_id_in => 1);
END;
/
------------------------------------
-- Hasta Yatış ilişkisi
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Admissions(room_id_in => 1, dept_name_in => 'Surgery', admis_date_in => TO_DATE('2024-05-15', 'YYYY-MM-DD'));
  Data_Entry_Package.Add_Patient(patient_id_in => 2, fname_in => 'Bob', lname_in => 'Smith', age_in => 35, phone_in => '456-789-0123');
  Data_Entry_Package.Add_Patient_Admis(patient_id_in => 1, admis_day_in => 3, room_id_in => 1);
  Data_Entry_Package.Add_Patient_Admis(patient_id_in => 2, admis_day_in => 5, room_id_in => 2);
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Patient_Admis(patient_id_in => 2, admis_day_in => 4, room_id_in => 2);
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Patient_Admis(patient_id_in => 1 ,room_id_in => 1);
END;
/
-----------------------
-- SGK
-- Ekleme
BEGIN
  Data_Entry_Package.Add_SGK(sgk_id_in => 1, patient_id_in => 1, sgk_entry_in => TO_DATE('2024-01-01', 'YYYY-MM-DD'), sgk_finish_in => TO_DATE('2024-12-31', 'YYYY-MM-DD'));
  Data_Entry_Package.Add_SGK(sgk_id_in => 2, patient_id_in => 2, sgk_entry_in => TO_DATE('2024-02-01', 'YYYY-MM-DD'), sgk_finish_in => TO_DATE('2024-12-30', 'YYYY-MM-DD'));
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_SGK(sgk_id_in => 1, patient_id_in => 2, sgk_entry_in => TO_DATE('2024-01-02', 'YYYY-MM-DD'), sgk_finish_in => TO_DATE('2024-12-31', 'YYYY-MM-DD'));
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_SGK(sgk_id_in => 2);
END;
/
---------------------------------------------------------
-- Departman Doktor ilişkisi
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Department(dep_id_in => 2, dep_name_in => 'Pediatrics', place_in => 'Building B');
  Data_Entry_Package.Add_Dep_Doctor(dep_id_in => 1, doc_id_in => 1, dep_name_in => 'Surgery');
  Data_Entry_Package.Add_Dep_Doctor(dep_id_in => 2, doc_id_in => 2, dep_name_in => 'Pediatrics');
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Dep_Doctor(dep_id_in => 2, doc_id_in => 2, dep_name_in => 'Cardiology');
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Dep_Doctor(dep_id_in => 1, doc_id_in => 1);
END;
/
----------------------------------------------------
-- Departman Hemşire ilişkisi
-- Ekleme
BEGIN
  Data_Entry_Package.Add_Nurse(nurse_id_in => 2, fname_in => 'Daniel', lname_in => 'Brown', age_in => 28);
  Data_Entry_Package.Add_Dep_Nurse(dep_id_in => 1, nurse_id_in => 1, dep_name_in => 'Surgery');
  Data_Entry_Package.Add_Dep_Nurse(dep_id_in => 2, nurse_id_in => 2, dep_name_in => 'Pediatrics');
END;
/
-- Güncelleme
BEGIN
  Data_Entry_Package.Update_Dep_Nurse(dep_id_in => 2, nurse_id_in => 2, dep_name_in => 'Cardiology');
END;
/
-- Silme
BEGIN
  Data_Entry_Package.Delete_Dep_Nurse(dep_id_in => 1, nurse_id_in => 1);
END;
/