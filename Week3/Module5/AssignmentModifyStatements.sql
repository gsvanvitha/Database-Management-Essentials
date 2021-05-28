use intercollegiate_athletic1;
#Insert a new row into the Facility table with facility name “Swimming Pool”.
INSERT into FACILITY(facNo,facName) values ('F1099','Swimming Pool');
#Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Door” for the location name.
INSERT into LOCATION(locNo,facNo,locName) values ('L1099','F1099','Door');
#Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Locker Room” for the location name.
INSERT into LOCATION(locNo,facNo,locName) values ('L1100','F1099','Locker Room');
/*Change the location name of “Door” to “Gate” for the row inserted in modification problem 2. 
In MySQL, you need to place the UPDATE statement between two SET statements.
SET SQL_SAFE_UPDATES = 0;
UPDATE statement
SET SQL_SAFE_UPDATES = 1;*/
SET SQL_SAFE_UPDATES = 0;
UPDATE LOCATION SET locName='Gate' where locNo='L1099';
SET SQL_SAFE_UPDATES = 1;
#5.	Delete the row inserted in modification problem 3.
DELETE FROM LOCATION WHERE locNo = 'L1100';