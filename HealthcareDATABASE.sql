
CREATE DATABASE healthcare_analysis_db;


--------------------------------------------------------------------------------

USE healthcare_analysis_db;


SHOW TABLES;


SELECT COUNT(*) AS total_records
FROM healthcare_cleaned;

--------------------------------------------------------------
CREATE TABLE patients AS
SELECT
    ROW_NUMBER() OVER () AS Patient_ID,
    Age,
    Gender,
    `Blood Type`,
    `Medical Condition`
FROM healthcare_cleaned;

-------------------------------------------------------------------------------

CREATE TABLE admissions AS
SELECT
    ROW_NUMBER() OVER () AS Admission_ID,
    ROW_NUMBER() OVER () AS Patient_ID,
    `Date of Admission`,
    `Admission Type`,
    `Discharge Date`,
    `Length of Stay`,
    `Admission Year`,
    `Admission Month`
FROM healthcare_cleaned;
---------------------------------------------------------------------------------

CREATE TABLE billing AS
SELECT
    ROW_NUMBER() OVER () AS Billing_ID,
    ROW_NUMBER() OVER () AS Patient_ID,
    `Insurance Provider`,
    `Billing Amount`
FROM healthcare_cleaned;

----------------------------------------------------------------------------------------

ALTER TABLE patients
ADD PRIMARY KEY (Patient_ID);

ALTER TABLE admissions
ADD PRIMARY KEY (Admission_ID);

ALTER TABLE billing
ADD PRIMARY KEY (Billing_ID);
--------------------------------------------------------------------------------------

ALTER TABLE admissions
ADD CONSTRAINT fk_admissions_patient
FOREIGN KEY (Patient_ID)
REFERENCES patients(Patient_ID);
---------------------------------------------------------------------------------------------------------------------

ALTER TABLE billing
ADD CONSTRAINT fk_billing_patient
FOREIGN KEY (Patient_ID)
REFERENCES patients(Patient_ID);

----------------------------------------------------------------------------------------------------------------------
SHOW CREATE TABLE patients;

----------------------------------------------------------------------------------------------------
CREATE TABLE medications AS
SELECT
    ROW_NUMBER() OVER () AS Medication_ID,
    ROW_NUMBER() OVER () AS Patient_ID,
    Medication
FROM healthcare_cleaned;

------------------------------------------------------------------------------------------------------

CREATE TABLE test_results AS
SELECT
    ROW_NUMBER() OVER () AS Test_Result_ID,
    ROW_NUMBER() OVER () AS Patient_ID,
    `Test Results`
FROM healthcare_cleaned;

-------------------------------------------------------------------

ALTER TABLE patients
ADD PRIMARY KEY (Patient_ID);


---------------------------------------------------------------------------------------------------

SHOW CREATE TABLE patients;

ALTER TABLE admissions
ADD CONSTRAINT fk_admissions_patient
FOREIGN KEY (Patient_ID)
REFERENCES patients(Patient_ID);


ALTER TABLE billing
ADD CONSTRAINT fk_billing_patient
FOREIGN KEY (Patient_ID)
REFERENCES patients(Patient_ID);

ALTER TABLE medications
ADD CONSTRAINT fk_medications_patient
FOREIGN KEY (Patient_ID)
REFERENCES patients(Patient_ID);

ALTER TABLE test_results
ADD CONSTRAINT fk_test_results_patient
FOREIGN KEY (Patient_ID)
REFERENCES patients(Patient_ID);


---------------------------------------------------------------------------------------
-- 1. How many patients are there for each admission type?
SELECT `Admission Type`,
       COUNT(*) AS total_patients
FROM healthcare_cleaned
GROUP BY `Admission Type`
ORDER BY total_patients DESC;

------------------------------------------------------------------------------------------
-- 2. What is the average billing amount for each medical condition?
SELECT `Medical Condition`,
       ROUND(AVG(`Billing Amount`), 2) AS average_billing
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY average_billing DESC;

----------------------------------------------------------------------------------------------

-- 3. Which hospitals have the highest number of patients?
SELECT Hospital,
       COUNT(*) AS total_patients
FROM healthcare_cleaned
GROUP BY Hospital
ORDER BY total_patients DESC
LIMIT 10;

----------------------------------------------------------------------------------------------------
-- 4. What is the total billing amount for each insurance provider?
SELECT `Insurance Provider`,
       ROUND(SUM(`Billing Amount`), 2) AS total_billing
FROM healthcare_cleaned
GROUP BY `Insurance Provider`
ORDER BY total_billing DESC;

-------------------------------------------------------------------------------------------------------------------
-- 5. Which medical conditions have more than 1,000 patients?
SELECT `Medical Condition`,
       COUNT(*) AS total_patients
FROM healthcare_cleaned
GROUP BY `Medical Condition`
HAVING COUNT(*) > 1000
ORDER BY total_patients DESC;

-------------------------------------------------------------------------------------------------------
-- 6. Which patients have billing amounts higher than the overall average?
SELECT Age,
       Gender,
       `Medical Condition`,
       `Billing Amount`,
       Hospital
FROM healthcare_cleaned
WHERE `Billing Amount` > (
    SELECT AVG(`Billing Amount`)
    FROM healthcare_cleaned
)
ORDER BY `Billing Amount` DESC;

------------------------------------------------------------------------------------------

-- 7. Which patients have their admission details and billing information?
SELECT
    p.Patient_ID,
    p.Age,
    p.Gender,
    a.`Admission Type`,
    a.`Length of Stay`,
    b.`Insurance Provider`,
    b.`Billing Amount`
FROM patients p
INNER JOIN admissions a
    ON p.Patient_ID = a.Patient_ID
INNER JOIN billing b
    ON p.Patient_ID = b.Patient_ID;
    
------------------------------------------------------------------------------------

-- 8. Show all patients and their billing information, including patients without billing records.
SELECT
    p.Patient_ID,
    p.Age,
    p.Gender,
    b.`Insurance Provider`,
    b.`Billing Amount`
FROM patients p
LEFT JOIN billing b
    ON p.Patient_ID = b.Patient_ID;
    
-----------------------------------------------------------------------------

-- 9.. Show all billing records and matching patient information?
SELECT
    b.Billing_ID,
    b.Patient_ID,
    p.Age,
    p.Gender,
    b.`Insurance Provider`,
    b.`Billing Amount`
FROM patients p
RIGHT JOIN billing b
    ON p.Patient_ID = b.Patient_ID;
    
-------------------------------------------------------------------------------------

-- 10.Show all patients and their medication and test results?
SELECT
    p.Patient_ID,
    p.Age,
    p.Gender,
    p.`Medical Condition`,
    m.Medication,
    t.`Test Results`
FROM patients p
LEFT JOIN medications m
    ON p.Patient_ID = m.Patient_ID
LEFT JOIN test_results t
    ON p.Patient_ID = t.Patient_ID;