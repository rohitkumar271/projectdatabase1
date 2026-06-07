CREATE TABLE admin (
    adm_id INT PRIMARY KEY,
    adm_name VARCHAR(50),
    adm_email VARCHAR(30),
    adm_phone INT
);

CREATE TABLE hod (
    hod_id INT PRIMARY KEY,
    hod_name VARCHAR(50),
    hod_email VARCHAR(30),
    hod_phone INT,
    dept_id int unique,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(50)
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
    section VARCHAR(10)
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(20) UNIQUE NOT NULL,
    capacity INT,
    features varchar(20),
    floor VARCHAR(50)
);

CREATE TABLE days (
    day_id INT PRIMARY KEY,
    day_name VARCHAR(20) UNIQUE NOT NULL,
    day_order INT
);

CREATE TABLE time_slots (
    slot_id INT PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    period_no INT
);

CREATE TABLE timetable (
    timetable_id INT PRIMARY KEY,
    class_id INT,
    subject_id INT,
    teacher_id INT,
    room_id INT,
    day_id INT,
    slot_id INT,
    semester VARCHAR(20),
    academic_year VARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (day_id) REFERENCES days(day_id),
    FOREIGN KEY (slot_id) REFERENCES time_slots(slot_id)
);
