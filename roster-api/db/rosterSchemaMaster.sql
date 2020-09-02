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

INSERT INTO users(email,password) VALUES ('Blank@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Kaiya@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Keon@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Makena@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Korbin@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Skyler@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Lindsay@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Alejandro@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Khalil@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Alvin@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Porter@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Natalee@geemail.com','password123');
INSERT INTO users(email,password) VALUES ('Allyson@geemail.com','password123');




CREATE TABLE groups
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(40),
    group_duration INTEGER,
    pay_rate NUMERIC(4,2)
);

INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Manager',6,35.5);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Supervisor',4,30);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Chef',4,40);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Pastry Chef',4,27);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Dishwasher',4,17);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Sandwich Artist',3,18);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Bar Tender',4,22);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Cocktail maker',4,28);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Kitchen Hand',3,15);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Waiter',3,19.5);
INSERT INTO groups(title,group_duration,pay_rate) VALUES ('Waitress',3,19.5);



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
    FOREIGN KEY (user_id) REFERENCES users (user_id)

);

INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('KKrueger','Kaiya','Krueger','1 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Great Worker','Kaiya@geemail.com',TRUE,1010101010,1);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('KSoto','Keon','Soto','2 Smith St','Frankston Sth','VIC',3199,'https://api.adorable.io/avatars/285/abott@adorable.png','Works well','Keon@geemail.com',TRUE,1001002000,2);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('MHenson','Makena','Henson','3 Smith St','Mt Eliza','VIC',3930,'https://api.adorable.io/avatars/285/abott@adorable.png','Easy going','Makena@geemail.com',TRUE,1212121212,3);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('KDavidson','Korbin','Davidson','4 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Friendly','Korbin@geemail.com',TRUE,1321321321,4);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('SNicholson','Skyler','Nicholson','5 Smith St','Mornington','VIC',3931,'https://api.adorable.io/avatars/285/abott@adorable.png','Great Worker','Skyler@geemail.com',TRUE,1221122112,5);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('LSellers','Lindsay','Sellers','6 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Works well','Lindsay@geemail.com',TRUE,1234432112,6);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('ANichols','Alejandro','Nichols','7 Smith St','Melbourne','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Easy going','Alejandro@geemail.com',TRUE,1222222222,7);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('KJackson','Khalil','Jackson','8 Smith St','Glen Waverley','VIC',3150,'https://api.adorable.io/avatars/285/abott@adorable.png','Friendly','Khalil@geemail.com',TRUE,1000100000,8);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('AMoody','Alvin','Moody','9 Smith St','Frankston Sth','VIC',3199,'https://api.adorable.io/avatars/285/abott@adorable.png','Great Worker','Alvin@geemail.com',TRUE,1324343220,9);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('PBonilla','Porter','Bonilla','10 Smith St','Mt Eliza','VIC',3930,'https://api.adorable.io/avatars/285/abott@adorable.png','Works well','Porter@geemail.com',TRUE,1555555555,10);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('NBonilla','Natalee','Bonilla','11 Smith St','Essendon','VIC',3040,'https://api.adorable.io/avatars/285/abott@adorable.png','Easy going','Natalee@geemail.com',TRUE,1234565430,11);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('AHarding','Allyson','Harding','12 Smith St','Essendon','VIC',3040,'https://api.adorable.io/avatars/285/abott@adorable.png','Friendly','Allyson@geemail.com',TRUE,1000666660,12);
INSERT INTO staff(username,firstname,lastname,address,city,state,postcode,picture_url,notes,email,is_active,phone_number,user_id) VALUES ('Bblank','Blank','Blank','Blank','Blank','VIC',3000,'https://api.adorable.io/avatars/285/abott@adorable.png','Blank','Blank@geemail.com',TRUE,1000000001,13);

CREATE TABLE stafftogroups (
    staff_member_id INTEGER,
    staff_role_id INTEGER,
    PRIMARY KEY (staff_member_id, staff_role_id),
    FOREIGN KEY (staff_member_id) REFERENCES staff(staff_id),
    FOREIGN KEY (staff_role_id) REFERENCES groups(id)
    
);

INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (1,1);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (1,2);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (1,3);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (2,3);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (2,4);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (3,4);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (3,5);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (4,5);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (5,5);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (6,4);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (6,5);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (7,5);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (7,6);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (7,7);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (8,6);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (9,7);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (10,7);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (10,9);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (10,1);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (10,11);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (11,7);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (11,10);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (12,7);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (12,2);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,1);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,2);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,3);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,4);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,5);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,6);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,7);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,8);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,9);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,10);
INSERT INTO stafftogroups (staff_member_id,staff_role_id) VALUES (13,11);


-- select staff_member_id,  staff_role_id, group_role, group_duration, firstname from stafftogroups, staff, groups  where staff.staff_id = stafftogroups.staff_member_id and groups.group_id = stafftogroups.staff_role_id;


CREATE TABLE publicholidays
(
    phol_id SERIAL PRIMARY KEY,
    phol_state VARCHAR(3) NOT NULL,
    phol_date DATE NOT NULL,
    phol_name VARCHAR(100)
);

INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('na','2000-01-01','N/a');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-03-09','Canberra Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-04-11','Easter Saturday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-04-12','Easter Sunday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-04-27','Declared Public Holiday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-06-01','Reconciliation Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-06-08','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-10-05','Labour Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-12-25','Christmas Day ');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-12-26','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('act','2020-12-28','Boxing Day (additional day)');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-04-11','Easter Saturday - the Saturday following Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-04-12','Easter Sunday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-06-08','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-08-03','Bank Holiday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-10-05','Labour Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-12-25','Christmas Day ');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-12-26','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nsw','2020-12-28','Boxing Day (Additional day)');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-04-11','Easter Saturday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-05-04','May Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-06-08','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-08-03','Picnic Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-12-24','Christmas Eve');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-12-25','Christmas Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-12-28','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('nt','2020-12-31','New Years Eve');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-04-11','The day after Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-04-12','Easter Sunday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-05-04','Labour Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-10-05','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-12-24','Christmas Eve');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-12-25','Christmas Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-12-26','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('qld','2020-12-28','Boxing Day (Additional day)');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-01-26','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-01-27','Australia Day (Additional day)');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-03-09','Adelaide Cup Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-04-11','Easter Saturday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-06-08','Queens Birthday/Volunteers Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-10-05','Labour Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-12-24','Christmas Eve');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-12-25','Christmas Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-12-28','Boxing/Proclamation Day ');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('sa','2020-12-31','New Years Eve');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-03-09','Eight Hours Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-04-14','Easter Tuesday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-06-08','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-12-25','Christmas Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('tas','2020-12-28','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-03-09','Labour Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-04-11','Saturday before Easter Sunday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-04-12','Easter Sunday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-06-08','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-11-03','Melbourne Cup');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-12-25','Christmas Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-12-26','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('vic','2020-12-28','Boxing Day (Additional day)');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-01-01','New Years Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-01-27','Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-03-02','Labour Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-04-10','Good Friday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-04-13','Easter Monday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-04-25','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-04-27','Anzac Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-06-01','Western Australia Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-09-28','Queens Birthday');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-12-25','Christmas Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-12-26','Boxing Day');
INSERT INTO publicholidays(phol_state,phol_date,phol_name) VALUES ('wa','2020-12-28','Boxing Day (Additional day)');


