create database itenary

CREATE TABLE admin (
    adm_id INT PRIMARY KEY,
    adm_name VARCHAR(50),
    adm_email VARCHAR(30),
    adm_phone VARCHAR(15)
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE hod (
    hod_id INT PRIMARY KEY,
    hod_name VARCHAR(50),
    hod_email VARCHAR(30),
    hod_phone VARCHAR(15),
    dept_id INT UNIQUE,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dept_id INT, 
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);


CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    subject_code VARCHAR(20) UNIQUE,
    credits INT
);

CREATE TABLE teacher_subject (
    ts_id INT PRIMARY KEY,
    teacher_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    UNIQUE (teacher_id, subject_id)
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    year INT,
    section VARCHAR(10),
    dept_id INT, 
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE rooms (
    room_no int PRIMARY KEY,
    capacity INT,
    features varchar(100),
    floor VARCHAR(50)
);

CREATE TABLE labs (
    lab_no INT PRIMARY KEY
    lab_name VARCHAR(20),
    capacity INT,
    features varchar(100),
    floor VARCHAR(50)
);

CREATE TABLE time_slots (
    slot_id INT PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    period_no INT,
    date date
);

CREATE TABLE timetable (
    timetable_id INT PRIMARY KEY,
    dept_id INT,
    class_id INT,
    subject_id INT,
    teacher_id INT,
    ts_id int,
    room_number varchar(20),
    lab_no INT,
    slot_id INT,
    date date,
    semester VARCHAR(20),
    academic_year VARCHAR(20),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (teacher_id) REFERENCES classes(teacher_id),
    FOREIGN KEY (subject_id) REFERENCES classes(subject_id),
    FOREIGN KEY (ts_id) REFERENCES teacher_subject(ts_id),
    FOREIGN KEY (room_no) REFERENCES rooms(room_no),
    FOREIGN KEY (lab_no) REFERENCES labs(lab_no),
    FOREIGN KEY (slot_id) REFERENCES time_slots(slot_id)
);
