Build a CSV ingestion system for employer earning data


Acceptance Criteria

ZayZoon determines how much money we can advance to an employee based on their past earnings. Allow employers to upload an earnings CSV file with this data.

Workflow

Employers upload an earnings CSV file through our employer website
Earnings are created for all of the data provided
Earnings file includes earnings for all employees of the employer
Each employer will have their own CSV data layout (i.e. different column names and data formats for dates, dollar amounts, etc). 
Earnings must be associated with the correct employee by cross referencing against the employee’s external ID in the employer’s system

Technical notes

Employers have many Employees
Employees have many Earnings
Employer model:
id
name
Employee model:
id
name
external_ref (Employee’s ID in the Employer’s system)
Earning model:
employee_id
employer_id
earning_date: date
amount: decimat

AcmeCo is giving us their earnings CSV in the following format

EmployeeID (string)
CheckDate (in non-standard format MM/DD/YYYY, ex: “12/14/2020” for Dec 14, 2020)
Amount (string with dollar sign, ex: “$800”)

Example CSV string:
EmployeeId,CheckDate,Amount\nABC123,12/14/2020,$800

BetaCo is giving us their earnings CSV in the following format

employee (string)
earningDate (in standard format YYYY-MM-DD, ex: “2020-12-14” for Dec 14, 2020)
netAmount (float)

Example CSV string:
employee,earningDate,netAmount\nABC123,2020-12-14,800.00



####################
TODO
1- format values
2- exclude header
