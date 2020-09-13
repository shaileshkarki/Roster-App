-- These commands create the required database for our Roster App

-- drop database if it exits
drop database roster;


-- create the database;
create database roster;

-- connect to the database. Note: you need to on the cli psql
\c roster;

-- now create the main tables.

-- THIS TABLE CREATES THE USERS THAT WILL LOGIN IN
CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    UNIQUE (email)
);

INSERT INTO users
    (email,password)
VALUES
    ('blank@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('kaiya@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('keon@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('makena@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('korbin@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('skyler@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('lindsay@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('alejandro@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('khalil@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('alvin@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('porter@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('natalee@geemail.com', 'password123');
INSERT INTO users
    (email,password)
VALUES
    ('allyson@geemail.com', 'password123');

CREATE TABLE groups
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(40),
    group_duration INTEGER,
    pay_rate NUMERIC(8,2),
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Manager',6,35.5,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Supervisor',4,30,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Chef',4,40,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Pastry Chef',4,27,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Dishwasher',4,17,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Sandwich Artist',3,18,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Bar Tender',4,22,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Cocktail maker',4,28,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Kitchen Hand',3,15,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Waiter',3,19.5,TRUE);
INSERT INTO groups(title,group_duration,pay_rate,is_active) VALUES ('Waitress',3,19.5,TRUE);

CREATE TABLE staff
(
    staff_id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(20) NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    address VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(3),
    postcode INTEGER,
    picture_url VARCHAR(100),
    notes VARCHAR(200),
    email VARCHAR(50),
    is_active BOOLEAN,
    phone_number INTEGER,
    UNIQUE (email)

);


INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('KKrueger','Kaiya','Krueger','1 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Great Worker','kaiya@geemail.com',TRUE,1010101010);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('KSoto','Keon','Soto','2 Smith St','Frankston Sth','VIC',3199,'https://api.adorable.io/avatars/285/abott@adorable.png','Works well','keon@geemail.com',TRUE,1001002000);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('MHenson','Makena','Henson','3 Smith St','Mt Eliza','VIC',3930,'https://api.adorable.io/avatars/285/abott@adorable.png','Easy going','makena@geemail.com',TRUE,1212121212);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('KDavidson','Korbin','Davidson','4 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Friendly','korbin@geemail.com',TRUE,1321321321);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('SNicholson','Skyler','Nicholson','5 Smith St','Mornington','VIC',3931,'https://api.adorable.io/avatars/285/abott@adorable.png','Great Worker','skyler@geemail.com',TRUE,1221122112);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('LSellers','Lindsay','Sellers','6 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Works well','lindsay@geemail.com',TRUE,1234432112);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('ANichols','Alejandro','Nichols','7 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Easy going','alejandro@geemail.com',TRUE,1222222222);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('KJackson','Khalil','Jackson','8 Smith St','Glen Waverley','VIC',3150,'https://api.adorable.io/avatars/285/abott@adorable.png','Friendly','khalil@geemail.com',TRUE,1000100000);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('AMoody','Alvin','Moody','9 Smith St','Frankston Sth','VIC',3199,'https://api.adorable.io/avatars/285/abott@adorable.png','Great Worker','alvin@geemail.com',TRUE,1324343220);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('PBonilla','Porter','Bonilla','10 Smith St','Mt Eliza','VIC',3930,'https://api.adorable.io/avatars/285/abott@adorable.png','Works well','porter@geemail.com',TRUE,1555555555);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('NBonilla','Natalee','Bonilla','11 Smith St','Essendon','VIC',3040,'https://api.adorable.io/avatars/285/abott@adorable.png','Easy going','natalee@geemail.com',TRUE,1234565430);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('AHarding','Allyson','Harding','12 Smith St','Essendon','VIC',3040,'https://api.adorable.io/avatars/285/abott@adorable.png','Friendly','allyson@geemail.com',TRUE,1000666660);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number) VALUES ('Bblank','Blank','Blank','Blank','Blank','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Blank','blank@geemail.com',TRUE,1000000001);

CREATE TABLE stafftogroups
(
    staff_member_id INTEGER,
    staff_role_id INTEGER,
    PRIMARY KEY (staff_member_id, staff_role_id),
    FOREIGN KEY (staff_member_id) REFERENCES staff(staff_id),
    FOREIGN KEY (staff_role_id) REFERENCES groups(id)

);

INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (1, 1);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (1, 2);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (1, 3);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (2, 3);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (2, 4);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (3, 4);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (3, 5);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (4, 5);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (5, 5);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (6, 4);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (6, 5);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (7, 5);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (7, 6);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (7, 7);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (8, 6);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (9, 7);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (10, 7);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (10, 9);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (10, 1);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (10, 11);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (11, 7);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (11, 10);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (12, 7);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (12, 2);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 1);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 2);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 3);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 4);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 5);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 6);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 7);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 8);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 9);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 10);
INSERT INTO stafftogroups
    (staff_member_id,staff_role_id)
VALUES
    (13, 11);


-- select staff_member_id,  staff_role_id, group_role, group_duration, firstname from stafftogroups, staff, groups  where staff.staff_id = stafftogroups.staff_member_id and groups.group_id = stafftogroups.staff_role_id;


CREATE TABLE publicholidays
(
    phol_id SERIAL PRIMARY KEY,
    phol_state VARCHAR(3) NOT NULL,
    phol_date DATE NOT NULL,
    phol_name VARCHAR(100)
);

INSERT INTO publicholidays
    (phol_state,phol_date,phol_name)
VALUES
    ('na', '2000-01-01', 'N/a');

CREATE TABLE roster
(
    roster_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    week_number SERIAL,
    status VARCHAR(9)
);

INSERT INTO roster
    (title,start_date,end_date,week_number,status)
VALUES('Week1', '2020-08-24', '2020-08-30', 1, 'Finalised');
INSERT INTO roster
    (title,start_date,end_date,week_number,status)
VALUES('Week2', '2020-08-31', '2020-09-06', 2, 'Finalised');
INSERT INTO roster
    (title,start_date,end_date,week_number,status)
VALUES('Week3', '2020-09-07', '2020-09-13', 3, 'Open');
INSERT INTO roster
    (title,start_date,end_date,week_number,status)
VALUES('Week4', '2020-09-14', '2020-09-20', 4, 'Open');
INSERT INTO roster
    (title,start_date,end_date,week_number,status)
VALUES('Week5', '2020-09-21', '2020-09-27', 5, 'Open');