CREATE TABLE roster
(
    roster_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    week_number SERIAL, 
    status VARCHAR(9)
);

INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES('Week1','2020-08-24','2020-08-30',1,'Finalised');
INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES('Week2','2020-08-31','2020-09-06',2,'Finalised');
INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES('Week3','2020-09-07','2020-09-13',3,'Open');
INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES('Week4','2020-09-14','2020-09-20',4,'Open');
INSERT INTO roster(title,start_date,end_date,week_number,status) VALUES('Week5','2020-09-21','2020-09-27',5,'Open');

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

INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598342400000,FALSE,'2020-08-24',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598346000000,1598374800000,FALSE,'2020-08-24',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598418000000,FALSE,'2020-08-25',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598421600000,1598436000000,FALSE,'2020-08-25',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598515200000,FALSE,'2020-08-26',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598518800000,1598547600000,FALSE,'2020-08-26',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598590800000,FALSE,'2020-08-27',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598594400000,1598605200000,FALSE,'2020-08-27',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598673600000,FALSE,'2020-08-28',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598677200000,1598706000000,FALSE,'2020-08-28',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598760000000,FALSE,'2020-08-29',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598763600000,1598785200000,FALSE,'2020-08-29',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598846400000,FALSE,'2020-08-30',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598850000000,1598871600000,FALSE,'2020-08-30',1,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598925600000,FALSE,'2020-08-31',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598929200000,1598943600000,FALSE,'2020-08-31',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599033600000,FALSE,'2020-09-01',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599037200000,1599051600000,FALSE,'2020-09-01',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599102000000,FALSE,'2020-09-02',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599105600000,1599112800000,FALSE,'2020-09-02',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599192000000,FALSE,'2020-09-03',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599195600000,1599202800000,FALSE,'2020-09-03',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599285600000,FALSE,'2020-09-04',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599289200000,1599314400000,FALSE,'2020-09-04',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599375600000,FALSE,'2020-09-05',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599379200000,1599390000000,FALSE,'2020-09-05',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599447600000,FALSE,'2020-09-06',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599451200000,1599462000000,FALSE,'2020-09-06',2,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599548400000,FALSE,'2020-09-07',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599552000000,1599580800000,FALSE,'2020-09-07',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599624000000,FALSE,'2020-09-08',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599627600000,1599631200000,FALSE,'2020-09-08',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599724800000,FALSE,'2020-09-09',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599728400000,1599746400000,FALSE,'2020-09-09',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599807600000,FALSE,'2020-09-10',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599811200000,1599836400000,FALSE,'2020-09-10',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599886800000,FALSE,'2020-09-11',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599890400000,1599897600000,FALSE,'2020-09-11',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599973200000,FALSE,'2020-09-12',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599976800000,1599984000000,FALSE,'2020-09-12',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600045200000,FALSE,'2020-09-13',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600048800000,1600074000000,FALSE,'2020-09-13',3,1,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600138800000,FALSE,'2020-09-14',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600142400000,1600160400000,FALSE,'2020-09-14',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600236000000,FALSE,'2020-09-15',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600239600000,1600243200000,FALSE,'2020-09-15',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600308000000,FALSE,'2020-09-16',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600311600000,1600322400000,FALSE,'2020-09-16',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600405200000,FALSE,'2020-09-17',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600408800000,1600416000000,FALSE,'2020-09-17',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600480800000,FALSE,'2020-09-18',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600484400000,1600513200000,FALSE,'2020-09-18',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600563600000,FALSE,'2020-09-19',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600567200000,1600581600000,FALSE,'2020-09-19',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600671600000,FALSE,'2020-09-20',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600675200000,1600704000000,FALSE,'2020-09-20',4,1,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600747200000,FALSE,'2020-09-21',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600750800000,1600772400000,FALSE,'2020-09-21',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600844400000,FALSE,'2020-09-22',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600848000000,1600862400000,FALSE,'2020-09-22',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600909200000,FALSE,'2020-09-23',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600912800000,1600934400000,FALSE,'2020-09-23',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601017200000,FALSE,'2020-09-24',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601020800000,1601035200000,FALSE,'2020-09-24',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601074800000,1601100000000,FALSE,'2020-09-25',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601103600000,1601132400000,FALSE,'2020-09-25',5,1,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598324400000,FALSE,'2020-08-24',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598328000000,1598353200000,FALSE,'2020-08-24',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598324400000,FALSE,'2020-08-25',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598328000000,1598335200000,FALSE,'2020-08-25',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598407200000,FALSE,'2020-08-26',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598410800000,1598436000000,FALSE,'2020-08-26',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598500800000,FALSE,'2020-08-27',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598504400000,1598515200000,FALSE,'2020-08-27',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598583600000,FALSE,'2020-08-28',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598587200000,1598594400000,FALSE,'2020-08-28',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598662800000,FALSE,'2020-08-29',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598666400000,1598695200000,FALSE,'2020-08-29',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598763600000,FALSE,'2020-08-30',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598767200000,1598770800000,FALSE,'2020-08-30',1,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598842800000,FALSE,'2020-08-31',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598846400000,1598860800000,FALSE,'2020-08-31',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598936400000,FALSE,'2020-09-01',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598940000000,1598950800000,FALSE,'2020-09-01',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599033600000,FALSE,'2020-09-02',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599037200000,1599051600000,FALSE,'2020-09-02',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599116400000,FALSE,'2020-09-03',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599120000000,1599138000000,FALSE,'2020-09-03',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599199200000,FALSE,'2020-09-04',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599202800000,1599224400000,FALSE,'2020-09-04',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599271200000,FALSE,'2020-09-05',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599274800000,1599289200000,FALSE,'2020-09-05',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599379200000,FALSE,'2020-09-06',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599382800000,1599411600000,FALSE,'2020-09-06',2,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599462000000,FALSE,'2020-09-07',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599465600000,1599487200000,FALSE,'2020-09-07',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599552000000,FALSE,'2020-09-08',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599555600000,1599577200000,FALSE,'2020-09-08',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599634800000,FALSE,'2020-09-09',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599638400000,1599660000000,FALSE,'2020-09-09',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599703200000,FALSE,'2020-09-10',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599706800000,1599728400000,FALSE,'2020-09-10',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599811200000,FALSE,'2020-09-11',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599814800000,1599829200000,FALSE,'2020-09-11',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599894000000,FALSE,'2020-09-12',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599897600000,1599908400000,FALSE,'2020-09-12',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599976800000,FALSE,'2020-09-13',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599980400000,1599987600000,FALSE,'2020-09-13',3,2,1,3);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600048800000,FALSE,'2020-09-14',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600052400000,1600081200000,FALSE,'2020-09-14',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600131600000,FALSE,'2020-09-15',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600135200000,1600138800000,FALSE,'2020-09-15',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600243200000,FALSE,'2020-09-16',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600246800000,1600264800000,FALSE,'2020-09-16',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600322400000,FALSE,'2020-09-17',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600326000000,1600333200000,FALSE,'2020-09-17',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600390800000,FALSE,'2020-09-18',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600394400000,1600419600000,FALSE,'2020-09-18',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600488000000,FALSE,'2020-09-19',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600491600000,1600516800000,FALSE,'2020-09-19',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600588800000,FALSE,'2020-09-20',4,2,1,4);






INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600592400000,1600610400000,FALSE,'2020-09-20',4,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600660800000,FALSE,'2020-09-21',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600664400000,1600671600000,FALSE,'2020-09-21',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600758000000,FALSE,'2020-09-22',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600761600000,1600772400000,FALSE,'2020-09-22',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600826400000,FALSE,'2020-09-23',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600830000000,1600837200000,FALSE,'2020-09-23',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600934400000,FALSE,'2020-09-24',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600938000000,1600963200000,FALSE,'2020-09-24',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1600995600000,FALSE,'2020-09-25',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600999200000,1601024400000,FALSE,'2020-09-25',5,2,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598324400000,FALSE,'2020-08-24',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598328000000,1598356800000,FALSE,'2020-08-24',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598320800000,FALSE,'2020-08-25',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598324400000,1598342400000,FALSE,'2020-08-25',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598414400000,FALSE,'2020-08-26',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598418000000,1598428800000,FALSE,'2020-08-26',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598504400000,FALSE,'2020-08-27',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598508000000,1598518800000,FALSE,'2020-08-27',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598587200000,FALSE,'2020-08-28',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598590800000,1598612400000,FALSE,'2020-08-28',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598688000000,FALSE,'2020-08-29',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598691600000,1598713200000,FALSE,'2020-08-29',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598770800000,FALSE,'2020-08-30',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598774400000,1598792400000,FALSE,'2020-08-30',1,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598853600000,FALSE,'2020-08-31',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598857200000,1598871600000,FALSE,'2020-08-31',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598929200000,FALSE,'2020-09-01',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598932800000,1598940000000,FALSE,'2020-09-01',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599015600000,FALSE,'2020-09-02',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599019200000,1599037200000,FALSE,'2020-09-02',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599109200000,FALSE,'2020-09-03',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599112800000,1599127200000,FALSE,'2020-09-03',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599199200000,FALSE,'2020-09-04',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599202800000,1599206400000,FALSE,'2020-09-04',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599285600000,FALSE,'2020-09-05',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599289200000,1599307200000,FALSE,'2020-09-05',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599372000000,FALSE,'2020-09-06',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599375600000,1599393600000,FALSE,'2020-09-06',2,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599454800000,FALSE,'2020-09-07',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599458400000,1599472800000,FALSE,'2020-09-07',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599526800000,FALSE,'2020-09-08',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599530400000,1599534000000,FALSE,'2020-09-08',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599627600000,FALSE,'2020-09-09',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599631200000,1599652800000,FALSE,'2020-09-09',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599717600000,FALSE,'2020-09-10',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599721200000,1599732000000,FALSE,'2020-09-10',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599793200000,FALSE,'2020-09-11',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599796800000,1599814800000,FALSE,'2020-09-11',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599876000000,FALSE,'2020-09-12',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599879600000,1599883200000,FALSE,'2020-09-12',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599962400000,FALSE,'2020-09-13',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599966000000,1599973200000,FALSE,'2020-09-13',3,3,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600059600000,FALSE,'2020-09-14',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600063200000,1600084800000,FALSE,'2020-09-14',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600149600000,FALSE,'2020-09-15',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600153200000,1600178400000,FALSE,'2020-09-15',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600243200000,FALSE,'2020-09-16',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600246800000,1600268400000,FALSE,'2020-09-16',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600311600000,FALSE,'2020-09-17',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600315200000,1600329600000,FALSE,'2020-09-17',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600401600000,FALSE,'2020-09-18',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600405200000,1600434000000,FALSE,'2020-09-18',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600488000000,FALSE,'2020-09-19',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600491600000,1600506000000,FALSE,'2020-09-19',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600563600000,FALSE,'2020-09-20',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600567200000,1600570800000,FALSE,'2020-09-20',4,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600657200000,FALSE,'2020-09-21',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600660800000,1600678800000,FALSE,'2020-09-21',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600736400000,FALSE,'2020-09-22',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600740000000,1600743600000,FALSE,'2020-09-22',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600826400000,FALSE,'2020-09-23',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600830000000,1600844400000,FALSE,'2020-09-23',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600930800000,FALSE,'2020-09-24',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600934400000,1600938000000,FALSE,'2020-09-24',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601017200000,FALSE,'2020-09-25',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601020800000,1601038800000,FALSE,'2020-09-25',5,3,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598320800000,FALSE,'2020-08-24',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598324400000,1598353200000,FALSE,'2020-08-24',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598338800000,FALSE,'2020-08-25',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598342400000,1598371200000,FALSE,'2020-08-25',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598403600000,FALSE,'2020-08-26',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598407200000,1598428800000,FALSE,'2020-08-26',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598490000000,FALSE,'2020-08-27',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598493600000,1598504400000,FALSE,'2020-08-27',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598598000000,FALSE,'2020-08-28',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598601600000,1598616000000,FALSE,'2020-08-28',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598680800000,FALSE,'2020-08-29',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598684400000,1598706000000,FALSE,'2020-08-29',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598749200000,FALSE,'2020-08-30',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598752800000,1598770800000,FALSE,'2020-08-30',1,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598857200000,FALSE,'2020-08-31',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598860800000,1598871600000,FALSE,'2020-08-31',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598940000000,FALSE,'2020-09-01',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598943600000,1598947200000,FALSE,'2020-09-01',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599026400000,FALSE,'2020-09-02',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599030000000,1599058800000,FALSE,'2020-09-02',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599105600000,FALSE,'2020-09-03',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599109200000,1599120000000,FALSE,'2020-09-03',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599199200000,FALSE,'2020-09-04',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599202800000,1599231600000,FALSE,'2020-09-04',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599274800000,FALSE,'2020-09-05',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599278400000,1599285600000,FALSE,'2020-09-05',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599375600000,FALSE,'2020-09-06',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599379200000,1599390000000,FALSE,'2020-09-06',2,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599440400000,FALSE,'2020-09-07',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599444000000,1599469200000,FALSE,'2020-09-07',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599530400000,FALSE,'2020-09-08',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599534000000,1599555600000,FALSE,'2020-09-08',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599624000000,FALSE,'2020-09-09',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599627600000,1599638400000,FALSE,'2020-09-09',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599699600000,FALSE,'2020-09-10',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599703200000,1599710400000,FALSE,'2020-09-10',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599807600000,FALSE,'2020-09-11',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599811200000,1599836400000,FALSE,'2020-09-11',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599872400000,FALSE,'2020-09-12',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599876000000,1599879600000,FALSE,'2020-09-12',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599958800000,FALSE,'2020-09-13',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599962400000,1599973200000,FALSE,'2020-09-13',3,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600063200000,FALSE,'2020-09-14',4,4,1,5);



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600066800000,1600084800000,FALSE,'2020-09-14',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600138800000,FALSE,'2020-09-15',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600142400000,1600149600000,FALSE,'2020-09-15',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600232400000,FALSE,'2020-09-16',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600236000000,1600264800000,FALSE,'2020-09-16',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600322400000,FALSE,'2020-09-17',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600326000000,1600336800000,FALSE,'2020-09-17',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600398000000,FALSE,'2020-09-18',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600401600000,1600426800000,FALSE,'2020-09-18',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600480800000,FALSE,'2020-09-19',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600484400000,1600509600000,FALSE,'2020-09-19',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600563600000,FALSE,'2020-09-20',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600567200000,1600592400000,FALSE,'2020-09-20',4,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600650000000,FALSE,'2020-09-21',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600653600000,1600668000000,FALSE,'2020-09-21',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600736400000,FALSE,'2020-09-22',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600740000000,1600768800000,FALSE,'2020-09-22',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600830000000,FALSE,'2020-09-23',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600833600000,1600851600000,FALSE,'2020-09-23',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600912800000,FALSE,'2020-09-24',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600916400000,1600923600000,FALSE,'2020-09-24',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601006400000,FALSE,'2020-09-25',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601010000000,1601038800000,FALSE,'2020-09-25',5,4,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598335200000,FALSE,'2020-08-24',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598338800000,1598364000000,FALSE,'2020-08-24',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598317200000,FALSE,'2020-08-25',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598320800000,1598328000000,FALSE,'2020-08-25',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598410800000,FALSE,'2020-08-26',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598414400000,1598439600000,FALSE,'2020-08-26',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598490000000,FALSE,'2020-08-27',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598493600000,1598518800000,FALSE,'2020-08-27',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598594400000,FALSE,'2020-08-28',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598598000000,1598623200000,FALSE,'2020-08-28',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598666400000,FALSE,'2020-08-29',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598670000000,1598673600000,FALSE,'2020-08-29',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598760000000,FALSE,'2020-08-30',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598763600000,1598778000000,FALSE,'2020-08-30',1,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598853600000,FALSE,'2020-08-31',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598857200000,1598868000000,FALSE,'2020-08-31',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598922000000,FALSE,'2020-09-01',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598925600000,1598954400000,FALSE,'2020-09-01',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599015600000,FALSE,'2020-09-02',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599019200000,1599044400000,FALSE,'2020-09-02',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599112800000,FALSE,'2020-09-03',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599116400000,1599130800000,FALSE,'2020-09-03',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599206400000,FALSE,'2020-09-04',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599210000000,1599220800000,FALSE,'2020-09-04',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599274800000,FALSE,'2020-09-05',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599278400000,1599282000000,FALSE,'2020-09-05',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599361200000,FALSE,'2020-09-06',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599364800000,1599379200000,FALSE,'2020-09-06',2,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599465600000,FALSE,'2020-09-07',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599469200000,1599498000000,FALSE,'2020-09-07',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599526800000,FALSE,'2020-09-08',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599530400000,1599541200000,FALSE,'2020-09-08',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599638400000,FALSE,'2020-09-09',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599642000000,1599663600000,FALSE,'2020-09-09',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599710400000,FALSE,'2020-09-10',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599714000000,1599735600000,FALSE,'2020-09-10',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599800400000,FALSE,'2020-09-11',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599804000000,1599832800000,FALSE,'2020-09-11',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599876000000,FALSE,'2020-09-12',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599879600000,1599883200000,FALSE,'2020-09-12',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599966000000,FALSE,'2020-09-13',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599969600000,1599998400000,FALSE,'2020-09-13',3,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600045200000,FALSE,'2020-09-14',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600048800000,1600052400000,FALSE,'2020-09-14',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600131600000,FALSE,'2020-09-15',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600135200000,1600138800000,FALSE,'2020-09-15',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600218000000,FALSE,'2020-09-16',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600221600000,1600243200000,FALSE,'2020-09-16',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600304400000,FALSE,'2020-09-17',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600308000000,1600333200000,FALSE,'2020-09-17',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600401600000,FALSE,'2020-09-18',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600405200000,1600430400000,FALSE,'2020-09-18',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600491600000,FALSE,'2020-09-19',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600495200000,1600506000000,FALSE,'2020-09-19',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600578000000,FALSE,'2020-09-20',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600581600000,1600599600000,FALSE,'2020-09-20',4,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600671600000,FALSE,'2020-09-21',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600675200000,1600700400000,FALSE,'2020-09-21',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600761600000,FALSE,'2020-09-22',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600765200000,1600768800000,FALSE,'2020-09-22',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600848000000,FALSE,'2020-09-23',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600851600000,1600873200000,FALSE,'2020-09-23',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600916400000,FALSE,'2020-09-24',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600920000000,1600945200000,FALSE,'2020-09-24',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601017200000,FALSE,'2020-09-25',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601020800000,1601046000000,FALSE,'2020-09-25',5,5,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598317200000,FALSE,'2020-08-24',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598320800000,1598328000000,FALSE,'2020-08-24',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598317200000,FALSE,'2020-08-25',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598320800000,1598346000000,FALSE,'2020-08-25',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598425200000,FALSE,'2020-08-26',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598428800000,1598446800000,FALSE,'2020-08-26',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598508000000,FALSE,'2020-08-27',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598511600000,1598533200000,FALSE,'2020-08-27',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598594400000,FALSE,'2020-08-28',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598598000000,1598623200000,FALSE,'2020-08-28',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598670000000,FALSE,'2020-08-29',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598673600000,1598695200000,FALSE,'2020-08-29',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598756400000,FALSE,'2020-08-30',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598760000000,1598781600000,FALSE,'2020-08-30',1,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598839200000,FALSE,'2020-08-31',2,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598842800000,1598868000000,FALSE,'2020-08-31',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598947200000,FALSE,'2020-09-01',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598950800000,1598954400000,FALSE,'2020-09-01',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599008400000,FALSE,'2020-09-02',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599012000000,1599015600000,FALSE,'2020-09-02',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599105600000,FALSE,'2020-09-03',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599109200000,1599116400000,FALSE,'2020-09-03',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599184800000,FALSE,'2020-09-04',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599188400000,1599195600000,FALSE,'2020-09-04',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599282000000,FALSE,'2020-09-05',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599285600000,1599292800000,FALSE,'2020-09-05',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599368400000,FALSE,'2020-09-06',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599372000000,1599379200000,FALSE,'2020-09-06',2,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599454800000,FALSE,'2020-09-07',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599458400000,1599469200000,FALSE,'2020-09-07',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599534000000,FALSE,'2020-09-08',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599537600000,1599566400000,FALSE,'2020-09-08',3,6,1,4);





INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599620400000,FALSE,'2020-09-09',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599624000000,1599627600000,FALSE,'2020-09-09',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599699600000,FALSE,'2020-09-10',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599703200000,1599706800000,FALSE,'2020-09-10',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599786000000,FALSE,'2020-09-11',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599789600000,1599818400000,FALSE,'2020-09-11',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599894000000,FALSE,'2020-09-12',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599897600000,1599904800000,FALSE,'2020-09-12',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599984000000,FALSE,'2020-09-13',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599987600000,1599998400000,FALSE,'2020-09-13',3,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600059600000,FALSE,'2020-09-14',4,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600063200000,1600088400000,FALSE,'2020-09-14',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600138800000,FALSE,'2020-09-15',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600142400000,1600171200000,FALSE,'2020-09-15',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600232400000,FALSE,'2020-09-16',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600236000000,1600257600000,FALSE,'2020-09-16',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600329600000,FALSE,'2020-09-17',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600333200000,1600358400000,FALSE,'2020-09-17',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600405200000,FALSE,'2020-09-18',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600408800000,1600426800000,FALSE,'2020-09-18',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600495200000,FALSE,'2020-09-19',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600498800000,1600513200000,FALSE,'2020-09-19',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600567200000,FALSE,'2020-09-20',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600570800000,1600592400000,FALSE,'2020-09-20',4,6,1,5);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600657200000,FALSE,'2020-09-21',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600660800000,1600675200000,FALSE,'2020-09-21',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600747200000,FALSE,'2020-09-22',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600750800000,1600761600000,FALSE,'2020-09-22',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600833600000,FALSE,'2020-09-23',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600837200000,1600851600000,FALSE,'2020-09-23',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600927200000,FALSE,'2020-09-24',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600930800000,1600934400000,FALSE,'2020-09-24',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601006400000,FALSE,'2020-09-25',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601010000000,1601031600000,FALSE,'2020-09-25',5,6,1,4);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598342400000,FALSE,'2020-08-24',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598346000000,1598360400000,FALSE,'2020-08-24',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598328000000,FALSE,'2020-08-25',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598331600000,1598335200000,FALSE,'2020-08-25',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598414400000,FALSE,'2020-08-26',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598418000000,1598439600000,FALSE,'2020-08-26',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598511600000,FALSE,'2020-08-27',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598515200000,1598533200000,FALSE,'2020-08-27',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598601600000,FALSE,'2020-08-28',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598605200000,1598626800000,FALSE,'2020-08-28',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598666400000,FALSE,'2020-08-29',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598670000000,1598684400000,FALSE,'2020-08-29',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598763600000,FALSE,'2020-08-30',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598767200000,1598774400000,FALSE,'2020-08-30',1,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598850000000,FALSE,'2020-08-31',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598853600000,1598868000000,FALSE,'2020-08-31',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598943600000,FALSE,'2020-09-01',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598947200000,1598976000000,FALSE,'2020-09-01',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599026400000,FALSE,'2020-09-02',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599030000000,1599037200000,FALSE,'2020-09-02',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599105600000,FALSE,'2020-09-03',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599109200000,1599130800000,FALSE,'2020-09-03',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599188400000,FALSE,'2020-09-04',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599192000000,1599213600000,FALSE,'2020-09-04',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599292800000,FALSE,'2020-09-05',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599296400000,1599321600000,FALSE,'2020-09-05',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599364800000,FALSE,'2020-09-06',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599368400000,1599379200000,FALSE,'2020-09-06',2,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599444000000,FALSE,'2020-09-07',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599447600000,1599462000000,FALSE,'2020-09-07',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599541200000,FALSE,'2020-09-08',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599544800000,1599555600000,FALSE,'2020-09-08',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599624000000,FALSE,'2020-09-09',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599627600000,1599645600000,FALSE,'2020-09-09',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599717600000,FALSE,'2020-09-10',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599721200000,1599742800000,FALSE,'2020-09-10',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599786000000,FALSE,'2020-09-11',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599789600000,1599796800000,FALSE,'2020-09-11',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599872400000,FALSE,'2020-09-12',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599876000000,1599897600000,FALSE,'2020-09-12',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599962400000,FALSE,'2020-09-13',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599966000000,1599987600000,FALSE,'2020-09-13',3,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600052400000,FALSE,'2020-09-14',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600056000000,1600059600000,FALSE,'2020-09-14',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600149600000,FALSE,'2020-09-15',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600153200000,1600156800000,FALSE,'2020-09-15',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600243200000,FALSE,'2020-09-16',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600246800000,1600250400000,FALSE,'2020-09-16',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600308000000,FALSE,'2020-09-17',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600311600000,1600315200000,FALSE,'2020-09-17',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600412400000,FALSE,'2020-09-18',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600416000000,1600441200000,FALSE,'2020-09-18',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600495200000,FALSE,'2020-09-19',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600498800000,1600513200000,FALSE,'2020-09-19',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600578000000,FALSE,'2020-09-20',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600581600000,1600606800000,FALSE,'2020-09-20',4,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600653600000,FALSE,'2020-09-21',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600657200000,1600660800000,FALSE,'2020-09-21',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600736400000,FALSE,'2020-09-22',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600740000000,1600758000000,FALSE,'2020-09-22',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600822800000,FALSE,'2020-09-23',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600826400000,1600833600000,FALSE,'2020-09-23',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600916400000,FALSE,'2020-09-24',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600920000000,1600945200000,FALSE,'2020-09-24',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601002800000,FALSE,'2020-09-25',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601006400000,1601013600000,FALSE,'2020-09-25',5,7,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598324400000,FALSE,'2020-08-24',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598328000000,1598342400000,FALSE,'2020-08-24',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598317200000,FALSE,'2020-08-25',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598320800000,1598338800000,FALSE,'2020-08-25',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598421600000,FALSE,'2020-08-26',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598425200000,1598450400000,FALSE,'2020-08-26',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598493600000,FALSE,'2020-08-27',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598497200000,1598522400000,FALSE,'2020-08-27',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598583600000,FALSE,'2020-08-28',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598587200000,1598590800000,FALSE,'2020-08-28',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598670000000,FALSE,'2020-08-29',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598673600000,1598688000000,FALSE,'2020-08-29',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598774400000,FALSE,'2020-08-30',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598778000000,1598792400000,FALSE,'2020-08-30',1,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598842800000,FALSE,'2020-08-31',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598846400000,1598860800000,FALSE,'2020-08-31',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598925600000,FALSE,'2020-09-01',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598929200000,1598958000000,FALSE,'2020-09-01',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599030000000,FALSE,'2020-09-02',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599033600000,1599062400000,FALSE,'2020-09-02',2,8,1,6);





INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599102000000,FALSE,'2020-09-03',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599105600000,1599123600000,FALSE,'2020-09-03',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599192000000,FALSE,'2020-09-04',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599195600000,1599224400000,FALSE,'2020-09-04',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599289200000,FALSE,'2020-09-05',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599292800000,1599296400000,FALSE,'2020-09-05',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599368400000,FALSE,'2020-09-06',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599372000000,1599400800000,FALSE,'2020-09-06',2,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599465600000,FALSE,'2020-09-07',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599469200000,1599480000000,FALSE,'2020-09-07',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599530400000,FALSE,'2020-09-08',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599534000000,1599548400000,FALSE,'2020-09-08',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599616800000,FALSE,'2020-09-09',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599620400000,1599634800000,FALSE,'2020-09-09',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599721200000,FALSE,'2020-09-10',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599724800000,1599746400000,FALSE,'2020-09-10',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599811200000,FALSE,'2020-09-11',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599814800000,1599832800000,FALSE,'2020-09-11',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599897600000,FALSE,'2020-09-12',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599901200000,1599915600000,FALSE,'2020-09-12',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599966000000,FALSE,'2020-09-13',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599969600000,1599991200000,FALSE,'2020-09-13',3,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600045200000,FALSE,'2020-09-14',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600048800000,1600063200000,FALSE,'2020-09-14',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600149600000,FALSE,'2020-09-15',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600153200000,1600160400000,FALSE,'2020-09-15',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600236000000,FALSE,'2020-09-16',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600239600000,1600246800000,FALSE,'2020-09-16',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600304400000,FALSE,'2020-09-17',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600308000000,1600326000000,FALSE,'2020-09-17',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600416000000,FALSE,'2020-09-18',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600419600000,1600426800000,FALSE,'2020-09-18',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600495200000,FALSE,'2020-09-19',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600498800000,1600506000000,FALSE,'2020-09-19',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600585200000,FALSE,'2020-09-20',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600588800000,1600592400000,FALSE,'2020-09-20',4,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600664400000,FALSE,'2020-09-21',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600668000000,1600686000000,FALSE,'2020-09-21',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600736400000,FALSE,'2020-09-22',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600740000000,1600743600000,FALSE,'2020-09-22',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600826400000,FALSE,'2020-09-23',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600830000000,1600851600000,FALSE,'2020-09-23',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600934400000,FALSE,'2020-09-24',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600938000000,1600956000000,FALSE,'2020-09-24',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1600999200000,FALSE,'2020-09-25',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601002800000,1601006400000,FALSE,'2020-09-25',5,8,1,6);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598324400000,FALSE,'2020-08-24',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598328000000,1598346000000,FALSE,'2020-08-24',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598335200000,FALSE,'2020-08-25',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598338800000,1598356800000,FALSE,'2020-08-25',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598428800000,FALSE,'2020-08-26',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598432400000,1598461200000,FALSE,'2020-08-26',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598500800000,FALSE,'2020-08-27',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598504400000,1598511600000,FALSE,'2020-08-27',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598576400000,FALSE,'2020-08-28',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598580000000,1598590800000,FALSE,'2020-08-28',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598684400000,FALSE,'2020-08-29',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598688000000,1598695200000,FALSE,'2020-08-29',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598760000000,FALSE,'2020-08-30',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598763600000,1598781600000,FALSE,'2020-08-30',1,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598857200000,FALSE,'2020-08-31',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598860800000,1598875200000,FALSE,'2020-08-31',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598943600000,FALSE,'2020-09-01',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598947200000,1598976000000,FALSE,'2020-09-01',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599008400000,FALSE,'2020-09-02',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599012000000,1599022800000,FALSE,'2020-09-02',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599116400000,FALSE,'2020-09-03',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599120000000,1599138000000,FALSE,'2020-09-03',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599184800000,FALSE,'2020-09-04',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599188400000,1599213600000,FALSE,'2020-09-04',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599278400000,FALSE,'2020-09-05',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599282000000,1599303600000,FALSE,'2020-09-05',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599361200000,FALSE,'2020-09-06',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599364800000,1599382800000,FALSE,'2020-09-06',2,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599458400000,FALSE,'2020-09-07',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599462000000,1599487200000,FALSE,'2020-09-07',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599530400000,FALSE,'2020-09-08',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599534000000,1599552000000,FALSE,'2020-09-08',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599638400000,FALSE,'2020-09-09',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599642000000,1599660000000,FALSE,'2020-09-09',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599714000000,FALSE,'2020-09-10',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599717600000,1599724800000,FALSE,'2020-09-10',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599793200000,FALSE,'2020-09-11',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599796800000,1599822000000,FALSE,'2020-09-11',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599894000000,FALSE,'2020-09-12',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599897600000,1599919200000,FALSE,'2020-09-12',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599973200000,FALSE,'2020-09-13',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599976800000,1599991200000,FALSE,'2020-09-13',3,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600056000000,FALSE,'2020-09-14',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600059600000,1600088400000,FALSE,'2020-09-14',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600131600000,FALSE,'2020-09-15',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600135200000,1600153200000,FALSE,'2020-09-15',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600218000000,FALSE,'2020-09-16',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600221600000,1600243200000,FALSE,'2020-09-16',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600315200000,FALSE,'2020-09-17',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600318800000,1600344000000,FALSE,'2020-09-17',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600408800000,FALSE,'2020-09-18',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600412400000,1600430400000,FALSE,'2020-09-18',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600495200000,FALSE,'2020-09-19',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600498800000,1600520400000,FALSE,'2020-09-19',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600563600000,FALSE,'2020-09-20',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600567200000,1600585200000,FALSE,'2020-09-20',4,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600664400000,FALSE,'2020-09-21',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600668000000,1600696800000,FALSE,'2020-09-21',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600740000000,FALSE,'2020-09-22',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600743600000,1600761600000,FALSE,'2020-09-22',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600822800000,FALSE,'2020-09-23',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600826400000,1600840800000,FALSE,'2020-09-23',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600909200000,FALSE,'2020-09-24',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600912800000,1600920000000,FALSE,'2020-09-24',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601013600000,FALSE,'2020-09-25',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601017200000,1601020800000,FALSE,'2020-09-25',5,9,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598328000000,FALSE,'2020-08-24',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598331600000,1598356800000,FALSE,'2020-08-24',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598328000000,FALSE,'2020-08-25',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598331600000,1598346000000,FALSE,'2020-08-25',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598425200000,FALSE,'2020-08-26',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598428800000,1598454000000,FALSE,'2020-08-26',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598497200000,FALSE,'2020-08-27',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598500800000,1598518800000,FALSE,'2020-08-27',1,10,1,7);



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598601600000,FALSE,'2020-08-28',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598605200000,1598619600000,FALSE,'2020-08-28',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598666400000,FALSE,'2020-08-29',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598670000000,1598677200000,FALSE,'2020-08-29',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598756400000,FALSE,'2020-08-30',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598760000000,1598774400000,FALSE,'2020-08-30',1,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598857200000,FALSE,'2020-08-31',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598860800000,1598871600000,FALSE,'2020-08-31',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598940000000,FALSE,'2020-09-01',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598943600000,1598961600000,FALSE,'2020-09-01',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599008400000,FALSE,'2020-09-02',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599012000000,1599022800000,FALSE,'2020-09-02',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599109200000,FALSE,'2020-09-03',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599112800000,1599141600000,FALSE,'2020-09-03',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599181200000,FALSE,'2020-09-04',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599184800000,1599210000000,FALSE,'2020-09-04',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599271200000,FALSE,'2020-09-05',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599274800000,1599278400000,FALSE,'2020-09-05',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599354000000,FALSE,'2020-09-06',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599357600000,1599386400000,FALSE,'2020-09-06',2,10,1,1);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599462000000,FALSE,'2020-09-07',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599465600000,1599494400000,FALSE,'2020-09-07',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599544800000,FALSE,'2020-09-08',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599548400000,1599577200000,FALSE,'2020-09-08',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599627600000,FALSE,'2020-09-09',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599631200000,1599660000000,FALSE,'2020-09-09',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599703200000,FALSE,'2020-09-10',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599706800000,1599721200000,FALSE,'2020-09-10',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599804000000,FALSE,'2020-09-11',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599807600000,1599814800000,FALSE,'2020-09-11',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599886800000,FALSE,'2020-09-12',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599890400000,1599897600000,FALSE,'2020-09-12',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599973200000,FALSE,'2020-09-13',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599976800000,1599994800000,FALSE,'2020-09-13',3,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600063200000,FALSE,'2020-09-14',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600066800000,1600077600000,FALSE,'2020-09-14',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600135200000,FALSE,'2020-09-15',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600138800000,1600160400000,FALSE,'2020-09-15',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600243200000,FALSE,'2020-09-16',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600246800000,1600254000000,FALSE,'2020-09-16',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600315200000,FALSE,'2020-09-17',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600318800000,1600322400000,FALSE,'2020-09-17',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600390800000,FALSE,'2020-09-18',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600394400000,1600412400000,FALSE,'2020-09-18',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600498800000,FALSE,'2020-09-19',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600502400000,1600527600000,FALSE,'2020-09-19',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600567200000,FALSE,'2020-09-20',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600570800000,1600578000000,FALSE,'2020-09-20',4,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600653600000,FALSE,'2020-09-21',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600657200000,1600660800000,FALSE,'2020-09-21',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600761600000,FALSE,'2020-09-22',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600765200000,1600776000000,FALSE,'2020-09-22',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600848000000,FALSE,'2020-09-23',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600851600000,1600876800000,FALSE,'2020-09-23',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600920000000,FALSE,'2020-09-24',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600923600000,1600941600000,FALSE,'2020-09-24',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601006400000,FALSE,'2020-09-25',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601010000000,1601013600000,FALSE,'2020-09-25',5,10,1,7);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598338800000,FALSE,'2020-08-24',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598342400000,1598364000000,FALSE,'2020-08-24',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598317200000,FALSE,'2020-08-25',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598320800000,1598331600000,FALSE,'2020-08-25',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598407200000,FALSE,'2020-08-26',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598410800000,1598436000000,FALSE,'2020-08-26',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598500800000,FALSE,'2020-08-27',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598504400000,1598518800000,FALSE,'2020-08-27',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598576400000,FALSE,'2020-08-28',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598580000000,1598608800000,FALSE,'2020-08-28',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598677200000,FALSE,'2020-08-29',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598680800000,1598706000000,FALSE,'2020-08-29',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598763600000,FALSE,'2020-08-30',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598767200000,1598792400000,FALSE,'2020-08-30',1,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598857200000,FALSE,'2020-08-31',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598860800000,1598864400000,FALSE,'2020-08-31',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598936400000,FALSE,'2020-09-01',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598940000000,1598968800000,FALSE,'2020-09-01',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599008400000,FALSE,'2020-09-02',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599012000000,1599026400000,FALSE,'2020-09-02',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599109200000,FALSE,'2020-09-03',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599112800000,1599127200000,FALSE,'2020-09-03',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599184800000,FALSE,'2020-09-04',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599188400000,1599192000000,FALSE,'2020-09-04',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599274800000,FALSE,'2020-09-05',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599278400000,1599303600000,FALSE,'2020-09-05',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599375600000,FALSE,'2020-09-06',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599379200000,1599404400000,FALSE,'2020-09-06',2,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599465600000,FALSE,'2020-09-07',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599469200000,1599472800000,FALSE,'2020-09-07',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599548400000,FALSE,'2020-09-08',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599552000000,1599577200000,FALSE,'2020-09-08',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599613200000,FALSE,'2020-09-09',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599616800000,1599638400000,FALSE,'2020-09-09',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599710400000,FALSE,'2020-09-10',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599714000000,1599717600000,FALSE,'2020-09-10',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599807600000,FALSE,'2020-09-11',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599811200000,1599840000000,FALSE,'2020-09-11',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599894000000,FALSE,'2020-09-12',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599897600000,1599926400000,FALSE,'2020-09-12',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599969600000,FALSE,'2020-09-13',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599973200000,1599991200000,FALSE,'2020-09-13',3,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600048800000,FALSE,'2020-09-14',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600052400000,1600081200000,FALSE,'2020-09-14',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600156800000,FALSE,'2020-09-15',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600160400000,1600174800000,FALSE,'2020-09-15',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600221600000,FALSE,'2020-09-16',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600225200000,1600243200000,FALSE,'2020-09-16',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600322400000,FALSE,'2020-09-17',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600326000000,1600344000000,FALSE,'2020-09-17',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600405200000,FALSE,'2020-09-18',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600408800000,1600412400000,FALSE,'2020-09-18',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600491600000,FALSE,'2020-09-19',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600495200000,1600506000000,FALSE,'2020-09-19',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600578000000,FALSE,'2020-09-20',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600581600000,1600592400000,FALSE,'2020-09-20',4,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600660800000,FALSE,'2020-09-21',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600664400000,1600678800000,FALSE,'2020-09-21',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600758000000,FALSE,'2020-09-22',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600761600000,1600786800000,FALSE,'2020-09-22',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600822800000,FALSE,'2020-09-23',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600826400000,1600851600000,FALSE,'2020-09-23',5,11,1,10);





INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600930800000,FALSE,'2020-09-24',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600934400000,1600959600000,FALSE,'2020-09-24',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601002800000,FALSE,'2020-09-25',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601006400000,1601028000000,FALSE,'2020-09-25',5,11,1,10);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598342400000,FALSE,'2020-08-24',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598346000000,1598353200000,FALSE,'2020-08-24',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598310000000,1598324400000,FALSE,'2020-08-25',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598328000000,1598353200000,FALSE,'2020-08-25',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598396400000,1598403600000,FALSE,'2020-08-26',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598407200000,1598432400000,FALSE,'2020-08-26',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598482800000,1598504400000,FALSE,'2020-08-27',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598508000000,1598529600000,FALSE,'2020-08-27',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598569200000,1598587200000,FALSE,'2020-08-28',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598590800000,1598605200000,FALSE,'2020-08-28',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598655600000,1598662800000,FALSE,'2020-08-29',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598666400000,1598680800000,FALSE,'2020-08-29',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598742000000,1598767200000,FALSE,'2020-08-30',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598770800000,1598785200000,FALSE,'2020-08-30',1,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598828400000,1598842800000,FALSE,'2020-08-31',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598846400000,1598875200000,FALSE,'2020-08-31',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598914800000,1598929200000,FALSE,'2020-09-01',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1598932800000,1598954400000,FALSE,'2020-09-01',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599001200000,1599019200000,FALSE,'2020-09-02',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599022800000,1599030000000,FALSE,'2020-09-02',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599087600000,1599109200000,FALSE,'2020-09-03',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599112800000,1599138000000,FALSE,'2020-09-03',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599174000000,1599188400000,FALSE,'2020-09-04',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599192000000,1599210000000,FALSE,'2020-09-04',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599260400000,1599282000000,FALSE,'2020-09-05',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599285600000,1599292800000,FALSE,'2020-09-05',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599346800000,1599357600000,FALSE,'2020-09-06',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599361200000,1599368400000,FALSE,'2020-09-06',2,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599433200000,1599454800000,FALSE,'2020-09-07',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599458400000,1599472800000,FALSE,'2020-09-07',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599519600000,1599530400000,FALSE,'2020-09-08',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599534000000,1599559200000,FALSE,'2020-09-08',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599606000000,1599631200000,FALSE,'2020-09-09',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599634800000,1599638400000,FALSE,'2020-09-09',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599692400000,1599703200000,FALSE,'2020-09-10',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599706800000,1599735600000,FALSE,'2020-09-10',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599778800000,1599800400000,FALSE,'2020-09-11',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599804000000,1599814800000,FALSE,'2020-09-11',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599865200000,1599872400000,FALSE,'2020-09-12',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599876000000,1599894000000,FALSE,'2020-09-12',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599951600000,1599973200000,FALSE,'2020-09-13',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1599976800000,1600005600000,FALSE,'2020-09-13',3,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600038000000,1600063200000,FALSE,'2020-09-14',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600066800000,1600070400000,FALSE,'2020-09-14',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600124400000,1600131600000,FALSE,'2020-09-15',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600135200000,1600164000000,FALSE,'2020-09-15',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600210800000,1600218000000,FALSE,'2020-09-16',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600221600000,1600239600000,FALSE,'2020-09-16',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600297200000,1600326000000,FALSE,'2020-09-17',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600329600000,1600354800000,FALSE,'2020-09-17',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600383600000,1600405200000,FALSE,'2020-09-18',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600408800000,1600419600000,FALSE,'2020-09-18',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600470000000,1600480800000,FALSE,'2020-09-19',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600484400000,1600491600000,FALSE,'2020-09-19',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600556400000,1600563600000,FALSE,'2020-09-20',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600567200000,1600588800000,FALSE,'2020-09-20',4,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600642800000,1600664400000,FALSE,'2020-09-21',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600668000000,1600689600000,FALSE,'2020-09-21',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600729200000,1600747200000,FALSE,'2020-09-22',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600750800000,1600768800000,FALSE,'2020-09-22',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600815600000,1600840800000,FALSE,'2020-09-23',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600844400000,1600851600000,FALSE,'2020-09-23',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600902000000,1600912800000,FALSE,'2020-09-24',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600916400000,1600945200000,FALSE,'2020-09-24',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1600988400000,1601013600000,FALSE,'2020-09-25',5,12,1,2);
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id) VALUES  (1601017200000,1601028000000,FALSE,'2020-09-25',5,12,1,2);



