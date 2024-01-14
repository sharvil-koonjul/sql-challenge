# sql-challenge

# QuickDBD was used to generate the Entity Relationship Diagram


# Composite keys were added to the exported PostgreSQL file (EmployeeSQL/employees_table_schemata.sql)
---
CREATE TABLE "Department_Managers" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL,
	CONSTRAINT "pk_Department_Managers" PRIMARY KEY ("dept_no", "emp_no")
);

CREATE TABLE "Department_Employees" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
	CONSTRAINT "pk_Department_Employees" PRIMARY KEY ("emp_no", "dept_no")
);
---

# Data Analysis (EmployeeSQL/queries.sql)
