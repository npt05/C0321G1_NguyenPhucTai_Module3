CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE class
(
    class_Id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    ctart_date DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE student
(
    student_Id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    Status      BIT,
    class_Id     INT         NOT NULL,
    FOREIGN KEY (class_Id) REFERENCES class (class_Id)
);
CREATE TABLE subject
(
    sub_Id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    Status  BIT                  DEFAULT 1
);
CREATE TABLE mark
(
    mark_Id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_Id     INT NOT NULL,
    student_Id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_Id, student_Id),
    FOREIGN KEY (sub_Id) REFERENCES Subject (sub_Id),
    FOREIGN KEY (student_Id) REFERENCES student (student_Id)
);