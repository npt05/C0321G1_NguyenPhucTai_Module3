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

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, Status, class_Id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, Status, class_Id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, Status, class_Id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark (sub_Id, student_Id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT *
FROM student;

SELECT *
FROM student
WHERE Status = true;      

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT s.student_Id, s.student_name, c.class_name
FROM student s join class c on s.class_Id = c.class_Id;

SELECT s.student_Id, s.student_name, c.class_name
FROM student s join class c on s.class_Id = c.class_Id
WHERE C.ClassName = 'A1';

SELECT s.student_Id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_Id = m.student_Id 
join Subject sub on m.sub_Id = sub.sub_Id
WHERE sub.sub_name = 'CF';