CREATE TABLE shifts
(
    shift_id SERIAL PRIMARY KEY NOT NULL,
    timeslot_from BIGINT NOT NULL,
    timeslot_to BIGINT NOT NULL,
    isAllocated BOOLEAN DEFAULT 'False' NOT NULL,
    shift_start_date DATE,
    staff_id INTEGER,
    roster_id INTEGER,
    phol_id INTEGER,
    group_id INTEGER,
    title VARCHAR(50),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
    FOREIGN KEY (roster_id) REFERENCES roster (roster_id),
    FOREIGN KEY (phol_id) REFERENCES publicholidays (phol_id),
    FOREIGN KEY (group_id) REFERENCES groups (id)

);


INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598270400, TRUE, '2020-08-24', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598274000, 1598284800, TRUE, '2020-08-24', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598367600, TRUE, '2020-08-25', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598371200, 1598385600, TRUE, '2020-08-25', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598446800, TRUE, '2020-08-26', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598450400, 1598472000, TRUE, '2020-08-26', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598547600, TRUE, '2020-08-27', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598551200, 1598565600, TRUE, '2020-08-27', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598634000, TRUE, '2020-08-28', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598637600, 1598666400, TRUE, '2020-08-28', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598716800, TRUE, '2020-08-29', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598720400, 1598734800, TRUE, '2020-08-29', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598796000, TRUE, '2020-08-30', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598799600, 1598803200, TRUE, '2020-08-30', 1, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598875200, TRUE, '2020-08-31', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598878800, 1598900400, TRUE, '2020-08-31', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598972400, TRUE, '2020-09-01', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598976000, 1598986800, TRUE, '2020-09-01', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599058800, TRUE, '2020-09-02', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599062400, 1599087600, TRUE, '2020-09-02', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599134400, TRUE, '2020-09-03', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599138000, 1599148800, TRUE, '2020-09-03', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599220800, TRUE, '2020-09-04', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599224400, 1599249600, TRUE, '2020-09-04', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599307200, TRUE, '2020-09-05', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599310800, 1599321600, TRUE, '2020-09-05', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599400800, TRUE, '2020-09-06', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599404400, 1599426000, TRUE, '2020-09-06', 2, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599490800, TRUE, '2020-09-07', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599494400, 1599498000, TRUE, '2020-09-07', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599584400, TRUE, '2020-09-08', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599588000, 1599609600, TRUE, '2020-09-08', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599663600, TRUE, '2020-09-09', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599667200, 1599678000, TRUE, '2020-09-09', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599746400, TRUE, '2020-09-10', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599750000, 1599760800, TRUE, '2020-09-10', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599825600, TRUE, '2020-09-11', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599829200, 1599847200, TRUE, '2020-09-11', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599926400, TRUE, '2020-09-12', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599930000, 1599933600, TRUE, '2020-09-12', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600016400, TRUE, '2020-09-13', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600020000, 1600027200, TRUE, '2020-09-13', 3, 1, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600102800, TRUE, '2020-09-14', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600106400, 1600117200, TRUE, '2020-09-14', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600178400, TRUE, '2020-09-15', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600182000, 1600185600, TRUE, '2020-09-15', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600261200, TRUE, '2020-09-16', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600264800, 1600268400, TRUE, '2020-09-16', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600365600, TRUE, '2020-09-17', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600369200, 1600383600, TRUE, '2020-09-17', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600444800, TRUE, '2020-09-18', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600448400, 1600473600, TRUE, '2020-09-18', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600513200, TRUE, '2020-09-19', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600516800, 1600542000, TRUE, '2020-09-19', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600624800, TRUE, '2020-09-20', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600628400, 1600650000, TRUE, '2020-09-20', 4, 1, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600704000, TRUE, '2020-09-21', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600707600, 1600725600, TRUE, '2020-09-21', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600776000, TRUE, '2020-09-22', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600779600, 1600794000, TRUE, '2020-09-22', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600869600, TRUE, '2020-09-23', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600873200, 1600894800, TRUE, '2020-09-23', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600963200, TRUE, '2020-09-24', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600966800, 1600995600, TRUE, '2020-09-24', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601035200, TRUE, '2020-09-25', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601038800, 1601064000, TRUE, '2020-09-25', 5, 1, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598274000, TRUE, '2020-08-24', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598277600, 1598288400, TRUE, '2020-08-24', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598374800, TRUE, '2020-08-25', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598378400, 1598400000, TRUE, '2020-08-25', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598454000, TRUE, '2020-08-26', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598457600, 1598475600, TRUE, '2020-08-26', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598529600, TRUE, '2020-08-27', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598533200, 1598540400, TRUE, '2020-08-27', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598626800, TRUE, '2020-08-28', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598630400, 1598659200, TRUE, '2020-08-28', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598724000, TRUE, '2020-08-29', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598727600, 1598745600, TRUE, '2020-08-29', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598799600, TRUE, '2020-08-30', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598803200, 1598806800, TRUE, '2020-08-30', 1, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598886000, TRUE, '2020-08-31', 2, 2, 1, 3, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598889600, 1598907600, TRUE, '2020-08-31', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598976000, TRUE, '2020-09-01', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598979600, 1599001200, TRUE, '2020-09-01', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599055200, TRUE, '2020-09-02', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599058800, 1599084000, TRUE, '2020-09-02', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599156000, TRUE, '2020-09-03', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599159600, 1599184800, TRUE, '2020-09-03', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599220800, TRUE, '2020-09-04', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599224400, 1599235200, TRUE, '2020-09-04', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599303600, TRUE, '2020-09-05', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599307200, 1599332400, TRUE, '2020-09-05', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599408000, TRUE, '2020-09-06', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599411600, 1599418800, TRUE, '2020-09-06', 2, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599490800, TRUE, '2020-09-07', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599494400, 1599519600, TRUE, '2020-09-07', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599580800, TRUE, '2020-09-08', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599584400, 1599588000, TRUE, '2020-09-08', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599667200, TRUE, '2020-09-09', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599670800, 1599685200, TRUE, '2020-09-09', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599742800, TRUE, '2020-09-10', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599746400, 1599760800, TRUE, '2020-09-10', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599836400, TRUE, '2020-09-11', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599840000, 1599850800, TRUE, '2020-09-11', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599933600, TRUE, '2020-09-12', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599937200, 1599958800, TRUE, '2020-09-12', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600009200, TRUE, '2020-09-13', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600012800, 1600030800, TRUE, '2020-09-13', 3, 2, 1, 3, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600088400, TRUE, '2020-09-14', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600092000, 1600102800, TRUE, '2020-09-14', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600185600, TRUE, '2020-09-15', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600189200, 1600196400, TRUE, '2020-09-15', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600264800, TRUE, '2020-09-16', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600268400, 1600286400, TRUE, '2020-09-16', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600365600, TRUE, '2020-09-17', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600369200, 1600380000, TRUE, '2020-09-17', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600448400, TRUE, '2020-09-18', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600452000, 1600470000, TRUE, '2020-09-18', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600531200, TRUE, '2020-09-19', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600534800, 1600545600, TRUE, '2020-09-19', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600617600, TRUE, '2020-09-20', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600621200, 1600650000, TRUE, '2020-09-20', 4, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600711200, TRUE, '2020-09-21', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600714800, 1600718400, TRUE, '2020-09-21', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600794000, TRUE, '2020-09-22', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600797600, 1600804800, TRUE, '2020-09-22', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600862400, TRUE, '2020-09-23', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600866000, 1600894800, TRUE, '2020-09-23', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600959600, TRUE, '2020-09-24', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600963200, 1600970400, TRUE, '2020-09-24', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601042400, TRUE, '2020-09-25', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601046000, 1601064000, TRUE, '2020-09-25', 5, 2, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598292000, TRUE, '2020-08-24', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598295600, 1598306400, TRUE, '2020-08-24', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598356800, TRUE, '2020-08-25', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598360400, 1598389200, TRUE, '2020-08-25', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598450400, TRUE, '2020-08-26', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598454000, 1598457600, TRUE, '2020-08-26', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598529600, TRUE, '2020-08-27', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598533200, 1598554800, TRUE, '2020-08-27', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598616000, TRUE, '2020-08-28', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598619600, 1598644800, TRUE, '2020-08-28', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598724000, TRUE, '2020-08-29', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598727600, 1598745600, TRUE, '2020-08-29', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598785200, TRUE, '2020-08-30', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598788800, 1598817600, TRUE, '2020-08-30', 1, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598878800, TRUE, '2020-08-31', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598882400, 1598886000, TRUE, '2020-08-31', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598976000, TRUE, '2020-09-01', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598979600, 1599001200, TRUE, '2020-09-01', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599069600, TRUE, '2020-09-02', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599073200, 1599084000, TRUE, '2020-09-02', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599145200, TRUE, '2020-09-03', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599148800, 1599159600, TRUE, '2020-09-03', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599235200, TRUE, '2020-09-04', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599238800, 1599256800, TRUE, '2020-09-04', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599318000, TRUE, '2020-09-05', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599321600, 1599343200, TRUE, '2020-09-05', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599408000, TRUE, '2020-09-06', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599411600, 1599426000, TRUE, '2020-09-06', 2, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599490800, TRUE, '2020-09-07', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599494400, 1599498000, TRUE, '2020-09-07', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599570000, TRUE, '2020-09-08', 3, 3, 1, 4, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599573600, 1599591600, TRUE, '2020-09-08', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599667200, TRUE, '2020-09-09', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599670800, 1599688800, TRUE, '2020-09-09', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599757200, TRUE, '2020-09-10', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599760800, 1599764400, TRUE, '2020-09-10', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599829200, TRUE, '2020-09-11', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599832800, 1599840000, TRUE, '2020-09-11', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599926400, TRUE, '2020-09-12', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599930000, 1599948000, TRUE, '2020-09-12', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1599994800, TRUE, '2020-09-13', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599998400, 1600012800, TRUE, '2020-09-13', 3, 3, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600092000, TRUE, '2020-09-14', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600095600, 1600110000, TRUE, '2020-09-14', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600171200, TRUE, '2020-09-15', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600174800, 1600185600, TRUE, '2020-09-15', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600279200, TRUE, '2020-09-16', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600282800, 1600308000, TRUE, '2020-09-16', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600365600, TRUE, '2020-09-17', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600369200, 1600376400, TRUE, '2020-09-17', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600444800, TRUE, '2020-09-18', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600448400, 1600477200, TRUE, '2020-09-18', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600538400, TRUE, '2020-09-19', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600542000, 1600560000, TRUE, '2020-09-19', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600621200, TRUE, '2020-09-20', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600624800, 1600632000, TRUE, '2020-09-20', 4, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600693200, TRUE, '2020-09-21', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600696800, 1600722000, TRUE, '2020-09-21', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600779600, TRUE, '2020-09-22', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600783200, 1600808400, TRUE, '2020-09-22', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600873200, TRUE, '2020-09-23', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600876800, 1600902000, TRUE, '2020-09-23', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600948800, TRUE, '2020-09-24', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600952400, 1600959600, TRUE, '2020-09-24', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601049600, TRUE, '2020-09-25', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601053200, 1601082000, TRUE, '2020-09-25', 5, 3, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598274000, TRUE, '2020-08-24', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598277600, 1598284800, TRUE, '2020-08-24', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598356800, TRUE, '2020-08-25', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598360400, 1598374800, TRUE, '2020-08-25', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598457600, TRUE, '2020-08-26', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598461200, 1598479200, TRUE, '2020-08-26', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598533200, TRUE, '2020-08-27', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598536800, 1598565600, TRUE, '2020-08-27', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598616000, TRUE, '2020-08-28', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598619600, 1598634000, TRUE, '2020-08-28', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598698800, TRUE, '2020-08-29', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598702400, 1598709600, TRUE, '2020-08-29', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598810400, TRUE, '2020-08-30', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598814000, 1598835600, TRUE, '2020-08-30', 1, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598896800, TRUE, '2020-08-31', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598900400, 1598918400, TRUE, '2020-08-31', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598961600, TRUE, '2020-09-01', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598965200, 1598976000, TRUE, '2020-09-01', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599058800, TRUE, '2020-09-02', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599062400, 1599073200, TRUE, '2020-09-02', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599141600, TRUE, '2020-09-03', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599145200, 1599163200, TRUE, '2020-09-03', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599242400, TRUE, '2020-09-04', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599246000, 1599256800, TRUE, '2020-09-04', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599310800, TRUE, '2020-09-05', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599314400, 1599339600, TRUE, '2020-09-05', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599411600, TRUE, '2020-09-06', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599415200, 1599444000, TRUE, '2020-09-06', 2, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599498000, TRUE, '2020-09-07', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599501600, 1599530400, TRUE, '2020-09-07', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599562800, TRUE, '2020-09-08', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599566400, 1599570000, TRUE, '2020-09-08', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599652800, TRUE, '2020-09-09', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599656400, 1599681600, TRUE, '2020-09-09', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599760800, TRUE, '2020-09-10', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599764400, 1599789600, TRUE, '2020-09-10', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599825600, TRUE, '2020-09-11', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599829200, 1599836400, TRUE, '2020-09-11', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599933600, TRUE, '2020-09-12', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599937200, 1599951600, TRUE, '2020-09-12', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1599998400, TRUE, '2020-09-13', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600002000, 1600009200, TRUE, '2020-09-13', 3, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600088400, TRUE, '2020-09-14', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600092000, 1600106400, TRUE, '2020-09-14', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600185600, TRUE, '2020-09-15', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600189200, 1600192800, TRUE, '2020-09-15', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600257600, TRUE, '2020-09-16', 4, 4, 1, 5, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600261200, 1600290000, TRUE, '2020-09-16', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600362000, TRUE, '2020-09-17', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600365600, 1600383600, TRUE, '2020-09-17', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600437600, TRUE, '2020-09-18', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600441200, 1600459200, TRUE, '2020-09-18', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600534800, TRUE, '2020-09-19', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600538400, 1600563600, TRUE, '2020-09-19', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600614000, TRUE, '2020-09-20', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600617600, 1600621200, TRUE, '2020-09-20', 4, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600693200, TRUE, '2020-09-21', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600696800, 1600714800, TRUE, '2020-09-21', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600783200, TRUE, '2020-09-22', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600786800, 1600815600, TRUE, '2020-09-22', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600866000, TRUE, '2020-09-23', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600869600, 1600891200, TRUE, '2020-09-23', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600963200, TRUE, '2020-09-24', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600966800, 1600981200, TRUE, '2020-09-24', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601046000, TRUE, '2020-09-25', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601049600, 1601064000, TRUE, '2020-09-25', 5, 4, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598292000, TRUE, '2020-08-24', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598295600, 1598313600, TRUE, '2020-08-24', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598356800, TRUE, '2020-08-25', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598360400, 1598374800, TRUE, '2020-08-25', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598450400, TRUE, '2020-08-26', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598454000, 1598482800, TRUE, '2020-08-26', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598533200, TRUE, '2020-08-27', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598536800, 1598547600, TRUE, '2020-08-27', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598634000, TRUE, '2020-08-28', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598637600, 1598666400, TRUE, '2020-08-28', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598720400, TRUE, '2020-08-29', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598724000, 1598738400, TRUE, '2020-08-29', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598792400, TRUE, '2020-08-30', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598796000, 1598810400, TRUE, '2020-08-30', 1, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598875200, TRUE, '2020-08-31', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598878800, 1598893200, TRUE, '2020-08-31', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598968800, TRUE, '2020-09-01', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598972400, 1598994000, TRUE, '2020-09-01', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599062400, TRUE, '2020-09-02', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599066000, 1599091200, TRUE, '2020-09-02', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599156000, TRUE, '2020-09-03', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599159600, 1599166800, TRUE, '2020-09-03', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599235200, TRUE, '2020-09-04', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599238800, 1599267600, TRUE, '2020-09-04', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599307200, TRUE, '2020-09-05', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599310800, 1599336000, TRUE, '2020-09-05', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599411600, TRUE, '2020-09-06', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599415200, 1599440400, TRUE, '2020-09-06', 2, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599494400, TRUE, '2020-09-07', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599498000, 1599508800, TRUE, '2020-09-07', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599577200, TRUE, '2020-09-08', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599580800, 1599602400, TRUE, '2020-09-08', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599656400, TRUE, '2020-09-09', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599660000, 1599667200, TRUE, '2020-09-09', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599757200, TRUE, '2020-09-10', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599760800, 1599768000, TRUE, '2020-09-10', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599840000, TRUE, '2020-09-11', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599843600, 1599865200, TRUE, '2020-09-11', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599912000, TRUE, '2020-09-12', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599915600, 1599930000, TRUE, '2020-09-12', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600020000, TRUE, '2020-09-13', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600023600, 1600041600, TRUE, '2020-09-13', 3, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600099200, TRUE, '2020-09-14', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600102800, 1600110000, TRUE, '2020-09-14', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600189200, TRUE, '2020-09-15', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600192800, 1600196400, TRUE, '2020-09-15', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600268400, TRUE, '2020-09-16', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600272000, 1600279200, TRUE, '2020-09-16', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600362000, TRUE, '2020-09-17', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600365600, 1600387200, TRUE, '2020-09-17', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600448400, TRUE, '2020-09-18', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600452000, 1600480800, TRUE, '2020-09-18', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600527600, TRUE, '2020-09-19', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600531200, 1600545600, TRUE, '2020-09-19', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600617600, TRUE, '2020-09-20', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600621200, 1600639200, TRUE, '2020-09-20', 4, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600707600, TRUE, '2020-09-21', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600711200, 1600725600, TRUE, '2020-09-21', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600790400, TRUE, '2020-09-22', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600794000, 1600804800, TRUE, '2020-09-22', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600873200, TRUE, '2020-09-23', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600876800, 1600898400, TRUE, '2020-09-23', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600970400, TRUE, '2020-09-24', 5, 5, 1, 5, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600974000, 1600984800, TRUE, '2020-09-24', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601046000, TRUE, '2020-09-25', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601049600, 1601060400, TRUE, '2020-09-25', 5, 5, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598270400, TRUE, '2020-08-24', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598274000, 1598299200, TRUE, '2020-08-24', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598371200, TRUE, '2020-08-25', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598374800, 1598389200, TRUE, '2020-08-25', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598439600, TRUE, '2020-08-26', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598443200, 1598472000, TRUE, '2020-08-26', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598526000, TRUE, '2020-08-27', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598529600, 1598554800, TRUE, '2020-08-27', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598623200, TRUE, '2020-08-28', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598626800, 1598652000, TRUE, '2020-08-28', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598716800, TRUE, '2020-08-29', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598720400, 1598724000, TRUE, '2020-08-29', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598799600, TRUE, '2020-08-30', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598803200, 1598817600, TRUE, '2020-08-30', 1, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598871600, TRUE, '2020-08-31', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598875200, 1598904000, TRUE, '2020-08-31', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598965200, TRUE, '2020-09-01', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598968800, 1598994000, TRUE, '2020-09-01', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599044400, TRUE, '2020-09-02', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599048000, 1599055200, TRUE, '2020-09-02', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599156000, TRUE, '2020-09-03', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599159600, 1599181200, TRUE, '2020-09-03', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599220800, TRUE, '2020-09-04', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599224400, 1599228000, TRUE, '2020-09-04', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599314400, TRUE, '2020-09-05', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599318000, 1599336000, TRUE, '2020-09-05', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599404400, TRUE, '2020-09-06', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599408000, 1599426000, TRUE, '2020-09-06', 2, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599501600, TRUE, '2020-09-07', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599505200, 1599516000, TRUE, '2020-09-07', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599584400, TRUE, '2020-09-08', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599588000, 1599616800, TRUE, '2020-09-08', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599663600, TRUE, '2020-09-09', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599667200, 1599692400, TRUE, '2020-09-09', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599735600, TRUE, '2020-09-10', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599739200, 1599757200, TRUE, '2020-09-10', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599825600, TRUE, '2020-09-11', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599829200, 1599843600, TRUE, '2020-09-11', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599919200, TRUE, '2020-09-12', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599922800, 1599933600, TRUE, '2020-09-12', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600016400, TRUE, '2020-09-13', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600020000, 1600048800, TRUE, '2020-09-13', 3, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600092000, TRUE, '2020-09-14', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600095600, 1600106400, TRUE, '2020-09-14', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600185600, TRUE, '2020-09-15', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600189200, 1600214400, TRUE, '2020-09-15', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600261200, TRUE, '2020-09-16', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600264800, 1600282800, TRUE, '2020-09-16', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600351200, TRUE, '2020-09-17', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600354800, 1600383600, TRUE, '2020-09-17', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600426800, TRUE, '2020-09-18', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600430400, 1600452000, TRUE, '2020-09-18', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600516800, TRUE, '2020-09-19', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600520400, 1600524000, TRUE, '2020-09-19', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600599600, TRUE, '2020-09-20', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600603200, 1600628400, TRUE, '2020-09-20', 4, 6, 1, 5, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600693200, TRUE, '2020-09-21', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600696800, 1600707600, TRUE, '2020-09-21', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600772400, TRUE, '2020-09-22', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600776000, 1600804800, TRUE, '2020-09-22', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600858800, TRUE, '2020-09-23', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600862400, 1600891200, TRUE, '2020-09-23', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600952400, TRUE, '2020-09-24', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600956000, 1600977600, TRUE, '2020-09-24', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601056800, TRUE, '2020-09-25', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601060400, 1601089200, TRUE, '2020-09-25', 5, 6, 1, 4, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598277600, TRUE, '2020-08-24', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598281200, 1598302800, TRUE, '2020-08-24', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598360400, TRUE, '2020-08-25', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598364000, 1598367600, TRUE, '2020-08-25', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598443200, TRUE, '2020-08-26', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598446800, 1598472000, TRUE, '2020-08-26', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598540400, TRUE, '2020-08-27', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598544000, 1598551200, TRUE, '2020-08-27', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598626800, TRUE, '2020-08-28', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598630400, 1598655600, TRUE, '2020-08-28', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598709600, TRUE, '2020-08-29', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598713200, 1598738400, TRUE, '2020-08-29', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598796000, TRUE, '2020-08-30', 1, 7, 1, 7, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598799600, 1598821200, TRUE, '2020-08-30', 1, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598893200, TRUE, '2020-08-31', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598896800, 1598918400, TRUE, '2020-08-31', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598972400, TRUE, '2020-09-01', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598976000, 1599001200, TRUE, '2020-09-01', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599048000, TRUE, '2020-09-02', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599051600, 1599073200, TRUE, '2020-09-02', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599156000, TRUE, '2020-09-03', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599159600, 1599181200, TRUE, '2020-09-03', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599217200, TRUE, '2020-09-04', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599220800, 1599228000, TRUE, '2020-09-04', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599314400, TRUE, '2020-09-05', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599318000, 1599321600, TRUE, '2020-09-05', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599397200, TRUE, '2020-09-06', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599400800, 1599422400, TRUE, '2020-09-06', 2, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599476400, TRUE, '2020-09-07', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599480000, 1599505200, TRUE, '2020-09-07', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599577200, TRUE, '2020-09-08', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599580800, 1599591600, TRUE, '2020-09-08', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599674400, TRUE, '2020-09-09', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599678000, 1599692400, TRUE, '2020-09-09', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599760800, TRUE, '2020-09-10', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599764400, 1599789600, TRUE, '2020-09-10', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599847200, TRUE, '2020-09-11', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599850800, 1599868800, TRUE, '2020-09-11', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599926400, TRUE, '2020-09-12', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599930000, 1599948000, TRUE, '2020-09-12', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600012800, TRUE, '2020-09-13', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600016400, 1600034400, TRUE, '2020-09-13', 3, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600106400, TRUE, '2020-09-14', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600110000, 1600135200, TRUE, '2020-09-14', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600185600, TRUE, '2020-09-15', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600189200, 1600200000, TRUE, '2020-09-15', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600275600, TRUE, '2020-09-16', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600279200, 1600293600, TRUE, '2020-09-16', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600351200, TRUE, '2020-09-17', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600354800, 1600380000, TRUE, '2020-09-17', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600437600, TRUE, '2020-09-18', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600441200, 1600452000, TRUE, '2020-09-18', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600520400, TRUE, '2020-09-19', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600524000, 1600549200, TRUE, '2020-09-19', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600624800, TRUE, '2020-09-20', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600628400, 1600650000, TRUE, '2020-09-20', 4, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600696800, TRUE, '2020-09-21', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600700400, 1600711200, TRUE, '2020-09-21', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600783200, TRUE, '2020-09-22', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600786800, 1600794000, TRUE, '2020-09-22', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600866000, TRUE, '2020-09-23', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600869600, 1600876800, TRUE, '2020-09-23', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600948800, TRUE, '2020-09-24', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600952400, 1600966800, TRUE, '2020-09-24', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601046000, TRUE, '2020-09-25', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601049600, 1601074800, TRUE, '2020-09-25', 5, 7, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598274000, TRUE, '2020-08-24', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598277600, 1598306400, TRUE, '2020-08-24', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598371200, TRUE, '2020-08-25', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598374800, 1598378400, TRUE, '2020-08-25', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598464800, TRUE, '2020-08-26', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598468400, 1598497200, TRUE, '2020-08-26', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598540400, TRUE, '2020-08-27', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598544000, 1598547600, TRUE, '2020-08-27', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598630400, TRUE, '2020-08-28', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598634000, 1598648400, TRUE, '2020-08-28', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598698800, TRUE, '2020-08-29', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598702400, 1598706000, TRUE, '2020-08-29', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598785200, TRUE, '2020-08-30', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598788800, 1598806800, TRUE, '2020-08-30', 1, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598871600, TRUE, '2020-08-31', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598875200, 1598882400, TRUE, '2020-08-31', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598976000, TRUE, '2020-09-01', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598979600, 1598997600, TRUE, '2020-09-01', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599069600, TRUE, '2020-09-02', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599073200, 1599102000, TRUE, '2020-09-02', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599141600, TRUE, '2020-09-03', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599145200, 1599174000, TRUE, '2020-09-03', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599220800, TRUE, '2020-09-04', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599224400, 1599253200, TRUE, '2020-09-04', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599314400, TRUE, '2020-09-05', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599318000, 1599336000, TRUE, '2020-09-05', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599400800, TRUE, '2020-09-06', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599404400, 1599426000, TRUE, '2020-09-06', 2, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599494400, TRUE, '2020-09-07', 3, 8, 1, 6, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599498000, 1599516000, TRUE, '2020-09-07', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599584400, TRUE, '2020-09-08', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599588000, 1599595200, TRUE, '2020-09-08', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599670800, TRUE, '2020-09-09', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599674400, 1599692400, TRUE, '2020-09-09', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599739200, TRUE, '2020-09-10', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599742800, 1599753600, TRUE, '2020-09-10', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599847200, TRUE, '2020-09-11', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599850800, 1599861600, TRUE, '2020-09-11', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599926400, TRUE, '2020-09-12', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599930000, 1599940800, TRUE, '2020-09-12', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1599998400, TRUE, '2020-09-13', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600002000, 1600023600, TRUE, '2020-09-13', 3, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600084800, TRUE, '2020-09-14', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600088400, 1600117200, TRUE, '2020-09-14', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600171200, TRUE, '2020-09-15', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600174800, 1600192800, TRUE, '2020-09-15', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600264800, TRUE, '2020-09-16', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600268400, 1600293600, TRUE, '2020-09-16', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600344000, TRUE, '2020-09-17', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600347600, 1600354800, TRUE, '2020-09-17', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600426800, TRUE, '2020-09-18', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600430400, 1600437600, TRUE, '2020-09-18', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600513200, TRUE, '2020-09-19', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600516800, 1600531200, TRUE, '2020-09-19', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600617600, TRUE, '2020-09-20', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600621200, 1600628400, TRUE, '2020-09-20', 4, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600707600, TRUE, '2020-09-21', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600711200, 1600729200, TRUE, '2020-09-21', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600772400, TRUE, '2020-09-22', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600776000, 1600797600, TRUE, '2020-09-22', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600876800, TRUE, '2020-09-23', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600880400, 1600905600, TRUE, '2020-09-23', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600959600, TRUE, '2020-09-24', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600963200, 1600992000, TRUE, '2020-09-24', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601056800, TRUE, '2020-09-25', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601060400, 1601074800, TRUE, '2020-09-25', 5, 8, 1, 6, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598274000, TRUE, '2020-08-24', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598277600, 1598299200, TRUE, '2020-08-24', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598378400, TRUE, '2020-08-25', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598382000, 1598396400, TRUE, '2020-08-25', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598454000, TRUE, '2020-08-26', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598457600, 1598486400, TRUE, '2020-08-26', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598551200, TRUE, '2020-08-27', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598554800, 1598569200, TRUE, '2020-08-27', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598612400, TRUE, '2020-08-28', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598616000, 1598619600, TRUE, '2020-08-28', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598716800, TRUE, '2020-08-29', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598720400, 1598731200, TRUE, '2020-08-29', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598810400, TRUE, '2020-08-30', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598814000, 1598828400, TRUE, '2020-08-30', 1, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598878800, TRUE, '2020-08-31', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598882400, 1598896800, TRUE, '2020-08-31', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598979600, TRUE, '2020-09-01', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598983200, 1599012000, TRUE, '2020-09-01', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599048000, TRUE, '2020-09-02', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599051600, 1599069600, TRUE, '2020-09-02', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599141600, TRUE, '2020-09-03', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599145200, 1599170400, TRUE, '2020-09-03', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599235200, TRUE, '2020-09-04', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599238800, 1599267600, TRUE, '2020-09-04', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599321600, TRUE, '2020-09-05', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599325200, 1599350400, TRUE, '2020-09-05', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599393600, TRUE, '2020-09-06', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599397200, 1599411600, TRUE, '2020-09-06', 2, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599494400, TRUE, '2020-09-07', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599498000, 1599516000, TRUE, '2020-09-07', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599577200, TRUE, '2020-09-08', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599580800, 1599588000, TRUE, '2020-09-08', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599667200, TRUE, '2020-09-09', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599670800, 1599699600, TRUE, '2020-09-09', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599742800, TRUE, '2020-09-10', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599746400, 1599757200, TRUE, '2020-09-10', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599847200, TRUE, '2020-09-11', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599850800, 1599858000, TRUE, '2020-09-11', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599908400, TRUE, '2020-09-12', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599912000, 1599940800, TRUE, '2020-09-12', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600002000, TRUE, '2020-09-13', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600005600, 1600016400, TRUE, '2020-09-13', 3, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600095600, TRUE, '2020-09-14', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600099200, 1600102800, TRUE, '2020-09-14', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600182000, TRUE, '2020-09-15', 4, 9, 1, 7, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600185600, 1600200000, TRUE, '2020-09-15', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600257600, TRUE, '2020-09-16', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600261200, 1600286400, TRUE, '2020-09-16', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600362000, TRUE, '2020-09-17', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600365600, 1600376400, TRUE, '2020-09-17', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600430400, TRUE, '2020-09-18', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600434000, 1600437600, TRUE, '2020-09-18', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600538400, TRUE, '2020-09-19', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600542000, 1600552800, TRUE, '2020-09-19', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600624800, TRUE, '2020-09-20', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600628400, 1600632000, TRUE, '2020-09-20', 4, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600696800, TRUE, '2020-09-21', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600700400, 1600711200, TRUE, '2020-09-21', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600794000, TRUE, '2020-09-22', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600797600, 1600822800, TRUE, '2020-09-22', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600869600, TRUE, '2020-09-23', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600873200, 1600902000, TRUE, '2020-09-23', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600952400, TRUE, '2020-09-24', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600956000, 1600977600, TRUE, '2020-09-24', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601038800, TRUE, '2020-09-25', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601042400, 1601060400, TRUE, '2020-09-25', 5, 9, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598270400, TRUE, '2020-08-24', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598274000, 1598292000, TRUE, '2020-08-24', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598353200, TRUE, '2020-08-25', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598356800, 1598385600, TRUE, '2020-08-25', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598457600, TRUE, '2020-08-26', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598461200, 1598472000, TRUE, '2020-08-26', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598526000, TRUE, '2020-08-27', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598529600, 1598547600, TRUE, '2020-08-27', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598626800, TRUE, '2020-08-28', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598630400, 1598655600, TRUE, '2020-08-28', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598698800, TRUE, '2020-08-29', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598702400, 1598727600, TRUE, '2020-08-29', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598799600, TRUE, '2020-08-30', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598803200, 1598817600, TRUE, '2020-08-30', 1, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598882400, TRUE, '2020-08-31', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598886000, 1598907600, TRUE, '2020-08-31', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598976000, TRUE, '2020-09-01', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598979600, 1599004800, TRUE, '2020-09-01', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599051600, TRUE, '2020-09-02', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599055200, 1599066000, TRUE, '2020-09-02', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599130800, TRUE, '2020-09-03', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599134400, 1599163200, TRUE, '2020-09-03', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599238800, TRUE, '2020-09-04', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599242400, 1599267600, TRUE, '2020-09-04', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599307200, TRUE, '2020-09-05', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599310800, 1599325200, TRUE, '2020-09-05', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599390000, TRUE, '2020-09-06', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599393600, 1599418800, TRUE, '2020-09-06', 2, 10, 1, 1, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599476400, TRUE, '2020-09-07', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599480000, 1599487200, TRUE, '2020-09-07', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599580800, TRUE, '2020-09-08', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599584400, 1599598800, TRUE, '2020-09-08', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599670800, TRUE, '2020-09-09', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599674400, 1599688800, TRUE, '2020-09-09', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599753600, TRUE, '2020-09-10', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599757200, 1599778800, TRUE, '2020-09-10', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599843600, TRUE, '2020-09-11', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599847200, 1599872400, TRUE, '2020-09-11', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599922800, TRUE, '2020-09-12', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599926400, 1599937200, TRUE, '2020-09-12', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600002000, TRUE, '2020-09-13', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600005600, 1600030800, TRUE, '2020-09-13', 3, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600095600, TRUE, '2020-09-14', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600099200, 1600110000, TRUE, '2020-09-14', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600174800, TRUE, '2020-09-15', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600178400, 1600196400, TRUE, '2020-09-15', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600261200, TRUE, '2020-09-16', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600264800, 1600268400, TRUE, '2020-09-16', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600340400, TRUE, '2020-09-17', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600344000, 1600362000, TRUE, '2020-09-17', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600448400, TRUE, '2020-09-18', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600452000, 1600466400, TRUE, '2020-09-18', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600516800, TRUE, '2020-09-19', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600520400, 1600545600, TRUE, '2020-09-19', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600603200, TRUE, '2020-09-20', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600606800, 1600617600, TRUE, '2020-09-20', 4, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600700400, TRUE, '2020-09-21', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600704000, 1600718400, TRUE, '2020-09-21', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600779600, TRUE, '2020-09-22', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600783200, 1600801200, TRUE, '2020-09-22', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600869600, TRUE, '2020-09-23', 5, 10, 1, 7, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600873200, 1600887600, TRUE, '2020-09-23', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600945200, TRUE, '2020-09-24', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600948800, 1600963200, TRUE, '2020-09-24', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601053200, TRUE, '2020-09-25', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601056800, 1601071200, TRUE, '2020-09-25', 5, 10, 1, 7, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598270400, TRUE, '2020-08-24', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598274000, 1598284800, TRUE, '2020-08-24', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598360400, TRUE, '2020-08-25', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598364000, 1598374800, TRUE, '2020-08-25', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598464800, TRUE, '2020-08-26', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598468400, 1598493600, TRUE, '2020-08-26', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598544000, TRUE, '2020-08-27', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598547600, 1598572800, TRUE, '2020-08-27', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598626800, TRUE, '2020-08-28', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598630400, 1598644800, TRUE, '2020-08-28', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598702400, TRUE, '2020-08-29', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598706000, 1598716800, TRUE, '2020-08-29', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598785200, TRUE, '2020-08-30', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598788800, 1598806800, TRUE, '2020-08-30', 1, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598889600, TRUE, '2020-08-31', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598893200, 1598907600, TRUE, '2020-08-31', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598968800, TRUE, '2020-09-01', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598972400, 1598979600, TRUE, '2020-09-01', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599044400, TRUE, '2020-09-02', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599048000, 1599069600, TRUE, '2020-09-02', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599156000, TRUE, '2020-09-03', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599159600, 1599166800, TRUE, '2020-09-03', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599228000, TRUE, '2020-09-04', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599231600, 1599260400, TRUE, '2020-09-04', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599321600, TRUE, '2020-09-05', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599325200, 1599343200, TRUE, '2020-09-05', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599415200, TRUE, '2020-09-06', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599418800, 1599429600, TRUE, '2020-09-06', 2, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599498000, TRUE, '2020-09-07', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599501600, 1599505200, TRUE, '2020-09-07', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599588000, TRUE, '2020-09-08', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599591600, 1599598800, TRUE, '2020-09-08', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599667200, TRUE, '2020-09-09', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599670800, 1599681600, TRUE, '2020-09-09', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599753600, TRUE, '2020-09-10', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599757200, 1599778800, TRUE, '2020-09-10', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599836400, TRUE, '2020-09-11', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599840000, 1599861600, TRUE, '2020-09-11', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599926400, TRUE, '2020-09-12', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599930000, 1599948000, TRUE, '2020-09-12', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1600020000, TRUE, '2020-09-13', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600023600, 1600038000, TRUE, '2020-09-13', 3, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600102800, TRUE, '2020-09-14', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600106400, 1600120800, TRUE, '2020-09-14', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600174800, TRUE, '2020-09-15', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600178400, 1600189200, TRUE, '2020-09-15', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600264800, TRUE, '2020-09-16', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600268400, 1600279200, TRUE, '2020-09-16', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600362000, TRUE, '2020-09-17', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600365600, 1600380000, TRUE, '2020-09-17', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600430400, TRUE, '2020-09-18', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600434000, 1600459200, TRUE, '2020-09-18', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600524000, TRUE, '2020-09-19', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600527600, 1600542000, TRUE, '2020-09-19', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600624800, TRUE, '2020-09-20', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600628400, 1600653600, TRUE, '2020-09-20', 4, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600711200, TRUE, '2020-09-21', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600714800, 1600729200, TRUE, '2020-09-21', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600797600, TRUE, '2020-09-22', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600801200, 1600830000, TRUE, '2020-09-22', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600884000, TRUE, '2020-09-23', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600887600, 1600894800, TRUE, '2020-09-23', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600952400, TRUE, '2020-09-24', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600956000, 1600977600, TRUE, '2020-09-24', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601053200, TRUE, '2020-09-25', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601056800, 1601085600, TRUE, '2020-09-25', 5, 11, 1, 10, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598259600, 1598284800, TRUE, '2020-08-24', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598288400, 1598299200, TRUE, '2020-08-24', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598346000, 1598356800, TRUE, '2020-08-25', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598360400, 1598364000, TRUE, '2020-08-25', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598432400, 1598457600, TRUE, '2020-08-26', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598461200, 1598479200, TRUE, '2020-08-26', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598518800, 1598529600, TRUE, '2020-08-27', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598533200, 1598540400, TRUE, '2020-08-27', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598605200, 1598634000, TRUE, '2020-08-28', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598637600, 1598666400, TRUE, '2020-08-28', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598691600, 1598720400, TRUE, '2020-08-29', 1, 12, 1, 2, 'UnAllocated');



INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598724000, 1598742000, TRUE, '2020-08-29', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598778000, 1598806800, TRUE, '2020-08-30', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598810400, 1598824800, TRUE, '2020-08-30', 1, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598864400, 1598886000, TRUE, '2020-08-31', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598889600, 1598900400, TRUE, '2020-08-31', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598950800, 1598983200, TRUE, '2020-09-01', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1598986800, 1599004800, TRUE, '2020-09-01', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599037200, 1599069600, TRUE, '2020-09-02', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599073200, 1599087600, TRUE, '2020-09-02', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599123600, 1599130800, TRUE, '2020-09-03', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599134400, 1599152400, TRUE, '2020-09-03', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599210000, 1599224400, TRUE, '2020-09-04', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599228000, 1599242400, TRUE, '2020-09-04', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599296400, 1599328800, TRUE, '2020-09-05', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599332400, 1599346800, TRUE, '2020-09-05', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599382800, 1599393600, TRUE, '2020-09-06', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599397200, 1599426000, TRUE, '2020-09-06', 2, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599469200, 1599480000, TRUE, '2020-09-07', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599483600, 1599498000, TRUE, '2020-09-07', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599555600, 1599566400, TRUE, '2020-09-08', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599570000, 1599580800, TRUE, '2020-09-08', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599642000, 1599656400, TRUE, '2020-09-09', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599660000, 1599685200, TRUE, '2020-09-09', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599728400, 1599746400, TRUE, '2020-09-10', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599750000, 1599760800, TRUE, '2020-09-10', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599814800, 1599829200, TRUE, '2020-09-11', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599832800, 1599836400, TRUE, '2020-09-11', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599901200, 1599933600, TRUE, '2020-09-12', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599937200, 1599951600, TRUE, '2020-09-12', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599987600, 1599994800, TRUE, '2020-09-13', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1599998400, 1600002000, TRUE, '2020-09-13', 3, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600074000, 1600081200, TRUE, '2020-09-14', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600084800, 1600113600, TRUE, '2020-09-14', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600160400, 1600167600, TRUE, '2020-09-15', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600171200, 1600185600, TRUE, '2020-09-15', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600246800, 1600261200, TRUE, '2020-09-16', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600264800, 1600272000, TRUE, '2020-09-16', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600333200, 1600340400, TRUE, '2020-09-17', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600344000, 1600351200, TRUE, '2020-09-17', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600419600, 1600426800, TRUE, '2020-09-18', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600430400, 1600441200, TRUE, '2020-09-18', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600506000, 1600527600, TRUE, '2020-09-19', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600531200, 1600549200, TRUE, '2020-09-19', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600592400, 1600606800, TRUE, '2020-09-20', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600610400, 1600617600, TRUE, '2020-09-20', 4, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600678800, 1600696800, TRUE, '2020-09-21', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600700400, 1600722000, TRUE, '2020-09-21', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600765200, 1600797600, TRUE, '2020-09-22', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600801200, 1600830000, TRUE, '2020-09-22', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600851600, 1600884000, TRUE, '2020-09-23', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600887600, 1600898400, TRUE, '2020-09-23', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600938000, 1600945200, TRUE, '2020-09-24', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1600948800, 1600970400, TRUE, '2020-09-24', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601024400, 1601046000, TRUE, '2020-09-25', 5, 12, 1, 2, 'UnAllocated');
INSERT INTO shifts
    (timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title)
