use intercollegiate_athletic1;
#1. List the event number, date held, customer number, customer name, facility number, and facility name of 2018 events placed by Boulder customers.
select eventno, dateHeld, CUSTOMER.custNo, custName, FACILITY.facNo, facName from CUSTOMER,EVENTREQUEST,FACILITY where city='Boulder' and dateHeld like '2018%'
and CUSTOMER.custNo = EVENTREQUEST.custNo and EVENTREQUEST.facNo=FACILITY.facNo;
/*2. List the customer number, customer name, event number, date held, facility number, facility name, and estimated audience cost per person (EstCost / EstAudience) 
for events held on 2018, in which the estimated cost per person is less than $0.2*/
select CUSTOMER.custNo, custName, eventno, dateheld, FACILITY.facNo, facName, (estCost/estAudience) as estimatedAudienceCost from CUSTOMER,EVENTREQUEST,FACILITY
where dateHeld like '2018%' and (estCost/estAudience)<0.2 and CUSTOMER.custNo = EVENTREQUEST.custNo and EVENTREQUEST.facNo=FACILITY.facNo;
/*3, List the customer number, customer name, and total estimated costs for Approved events.
The total amount of events is the sum of the estimated cost for each event. Group the results by customer number and customer name.*/
select CUSTOMER.custNo, custName, SUM(estCost) as TotalCost from EVENTREQUEST INNER JOIN CUSTOMER on CUSTOMER.custNo= EVENTREQUEST.custNo 
where status='Approved' group by CUSTOMER.custNo,custName;
#4. Insert yourself as a new row in the Customer table.
INSERT INTO CUSTOMER (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ('C2000', 'Anvitha', 'Wall Street', 'Y', 'Self', '725000','Denver', 'CO', '80204'); 
#5. Increase the rate by 10 percent of nurse resource in the resource table.
UPDATE RESOURCETBL SET Rate = Rate * 1.1 WHERE ResName = 'nurse';
SET SQL_SAFE_UPDATES = 1; 
#6. Delete the new row added to the Customer table.
DELETE FROM Customer WHERE CustNo = 'C2000';
