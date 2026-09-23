/*--This project contains a comprehensive collection of SQL Server queries designed to analyze
and manage employee and salary data*/

--1., Code to get EmpID and full name for all employees under the manager with ID 986

Select[EmpID],[FullName]
From[dbo].[Staff_Table]
Where [ManagerID]=986

--2., Code to fetch different project available from EmployeeSalary table

Select distinct([Project])
From [dbo].[Salary_Table]

--3.,Code to count of employee working in project 'P1'

Select count([EmpID]) as No_of_Emp_in_P1
from [dbo].[Salary_Table]
Where [Project] = 'P1'

--4.,SQL queries to find the maximum, minimum, and average salary of the employees.

--i., Maximum Salary
Select Max([Salary]) as Maximum_Sal
from [dbo].[Salary_Table]

--ii., Minimum Salary
Select Min([Salary]) as Minimum_Sal
from[dbo].[Salary_Table]

--iii., Average Salary
Select AVG([Salary]) AS Average_Sal
from [dbo].[Salary_Table]

--5. SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
Select [EmpID]
from [dbo].[Salary_Table]
Where [Salary] >=9000 and [Salary]<=15000

--6. SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
Select [EmpID]
from[dbo].[Staff_Table]
Where [City] = 'Toronto' And [ManagerID] =321

--7. SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
Select [EmpID]
from [dbo].[Staff_Table]
Where [City]='California' OR [ManagerID]=321

--8.SQL query to fetch all those employees who work on Projects other than P1.
Select [EmpID]
from [dbo].[Salary_Table]
Where [Project]!='P1'

--9. SQL query to display the total salary of each employee adding the Salary with Variable value.
Select[EmpID],[Salary],[Variable],(FORMAT([Salary]+[Variable],'N2'))as 'Total_Salary'
From [dbo].[Salary_Table]

--10. SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
select[EmpID],[FullName]
from [dbo].[Staff_Table]
Where [FullName] like '__hn%'

--11. SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.

Select [EmpID]
from [dbo].[Salary_Table]
Union
Select [EmpID]
from[dbo].[Staff_Table]

--OR

Select [EmpID]
from [dbo].[Salary_Table]
Union All
Select [EmpID]
from[dbo].[Staff_Table]

