select *
from bank_loan_data

--1.Total Loan Applications:
select count(id)as Total_Loan_application
from bank_loan_data

--MTD Loan Application
select count(id)as MTD_Total_Loan_application from bank_loan_data
where month(issue_date)=11 and YEAR(issue_date)=2021

--PMTD Loan Application
select count(id)as Total_Loan_application from bank_loan_data
where month(issue_date)=10 and YEAR(issue_date)=2021

--(MTD_PMTD)/PMTD -->MOM(track changes Month-over-Month)
----------------------------------------------------------------------------------------------------

--2.Total Funded Amount:(«·„»·€ «·≈Ã„«·Ì ··√„Ê«· «·„œ›Ê⁄… ﬂﬁ—Ê÷)
select sum(loan_amount) as Total_Funded_Amount
from bank_loan_data

--MTD
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--PMTD
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date)=10 and YEAR(issue_date)=2021
----------------------------------------------------------------------------------------------------
--3.Total Amount Received:(«·„»·€ «·«Ã„«·Ì «·Ê«—œ „‰ «·„ﬁ —÷Ì‰)
select sum(total_payment) as Total_Amount_Received
from bank_loan_data

--MTD
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where month(issue_date)=11 and YEAR(issue_date)=2021

--PMTD
select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
where month(issue_date)=10 and YEAR(issue_date)=2021
--------------------------------------------------------------------------------------------

--4.Average Interest Rate:(Õ”«» „ Ê”ÿ ”⁄— «·›«∆œ… ⁄»— Ã„Ì⁄ «·ﬁ—Ê÷)

/*[«·€—÷: Ì„À· ”⁄— «·›«∆œ… «· ﬂ·›… «·”‰ÊÌ… ··«ﬁ —«÷ „⁄»—« ⁄‰Â« ﬂ‰”»… „∆ÊÌ…. «‰Â«
ÌÕœœ  ﬂ·›… «·ﬁ—÷.
«·«” Œœ«„ ··»‰Êﬂ:  ” Œœ„ «·»‰Êﬂ √”⁄«— «·›«∆œ… · ”⁄Ì— «·ﬁ—Ê÷ Ê≈œ«—… ÂÊ«„‘ «·—»Õ ÊÃ–»
«·„” À„—Ê‰]*/

select round(avg(int_rate),4)*100 as Average_Interest_Rate
from bank_loan_data

--MTD
select round(avg(int_rate),4)*100 as MTD_Average_Interset_Rate from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

--PMTD
select round(avg(int_rate),4)*100 as PMTD_Average_Interset_Rate from bank_loan_data
where month(issue_date)=10 and year(issue_date)=2021
------------------------------------------------------------------------------------------------------------------

--5.Average Debt-to-Income Ratio (DTI): Evaluating the average DTI for our borrowers helps us gauge their financial health.) gauge-->measure

/*[Purpose: DTI measures the borrower's debt burden relative to income. It gauges the
borrower's capacity to take on additional debt.
Use for Banks: Banks use DTI to assess a borrower's ability to handle loan payments and
make responsible lending decisions]

«·«” Œœ«„ ··»‰Êﬂ:  ” Œœ„ «·»‰Êﬂ DTI · ﬁÌÌ„ ﬁœ—… «·„ﬁ —÷ ⁄·Ï «· ⁄«„· „⁄ „œ›Ê⁄«  «·ﬁ—Ê÷ Ê
« Œ«– ﬁ—«—«  «·≈ﬁ—«÷ «·„”ƒÊ·…*/

/*   The Debt-to-Income Ratio (DTI) is an important financial metric that lenders use to assess a borrower's ability to manage
monthly payments and debts relative to their income. A lower DTI ratio generally indicates 
a healthier financial situation for borrowers. 
Calculating the average DTI helps in understanding the overall financial health of borrowers within the dataset. */


-- ‘Ì— ‰”»… DTI «·„‰Œ›÷… ⁄„Ê„« ≈·Ï Ê÷⁄ „«·Ì √ﬂÀ— ’Õ… ··„ﬁ —÷Ì‰.
select round(AVG(dti),4)*100 as Average_DTI
from bank_loan_data

--MTD
select round(AVG(dti),4)*100 as MTD_Average_DTI from bank_loan_data
where month(issue_date)=11 and YEAR(issue_date)=2021

--PMTD
select round(AVG(dti),4)*100 as PMTD_Average_DTI from bank_loan_data
where month(issue_date)=10 and YEAR(issue_date)=2021

