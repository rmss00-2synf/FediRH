CREATE TABLE departments
(
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees
(
    employee_id   INT AUTO_INCREMENT PRIMARY KEY,
    last_name     VARCHAR(50)                  NOT NULL,
    first_name    VARCHAR(50)                  NOT NULL,
    hire_date     DATE                         NOT NULL,
    job_title     VARCHAR(50)                  NOT NULL,
    department_id INT,
    site          VARCHAR(50) DEFAULT 'Tanger' NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

CREATE TABLE absences
(
    absence_id    INT AUTO_INCREMENT PRIMARY KEY,
    employee_id   INT,
    start_date    DATE        NOT NULL,
    end_date      DATE        NOT NULL,
    reason        VARCHAR(100),
    absence_type  VARCHAR(50) NOT NULL,
    leave_type_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (leave_type_id) REFERENCES leaves (leave_type_id)
);


CREATE TABLE leaves
(
    leave_type_id INT AUTO_INCREMENT PRIMARY KEY,
    leave_name    VARCHAR(50) NOT NULL,
    description   VARCHAR(255)
);

CREATE TABLE performances
(
    performance_id   INT AUTO_INCREMENT PRIMARY KEY,
    employee_id      INT,
    performance_date DATE NOT NULL,
    sales_amount     DECIMAL(10, 2),
    comments         VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

CREATE TABLE contracts
(
    contract_id   INT AUTO_INCREMENT PRIMARY KEY,
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


















