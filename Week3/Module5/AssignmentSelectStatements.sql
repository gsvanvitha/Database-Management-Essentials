use intercollegiate_athletic1;
/*1.	For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans. 
Only include event requests in the result if the event request has more than one related event plan with a work date in December 2018.*/
select EVENTREQUEST.eventno,dateHeld, count(*) as EventPlans 
from EVENTREQUEST ,EVENTPLAN 
where workDate like '2018-12-%' 
and EVENTREQUEST.eventno=EVENTPLAN.eventno
group by EVENTREQUEST.eventno 
having count(*)>1;
/*2.	List the plan number, event number, work date, and activity of event plans meeting the following two conditions: 
(1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”.  
Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
Instead, you should use a condition on the FacName column for the value of “Basketball arena”.*/
select planNo, EVENTPLAN.eventNo, workDate, activity 
from EVENTPLAN,FACILITY,EVENTREQUEST 
where workDate like '2018-12-%' 
and facName='Basketball Arena'
and EVENTPLAN.eventNo=EVENTREQUEST.eventNo 
and EVENTREQUEST.facNo=FACILITY.facNo;
/*3. List the event number, event date, status, and estimated cost of events where there is an event plan managed by Mary Manager 
and the event is held in the basketball arena in the period October 1 to December 31, 2018. 
Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the WHERE clause.
Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.*/
select EVENTPLAN.eventNo, dateHeld, status, estCost 
from EVENTPLAN,EVENTREQUEST,EMPLOYEE,FACILITY 
where facName='Basketball Arena' 
and empName='Mary Manager'
and EVENTPLAN.eventno = EVENTREQUEST.eventno
and EVENTREQUEST.facNo = FACILITY.facNo 
and EVENTPLAN.empNo = EMPLOYEE.empNo
and dateHeld between '2018-10-01' and '2018-12-31';
/*4. List the plan number, line number, resource name, number of resources (eventplanline.number), location name, time start, and time end
where the event is held at the basketball arena, the event plan has activity of activity of “Operation”, 
and the event plan has a work date in the period October 1 to December 31, 2018. 
Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
Instead, you should use a condition on the FacName column for the value of “Basketball arena”.*/
SELECT EVENTPLANLINE.planNo, lineNo, resName, numberFLD,locName, timeStart, timeEnd
FROM EVENTPLANLINE, EVENTPLAN, RESOURCETBL, LOCATION, FACILITY
WHERE EVENTPLANLINE.planNo = EVENTPLAN.planNo
AND EVENTPLANLINE.resNo = RESOURCETBL.resNo
AND EVENTPLANLINE.locNo = LOCATION.locNo
AND LOCATION.facNo = FACILITY.facNo
AND facName = 'Basketball Arena'
AND activity = 'Operation'
AND workDate BETWEEN '2018-10-01' AND '2018-12-31';
