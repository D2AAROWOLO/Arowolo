
/* The SQL scripts perform exploratory data analysis, cost assessments, departmental comparisons, and 
employee-related investigations by leveraging both traditional SQL queries and advanced window functions.Codes for 
manipulating and extracting information from Dataset (Work safety Data) */

--Preliminary checks:

--1. View the enitre table to have a look of possible insights required

select*
from[dbo].[Worksafety Data Edited]


--2. Counting the number of rows in the dataset

Select 
Count(*) As Number_of_Row
from [dbo].[Worksafety Data Edited]

--3. Queries:

--i. Sum of the incident cost
Select sum([Incident_Cost]) As Total_Cost_of_Incident
From [dbo].[Worksafety Data Edited]


Select sum([Incident_Cost]) As Total_Cost_of_Incident
From [dbo].[Worksafety Data Edited]
Where [Plant] = 'Iowa'

Select sum([Incident_Cost]) As Total_Cost_of_Incident
From [dbo].[Worksafety Data Edited]
Where [Plant] IN ('Iowa','California') 

Select sum([Incident_Cost]) As Total_Cost_of_Incident
From [dbo].[Worksafety Data Edited]
Where [Plant] IN ('Iowa','California') AND [Department] IN ('Purchases', 'Administration', 'Maintenace')
       AND [Age_Group] IN ('50+', '18-24')

Select  [Date] 
        ,[Plant]
        ,[Department]
        ,[Gender],
        [Age_Group]
        ,[Incident_Cost]
From [dbo].[Worksafety Data Edited]
Where [Plant] IN ('Iowa','California') AND [Department] IN ('Melting', 'Administration', 'Security')
      AND [Age_Group] IN ('50+', '18-24')


Select  [Date] 
        ,[Plant]
        ,[Department]
        ,[Gender],
        [Age_Group]
        ,[Incident_Cost]
From [dbo].[Worksafety Data Edited]
Where [Plant] IN ('Iowa','California') AND [Department] IN ('Melting', 'Administration', 'Security')
      

Select  [Date] 
        ,[Plant]
        ,[Department]
        ,[Gender],
        [Age_Group]
        ,[Incident_Cost]
From [dbo].[Worksafety Data Edited]
Where [Plant] IN ('Iowa','California') AND [Department] IN ('Melting', 'Administration', 'Security')
      AND [Age_Group] IN ('18-24', '50+')


Select   [Date]
        ,[Plant]
        ,[Injury_Location]
        ,[Gender]
        ,[Age_Group]
        ,([Incident_Cost]) 
From [dbo].[Worksafety Data Edited]


Select [Department]
       ,MAX([Incident_Cost]) As Max_IncidentCost
FROM [dbo].[Worksafety Data Edited]
Group By [Department] 
Order By MAX([Incident_Cost]) desc

Select   [Injury_Location]
        ,[Plant]
        ,[Department]
        ,MAX([Incident_Cost]) As Max_IncidentCost
FROM [dbo].[Worksafety Data Edited]
Group By [Injury_Location]
        ,[Department] 
        ,[Plant]
Having [Plant] IN ('California', 'Iowa') AND [Department] IN ('Administration', 'Melting', 'Security')
        AND [Injury_Location]='Hands'
Order By MAX([Incident_Cost]) Desc



--Windows Functions 

--1. Using aggregate function


Select [Department]
       ,MAX([Incident_Cost]) Over()
FROM [dbo].[Worksafety Data Edited]

Select [Department]
       ,MAX([Incident_Cost]) Over(Partition by [Department]) As Max_IncidentCost
FROM [dbo].[Worksafety Data Edited]

Select *
       ,Sum([Incident_Cost]) Over(Partition by [Department]) As Total_IncidentCost
FROM [dbo].[Worksafety Data Edited]

Select *
       ,Count([Incident_Cost]) Over(Partition by [Plant]) As Total_Incidents
FROM [dbo].[Worksafety Data Edited]

--2. Using ROW NUMBER (Use when you have unique Id)

Select *
From [dbo].[Employee_Info]

Select *
From [dbo].[Worksafety Data Edited]


Select*
      ,ROW_NUMBER() OVER(order by [EmpID]) As Row_Number
FROM [dbo].[Employee_Info]


Select*
      ,ROW_NUMBER() OVER(Partition by[Address] order by [EmpID]) As Row_Number
FROM [dbo].[Employee_Info]


With AYO AS (
Select*
      ,ROW_NUMBER() OVER(Partition by[Address] order by [EmpID]) As Row_Number
FROM [dbo].[Employee_Info])
Select *
From AYO
Where Row_Number >1


--3. Using Rank (Use when you have unique Id)

select*
from [dbo].[Worksafety Data Edited]

Select *
       ,Rank() over(Partition by [Department] order by [Incident_Cost])
       From [dbo].[Worksafety Data Edited]

Select *
       ,Rank() over(Partition by [Department] order by [Incident_Cost]Desc)
       From [dbo].[Worksafety Data Edited]
