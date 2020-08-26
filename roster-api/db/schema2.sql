-- These commands create the required database for our Roster App

-- drop database if it exits
drop database roster2;


-- create the database;
create database roster2;

-- connect to the database. Note: you need to on the cli psql
\c roster2;

-- now create the main tables.

-- THIS TABLE CREATES THE USERS THAT WILL LOGIN IN
CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    UNIQUE (email)

);

INSERT INTO users (email, password) VALUES ('gj@gj.com', 'password123');
INSERT INTO users
    (email, password)
VALUES
    ('aj@gj.com', 'password123');
INSERT INTO users
    (email, password)
VALUES
    ('bj@gj.com', 'password123');
INSERT INTO users
    (email, password)
VALUES
    ('cj@gj.com', 'password123');
INSERT INTO users
    (email, password)
VALUES
    ('dj@gj.com', 'password123');
INSERT INTO users
    (email, password)
VALUES
    ('ej@gj.com', 'password123');
INSERT INTO users
    (email, password)
VALUES
    ('fj@gj.com', 'password123');



CREATE TABLE groups
(
    group_id SERIAL PRIMARY KEY,
    group_role VARCHAR(40)
);

INSERT INTO groups (staff_role) VALUES ('Manager');
INSERT INTO groups (staff_role) VALUES ('Supervisor');
INSERT INTO groups (staff_role) VALUES ('Chef');
INSERT INTO groups (staff_role) VALUES ('Pastry Chef');
INSERT INTO groups (staff_role) VALUES ('Dishwasher');
INSERT INTO groups (staff_role) VALUES ('Sandwich Artist');
INSERT INTO groups (staff_role) VALUES ('Bar Tender');
INSERT INTO groups (staff_role) VALUES ('Cocktail maker');
INSERT INTO groups (staff_role) VALUES ('Kitchen Hand');
INSERT INTO groups (staff_role) VALUES ('Waiter');
INSERT INTO groups (staff_role) VALUES ('Waitress');

CREATE TABLE stafftogroups (
    staff_to_group_id SERIAL PRIMARY KEY,
    staff_member_id INTEGER,
    staff_role_id INTEGER
    -- PRIMARY KEY (staff_member_id, staff_role_id)
    
);

INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (1, 1);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (1, 2);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (2, 2);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (2, 3);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (3, 3);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (4, 1);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (4, 5);
INSERT INTO stafftogroup (staff_member_id, staff_role_id) VALUES (4, 6);

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
    
    user_id INTEGER,
    group_id INTEGER,
    staff_to_group_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (group_id) REFERENCES groups (group_id),
    FOREIGN KEY (staff_to_group_id) REFERENCES stafftogroup (staff_to_group_id)
    -- FOREIGN KEY (staff_id, staff_role_id) REFERENCES stafftogroup (staff_member_id, staff_role_id)
);

INSERT INTO staff
    (username, firstname, lastname, address, city, state, postcode, picture_url, notes, email,is_active, phone_number, user_id)
VALUES
    ('gj', 'Glen', 'Jones', '1 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker', 'gj@gj.com', true, 0400123456, 1);

INSERT INTO staff
    (username, firstname, lastname, address, city, state, postcode, picture_url, notes, email, is_active, phone_number, user_id)
VALUES
    ('aj', 'Andrew', 'Jones', '2 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker', 'aj@aj.com', true, 0423123456,2);

INSERT INTO staff
    (username, firstname, lastname, address, city, state, postcode, picture_url, notes, email, is_active, phone_number, user_id)
VALUES
    ('bj', 'Ben', 'Jones', '3 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker', 'bj@bj.com', true, 0411123234,3);

INSERT INTO staff
    (username, firstname, lastname, address, city, state, postcode, picture_url, notes, email, is_active , phone_number, user_id)
VALUES
    ('cj', 'Craig', 'Jones', '4 Smith St', 'Melbourne', 'VIC', 3000, 'https://i.pravatar.cc/300', 'Great worker', 'cj@cj.com', false, 0444123111, 4);

-- select staff_member_id,  staff_role_id, firstname, staff_role  from stafftogroup, staff, groups  where staff.staff_id = stafftogroup.staff_member_id and groups.group_id = stafftogroup.staff_role_id;


CREATE TABLE publicholidays
(
    phol_id SERIAL PRIMARY KEY,
    phol_state VARCHAR(3) NOT NULL,
    phol_date DATE NOT NULL,
    phol_name VARCHAR(200)
);

INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('NA', '2020-01-01','Xmas');
INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('VIC', '2020-08-14','Xmas');
INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('VIC', '2020-08-20','Xmas');
INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('VIC', '2020-08-24','Xmas');
INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('VIC', '2020-08-28','Xmas');
INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('VIC', '2020-09-01','Xmas');
INSERT INTO publicHolidays
    (phol_state, phol_date, phol_name)
VALUES
    ('VIC', '2020-09-06','Xmas');



CREATE TABLE shifts
(
    shift_id SERIAL PRIMARY KEY NOT NULL,
    timeslot_from VARCHAR(13) NOT NULL,
    timeslot_to VARCHAR(13) NOT NULL,
    isAllocated BOOLEAN DEFAULT 'False' NOT NULL,
    staff_id INTEGER,
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id)

);

INSERT INTO shifts
    (timeslot_from, timeslot_to, isAllocated,  staff_id)
VALUES
    (1597273200000, 1597276800000, 'false', 1);

INSERT INTO shifts
    (timeslot_from, timeslot_to, isAllocated, staff_id)
VALUES
    (1597280400, 1597291200, 'false', 1);

INSERT INTO shifts
    (timeslot_from, timeslot_to, isAllocated,  staff_id)
VALUES
    (1597359600, 1597384800, 'false', 2);

INSERT INTO shifts
    (timeslot_from, timeslot_to, isAllocated, staff_id)
VALUES
    (1597388400, 1597399200, 'false', 2);


CREATE TABLE roster
(
    roster_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    week_number SERIAL, 
    status VARCHAR(9),
    shift_id INTEGER,
    phol_id INTEGER,
    group_id INTEGER,
    FOREIGN KEY (shift_id) REFERENCES shifts (shift_id),
    FOREIGN KEY (phol_id) REFERENCES publicholidays (phol_id),
    FOREIGN KEY (group_id) REFERENCES groups (group_id)

);



