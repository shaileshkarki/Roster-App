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
    password VARCHAR(20) NOT NULL,
    UNIQUE (email)

);

INSERT INTO users (email, password) VALUES ('gj@gj.com', 'password123');
INSERT INTO users (email, password) VALUES ('aj@gj.com', 'password123');
INSERT INTO users (email, password) VALUES ('bj@gj.com', 'password123');
INSERT INTO users (email, password) VALUES ('cj@gj.com', 'password123');
INSERT INTO users (email, password) VALUES ('dj@gj.com', 'password123');
INSERT INTO users (email, password) VALUES ('ej@gj.com', 'password123');
INSERT INTO users (email, password) VALUES ('fj@gj.com', 'password123');


-- THIS TABLE CREATES THE ROLES THAT WORKERS WILL BE ASSIGNED TO
CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    staff_role VARCHAR(20) 
);

INSERT INTO groups (staff_role) VALUES ('Manager');
INSERT INTO groups (staff_role) VALUES ('Supervisor');
INSERT INTO groups (staff_role) VALUES ('Chef');
INSERT INTO groups (staff_role) VALUES ('Dishwasher');
INSERT INTO groups (staff_role) VALUES ('Therapist');
INSERT INTO groups (staff_role) VALUES ('Magician');

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

    user_id INTEGER,
    group_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users (user_id), 
    FOREIGN KEY (group_id) REFERENCES groups (group_id)
);

INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email,is_active, user_id, group_id) VALUES ('gj', 'Glen', 'Jones', '1 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker','gj@gj.com',true,1,1);

INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active,user_id, group_id) VALUES ('aj', 'Andrew', 'Jones', '2 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker','aj@aj.com',true,2,2);

INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active,user_id, group_id) VALUES ('bj', 'Ben', 'Jones', '3 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker','bj@bj.com',true,3,3);

INSERT INTO staff (username, firstname, lastname, address, city, state, postcode,  picture_url, notes, email, is_active ,user_id, group_id) VALUES ('cj', 'Craig', 'Jones', '4 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker','cj@cj.com',false,4,4);



CREATE TABLE publicHolidays (
    phol_id SERIAL PRIMARY KEY,
    phol_state VARCHAR(3) NOT NULL,
    phol_date DATE NOT NULL
);

INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('NA', '2020-01-01');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-08-14');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-08-20');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-08-24');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-08-28');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-09-01');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-09-06');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('VIC', '2020-09-15');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('NSW', '2020-08-23');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('NSW', '2020-08-29');
INSERT INTO publicHolidays (phol_state, phol_date) VALUES ('NSW', '2020-09-15');



CREATE TABLE shifts(
    shift_id SERIAL PRIMARY KEY NOT NULL,
    state VARCHAR(3) NOT NULL,
    date DATE NOT NULL,
    timeslot_from VARCHAR(13) NOT NULL,
    timeslot_to VARCHAR(13) NOT NULL,
    isAllocated BOOLEAN DEFAULT 'False' NOT NULL, 
    roster_number INTEGER NOT NULL,
    week_ending DATE NOT NULL,
    staff_id INTEGER,
    phol_id INTEGER,

    FOREIGN KEY (staff_id) REFERENCES staff (staff_id), 
    FOREIGN KEY (phol_id) REFERENCES publicHolidays (phol_id)
);

INSERT INTO shifts (state, date, timeslot_from, timeslot_to, isAllocated, roster_number, week_ending, staff_id,phol_id) VALUES ('VIC', '2020-08-13',1597273200000,1597276800000,'false',1,'2020-08-20',1,1);

INSERT INTO shifts (state, date, timeslot_from, timeslot_to, isAllocated, roster_number, week_ending, staff_id,phol_id) VALUES ('VIC', '2020-08-13',1597280400,1597291200,'false',1,'2020-08-20',1,1);

INSERT INTO shifts (state, date, timeslot_from, timeslot_to, isAllocated, roster_number, week_ending, staff_id,phol_id) VALUES ('VIC', '2020-08-14',1597359600,1597384800,'false',1,'2020-08-20',2,1);

INSERT INTO shifts (state, date, timeslot_from, timeslot_to, isAllocated, roster_number, week_ending, staff_id,phol_id) VALUES ('VIC', '2020-08-14', 1597388400,1597399200,'false',1,'2020-08-20',2,1);




