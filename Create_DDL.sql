CREATE SCHEMA IF NOT EXISTS company;

CREATE TABLE company.SCIENTIST (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    ph_no BIGINT,
    email VARCHAR(50)
);

CREATE TABLE company.EXPERIMENT (
    exp_id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(100),
    emp_id INT REFERENCES company.SCIENTIST(emp_id)
);

CREATE TABLE company.MATERIAL (
    m_id INT PRIMARY KEY,
    name VARCHAR(50),
    supplier VARCHAR(60),
    date_delivered TIMESTAMP,
    exp_id INT REFERENCES company.EXPERIMENT(exp_id)
);

CREATE TABLE company.PROCESS (
    id INT PRIMARY KEY,
    type VARCHAR(20),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    exp_id INT REFERENCES company.EXPERIMENT(exp_id)
);

CREATE TABLE company.PROCESS_INPUT (
    id INT,
    input VARCHAR(100),
    PRIMARY KEY (id, input)
);

CREATE TABLE company.PROCESS_OUTPUT (
    id INT REFERENCES company.PROCESS(id),
    output VARCHAR(100),
    PRIMARY KEY (id, output)
);

CREATE TABLE company.EQUIPMENT (
    e_id INT PRIMARY KEY,
    name VARCHAR(50),
    process_id INT REFERENCES company.PROCESS(id)
);

CREATE TABLE company.EQU_LOCATION (
    e_id INT REFERENCES company.EQUIPMENT(e_id),
    location VARCHAR(50),
    PRIMARY KEY (e_id, location)
);



CREATE TABLE company.INSTRUMENT (
    i_id INT PRIMARY KEY,
    last_cal_date TIMESTAMP,
    frequency INT
);

CREATE TABLE company.ANALYSIS (
    a_id INT PRIMARY KEY,
    results BYTEA,
    i_id INT REFERENCES company.INSTRUMENT(i_id)
);

CREATE TABLE company.SAMPLE (
    sample_id INT PRIMARY KEY,
    sample_point VARCHAR(10) CHECK (sample_point IN ('start', 'middle', 'end')),
    process_id INT REFERENCES company.PROCESS(id),
	   a_id INT REFERENCES company.ANALYSIS(a_id)
);

CREATE TABLE company.ANALYSIS_PARAMETER (
    a_id INT REFERENCES company.ANALYSIS(a_id),
    parameter VARCHAR(10),
    PRIMARY KEY (a_id, parameter)
);
