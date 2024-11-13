# Data modeling project

Creating a data model for a company.

Entity:
- Scientist
- Material
- Experiment
- Process
- Process type
- Equipment
- Sample
- Analysis
- Instrument


Assumptions:
- A scientist will be assigned to one Experiment and Experiment will be run by one Sceintist.
- Material can be associated with one experiment and Experiment can have one or more material.
- An experiment can have multiple Processes but a process can have only one experiment.
- A process can be run by one or more equipment but each equipment will be having one process associated with that equipment.
- A process can have one or more Sample but a sample will be associated with one process.
- A sample will be sent for analysis 2 or 6 times and Analysis can be have one sample.
- Analysis can be run by one Instrument and Instrument can support one or more Analysis.
- Time is tracked in each step. Start and end times for managment.
  

