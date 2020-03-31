use course;

CREATE TABLE `course`.`students` (
  `stID` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dateofbirth` DATE NOT NULL,
  PRIMARY KEY (`stID`));

CREATE TABLE `course`.`courses` (
  `cID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lecturer` VARCHAR(45) NOT NULL,
  `assistant` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `startdate` DATE NULL,
  PRIMARY KEY (`cID`));

CREATE TABLE `course`.`exams` (
  `examID` INT NOT NULL AUTO_INCREMENT,
  `cID` INT NOT NULL,
  `stID` INT NOT NULL,
  `grade` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`examID`));

ALTER TABLE `course`.`exams` 
ADD INDEX `fk_exams_students_idx` (`stID` ASC) VISIBLE,
ADD INDEX `fk_exams_courses_idx` (`cID` ASC) VISIBLE;
;
ALTER TABLE `course`.`exams` 
ADD CONSTRAINT `fk_exams_students`
  FOREIGN KEY (`stID`)
  REFERENCES `course`.`students` (`stID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_exams_courses`
  FOREIGN KEY (`cID`)
  REFERENCES `course`.`courses` (`cID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;




INSERT INTO `course`.`courses` (`name`, `lecturer`, `assistant`, `duration`, `startdate`) VALUES ('Math', 'Brian', 'A', '15', '2020-01-01');
INSERT INTO `course`.`courses` (`name`, `lecturer`, `assistant`, `duration`, `startdate`) VALUES ('Gepmetry', 'Bob', 'B', '20', '2020-02-01');
INSERT INTO `course`.`courses` (`name`, `lecturer`, `assistant`, `duration`, `startdate`) VALUES ('Physics', 'Mary', 'C', '20', '2020-03-04');
INSERT INTO `course`.`courses` (`name`, `lecturer`, `assistant`, `duration`, `startdate`) VALUES ('Greek', 'Jane', 'D', '15', '2020-06-01');

INSERT INTO `course`.`students` (`fname`, `lname`, `dateofbirth`) VALUES ('George', 'Georgiou', '1990-01-01');
INSERT INTO `course`.`students` (`fname`, `lname`, `dateofbirth`) VALUES ('Antonis', 'Papadopoulos', '1991-02-04');
INSERT INTO `course`.`students` (`fname`, `lname`, `dateofbirth`) VALUES ('Maria', 'Andreou', '1990-02-02');
INSERT INTO `course`.`students` (`fname`, `lname`, `dateofbirth`) VALUES ('Petroe', 'Panou', '1998-01-02');
INSERT INTO `course`.`students` (`fname`, `lname`, `dateofbirth`) VALUES ('Panos', 'B', '1990-01-02');

INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('1', '2', '6');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('1', '1', '7');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('1', '3', '5');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('1', '4', '9');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('2', '5', '10');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('3', '4', '3');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('2', '2', '8');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('2', '2', '6');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('2', '1', '7');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('2', '3', '5');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('2', '4', '9');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('3', '5', '10');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('1', '4', '3');
INSERT INTO `course`.`exams` (`cID`, `stID`, `grade`) VALUES ('3', '2', '8');

