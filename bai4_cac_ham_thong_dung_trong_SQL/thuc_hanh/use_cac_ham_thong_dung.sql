CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE class
(
    class_Id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
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
    FOREIGN KEY (sub_Id) REFERENCES subject (sub_Id),
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

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark (sub_Id, student_Is, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);   

SELECT address, COUNT(student_Id) AS 'Số lượng học viên'
FROM student
GROUP BY address;

SELECT s.student_Id,s.student_name, AVG(mark)
FROM student s join mark m on s.student_Id = m.student_Id
GROUP BY s.student_Id, s.student_name
HAVING AVG(mark) > 15;

SELECT s.student_Id, s.student_name, AVG(mark)
FROM student s join mark m on s.student_Id = m.student_Id
GROUP BY s.student_Id, s.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_Id);

