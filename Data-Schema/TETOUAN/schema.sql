CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    last_name     VARCHAR(50)                  NOT NULL,
    first_name    VARCHAR(50)                  NOT NULL,
    hire_date     DATE                         NOT NULL,
    job_title     VARCHAR(50)                  NOT NULL,
    department_id INT,
    site          VARCHAR(50) DEFAULT 'Tanger' NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

CREATE TABLE leaves
(
    leave_type_id SERIAL PRIMARY KEY,
    leave_name    VARCHAR(50) NOT NULL,
    description   VARCHAR(255)
);

CREATE TABLE absences
(
    absence_id    SERIAL PRIMARY KEY,
    employee_id   INT,
    start_date    DATE        NOT NULL,
    end_date      DATE        NOT NULL,
    reason        VARCHAR(100),
    absence_type  VARCHAR(50) NOT NULL,
    leave_type_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (leave_type_id) REFERENCES leaves (leave_type_id)
);



CREATE TABLE performances
(
    performance_id   SERIAL PRIMARY KEY,
    employee_id      INT,
    performance_date DATE NOT NULL,
    sales_amount     DECIMAL(10, 2),
    comments         VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

CREATE TABLE contracts
(
    contract_id   SERIAL PRIMARY KEY,
    contract_type VARCHAR(50) NOT NULL,
    duration      INT,
    conditions    VARCHAR(255)
);


CREATE TABLE employee_contracts
(
    employee_id INT,
    contract_id INT,
    start_date  DATE NOT NULL,
    end_date    DATE,
    PRIMARY KEY (employee_id, contract_id),
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (contract_id) REFERENCES contracts (contract_id)
);

CREATE VIEW vue_employes_departements AS
SELECT e.employee_id, e.last_name, e.first_name, e.site, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

CREATE VIEW vue_absences AS
SELECT a.absence_id, e.last_name, e.first_name, a.start_date, a.end_date, a.reason, l.leave_name
FROM absences a
JOIN employees e ON a.employee_id = e.employee_id
JOIN leaves l ON a.leave_type_id = l.leave_type_id;

CREATE VIEW vue_performances AS
SELECT p.performance_id, e.last_name, e.first_name, p.performance_date, p.comments
FROM performances p
JOIN employees e ON p.employee_id = e.employee_id;

CREATE VIEW vue_employes_contrats AS
SELECT ec.employee_id, e.last_name, e.first_name, c.contract_type, ec.start_date, ec.end_date
FROM employee_contracts ec
JOIN employees e ON ec.employee_id = e.employee_id
JOIN contracts c ON ec.contract_id = c.contract_id;