--if DTI is more high then you are not able to manage your payments and all things.[30% to 35%] is better DTI NOT LOW AND NOT HIGH
--------------------------------------------------------------------------------------------------------------------------------------
--6.How does the loan amount correlate with the annual income?
select annual_income,AVg(loan_amount) as Avg_Loan_Amount
from bank_loan_data 
group by annual_income
order by annual_income
--This query analyzes the relationship between loan amounts and annual incomes, potentially revealing trends in borrowing behavior based on income levels.
--ÌÕ·· Â–« «·«” ⁄·«„ «·⁄·«ﬁ… »Ì‰ „»«·€ «·ﬁ—Ê÷ Ê«·œŒ· «·”‰ÊÌ° „„« ﬁœ Ìﬂ‘› ⁄‰ « Ã«Â«  ›Ì ”·Êﬂ «·«ﬁ —«÷ »‰«¡ ⁄·Ï „” ÊÌ«  «·œŒ·.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--7.What is the average interest rate for each loan grade and term combination?
select round(avg(int_rate),2)*100 as Average_int_rate,grade,term
from bank_loan_data
group by grade,term
order by grade,term

/* grade-->:  ” Œœ„ «·»‰Êﬂ «·œ—Ã… · ”⁄Ì— «·ﬁ—Ê÷ Ê≈œ«—… «·„Œ«ÿ—. ⁄«œ… „«   ·ﬁÏ «·ﬁ—Ê÷ –«  «·œ—Ã… «·√⁄·Ï √”⁄«— ›«∆œ… √ﬁ· Ê ﬂÊ‰ √ﬂÀ— Ã«–»Ì… ··„” À„—Ì‰
   term-->ÌÕœœ „’ÿ·Õ „œ… «·ﬁ—÷ »«·√‘Â—. ÌÕœœ › —… «·”œ«œ
    ” Œœ„ «·»‰Êﬂ «·„’ÿ·Õ ·ÂÌﬂ·… « ›«ﬁÌ«  «·ﬁ—Ê÷ ÊÕ”«» „œ›Ê⁄«  «·›«∆œ… Ê≈œ«—… ¬Ã«· «” Õﬁ«ﬁ «·ﬁ—Ê÷
*/

------------------------------------------------------------------------------------------------------------------------
--GOOD LOAN
--1.Goad Loan Percentage
SELECT
(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id
END) * 100.0) /
COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

/* CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END: 
This part of the expression creates a conditional statement. It checks if the loan_status is either 'Fully Paid' or 'Current'. 
If this condition is true for a particular loan, it returns the value of the id column for that loan. 
Otherwise, it returns NULL. 

So, THEN id within the CASE statement is used to retrieve and count specific values (ids) based on the condition specified, 
contributing to the overall count of loans meeting the condition of being either 'Fully Paid' or 'Current'.
*/

--2.Good Loan Application
select count(id) as goad_loan_application from bank_loan_data
where loan_status='Fully Paid' OR loan_status='Current'


--3.Good Loan Funded Amount
select sum(loan_amount) as good_loan_funded_amount from bank_loan_data
where loan_status='Fully Paid' OR loan_status='Current'

--4.Good Loan Total Received Amount
select sum(total_payment) as good_loan_total_received_amount from bank_loan_data
where loan_status='Fully Paid' OR loan_status='Current'

--------------------------------------------------------------------------------------------------------------------
--Bad Loan:
--1.Bad Loan Percentage
select(count(case when loan_status='Charged off' Then id End)*100.0)/
count(id) as Bad_Loan_Percentage
from bank_loan_data

--2.Bad Loan Application
select count(id) as Bad_Loan_Application from bank_loan_data
where loan_status='Charged off'

--3.Bad Loan Funded Amount
select sum(loan_amount) as Bad_loan_funded_amount from bank_loan_data
where loan_status='Charged off'

--4.Bad Loan Total Received Amount
select sum(total_payment) as Bad_loan_total_received_amount from bank_loan_data
where loan_status='Charged off'
 
---------------------------------------------------------------------------------------------------------
--LOAN STATUS
/*  In order to gain a comprehensive overview of our lending operations and monitor the performance of loans, we aim 
to create a grid view report categorized by 'Loan Status.í By providing insights into metrics such as 'Total Loan 
Applications,' 'Total Funded Amount,' 'Total Amount Received,' 'Month-to-Date (MTD) Funded Amount,' 'MTD 
Amount Received,' 'Average Interest Rate,' and 'Average Debt-to-Income Ratio (DTI),' this grid view will empower us 
to make data-driven decisions and assess the health of our loan portfolio.   */