VALUES
    (1601049600, 1601060400, TRUE, '2020-09-25', 5, 12, 1, 2, 'UnAllocated');



-- WHAT WERE EACH PERSONS WAGE ON A SPECIFIC DATE?

select shift_start_date, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay, shifts.staff_id, username, shifts.group_id, groups.title
from shifts, groups, staff
WHERE shift_start_date='2020-08-24'
    AND shifts.group_id = groups.id
    AND shifts.staff_id = staff.staff_id
GROUP BY shift_start_date, shifts.staff_id, username, shifts.group_id, groups.title;


-- THE BELOW SHOWS THE TOTAL WAGES AMOUNT PAID FOR ROSTER 1...(i.e. 1 WEEK)

select SUM(subq.hours_worked * pay_rate)
from (
select SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, shifts.staff_id, username, groups.title, pay_rate
    from shifts, groups, staff
    WHERE shifts.roster_id=1
        AND shifts.group_id = groups.id
        AND shifts.staff_id = staff.staff_id
    GROUP BY shifts.staff_id, username, groups.title, pay_rate
    ORDER BY shifts.staff_id
) as subq;

-- THE BELOW SHOWS THE COMPLETE TOTAL OF ALL WAGES PAID ACROSS ALL ROSTERS
select SUM(subq.hours_worked * pay_rate)
from (
select SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, shifts.staff_id, username, groups.title, pay_rate
    from shifts, groups, staff
    WHERE shifts.group_id = groups.id
        AND shifts.staff_id = staff.staff_id
    GROUP BY shifts.staff_id, username, groups.title, pay_rate
    ORDER BY shifts.staff_id
) as subq;


