CREATE DATABASE miniproject;
USE miniproject;

CREATE TABLE Student(
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    total_sessions INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    enroll_date DATE,
    PRIMARY KEY (student_id, course_id), 
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
CREATE TABLE Result (
    student_id INT,
    course_id INT,
    mid_score FLOAT CHECK (mid_score >= 0 AND mid_score <= 10),
    final_score FLOAT CHECK (final_score >= 0 AND final_score <= 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id, course_id) REFERENCES Enrollment(student_id, course_id)
);

-- Phần II
INSERT INTO Student 
VALUES (1, 'Nguyen Van A', '2003-01-01', 'a@gmail.com'),
	(2, 'Tran Thi B', '2003-02-02', 'b@gmail.com'),
	(3, 'Le Van C', '2003-03-03', 'c@gmail.com'),
	(4, 'Pham Thi D', '2003-04-04', 'd@gmail.com'),
	(5, 'Hoang Van E', '2003-05-05', 'e@gmail.com');

INSERT INTO Instructor 
VALUES (1, 'Thay Nam', 'nam@gmail.com'),
	(2, 'Co Hoa', 'hoa@gmail.com'),
	(3, 'Thay Minh', 'minh@gmail.com'),
	(4, 'Co Lan', 'lan@gmail.com'),
	(5, 'Thay Hung', 'hung@gmail.com');

INSERT INTO Course 
VALUES (1, 'SQL', 'Hoc SQL co ban', 20, 1),
	(2, 'Java', 'Lap trinh Java', 25, 2),
	(3, 'Python', 'Hoc Python', 15, 3),
	(4, 'Web', 'Lap trinh web', 30, 4),
	(5, 'AI', 'Nhap mon AI', 18, 5);

INSERT INTO Enrollment 
VALUES (1, 1, '2026-01-01'),
	(1, 2, '2026-01-02'),
	(2, 1, '2026-01-03'),
	(3, 3, '2026-01-04'),
	(4, 4, '2026-01-05');

INSERT INTO Result 
VALUES (1, 1, 8, 9),
	(1, 2, 7, 8),
	(2, 1, 6, 7),
	(3, 3, 9, 9),
	(4, 4, 5, 6);


-- Phần III
UPDATE Student
SET email = 'newemail@gmail.com'
WHERE student_id = 1;
UPDATE Course
SET description = 'SQL nang cao'
WHERE course_id = 1;

UPDATE Result
SET final_score = 10
WHERE student_id = 1 AND course_id = 1;


-- phần IV
DELETE FROM Enrollment
WHERE student_id = 1 AND course_id = 2;

DELETE FROM Result
WHERE student_id = 1 AND course_id = 2;


-- phần V
-- Danh sách sinh viên
SELECT student_id, full_name, birth_date, email FROM Student;
-- Danh sách giảng viên
SELECT instructor_id, full_name, email FROM Instructor;
-- Danh sách khóa học
SELECT course_id, course_name, description, total_sessions FROM Course;
-- Danh sách đăng ký
SELECT student_id, course_id, enroll_date FROM Enrollment;
-- Danh sách điểm
SELECT student_id, course_id, mid_score, final_score FROM Result;