-- Insertion dans la table departements
INSERT INTO departments (department_name)
VALUES ('Human Resources'), ('Sales'), ('Logistics'), ('IT');

-- Insertion dans la table contrats
INSERT INTO contracts (contract_type, duration, conditions)
VALUES('Permanent', NULL, 'Indefinite contract'),('Temporary', 12, 'Fixed duration contract');

-- Insertion dans la table employes
INSERT INTO employees (last_name, first_name, hire_date, job_title, department_id)
VALUES('El Fassi', 'Ahmed', '2015-03-12', 'Manager', 1),('Bennani', 'Fatima', '2018-06-01', 'Sales Manager', 2);

-- Insertion dans la table absences
INSERT INTO absences (employee_id, start_date, end_date, reason, absence_type, leave_type_id)
VALUES(1, '2023-01-01', '2023-01-10', 'Family reasons', 'Leave', 1),
      (2, '2023-02-15', '2023-02-20', 'Illness', 'Sick Leave', 2);


-- Insertion dans la table performances
INSERT INTO performances (employee_id, performance_date, sales_amount, comments)
VALUES(2, '2023-03-15', 15000.00, 'Exceeded sales target');

-- Insertion dans la table conges
INSERT INTO leaves (leave_name, description)
VALUES('Annual Leave', 'Paid annual leave'),('Sick Leave', 'Leave due to illness');

-- Insertion dans la table employes_contrats
INSERT INTO employee_contracts (employee_id, contract_id, start_date, end_date)
VALUES(1, 1, '2015-03-12', NULL),(2, 2, '2018-06-01', '2019-06-01');

