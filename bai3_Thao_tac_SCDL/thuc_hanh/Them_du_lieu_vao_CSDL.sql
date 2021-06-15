CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class
(
    Class_ID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Class_Name VARCHAR(60) NOT NULL,
    Start_Date DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    Student_ID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Student_Name VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    Class_ID     INT         NOT NULL,
    FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID)
);
CREATE TABLE Subject
(
    Sub_ID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sub_Name VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);
CREATE TABLE Mark
(
    Mark_ID    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sub_ID     INT NOT NULL,
    Student_ID INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (Sub_ID, Student_ID),
    FOREIGN KEY (Sub_ID) REFERENCES Subject (Sub_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student (Student_ID)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (Student_Name, Address, Phone, Status, Class_ID)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (Student_Name, Address, Status, Class_ID)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (Student_Name, Address, Phone, Status, Class_ID)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO Mark (Sub_ID, Student_ID, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);       
