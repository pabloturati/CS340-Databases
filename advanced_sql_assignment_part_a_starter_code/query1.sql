-- Write the query to create the 4 tables below.

CREATE TABLE client(
  id int primary key auto_increment,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  dob date NOT NULL,
  CONSTRAINT full_name unique (first_name, last_name)
) ENGINE=innoDB;

CREATE TABLE employee(
  id int primary key auto_increment,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  dob date NOT NULL,
  date_joined date NOT NULL,
  CONSTRAINT full_name unique (first_name, last_name)
) ENGINE=innoDB;

CREATE TABLE project(
  id int primary key auto_increment,
  cid int,
  name varchar(255) not null,
  notes text,
  foreign key(cid) references client(id),
  unique (name)
) ENGINE=innoDB;

CREATE TABLE works_on(
  eid int,
  pid int,
  start_date date NOT NULL,
  PRIMARY KEY (eid, pid),
  FOREIGN KEY (eid) REFERENCES employee(id),
  FOREIGN KEY (pid) REFERENCES project(id)
) ENGINE=innoDB;

-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created 
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_SCHEMA = 'grade';