CREATE TABLE blank_shifts
(
    blank_shift_id SERIAL PRIMARY KEY NOT NULL,
    timeslot_from VARCHAR(13) NOT NULL,
    timeslot_to VARCHAR(13) NOT NULL,
    isAllocated BOOLEAN DEFAULT 'False' NOT NULL,
    staff_id INTEGER

);

CREATE TABLE blank_roster
(
    blank_roster_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    week_number SERIAL, 
    status VARCHAR(9),
    shift_id INTEGER,
    phol_id INTEGER

);

-- WHAT WERE EACH PERSONS WAGE ON A SPECIFIC DATE?

select shift_start_date, SUM((timeslot_to - timeslot_from) / 3600000) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600000) * pay_rate) AS total_shift_pay, shifts.staff_id, firstname, shifts.group_id, groups.title 
from shifts, groups, staff 
WHERE shift_start_date='2020-08-24' 
AND shifts.group_id = groups.id
AND shifts.staff_id = staff.staff_id
GROUP BY shift_start_date, shifts.staff_id, firstname, shifts.group_id, groups.title;


-- THE BELOW SHOWS THE TOTAL WAGES AMOUNT PAID FOR ROSTER 1...(i.e. 1 WEEK)

select SUM(subq.hours_worked * pay_rate) from (
select SUM((timeslot_to - timeslot_from) / 3600000) AS hours_worked, shifts.staff_id, firstname, groups.title, pay_rate 
from shifts, groups, staff 
WHERE shifts.roster_id=1 
AND shifts.group_id = groups.id
AND shifts.staff_id = staff.staff_id
GROUP BY shifts.staff_id, firstname, groups.title, pay_rate
ORDER BY shifts.staff_id
) as subq;


-- THE BELOW SHOWS HOW MANY HOURS WORKED AND WAGES PER PERSON FOR ROSTER ID 1 (WEEKLY)

select  shifts.staff_id, firstname, groups.title, pay_rate, SUM((timeslot_to - timeslot_from) / 3600000) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600000) * pay_rate) AS total_shift_pay 
from shifts, groups, staff 
WHERE shifts.roster_id=1 
AND shifts.group_id = groups.id
AND shifts.staff_id = staff.staff_id
GROUP BY shifts.staff_id, firstname, groups.title, pay_rate
ORDER BY shifts.staff_id;




-- THE BELOW SHOWS DAILY WAGES FOR THOSE ON ROSTER 1

select  shifts.staff_id, firstname, groups.title, shift_start_date, pay_rate, SUM((timeslot_to - timeslot_from) / 3600000) AS hours_worked, SUM(((timeslot_to - timeslot_from) / 3600000) * pay_rate) AS total_shift_pay 
from shifts, groups, staff 
WHERE shifts.roster_id=1 
AND shifts.group_id = groups.id
AND shifts.staff_id = staff.staff_id
GROUP BY shifts.staff_id, firstname, groups.title, shift_start_date, pay_rate
ORDER BY shifts.staff_id;
