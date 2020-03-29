CREATE SCHEMA gym;

CREATE TABLE `gym`.`member` (
  `MembID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Zip` INT(5) NULL,
  `Date` DATE NOT NULL,
  `membershipID` INT NOT NULL,
  `onedaypassID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`MembID`));
  
  CREATE TABLE `gym`.`membership` (
    `Mid` INT NOT NULL AUTO_INCREMENT,
    `MName` VARCHAR(45) NOT NULL,
    `Price` DOUBLE NOT NULL,
    PRIMARY KEY (`Mid`)
);

CREATE TABLE `gym`.`onedaypass` (
    `PassID` INT NOT NULL AUTO_INCREMENT,
    `Date` DATE NOT NULL,
    `memberID` INT NULL DEFAULT NULL,
    `passcategoryID` INT NOT NULL,
    PRIMARY KEY (`Passid`)
);

  CREATE TABLE `gym`.`passcategory` (
    `PassCatID` INT NOT NULL AUTO_INCREMENT,
    `PCName` VARCHAR(45) NOT NULL,
    `Price` DOUBLE NOT NULL,
    `onedaypassID` INT NULL DEFAULT NULL,
    PRIMARY KEY (`PassCatID`)
);

CREATE TABLE `gym`.`transaction` (
    `Tid` INT NOT NULL AUTO_INCREMENT,
    `Date` DATE NOT NULL,
    `merchandise_id` INT NULL,
    `member_id` INT NOT NULL ,
    PRIMARY KEY (`Tid`)
);

  CREATE TABLE `gym`.`merchandise` (
    `MrchID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(45) NOT NULL,
    `Price` DOUBLE NOT NULL,
    PRIMARY KEY (`MrchID`)
);
ALTER TABLE `gym`.`member` 
ADD INDEX `fk_member_1_idx` (`membershipID` ASC) VISIBLE;
;
ALTER TABLE `gym`.`member` 
ADD CONSTRAINT `fk_member_1`
  FOREIGN KEY (`membershipID`)
  REFERENCES `gym`.`membership` (`Mid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
INSERT INTO `gym`.`membership` (`MName`, `Price`) VALUES ('1 month', '50');
INSERT INTO `gym`.`membership` (`MName`, `Price`) VALUES ('2 month', '70');
INSERT INTO `gym`.`membership` (`MName`, `Price`) VALUES ('6 month', '200');
INSERT INTO `gym`.`membership` (`MName`, `Price`) VALUES ('1 year', '300');


INSERT INTO `gym`.`member` (`Name`, `Zip`, `Date`, `membershipID`) VALUES ('Jack', '23994', '2020-01-01', '9');
INSERT INTO `gym`.`member` (`Name`, `Zip`, `Date`, `membershipID`) VALUES ('John', '26500', '2020-01-01', '10');


ALTER TABLE `gym`.`onedaypass` 
ADD INDEX `fk_onedaypass_1_idx` (`memberID` ASC) VISIBLE;
;
ALTER TABLE `gym`.`onedaypass` 
ADD CONSTRAINT `fk_onedaypass_1`
  FOREIGN KEY (`memberID`)
  REFERENCES `gym`.`member` (`MembID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `gym`.`onedaypass` (`Date`, `memberID`) VALUES ('2020-01-01', '2');
INSERT INTO `gym`.`member` (`Name`, `Zip`, `Date`, `membershipID`) VALUES ('Mary', '238779', '2020-01-01', '9');
INSERT INTO `gym`.`member` (`Name`, `Zip`, `Date`, `membershipID`, `onedaypassID`) VALUES ('Jane', '987220', '2020-01-01', '11', '1');



ALTER TABLE `gym`.`onedaypass` 
ADD INDEX `fk_onedaypass_2_idx` (`passcategoryID` ASC) VISIBLE;
;
ALTER TABLE `gym`.`onedaypass` 
ADD CONSTRAINT `fk_onedaypass_2`
  FOREIGN KEY (`passcategoryID`)
  REFERENCES `gym`.`passcategory` (`PassCatID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
INSERT INTO `gym`.`passcategory` (`PCName`, `Price`) VALUES ('a category', '49');
INSERT INTO `gym`.`onedaypass` (`Date`, `memberID`, `passcategoryID`) VALUES ('2020-01-01', '1', '1');

ALTER TABLE `gym`.`transaction` 
ADD CONSTRAINT `fk_transaction_1`
  FOREIGN KEY (`Tid`)
  REFERENCES `gym`.`member` (`MembID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `gym`.`member` (`Name`, `Zip`, `Date`, `membershipID`, `onedaypassID`) VALUES ('George', '83772', '2020-01-01', '10', '1');
INSERT INTO `gym`.`transaction` (`Date`) VALUES ('2020-02-01');

CREATE TABLE `gym`.`transactions_merchandise` (
  `transactions_merchandiseID` INT NOT NULL AUTO_INCREMENT,
  `transaction_id` INT NULL,
  `merchandise_id` INT NULL,
  PRIMARY KEY (`transactions_merchandiseID`));

  
ALTER TABLE `gym`.`transactions_merchandise` 
ADD INDEX `fk_transactions_merchandise_1_idx` (`merchandise_id` ASC) VISIBLE;
;
ALTER TABLE `gym`.`transactions_merchandise` 
ADD CONSTRAINT `fk_transactions_merchandise_1`
  FOREIGN KEY (`merchandise_id`)
  REFERENCES `gym`.`merchandise` (`MrchID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `gym`.`transactions_merchandise` 
ADD INDEX `fk_transactions_merchandise_2_idx` (`transaction_id` ASC) VISIBLE;
;
ALTER TABLE `gym`.`transactions_merchandise` 
ADD CONSTRAINT `fk_transactions_merchandise_2`
  FOREIGN KEY (`transaction_id`)
  REFERENCES `gym`.`transaction` (`Tid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `gym`.`transaction` (`Date`, `merchandise_id`, `member_id`) VALUES ('2020-01-01', '11', '1');
INSERT INTO `gym`.`transactions_merchandise` (`transaction_id`, `merchandise_id`) VALUES ('5', '12');
INSERT INTO `gym`.`merchandise` (`Name`, `Price`) VALUES ('An item', '5.2');

