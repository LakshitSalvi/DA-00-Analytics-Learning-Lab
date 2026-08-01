/*
===============================================================================
QUESTION
===============================================================================

Perform healthcare patient analysis using SQL.

The hospital administration wants to analyze patient admissions,
treatment costs, and departmental performance to improve operational
efficiency and patient care.

The analysis should answer the following questions:

1. How many patients visited each department?
2. What is the total treatment revenue?
3. What is the average treatment cost?
4. Which departments generate the highest revenue?
5. Which doctors treated the most patients?
6. Rank departments based on revenue.

*/

/*
===============================================================================
BUSINESS SCENARIO
===============================================================================

CityCare Hospital receives thousands of patients every month across multiple
departments.

Hospital management wants to understand patient flow, departmental workload,
and treatment revenue to optimize staffing and improve healthcare services.

As a Data Analyst, your task is to prepare a healthcare performance report.

*/

/*
===============================================================================
BUSINESS OBJECTIVE
===============================================================================

Generate healthcare KPIs including:

• Total Patients
• Total Revenue
• Average Treatment Cost
• Department Revenue
• Doctor Performance
• Department Ranking

*/

/*
===============================================================================
CONCEPTS COVERED
===============================================================================

• Aggregate Functions
• GROUP BY
• INNER JOIN
• CASE Statement
• CTE
• Window Functions
• DENSE_RANK()
• SUM()
• COUNT()
• AVG()

*/

/*
===============================================================================
ASSUMED TABLES
===============================================================================

Patients
--------

PatientID
FirstName
LastName

Doctors
-------

DoctorID
DoctorName
Department

Appointments
------------

AppointmentID
PatientID
DoctorID
AppointmentDate
TreatmentCost

*/

/*
===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH DepartmentSummary AS
(
    SELECT

        d.Department,

        COUNT(DISTINCT a.PatientID) AS TotalPatients,

        COUNT(a.AppointmentID) AS TotalAppointments,

        SUM(a.TreatmentCost) AS Revenue,

        ROUND(AVG(a.TreatmentCost),2) AS AverageTreatmentCost

    FROM Doctors d

    JOIN Appointments a

        ON d.DoctorID = a.DoctorID

    GROUP BY

        d.Department
),

DoctorPerformance AS
(
    SELECT

        d.DoctorName,

        d.Department,

        COUNT(a.AppointmentID) AS PatientsHandled,

        SUM(a.TreatmentCost) AS RevenueGenerated

    FROM Doctors d

    JOIN Appointments a

        ON d.DoctorID = a.DoctorID

    GROUP BY

        d.DoctorName,
        d.Department
)

SELECT

    Department,

    TotalPatients,

    TotalAppointments,

    Revenue,

    AverageTreatmentCost,

    CASE

        WHEN Revenue >= 5000000
            THEN 'Excellent'

        WHEN Revenue >= 2000000
            THEN 'Good'

        ELSE 'Needs Improvement'

    END AS DepartmentPerformance,

    DENSE_RANK()

        OVER
        (
            ORDER BY Revenue DESC
        ) AS DepartmentRank

FROM DepartmentSummary

ORDER BY

    Revenue DESC;

----------------------------------------------------------
-- Doctor Performance
----------------------------------------------------------

SELECT

    DoctorName,

    Department,

    PatientsHandled,

    RevenueGenerated,

    DENSE_RANK()

        OVER
        (
            ORDER BY RevenueGenerated DESC
        ) AS DoctorRank

FROM DoctorPerformance

ORDER BY

    RevenueGenerated DESC;
