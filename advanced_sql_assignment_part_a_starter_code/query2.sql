-- write your queries to insert data here
INSERT INTO client(first_name, last_name, dob) values
('Sara', 'Smith', STR_TO_DATE('1/2/1970', '%m/%d/%Y')),
('Miguel', 'Cabrera', STR_TO_DATE('2/2/1988', '%m/%d/%Y')),
('Bo', 'Chang', STR_TO_DATE('3/2/1985', '%m/%d/%Y'));

INSERT INTO employee(first_name, last_name, dob, date_joined) values
('Ananya', 'Jaiswal', STR_TO_DATE('1/2/1975', '%m/%d/%Y'), STR_TO_DATE('1/1/2009', '%m/%d/%Y')),
('Michael', 'Fern', STR_TO_DATE('10/18/1980', '%m/%d/%Y'), STR_TO_DATE('6/5/2013', '%m/%d/%Y')),
('Abdul', 'Rehman', STR_TO_DATE('3/21/1984', '%m/%d/%Y'), STR_TO_DATE('11/10/2013', '%m/%d/%Y'));

INSERT INTO project(cid, name, notes) values
((SELECT id FROM client WHERE first_name='Sara' AND last_name='Smith'), 'Diamond', 'Should be done by Jan 2019'),
((SELECT id FROM client WHERE first_name='Bo' AND last_name='Chang'), 'Chan''g', 'Ongoing maintenance'),
((SELECT id FROM client WHERE first_name='Miguel' AND last_name='Cabrera'), 'The Robinson Project', NULL);

INSERT INTO works_on(eid, pid, start_date) values
((SELECT id FROM employee WHERE first_name='Ananya' AND last_name='Jaiswal'),
  (SELECT id from project where name='Chan''g'), STR_TO_DATE('1/1/2012', '%m/%d/%Y')),
((SELECT id FROM employee WHERE first_name='Michael' AND last_name='Fern'),
  (SELECT id from project where name='The Robinson Project'), STR_TO_DATE('8/8/2013', '%m/%d/%Y')),
((SELECT id FROM employee WHERE first_name='Abdul' AND last_name='Rehman'),
  (SELECT id from project where name='Diamond'), STR_TO_DATE('9/11/2014', '%m/%d/%Y'));

-- Leave the queries below untouched. These are to test your submission correctly.
select * from project;
select * from client;
select * from employee;
select * from works_on;