select loan_status,
                     count(id) as Total_Loan_Applications,
					 sum(loan_amount) as Total_Funded_Amount,
					 sum(total_payment) as Total_Amount_Received,
					 avg(int_rate*100) as Average_Int_Rate,
					 avg(dti*100) as Average_DTI

from bank_loan_data
Group by loan_status

--MTD
select loan_status,
                     
					 sum(loan_amount) as MTD_Total_Funded_Amount,
					 sum(total_payment) as MTD_Total_Amount_Received
from bank_loan_data
where month(issue_date)=11
Group by loan_status
------------------------------------------------------------------------------------------------------
--BANK LOAN REPORT | OVERVIEW

--1.Monthly Trends by Issue Date :(To identify seasonality and long-term trends in lending activities)

select
           month(issue_date) as month_name,
		   DATENAME(MONTH,issue_date) as Month_Name,
		   count(id) as Total_Loan_Applications,
		   sum(loan_amount) as Total_Funded_Amount,
		   sum(total_payment) as Total_Amount_Received
		   

from bank_loan_data
group by Month(issue_date),DATENAME(MONTH,ISSUE_DATE)
order by  month(issue_date)

-----------------------------------------------------------------------------------------------------------------
--Regional Analysis by State: To identify regions with significant lending activity and assess regional disparities
select address_state,
      count(id) as Total_Loan_Applications,
	  sum(loan_amount) as Total_Funded_Amount,
	  sum(total_payment) as Total_Amount_Received

from bank_loan_data
group by address_state
order by address_state

--CA IS THE MAX IN THREE COLUMNS
-----------------------------------------------------------------------------------------------------------
--Loan Term Analysis: To allow the client to understand the distribution of loans across various term length.
select term,
      count(id) as Total_Loan_Applications,
	  sum(loan_amount) as Total_Funded_Amount,
	  sum(total_payment) as Total_Amount_Received

from bank_loan_data
group by term
order by term
----------------------------------------------------------------------------------------------------------------

--emp_length(„œ… «·⁄„· ··„ﬁœ„ ⁄·Ì «·ﬁ—÷)
/*  :«·€—÷: ÌÊ›— ÿÊ· «·„ÊŸ› ‰Ÿ—… À«ﬁ»… ⁄·Ï «·«” ﬁ—«— «·ÊŸÌ›Ì ··„ﬁ —÷
.ﬁœ  ‘Ì— › —«  «·⁄„· «·√ÿÊ· ≈·Ï ﬁœ— √ﬂ»— „‰ «·√„‰ «·ÊŸÌ›Ì.
«” Œœ«„ ··»‰Êﬂ:  √Œ– «·»‰Êﬂ ›Ì «·«⁄ »«— ÿÊ· «· ÊŸÌ› ⁄‰œ  ﬁÌÌ„ ﬁœ—… «·„ﬁ —÷ ⁄·Ï «·”œ«œ
. €«·»« „« Ì —Ã„ «· ÊŸÌ› «·„” ﬁ— ≈·Ï «‰Œ›«÷ „Œ«ÿ— «· Œ·› ⁄‰ «·”œ«œ.  */

select emp_length,
      count(id) as Total_Loan_Applications,
	  sum(loan_amount) as Total_Funded_Amount,
	  sum(total_payment) as Total_Amount_Received