-- THE BLEOW SHOWS THE WEEKLY WAGES PAID BY ROSTER ID, PER PERSON PER ROLE

select shifts.roster_id, shifts.staff_id AS staff_id, username, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay
from shifts, groups, staff
WHERE shifts.group_id = groups.id
    AND shifts.staff_id = staff.staff_id
GROUP BY shifts.staff_id, shifts.roster_id, username, groups.title, pay_rate
ORDER BY shifts.staff_id;



-- THE BELOW SHOWS HOW MANY HOURS WORKED AND WAGES PER PERSON FOR ROSTER ID 1 (WEEKLY)

select shifts.staff_id, username, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay
from shifts, groups, staff
WHERE shifts.roster_id=1
    AND shifts.group_id = groups.id
    AND shifts.staff_id = staff.staff_id
GROUP BY shifts.staff_id, username, groups.title, pay_rate
ORDER BY shifts.staff_id;




-- THE BELOW SHOWS DAILY WAGES FOR THOSE ON ROSTER 1

select shifts.staff_id, username, groups.title, shift_start_date, pay_rate, SUM((timeslot_to - timeslot_from) / 3600) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600) * pay_rate) AS total_shift_pay
from shifts, groups, staff
WHERE shifts.roster_id=1
    AND shifts.group_id = groups.id
    AND shifts.staff_id = staff.staff_id
GROUP BY shifts.staff_id, username, groups.title, shift_start_date, pay_rate
ORDER BY shifts.staff_id;


ALTER TABLE groups ADD COLUMN "is_active" BOOLEAN DEFAULT TRUE;



-- THE BELOW SHOWS THE HOURS ROSTERED FOR EACH JOB TITLE FOR ROSTER 1...(i.e. 1 WEEK)
select shifts.roster_id, SUM((timeslot_to - timeslot_from) / 3600) AS hours_rostered, groups.title, pay_rate
from shifts, groups
WHERE shifts.roster_id=1
    AND shifts.group_id = groups.id
GROUP BY timeslot_to, shifts.roster_id, groups.title, pay_rate
ORDER BY groups.title;

