CREATE TABLE department(
name VARCHAR(10) NOT NULL,
department_id INT PRIMARY KEY,
)

CREATE TABLE student (
id INT PRIMARY KEY,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
adress VARCHAR(15) NOT NULL,
academic_year INT NOT NULL,
);

CREATE TABLE student_phone(
id INT NOT NULL,
phone_number VARCHAR(15) PRIMARY KEY,
CONSTRAINT fk_student_phone FOREIGN KEY (id) 
REFERENCES student(id)
);

CREATE TABLE guardian(
student_id INT NOT NULL unique,
full_name VARCHAr(25) PRIMARY KEY, --Not null
constraint fk_student_guardian FOREIGN KEY(student_id)
REFERENCES student(id)
)

CREATE TABLE guardian_phone(
full_name VARCHAr(25) NOT NULL,
phone_number VARCHAR(11) PRIMARY KEY,
CONSTRAINT fk_guardian_phone FOREIGN KEY (full_name) 
REFERENCES guardian(full_name)
)

CREATE TABLE course(
name VARCHAR(20) NOT NULL UNIQUE,
course_code VARCHAR(5) PRIMARY KEY,
cridit INT NOT NULL,
)
-- a a cs
-- a a is
-- p p cs
CREATE TABLE course_with_dapartment(
department_id INT NOT NULL,
course_code VARCHAR(5) NOT NULL,
CONSTRAINT fk_department_course_with_dapartment FOREIGN KEY (department_id)
REFERENCES department(department_id),
CONSTRAINT fk_course_course_with_dapartment FOREIGN KEY (course_code)
REFERENCES course(course_code)
)

CREATE TABLE courses_enrroled(
course_code VARCHAR(5) PRIMARY KEY,
CONSTRAINT fk_course_courses_enrroled FOREIGN KEY (course_code)
REFERENCES course(course_code)
)

CREATE TABLE courses_with_student(
registration_id INT PRIMARY KEY,
student_id INT NOT NULL,
course_code VARCHAR(5) , --##
CONSTRAINT fk_courses_with_student FOREIGN KEY (student_id)
REFERENCES student(id),
CONSTRAINT fk_courses_with_student_course FOREIGN KEY (course_code)
REFERENCES course(course_code)
)

CREATE TABLE assignment(
registration_id INT,
course_code VARCHAR(5) NOT NULL,
number INT NOT NULL,
deadline DATE NOT NULL,
grade INT NOT NULL,
CONSTRAINT fk_course_assignment FOREIGN KEY (registration_id)
REFERENCES courses_with_student(registration_id)
)

CREATE TABLE lecturer (
lecturer_id INT PRIMARY KEY,
salary INT NOT NULL,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
adress VARCHAR(15) NOT NULL,
age INT,
course_code VARCHAR(5) NOT NULL,
CONSTRAINT fk_course_lecturer FOREIGN KEY (course_code)
REFERENCES courses_enrroled(course_code)
);

CREATE TABLE lecturer_phone(
lecturer_id INT NOT NULL,
phone VARCHAR(15) PRIMARY KEY,
CONSTRAINT fk_lecturer_lecturer_phone FOREIGN KEY (lecturer_id)
REFERENCES lecturer(lecturer_id)
)

CREATE TABLE lecturer_with_dapartment(
department_id INT NOT NULL,
lecturer_id INT NOT NULL,
CONSTRAINT fk_department_lecturer_with_dapartment FOREIGN KEY (department_id)
REFERENCES department(department_id),
CONSTRAINT fk_lecturer_lecturer_with_dapartment FOREIGN KEY (lecturer_id)
REFERENCES lecturer(lecturer_id)
)


drop table course_with_dapartment;
drop table lecturer_with_dapartment;
drop table department;
drop table lecturer_phone;
drop table lecturer;
drop table assignment;
drop table courses_with_student;
drop table courses_enrroled;
drop table course;
drop table guardian_phone;
drop table guardian;
drop table student_phone;
drop table student;