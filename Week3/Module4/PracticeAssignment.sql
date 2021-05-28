SELECT custNo,custName,phone,city FROM intercollegiate_athletic1.CUSTOMER;
SELECT custNo,custName,phone,city FROM intercollegiate_athletic1.CUSTOMER where state='CO';
select * from intercollegiate_athletic1.CUSTOMER;
select * from intercollegiate_athletic1.EVENTREQUEST where estCost>4000.00 order by dateHeld;
#List the event number, the event date (DateHeld), and the estimated audience number with approved status and audience greater than 9000 or with pending status and audience greater than 7000.
select eventno, dateHeld, estAudience from intercollegiate_athletic1.EVENTREQUEST where (status='Approved' and estAudience>9000) or (status='Pending' and estAudience>7000);
#List the event number, event date (DateHeld), customer number and customer name of events placed in January 2018 by customers from Boulder.
select eventno, dateHeld, intercollegiate_athletic1.CUSTOMER.custNo, custName from intercollegiate_athletic1.CUSTOMER,
intercollegiate_athletic1.EVENTREQUEST where city='Boulder' and dateHeld like '2018-12-%' and
intercollegiate_athletic1.CUSTOMER.custNo=intercollegiate_athletic1.EVENTREQUEST.custNo;
 SELECT PlanNo, AVG(NumberFld) AS AvgNumResources
  FROM intercollegiate_athletic1.EVENTPLANLINE
  WHERE LocNo = 'L100'
  GROUP BY PlanNo;
  SELECT PlanNo, AVG(NumberFld) AS AvgNumResources, 
               COUNT(*) AS NumEventLines
  FROM intercollegiate_athletic1.EVENTPLANLINE
  WHERE LocNo = 'L100'
  GROUP BY PlanNo
  HAVING COUNT(*) > 1;