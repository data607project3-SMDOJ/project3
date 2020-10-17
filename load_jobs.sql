DROP TABLE IF EXISTS indeed;
DROP TABLE IF EXISTS general_skills;

CREATE TABLE indeed(
	job_id INT NOT NULL AUTO_INCREMENT,
	Job_Title varchar(255),
    Queried_Salary varchar(255),
    Job_Type varchar(255),
    Skill longtext,
    No_of_Skills int,
    Company varchar(100),
    Description longtext,
    Location varchar(100),
    Company_Industry varchar(255),
    python	int,
    _sql int,
    machine_learning int,
	r int,
    hadoop int,
    tableau	int,
    sas	int,
    spark int,
	java int,
	Others int,
    PRIMARY KEY (job_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/indeed_job_dataset.csv'
INTO TABLE indeed
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@dummy, Job_Title, @Link, Queried_Salary, Job_Type, @Skill,	No_of_Skills, Company, @No_of_Reviews, @No_of_Stars, @Date_Since_Posted,
@Description, @Location,	@Company_Revenue, @Company_Employees, @Company_Industry, python, _sql, machine_learning, r, hadoop, tableau, sas, 
spark, java, Others, @CA, @NY, @VA, @TX, @MA, @IL, @WA, @MD, @DC, @NC, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy)
SET 
	Company_Industry = nullif(@Company_Industry, ''),
	Description = nullif(@Description, ''),
	Skill = nullif(@Skill, ''),
	Location = nullif(@Location, '');

CREATE TABLE general_skills(
	skill varchar(255),
    linkedIn varchar(255),
    indeed varchar(255),
    simplyHired varchar(255),
    monster varchar(255)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ds_general_skills_revised.csv'
INTO TABLE general_skills
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(skill, @LinkedIn, @Indeed, @SimplyHired, @Monster)
SET
	linkedIn = nullif(@LinkedIn, ''),
    indeed = nullif(@Indeed, ''),
    simplyHired =nullif(@SimplyHired, ''),
    monster = nullif(@Monster, '');
