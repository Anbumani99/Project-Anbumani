-- Create StudentInfo table 
use student_db ;
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(100),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(100),
    ADDRESS VARCHAR(255)
);

 -- Create CoursesInfo table
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    COURSE_INSTRUCTOR_NAME VARCHAR(100)
);

-- Create EnrollmentInfo table
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

-- Insert sample data into StudentInfo table
INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES 
(1, 'Arun kumar ', '2000-01-01', '123-456-7890', 'arun.k@example.com', '123 Main St'),
(2, 'naveen kumar ', '2001-02-03', '987-654-3210', 'naveen.k@example.com', '456 Elm St');

-- Insert sample data into CoursesInfo table
INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES 
(101, 'Mathematics', 'Prof. krish'),
(102, 'Physics', 'Prof. sam');

-- Insert sample data into EnrollmentInfo table
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES 
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),
(3, 2, 101, 'Enrolled');

-- a) Retrieve student details
SELECT STU_NAME, DOB, PHONE_NO, EMAIL_ID, ENROLL_STATUS
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID;

-- b) Retrieve list of courses for a specific student
SELECT CoursesInfo.COURSE_NAME, CoursesInfo.COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE EnrollmentInfo.STU_ID = 1;


-- c) Retrieve course information
SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;

-- d) Retrieve course information for a specific course
SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID = 101;

-- e) Retrieve course information for multiple courses
SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID IN (101, 102);

/* 3) Retrieve the Student Information */ 
-- a) Number of students enrolled in each course

SELECT CoursesInfo.COURSE_NAME, COUNT(*) AS Num_Students
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY CoursesInfo.COURSE_NAME;

-- b) List of students enrolled in a specific course
SELECT StudentInfo.STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
WHERE EnrollmentInfo.COURSE_ID = 101;

-- c) Count of enrolled students for each instructor
SELECT CoursesInfo.COURSE_INSTRUCTOR_NAME, COUNT(*) AS Num_Students
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY CoursesInfo.COURSE_INSTRUCTOR_NAME;

-- d) List of students enrolled in multiple courses
SELECT EnrolledStudents.STU_NAME
FROM (
    SELECT SI.STU_ID, SI.STU_NAME, COUNT(*) AS Num_Courses
    FROM StudentInfo SI
    JOIN EnrollmentInfo EI ON SI.STU_ID = EI.STU_ID
    GROUP BY SI.STU_ID, SI.STU_NAME
) AS EnrolledStudents
WHERE EnrolledStudents.Num_Courses > 1;

-- e) Courses with the highest number of enrolled students
SELECT CoursesInfo.COURSE_NAME, COUNT(*) AS Num_Students
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY CoursesInfo.COURSE_NAME
ORDER BY Num_Students DESC;



