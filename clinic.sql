-- create database clinic;
-- use clinic;

-- Departments
-- CREATE TABLE Departments (
--     department_id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL UNIQUE
-- );

-- Doctors
-- CREATE TABLE Doctors (
--     doctor_id INT PRIMARY KEY AUTO_INCREMENT,
--     full_name VARCHAR(100) NOT NULL,
--     department_id INT,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     phone VARCHAR(20),
--     FOREIGN KEY (department_id) REFERENCES Departments(department_id)
-- );

-- Patients
-- CREATE TABLE Patients (
--     patient_id INT PRIMARY KEY AUTO_INCREMENT,
--     full_name VARCHAR(100) NOT NULL,
--     date_of_birth DATE,
--     phone VARCHAR(20),
--     email VARCHAR(100) UNIQUE
-- );

-- Specializations (e.g., Cardiology, Dermatology)
-- CREATE TABLE Specializations (
--     specialization_id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL UNIQUE
-- );

-- Many-to-Many between Doctors and Specializations
-- CREATE TABLE AppointmentSpecializations (
--     doctor_id INT,
--     specialization_id INT,
--     PRIMARY KEY (doctor_id, specialization_id),
--     FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
--     FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
-- );

-- Appointments
-- CREATE TABLE Appointments (
--     appointment_id INT PRIMARY KEY AUTO_INCREMENT,
--     patient_id INT NOT NULL,
--     doctor_id INT NOT NULL,
--     appointment_date DATETIME NOT NULL,
--     reason TEXT,
--     FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
--     FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
-- );

-- Prescriptions (One-to-One with Appointment)
-- CREATE TABLE Prescriptions (
--     prescription_id INT PRIMARY KEY AUTO_INCREMENT,
--     appointment_id INT UNIQUE,
--     medication TEXT NOT NULL,
--     dosage VARCHAR(100),
--     instructions TEXT,
--     FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
-- );

-- Insert Departments
INSERT INTO Departments (name) VALUES
('Cardiology'),
('Dermatology'),
('Neurology'),
('General Medicine');

-- Insert Specializations
INSERT INTO Specializations (name) VALUES
('Cardiologist'),
('Dermatologist'),
('Neurologist'),
('General Practitioner');

-- Insert Doctors
INSERT INTO Doctors (full_name, department_id, email, phone) VALUES
('Dr. Alice Smith', 1, 'alice.smith@clinic.com', '123-456-7890'),
('Dr. Bob Johnson', 2, 'bob.johnson@clinic.com', '234-567-8901'),
('Dr. Clara Adams', 3, 'clara.adams@clinic.com', '345-678-9012'),
('Dr. Daniel Green', 4, 'daniel.green@clinic.com', '456-789-0123');

-- Assign Doctors to Specializations (many-to-many)
INSERT INTO AppointmentSpecializations (doctor_id, specialization_id) VALUES
(1, 1),  -- Dr. Alice Smith - Cardiologist
(2, 2),  -- Dr. Bob Johnson - Dermatologist
(3, 3),  -- Dr. Clara Adams - Neurologist
(4, 4);  -- Dr. Daniel Green - General Practitioner

-- Insert Patients
INSERT INTO Patients (full_name, date_of_birth, phone, email) VALUES
('John Doe', '1990-01-15', '111-222-3333', 'john.doe@email.com'),
('Jane Smith', '1985-07-22', '222-333-4444', 'jane.smith@email.com'),
('Emily Clark', '2000-03-10', '333-444-5555', 'emily.clark@email.com');

-- Insert Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2025-05-10 10:00:00', 'Chest pain'),
(2, 2, '2025-05-11 14:30:00', 'Skin rash'),
(3, 3, '2025-05-12 09:00:00', 'Migraine headaches');

-- Insert Prescriptions
INSERT INTO Prescriptions (appointment_id, medication, dosage, instructions) VALUES
(1, 'Aspirin', '100mg', 'Take one tablet daily after meals'),
(2, 'Hydrocortisone Cream', 'Apply thinly', 'Apply to affected area twice a day'),
(3, 'Ibuprofen', '200mg', 'Take one tablet every 8 hours with food');
