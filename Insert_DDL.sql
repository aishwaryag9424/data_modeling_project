
-- Inserting Scientist
INSERT INTO company.SCIENTIST (emp_id, name, ph_no, email)
VALUES (1, 'Dr. Ash', 1234567890, 'dr.aish@heirloom.com');

-- Inserting Experiment
INSERT INTO company.EXPERIMENT (exp_id, name, description, emp_id)
VALUES (1, 'Limestone Feedstock Comparison', 
        'Compare performance of new limestone feedstock with previous batch', 1);

-- Inserting Material (Limestone Feedstock Delivery)
INSERT INTO company.MATERIAL (m_id, name, supplier, date_delivered, exp_id)
VALUES (1, 'Limestone Feedstock', 'ABC Minerals', '2024-11-01 10:00:00', 1);

-- Inserting Processes (Calcining, Hydroxylation, Carbonation)
INSERT INTO company.PROCESS (id, type, start_time, end_time, exp_id)
VALUES 
    (1, 'Calcining', '2024-11-01 10:30:00', '2024-11-01 11:00:00', 1),
    (2, 'Hydroxylation', '2024-11-01 11:15:00', '2024-11-01 11:45:00', 1),
    (3, 'Carbonation', '2024-11-01 12:00:00', '2024-11-01 12:30:00', 1);

-- Inserting Process Inputs
INSERT INTO company.PROCESS_INPUT (id, input)
VALUES 
    (1, 'Limestone Feedstock'),
    (1, 'Set Temperature'),
    (2, 'Calcium Hydroxide'),
    (2, 'Water'),
    (3, 'Controlled Carbonation Conditions');

-- Inserting Equipment (Batch Kiln, Lime Hydrator, Carbonation Test Bed)
INSERT INTO company.EQUIPMENT (e_id, name, process_id)
VALUES 
    (1, 'Batch Kiln', 1),
    (2, 'Prototype Lime Hydrator', 2),
    (3, 'Carbonation Test Bed', 3);

-- Inserting Samples (Collected at each step - start, middle, end)
INSERT INTO company.SAMPLE (sample_id, sample_point, process_id, a_id)
VALUES 
    (1, 'start', 1, 1),  -- Links process 1 (Calcining) start sample with analysis id 1 (carbon content 2.4)
    (2, 'end', 2, 2),    -- Links process 1 (Calcining) end sample with analysis id 2 (carbon content 7.9)
    (3, 'middle', 3, 3); 


-- Inserting Instrument (Combustion Analyzer)
INSERT INTO company.INSTRUMENT (i_id, last_cal_date, frequency)
VALUES (1, '2024-11-11', 28),
(2, '2024-10-02', 32),
(3, '2024-10-15', 25);

-- Inserting Analysis (Total Carbon Content Analysis)
INSERT INTO company.ANALYSIS (a_id, results, i_id)
VALUES 
(1, DECODE('Mi40', 'base64'), 1),  -- Storing 2.4
    (2, DECODE('Ny45', 'base64'), 2),  -- Storing 7.9
    (3, DECODE('NS4y', 'base64'), 3); 

-- Inserting Analysis Parameters
INSERT INTO company.ANALYSIS_PARAMETER (a_id, parameter)
VALUES 
    (1, 'temp'),
    (2, 'water'),
    (3, 'chemical');
