
-- 2. Table Creation
CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);

-- 3. Data Entry  
INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
    ('Arjun Kumar', 'Computer Science', 'arjun@example.com', 1234567890, '123 Main St', '1998-05-20', 'Male', 'Computer Science', 4.0, 'B'),
    ('Priya Menon', 'Mathematics', 'priya@example.com', 9876543210, '456 Elm St', '1999-02-15', 'Female', 'Mathematics', 3.5, 'C'),
    ('Suresh Rao', 'Physics', 'suresh@example.com', 8765432109, '789 Oak St', '1997-09-10', 'Male', 'Physics', 4.2, 'B'),
    ('Deepa Nair', 'Chemistry', 'deepa@example.com', 7654321098, '567 Pine St', '1998-11-25', 'Female', 'Chemistry', 3.8, 'B'),
    ('Krishna Iyer', 'Biology', 'krishna@example.com', 6543210987, '890 Cedar St', '1999-03-30', 'Male', 'Biology', 4.5, 'A'),
    ('Lakshmi Patel', 'Geology', 'lakshmi@example.com', 5432109876, '234 Birch St', '1997-07-05', 'Female', 'Geology', 3.9, 'B'),
    ('Rajesh Pillai', 'History', 'rajesh@example.com', 4321098765, '678 Maple St', '1998-01-12', 'Male', 'History', 3.6, 'C'),
    ('Meera Reddy', 'Economics', 'meera@example.com', 3210987654, '901 Walnut St', '1999-06-17', 'Female', 'Economics', 4.1, 'B'),
    ('Vishnu Menon', 'Sociology', 'vishnu@example.com', 2109876543, '345 Ash St', '1997-04-22', 'Male', 'Sociology', 3.7, 'C'),
    ('Shanti Kumar', 'Anthropology', 'shanti@example.com', 1098765432, '567 Oak St', '1998-08-08', 'Female', 'Anthropology', 4.3, 'A');

-- 4. Retrieve all students sorted by grade descending
SELECT * FROM student_table ORDER BY Grade DESC;

-- 5. Query for Male Students
SELECT * FROM student_table WHERE Gender = 'Male';

-- 6. Query for Students with GPA less than 5.0
SELECT * FROM student_table WHERE GPA < 5.0;

-- 7. Update Student Email and Grade
 UPDATE student_table SET email_id = 'newemail@example.com', Grade = 'A' WHERE Student_id = 1;

-- 8. Query for Students with Grade "B"
SELECT Stu_name, DATE_PART('year', AGE(Date_of_birth)) AS Age FROM student_table WHERE Grade = 'B';

-- 9. Grouping and Calculation
SELECT Department, Gender, AVG(GPA) AS Avg_GPA FROM student_table GROUP BY Department, Gender;

-- 10. Table Renaming
 ALTER TABLE student_table RENAME TO student_info;

-- 11. Retrieve Student with Highest GPA
SELECT Stu_name FROM student_info WHERE GPA = (SELECT MAX(GPA) FROM student_info);