from bank_loan_data
group by emp_length
order by emp_length
-------------------------------------------------------------------------------------------------------------------------
--Purpose(Âœ› «·ﬁ—÷ (”Ì«—…°  Õ”Ì‰ „‰“·° ≈·Œ)
/*     Purpose: Purpose specifies the reason for the loan (e.g., debt consolidation, education). It
helps understand borrower intentions.
Use for Banks: Banks use this field to segment and customize loan offerings, aligning loan
terms with borrower needs.  */

select purpose,
      count(id) as Total_Loan_Applications,
	  sum(loan_amount) as Total_Funded_Amount,
	  sum(total_payment) as Total_Amount_Received

from bank_loan_data
group by purpose
order by purpose

---------------------------------------------------------------------------------------------------
--home Owenership(„·ﬂÌ… «·„‰“·)
/*     «·€—÷:  ‘Ì— „·ﬂÌ… «·„‰“· ≈·Ï Õ«·… ”ﬂ‰ «·„ﬁ —÷. Ìﬁœ„ —ƒÏ ÕÊ·
«·«” ﬁ—«— «·„«·Ì.
«·«” Œœ«„ ··»‰Êﬂ:  ” Œœ„ «·»‰Êﬂ Â–« «·„Ã«· · ﬁÌÌ„  Ê«›— «·÷„«‰«  Ê«” ﬁ—«— «·„ﬁ —÷.
ﬁœ ÌﬂÊ‰ ·œÏ „«·ﬂÌ «·„‰«“· „⁄œ·«  «› —«÷Ì… √ﬁ·.
*/

select home_ownership,
      count(id) as Total_Loan_Applications,
	  sum(loan_amount) as Total_Funded_Amount,
	  sum(total_payment) as Total_Amount_Received

from bank_loan_data
where grade='A' and address_state='CA'
group by home_ownership
order by home_ownership


--important note 
/*  Differentiating Ownership Status:
By incorporating mortgage information into the "home ownership" column, you can differentiate between properties based on their ownership status:

    Owned: Properties that are fully owned without any mortgage.
    Mortgaged: Properties that have a mortgage, indicating that there is an outstanding loan secured against the property. 
	»«Œ ’«— «·«Ê·Ì «·»Ì  „·ﬂŒÂ „›Ì‘ «Ì ﬁ—÷ ⁄·ÌÂ «„« «· «‰Ì… «‰ ›ÌÂ ﬁ—÷ „” Õﬁ „ﬁ«»· «·⁄ﬁ«—*/


-----------------------------------------------------------------------------------------------------------
--How many unique states are represented in the dataset?
select count(distinct address_state) as Unique_States_Count
FROM bank_loan_data
-----------------------------------------------------------------------------------------------

--What are the distinct application types in the dataset?
select count(distinct application_type) as Unique_Applications_Types
from bank_loan_data

---------------------------------------------------------------------------------------------------------------
--What is the average annual income of the borrowers?
select avg(annual_income) as Averge_Annual_Income
from bank_loan_data
------------------------------------------------------------------------
--How many loans were issued in each state?
select count(id) as Total_Loans_Applications,address_state
from bank_loan_data
group by address_state
order by count(id) desc
----------------------------------------------------------------------------------------------
--What is the total loan amount for each grade of loans?
select sum(loan_amount) as Total_Loan_Amount,grade
from bank_loan_data
Group by grade
order by grade
------------------------------------------------------------------
--What is the average installment amount for loans with a term of 36 months?
--Installment(œ›⁄… «·”œ«œ «·‘Â—Ì…)
--term(„œ… «·ﬁ—÷ »«·«‘Â—)
select avg(installment)as Average_Installment
from bank_loan_data
where term='36 months'

--------------------------------------------------------------------
--What is the total amount paid for loans that are "Fully Paid"?
select sum(loan_amount) as total_amount_paid
from bank_loan_data
where loan_status='Fully Paid'
---------------------------------------------------------------------
--What is the average interest rate for loans with a term of 60 months and a grade of "A"?
select round(avg(int_rate),4)*100 as Avg_int_rate
from bank_loan_data
where term='60 months' and grade='A'
--------------------------------------------------------------------------------------
--Can you identify any trends in loan applications over time, such as monthly , yearly or Quarterly trends?

--Monthly Trend for total loan applications
SELECT YEAR(issue_date) AS Year, MONTH(issue_date) AS Month, COUNT(id) AS Total_Loan_Applications
FROM bank_loan_data
GROUP BY YEAR(issue_date), MONTH(issue_date)
ORDER BY Year, Month;


--QUERTLY TRENDS
SELECT YEAR(issue_date) AS Year,
       CASE 
           WHEN MONTH(issue_date) BETWEEN 1 AND 3 THEN 'Q1'
           WHEN MONTH(issue_date) BETWEEN 4 AND 6 THEN 'Q2'
           WHEN MONTH(issue_date) BETWEEN 7 AND 9 THEN 'Q3'
           ELSE 'Q4'
       END AS Quarter,
       COUNT(id) AS Total_Loan_Applications
FROM bank_loan_data
GROUP BY YEAR(issue_date), 
         CASE 
             WHEN MONTH(issue_date) BETWEEN 1 AND 3 THEN 'Q1'
             WHEN MONTH(issue_date) BETWEEN 4 AND 6 THEN 'Q2'
             WHEN MONTH(issue_date) BETWEEN 7 AND 9 THEN 'Q3'
             ELSE 'Q4'
         END
ORDER BY Year, Quarter;
--This query categorizes loan applications into quarters (Q1, Q2, Q3, Q4) based on the issue date, providing a quarterly trend analysis.