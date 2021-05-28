use intercollegiate_athletic1;
#1.	List the city, state, and zip codes in the customer table.  Your result should not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)
select DISTINCT city,state,zip from CUSTOMER;
#2. List the name, department, phone number, and email address of employees with a phone number beginning with “3-”.
select empName,department,phone,email from EMPLOYEE where phone like '3-%';
#3. List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.
select * from RESOURCETBL where rate between 10 and 20 order by rate;
/*4.	List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2018. 
Include the event number, authorization date, and status in the output. (Hint: see the examples in Module 4 for date constants in Oracle and MySQL.)*/
select eventno,dateAuth,EVENTREQUEST.status from EVENTREQUEST where EVENTREQUEST.status in ('Approved','Denied') and dateAuth like '2018-07-%';
/*5.	List the location number and name of locations that are part of the “Basketball arena”.  
Your WHERE clause should not have a condition involving the facility number compared to a constant (“F101”). 
Instead, you should use a condition on the FacName column for the value of “Basketball arena”.*/
select locNo,locName from LOCATION,FACILITY where facName='Basketball Arena' and LOCATION.facNo=FACILITY.facNo;
/*6.	For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned.  
For example, plan number “P100” has 4 lines and 7 resources assigned. 
You only need to consider event plans that have at least one line.*/
select planNo, COUNT(*) as NumEventLines, count(distinct resNo) from EVENTPLANLINE where planNo='P100' group by planNo having COUNT(*)>1;