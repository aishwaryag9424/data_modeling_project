# Data modeling project

Creating a data model for a company.

Entity:
- Scientist
- Experiment
- Process
- Process type
- Equipment
- Sample
- Analysis
- Instrument


Assumptions:
- An experiment can have multiple Processes but a process can have only one experiment.
- A process can be run by one or more equipment but each equipment will be having one process associated with that equipment.
- A process can have one or more Sample but a sample will be associated with one process.
- A sample will be sent for analysis 2 or 6 times and Analysis can be have one sample.
- Analysis can be run by one or more Instrument and Instrument can support one or more Analysis.
