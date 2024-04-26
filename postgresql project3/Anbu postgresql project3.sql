-- Table crestion

CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name TEXT,
    Event_Date DATE,
    Event_Location TEXT,
    Event_Description TEXT
);

CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name TEXT,
    Attendee_Phone TEXT,
    Attendee_Email TEXT,
    Attendee_City TEXT
);

CREATE TABLE Registrations (
    Registration_id SERIAL PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount NUMERIC,
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

-- 2. Data Creation
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES 
('Tech Summit', '2024-05-15', 'Chennai Trade Center', 'Annual technology conference'),
('Cultural Fest', '2024-06-20', 'Madurai College Grounds', 'Celebration of diverse cultures'),
('Business Conference', '2024-07-25', 'Coimbatore Convention Center', 'Networking and business insights');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES 
('Arjun Kumar', '1234567890', 'arjun@example.com', 'Chennai'),
('Priya Devi', '9876543210', 'priya@example.com', 'Madurai'),
('Sanjay Rao', '8765432109', 'sanjay@example.com', 'Coimbatore');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES 
(1, 1, '2024-05-10', 1000),
(2, 2, '2024-06-15', 800),
(3, 3, '2024-07-20', 1200);

-- 3. Manage Event Details
-- a) Inserting a new event
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES 
('Music Concert', '2024-08-30', 'Pondicherry Beach', 'Live music performances');

-- b) Updating an event's information
UPDATE Events 
SET Event_Location = 'Madurai Palace Grounds' 
WHERE Event_Id = 2;

-- c)  Delete registrations for the event with Event_Id = 3
DELETE FROM Registrations 
WHERE Event_Id = 3;

-- Now delete the event
DELETE FROM Events 
WHERE Event_Id = 3;

-- 4) Manage Track Attendees & Handle Events
-- a) Inserting a new attendee
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES 
('Karthik N', '6543210985', 'karthikn@example.com', 'Chennai');

-- b) Registering an attendee for an event
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES 
(1, 4, '2024-08-25', 1500);

-- 5. Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics

-- Retrieve event information
SELECT * FROM Events;

-- Generate attendee lists
SELECT Attendee_Name FROM Attendees;

-- Calculate event attendance statistics
SELECT Event_Id, COUNT(Attendee_Id) AS Attendance_Count 
FROM Registrations 
GROUP BY Event_Id;
