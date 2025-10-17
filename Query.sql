/* Q1 To Show Total manufactured Qty*/
select sum(manufacturedQty) `Total Manufactured Qty` from prod_data;

/* Q2 To Show Total Rejected Qty*/
select sum(RejectedQty) `Total Rejected Qty` from prod_data;

/*Q3 To Show Total Processed Qty*/
select sum(ProcessedQty) `Total Processed Qty` from prod_data;

/* Q4 To Show Total Wastage Rate*/
select SUM(RejectedQty)/SUM(ProcessedQty) `Wastage Rate` from Prod_data;

/* Q5 Top 10 Highest Rejected Qty employee Wise*/
Select empcode, Sum(RejectedQty) `Total Rejected` from Prod_data group by empcode order by `Total Rejected` desc limit 10;

/* Q6 Machine Wise Rejected Qty*/
Select MachineName, Sum(RejectedQty) `Total Rejected` from prod_data Where RejectedQty !=0 group by MachineName order by `Total Rejected`desc ;

/* Q7 Top 10 Machine Wise Rejected Qty*/
Select MachineName, Sum(RejectedQty) `Total Rejected` from prod_data group by MachineName order by `Total Rejected`desc limit 10 ;

/* Q8 Manufactured vs Rejected Qty*/
Select ManufacturedQty, RejectedQty from prod_data order by ManufacturedQty desc;

/*Q9 Department Wise Manufactured vs Rejected Qty*/
select departmentName, sum(ManufacturedQty) `Manufactured Qty`, sum(RejectedQty) `Rejected Qty` from prod_data group by departmentName;

/* Q10 Production Comparision Trend */
Select FiscalDate, sum(ManufacturedQty) `Manufactured Qty` , sum(RejectedQty) `Rejected Qty`,sum(ProcessedQty) `Processed Qty`, sum(ProducedQty)`Produced qty` 
from prod_data group by FiscalDate order by FiscalDate;

/* Q11 Rank based on Total Produced Qty*/
Select FiscalDate, sum(ProducedQty) `Total Produced Qty`, rank() Over (order by sum(ProducedQty)desc)`Rank ` from Prod_data group by FiscalDate;

/* Q12 Top 5 Highest Rejection */
Select * from(
Select FiscalDate, Sum(RejectedQty) `Rejected Qty`, rank() over(order by sum(RejectedQty)desc)as `Highest Rejection` from prod_data group by FiscalDate) t
 Where `Highest Rejection`<=5;
 
 /*Q13 Department Wise Lowest Rejection*/
 select * from 
 (select departmentname, sum(RejectedQty) Rejected_Qty, rank() Over (order by sum(RejectedQty)) Lowest_Rejection
 from prod_data group by departmentName)t ;

