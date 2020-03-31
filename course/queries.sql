use courses;

-- Display those students that have participated in an (any) exam
SELECT DISTINCT
    students.fname, students.lname
FROM
    students,
    exams
WHERE
    students.stid = exams.stid;

-- Display the students and all their grades (from all courses)
SELECT 
    students.fname, students.lname, exams.grade, courses.name
FROM
    students,
    exams,
    courses
WHERE
    students.stid = exams.stid
        AND courses.cid = exams.cid;

-- Display the average grade of each student (from all courses)
SELECT 
    students.fname,
    students.lname,
    ROUND(AVG(exams.grade), 1) AS avg
FROM
    students,
    exams,
    courses
WHERE
    students.stid = exams.stid
        AND courses.cid = exams.cid
GROUP BY students.fname , students.lname;

-- Display the first and last name of those students that have an average grade greater than 5
SELECT 
    students.fname,
    students.lname,
    ROUND(AVG(exams.grade), 1) AS avg
FROM
    students,
    exams,
    courses
WHERE
    students.stid = exams.stid
        AND courses.cid = exams.cid
        AND exams.grade > 5
GROUP BY students.fname , students.lname;

-- Display the average grade per course (for all students)
SELECT 
    courses.name, ROUND(AVG(exams.grade), 1) AS avg
FROM
    students,
    exams,
    courses
WHERE
    students.stid = exams.stid
        AND courses.cid = exams.cid
GROUP BY courses.name;

-- Display those students that participated at “Math” course
SELECT 
    students.fname, students.lname, courses.name
FROM
    students,
    exams,
    courses
WHERE
    students.stid = exams.stid
        AND courses.name = 'Math'
GROUP BY students.fname , students.lname , courses.name;
        

-- Display the max grade (of all courses), the First and the Last name, 
-- for each student that have a grade greater than 5 at “Math” course
SELECT 
    students.fname,
    students.lname,
    ROUND(AVG(exams.grade), 1) AS avg, max(exams.grade) as maxGrade
FROM
    students,
    exams,
    courses
WHERE
    students.stid = exams.stid
        AND courses.cid = exams.cid
        AND exams.grade > 5
GROUP BY students.fname , students.lname


 