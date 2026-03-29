CREATE DATABASE IF NOT exists dbms_exam;
USE dbms_exam;
CREATE TABLE Classroom (
    building VARCHAR(50),
    room_number VARCHAR(10),
    capacity INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE Department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget DECIMAL(10,2)
);

CREATE TABLE Course (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Instructor (
    i_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Student (
    s_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    tot_cred INT,
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Section (
    course_id VARCHAR(10),
    sec_id INT,
    semester INT,
    year INT,
    building VARCHAR(50),
    room_number VARCHAR(10),
    time_slot_id VARCHAR(10),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES Classroom(building, room_number)
);

CREATE TABLE Teaches (
    i_id INT,
    course_id VARCHAR(10),
    sec_id INT,
    semester INT,
    year INT,
    PRIMARY KEY (i_id, course_id, sec_id, semester, year),
    FOREIGN KEY (i_id) REFERENCES Instructor(i_id),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES Section(course_id, sec_id, semester, year)
);
CREATE TABLE Takes (
    s_id INT,
    course_id VARCHAR(10),
    sec_id INT,
    semester INT,
    year INT,
    grade VARCHAR(2),
    PRIMARY KEY (s_id, course_id, sec_id, semester, year),
    FOREIGN KEY (s_id) REFERENCES Student(s_id)
);

CREATE TABLE Advisor (
    s_id INT,
    i_id INT,
    PRIMARY KEY (s_id),
    FOREIGN KEY (s_id) REFERENCES Student(s_id),
    FOREIGN KEY (i_id) REFERENCES Instructor(i_id)
);

CREATE TABLE Time_Slot (
    time_slot_id VARCHAR(10) PRIMARY KEY,
    day VARCHAR(10),
    start_time TIME,
    end_time TIME
);

CREATE TABLE Prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id)
);



INSERT INTO Department VALUES
('IT', 'LHC', 1000000),
('Computer Engg.', 'Main Block', 1500000);

INSERT INTO Instructor VALUES
(1, 'Amit', 'IT', 80000),
(2, 'Riya', 'Computer Engg.', 75000),
(3, 'Karan', 'Computer Engg.', 60000);

INSERT INTO Student VALUES
(101, 'Rahul', 'IT', 120),
(102, 'Sneha', 'Computer Engg.', 100);

INSERT INTO Course VALUES
('C1', 'DBMS', 'IT', 3),
('C2', 'OS', 'Computer Engg.', 4);

INSERT INTO Classroom VALUES
('LHC', '102', 60),
('LHC', '101', 50);

INSERT INTO Section VALUES
('C1', 1, 4, 2026, 'LHC', '102', 'T1'),
('C2', 1, 7, 2026, 'LHC', '101', 'T2');

INSERT INTO Teaches VALUES
(1, 'C1', 1, 4, 2026),
(2, 'C2', 1, 7, 2026);

UPDATE Instructor SET salary = 1.2*salary WHERE dept_name='IT';

SELECT name,dept_name FROM Instructor;
USE dbms_exam;

SELECT I.name,I.dept_name, D.building FROM Instructor I JOIN department D ON I.dept_name = D.dept_name;

SELECT dept_name,building FROM Department;

UPDATE Department SET building = 'Lecture Hall Complex' WHERE building = 'Lecture Hall Theatre';

SELECT dept_name FROM Student WHERE s_id=101;

SELECT I.name, T.course_id FROM Instructor I JOIN Teaches T ON T.i_id = I.i_id ;

 
SELECT S.course_id, S.semester, S.year, C.title FROM Section S JOIN Course C ON S.course_id = C.course_id WHERE dept_name = 'Computer Engg';

SELECT name,salary/12 AS monthly_salary FROM Instructor;

-- Q10
SELECT dept_name FROM Department WHERE building='Main Block';

SELECT name FROM Instructor WHERE dept_name='Computer Engg' AND salary>70000;


-- 14
SELECT year,semester FROM Section WHERE room_number = 'LHC-102';

-- 15
SELECT year,semester,sec_id FROM Section WHERE room_number = 'LHC-102';


-- 16
SELECT year,semester,sec_id FROM Section WHERE room_number = 'LHC-101';

-- 17
SELECT S.room_number,S.time_slot_id FROM Section S JOIN Course C ON S.course_id = C.course_id WHERE C.dept_name='Computer Engg' AND S.semester=7;


-- 18
SELECT C.title FROM Course C JOIN Teaches T ON C.course_id = T.course_id
JOIN Instructor I ON I.i_id=T.i_id where I.name='Rahul';

-- 19
SELECT DISTINCT I.name,I.dept_name FROM Instructor I  JOIN Teaches T ON I.i_id=T.i_id;

-- 20
SELECT name FROM Instructor WHERE salary>ANY(SELECT salary FROM Instructor WHERE dept_name= 'Computer Engg' );





