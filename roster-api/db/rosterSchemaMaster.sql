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


INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598292000,FALSE,'2020-08-24',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598295600,1598306400,FALSE,'2020-08-24',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598353200,FALSE,'2020-08-25',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598356800,1598378400,FALSE,'2020-08-25',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598464800,FALSE,'2020-08-26',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598468400,1598482800,FALSE,'2020-08-26',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598540400,FALSE,'2020-08-27',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598544000,1598551200,FALSE,'2020-08-27',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598630400,FALSE,'2020-08-28',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598634000,1598655600,FALSE,'2020-08-28',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598716800,FALSE,'2020-08-29',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598720400,1598734800,FALSE,'2020-08-29',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598806800,FALSE,'2020-08-30',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598810400,1598839200,FALSE,'2020-08-30',1,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598875200,FALSE,'2020-08-31',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598878800,1598893200,FALSE,'2020-08-31',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598983200,FALSE,'2020-09-01',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598986800,1598997600,FALSE,'2020-09-01',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599044400,FALSE,'2020-09-02',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599048000,1599066000,FALSE,'2020-09-02',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599141600,FALSE,'2020-09-03',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599145200,1599152400,FALSE,'2020-09-03',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599242400,FALSE,'2020-09-04',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599246000,1599249600,FALSE,'2020-09-04',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599321600,FALSE,'2020-09-05',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599325200,1599343200,FALSE,'2020-09-05',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599404400,FALSE,'2020-09-06',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599408000,1599422400,FALSE,'2020-09-06',2,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599483600,FALSE,'2020-09-07',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599487200,1599501600,FALSE,'2020-09-07',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599580800,FALSE,'2020-09-08',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599584400,1599613200,FALSE,'2020-09-08',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599660000,FALSE,'2020-09-09',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599663600,1599670800,FALSE,'2020-09-09',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599739200,FALSE,'2020-09-10',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599742800,1599746400,FALSE,'2020-09-10',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599843600,FALSE,'2020-09-11',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599847200,1599876000,FALSE,'2020-09-11',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599930000,FALSE,'2020-09-12',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599933600,1599948000,FALSE,'2020-09-12',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600002000,FALSE,'2020-09-13',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600005600,1600009200,FALSE,'2020-09-13',3,1,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600095600,FALSE,'2020-09-14',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600099200,1600120800,FALSE,'2020-09-14',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600174800,FALSE,'2020-09-15',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600178400,1600200000,FALSE,'2020-09-15',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600257600,FALSE,'2020-09-16',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600261200,1600264800,FALSE,'2020-09-16',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600365600,FALSE,'2020-09-17',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600369200,1600376400,FALSE,'2020-09-17',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600437600,FALSE,'2020-09-18',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600441200,1600455600,FALSE,'2020-09-18',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600527600,FALSE,'2020-09-19',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600531200,1600542000,FALSE,'2020-09-19',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600599600,FALSE,'2020-09-20',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600603200,1600632000,FALSE,'2020-09-20',4,1,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600689600,FALSE,'2020-09-21',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600693200,1600707600,FALSE,'2020-09-21',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600776000,FALSE,'2020-09-22',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600779600,1600783200,FALSE,'2020-09-22',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600884000,FALSE,'2020-09-23',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600887600,1600909200,FALSE,'2020-09-23',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600966800,FALSE,'2020-09-24',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600970400,1600974000,FALSE,'2020-09-24',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601056800,FALSE,'2020-09-25',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601060400,1601064000,FALSE,'2020-09-25',5,1,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598277600,FALSE,'2020-08-24',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598281200,1598288400,FALSE,'2020-08-24',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598371200,FALSE,'2020-08-25',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598374800,1598378400,FALSE,'2020-08-25',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598450400,FALSE,'2020-08-26',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598454000,1598482800,FALSE,'2020-08-26',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598526000,FALSE,'2020-08-27',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598529600,1598540400,FALSE,'2020-08-27',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598619600,FALSE,'2020-08-28',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598623200,1598652000,FALSE,'2020-08-28',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598713200,FALSE,'2020-08-29',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598716800,1598727600,FALSE,'2020-08-29',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598810400,FALSE,'2020-08-30',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598814000,1598828400,FALSE,'2020-08-30',1,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598886000,FALSE,'2020-08-31',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598889600,1598893200,FALSE,'2020-08-31',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598965200,FALSE,'2020-09-01',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598968800,1598983200,FALSE,'2020-09-01',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599044400,FALSE,'2020-09-02',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599048000,1599073200,FALSE,'2020-09-02',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599130800,FALSE,'2020-09-03',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599134400,1599138000,FALSE,'2020-09-03',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599224400,FALSE,'2020-09-04',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599228000,1599256800,FALSE,'2020-09-04',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599318000,FALSE,'2020-09-05',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599321600,1599343200,FALSE,'2020-09-05',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599411600,FALSE,'2020-09-06',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599415200,1599426000,FALSE,'2020-09-06',2,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599483600,FALSE,'2020-09-07',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599487200,1599501600,FALSE,'2020-09-07',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599584400,FALSE,'2020-09-08',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599588000,1599591600,FALSE,'2020-09-08',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599652800,FALSE,'2020-09-09',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599656400,1599681600,FALSE,'2020-09-09',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599739200,FALSE,'2020-09-10',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599742800,1599768000,FALSE,'2020-09-10',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599847200,FALSE,'2020-09-11',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599850800,1599865200,FALSE,'2020-09-11',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599922800,FALSE,'2020-09-12',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599926400,1599940800,FALSE,'2020-09-12',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600009200,FALSE,'2020-09-13',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600012800,1600016400,FALSE,'2020-09-13',3,2,1,3,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600084800,FALSE,'2020-09-14',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600088400,1600113600,FALSE,'2020-09-14',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600192800,FALSE,'2020-09-15',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600196400,1600218000,FALSE,'2020-09-15',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600279200,FALSE,'2020-09-16',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600282800,1600290000,FALSE,'2020-09-16',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600340400,FALSE,'2020-09-17',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600344000,1600351200,FALSE,'2020-09-17',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600452000,FALSE,'2020-09-18',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600455600,1600470000,FALSE,'2020-09-18',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600538400,FALSE,'2020-09-19',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600542000,1600563600,FALSE,'2020-09-19',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600617600,FALSE,'2020-09-20',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600621200,1600635600,FALSE,'2020-09-20',4,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600696800,FALSE,'2020-09-21',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600700400,1600725600,FALSE,'2020-09-21',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600783200,FALSE,'2020-09-22',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600786800,1600815600,FALSE,'2020-09-22',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600858800,FALSE,'2020-09-23',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600862400,1600887600,FALSE,'2020-09-23',5,2,1,4,'UnAllocated');



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600963200,FALSE,'2020-09-24',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600966800,1600984800,FALSE,'2020-09-24',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601031600,FALSE,'2020-09-25',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601035200,1601064000,FALSE,'2020-09-25',5,2,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598266800,FALSE,'2020-08-24',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598270400,1598302800,FALSE,'2020-08-24',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598364000,FALSE,'2020-08-25',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598367600,1598378400,FALSE,'2020-08-25',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598439600,FALSE,'2020-08-26',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598443200,1598454000,FALSE,'2020-08-26',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598544000,FALSE,'2020-08-27',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598547600,1598565600,FALSE,'2020-08-27',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598612400,FALSE,'2020-08-28',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598616000,1598626800,FALSE,'2020-08-28',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598706000,FALSE,'2020-08-29',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598709600,1598731200,FALSE,'2020-08-29',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598803200,FALSE,'2020-08-30',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598806800,1598832000,FALSE,'2020-08-30',1,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598893200,FALSE,'2020-08-31',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598896800,1598911200,FALSE,'2020-08-31',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598979600,FALSE,'2020-09-01',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598983200,1599004800,FALSE,'2020-09-01',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599069600,FALSE,'2020-09-02',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599073200,1599084000,FALSE,'2020-09-02',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599145200,FALSE,'2020-09-03',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599148800,1599177600,FALSE,'2020-09-03',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599235200,FALSE,'2020-09-04',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599238800,1599267600,FALSE,'2020-09-04',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599310800,FALSE,'2020-09-05',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599314400,1599343200,FALSE,'2020-09-05',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599404400,FALSE,'2020-09-06',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599408000,1599436800,FALSE,'2020-09-06',2,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599483600,FALSE,'2020-09-07',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599487200,1599501600,FALSE,'2020-09-07',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599588000,FALSE,'2020-09-08',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599591600,1599606000,FALSE,'2020-09-08',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599652800,FALSE,'2020-09-09',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599656400,1599681600,FALSE,'2020-09-09',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599750000,FALSE,'2020-09-10',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599753600,1599778800,FALSE,'2020-09-10',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599836400,FALSE,'2020-09-11',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599840000,1599847200,FALSE,'2020-09-11',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599908400,FALSE,'2020-09-12',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599912000,1599940800,FALSE,'2020-09-12',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600009200,FALSE,'2020-09-13',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600012800,1600030800,FALSE,'2020-09-13',3,3,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600092000,FALSE,'2020-09-14',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600095600,1600113600,FALSE,'2020-09-14',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600178400,FALSE,'2020-09-15',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600182000,1600196400,FALSE,'2020-09-15',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600264800,FALSE,'2020-09-16',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600268400,1600279200,FALSE,'2020-09-16',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600340400,FALSE,'2020-09-17',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600344000,1600358400,FALSE,'2020-09-17',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600452000,FALSE,'2020-09-18',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600455600,1600473600,FALSE,'2020-09-18',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600524000,FALSE,'2020-09-19',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600527600,1600556400,FALSE,'2020-09-19',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600603200,FALSE,'2020-09-20',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600606800,1600614000,FALSE,'2020-09-20',4,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600686000,FALSE,'2020-09-21',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600689600,1600696800,FALSE,'2020-09-21',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600797600,FALSE,'2020-09-22',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600801200,1600808400,FALSE,'2020-09-22',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600880400,FALSE,'2020-09-23',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600884000,1600909200,FALSE,'2020-09-23',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600959600,FALSE,'2020-09-24',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600963200,1600966800,FALSE,'2020-09-24',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601035200,FALSE,'2020-09-25',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601038800,1601060400,FALSE,'2020-09-25',5,3,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598284800,FALSE,'2020-08-24',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598288400,1598310000,FALSE,'2020-08-24',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598356800,FALSE,'2020-08-25',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598360400,1598364000,FALSE,'2020-08-25',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598457600,FALSE,'2020-08-26',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598461200,1598486400,FALSE,'2020-08-26',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598547600,FALSE,'2020-08-27',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598551200,1598562000,FALSE,'2020-08-27',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598612400,FALSE,'2020-08-28',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598616000,1598626800,FALSE,'2020-08-28',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598706000,FALSE,'2020-08-29',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598709600,1598720400,FALSE,'2020-08-29',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598796000,FALSE,'2020-08-30',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598799600,1598803200,FALSE,'2020-08-30',1,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598882400,FALSE,'2020-08-31',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598886000,1598907600,FALSE,'2020-08-31',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598965200,FALSE,'2020-09-01',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598968800,1598972400,FALSE,'2020-09-01',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599048000,FALSE,'2020-09-02',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599051600,1599076800,FALSE,'2020-09-02',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599156000,FALSE,'2020-09-03',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599159600,1599184800,FALSE,'2020-09-03',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599217200,FALSE,'2020-09-04',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599220800,1599228000,FALSE,'2020-09-04',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599303600,FALSE,'2020-09-05',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599307200,1599328800,FALSE,'2020-09-05',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599390000,FALSE,'2020-09-06',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599393600,1599411600,FALSE,'2020-09-06',2,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599483600,FALSE,'2020-09-07',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599487200,1599490800,FALSE,'2020-09-07',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599577200,FALSE,'2020-09-08',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599580800,1599602400,FALSE,'2020-09-08',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599660000,FALSE,'2020-09-09',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599663600,1599670800,FALSE,'2020-09-09',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599760800,FALSE,'2020-09-10',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599764400,1599793200,FALSE,'2020-09-10',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599847200,FALSE,'2020-09-11',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599850800,1599861600,FALSE,'2020-09-11',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599915600,FALSE,'2020-09-12',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599919200,1599948000,FALSE,'2020-09-12',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600002000,FALSE,'2020-09-13',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600005600,1600023600,FALSE,'2020-09-13',3,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600095600,FALSE,'2020-09-14',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600099200,1600113600,FALSE,'2020-09-14',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600189200,FALSE,'2020-09-15',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600192800,1600218000,FALSE,'2020-09-15',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600264800,FALSE,'2020-09-16',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600268400,1600272000,FALSE,'2020-09-16',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600344000,FALSE,'2020-09-17',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600347600,1600369200,FALSE,'2020-09-17',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600434000,FALSE,'2020-09-18',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600437600,1600448400,FALSE,'2020-09-18',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600527600,FALSE,'2020-09-19',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600531200,1600545600,FALSE,'2020-09-19',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600621200,FALSE,'2020-09-20',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600624800,1600646400,FALSE,'2020-09-20',4,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600711200,FALSE,'2020-09-21',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600714800,1600725600,FALSE,'2020-09-21',5,4,1,5,'UnAllocated');



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600790400,FALSE,'2020-09-22',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600794000,1600801200,FALSE,'2020-09-22',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600880400,FALSE,'2020-09-23',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600884000,1600909200,FALSE,'2020-09-23',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600945200,FALSE,'2020-09-24',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600948800,1600970400,FALSE,'2020-09-24',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601038800,FALSE,'2020-09-25',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601042400,1601053200,FALSE,'2020-09-25',5,4,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598284800,FALSE,'2020-08-24',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598288400,1598295600,FALSE,'2020-08-24',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598360400,FALSE,'2020-08-25',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598364000,1598367600,FALSE,'2020-08-25',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598446800,FALSE,'2020-08-26',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598450400,1598457600,FALSE,'2020-08-26',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598544000,FALSE,'2020-08-27',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598547600,1598569200,FALSE,'2020-08-27',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598612400,FALSE,'2020-08-28',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598616000,1598634000,FALSE,'2020-08-28',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598720400,FALSE,'2020-08-29',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598724000,1598745600,FALSE,'2020-08-29',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598788800,FALSE,'2020-08-30',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598792400,1598796000,FALSE,'2020-08-30',1,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598882400,FALSE,'2020-08-31',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598886000,1598911200,FALSE,'2020-08-31',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598972400,FALSE,'2020-09-01',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598976000,1598983200,FALSE,'2020-09-01',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599051600,FALSE,'2020-09-02',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599055200,1599084000,FALSE,'2020-09-02',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599148800,FALSE,'2020-09-03',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599152400,1599181200,FALSE,'2020-09-03',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599220800,FALSE,'2020-09-04',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599224400,1599242400,FALSE,'2020-09-04',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599321600,FALSE,'2020-09-05',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599325200,1599350400,FALSE,'2020-09-05',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599408000,FALSE,'2020-09-06',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599411600,1599426000,FALSE,'2020-09-06',2,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599501600,FALSE,'2020-09-07',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599505200,1599519600,FALSE,'2020-09-07',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599584400,FALSE,'2020-09-08',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599588000,1599613200,FALSE,'2020-09-08',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599649200,FALSE,'2020-09-09',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599652800,1599678000,FALSE,'2020-09-09',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599760800,FALSE,'2020-09-10',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599764400,1599782400,FALSE,'2020-09-10',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599822000,FALSE,'2020-09-11',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599825600,1599854400,FALSE,'2020-09-11',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599915600,FALSE,'2020-09-12',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599919200,1599930000,FALSE,'2020-09-12',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1599994800,FALSE,'2020-09-13',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599998400,1600002000,FALSE,'2020-09-13',3,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600102800,FALSE,'2020-09-14',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600106400,1600120800,FALSE,'2020-09-14',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600178400,FALSE,'2020-09-15',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600182000,1600210800,FALSE,'2020-09-15',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600272000,FALSE,'2020-09-16',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600275600,1600282800,FALSE,'2020-09-16',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600351200,FALSE,'2020-09-17',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600354800,1600380000,FALSE,'2020-09-17',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600452000,FALSE,'2020-09-18',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600455600,1600462800,FALSE,'2020-09-18',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600524000,FALSE,'2020-09-19',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600527600,1600538400,FALSE,'2020-09-19',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600621200,FALSE,'2020-09-20',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600624800,1600653600,FALSE,'2020-09-20',4,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600711200,FALSE,'2020-09-21',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600714800,1600740000,FALSE,'2020-09-21',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600790400,FALSE,'2020-09-22',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600794000,1600822800,FALSE,'2020-09-22',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600869600,FALSE,'2020-09-23',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600873200,1600898400,FALSE,'2020-09-23',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600952400,FALSE,'2020-09-24',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600956000,1600981200,FALSE,'2020-09-24',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601049600,FALSE,'2020-09-25',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601053200,1601082000,FALSE,'2020-09-25',5,5,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598288400,FALSE,'2020-08-24',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598292000,1598320800,FALSE,'2020-08-24',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598367600,FALSE,'2020-08-25',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598371200,1598374800,FALSE,'2020-08-25',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598464800,FALSE,'2020-08-26',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598468400,1598475600,FALSE,'2020-08-26',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598536800,FALSE,'2020-08-27',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598540400,1598565600,FALSE,'2020-08-27',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598616000,FALSE,'2020-08-28',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598619600,1598623200,FALSE,'2020-08-28',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598724000,FALSE,'2020-08-29',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598727600,1598749200,FALSE,'2020-08-29',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598799600,FALSE,'2020-08-30',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598803200,1598806800,FALSE,'2020-08-30',1,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598882400,FALSE,'2020-08-31',2,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598886000,1598907600,FALSE,'2020-08-31',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598972400,FALSE,'2020-09-01',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598976000,1598979600,FALSE,'2020-09-01',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599044400,FALSE,'2020-09-02',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599048000,1599073200,FALSE,'2020-09-02',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599138000,FALSE,'2020-09-03',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599141600,1599152400,FALSE,'2020-09-03',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599224400,FALSE,'2020-09-04',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599228000,1599253200,FALSE,'2020-09-04',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599303600,FALSE,'2020-09-05',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599307200,1599310800,FALSE,'2020-09-05',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599397200,FALSE,'2020-09-06',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599400800,1599415200,FALSE,'2020-09-06',2,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599498000,FALSE,'2020-09-07',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599501600,1599530400,FALSE,'2020-09-07',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599570000,FALSE,'2020-09-08',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599573600,1599595200,FALSE,'2020-09-08',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599674400,FALSE,'2020-09-09',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599678000,1599688800,FALSE,'2020-09-09',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599760800,FALSE,'2020-09-10',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599764400,1599768000,FALSE,'2020-09-10',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599832800,FALSE,'2020-09-11',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599836400,1599858000,FALSE,'2020-09-11',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599912000,FALSE,'2020-09-12',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599915600,1599930000,FALSE,'2020-09-12',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600020000,FALSE,'2020-09-13',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600023600,1600030800,FALSE,'2020-09-13',3,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600081200,FALSE,'2020-09-14',4,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600084800,1600092000,FALSE,'2020-09-14',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600185600,FALSE,'2020-09-15',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600189200,1600192800,FALSE,'2020-09-15',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600264800,FALSE,'2020-09-16',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600268400,1600279200,FALSE,'2020-09-16',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600344000,FALSE,'2020-09-17',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600347600,1600354800,FALSE,'2020-09-17',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600452000,FALSE,'2020-09-18',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600455600,1600480800,FALSE,'2020-09-18',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600534800,FALSE,'2020-09-19',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600538400,1600542000,FALSE,'2020-09-19',4,6,1,5,'UnAllocated');



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600610400,FALSE,'2020-09-20',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600614000,1600624800,FALSE,'2020-09-20',4,6,1,5,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600696800,FALSE,'2020-09-21',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600700400,1600729200,FALSE,'2020-09-21',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600783200,FALSE,'2020-09-22',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600786800,1600801200,FALSE,'2020-09-22',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600862400,FALSE,'2020-09-23',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600866000,1600891200,FALSE,'2020-09-23',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600966800,FALSE,'2020-09-24',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600970400,1600981200,FALSE,'2020-09-24',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601046000,FALSE,'2020-09-25',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601049600,1601078400,FALSE,'2020-09-25',5,6,1,4,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598277600,FALSE,'2020-08-24',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598281200,1598288400,FALSE,'2020-08-24',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598367600,FALSE,'2020-08-25',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598371200,1598385600,FALSE,'2020-08-25',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598457600,FALSE,'2020-08-26',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598461200,1598482800,FALSE,'2020-08-26',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598544000,FALSE,'2020-08-27',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598547600,1598551200,FALSE,'2020-08-27',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598637600,FALSE,'2020-08-28',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598641200,1598659200,FALSE,'2020-08-28',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598716800,FALSE,'2020-08-29',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598720400,1598745600,FALSE,'2020-08-29',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598803200,FALSE,'2020-08-30',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598806800,1598835600,FALSE,'2020-08-30',1,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598893200,FALSE,'2020-08-31',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598896800,1598907600,FALSE,'2020-08-31',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598972400,FALSE,'2020-09-01',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598976000,1598983200,FALSE,'2020-09-01',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599062400,FALSE,'2020-09-02',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599066000,1599073200,FALSE,'2020-09-02',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599141600,FALSE,'2020-09-03',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599145200,1599159600,FALSE,'2020-09-03',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599235200,FALSE,'2020-09-04',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599238800,1599253200,FALSE,'2020-09-04',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599303600,FALSE,'2020-09-05',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599307200,1599321600,FALSE,'2020-09-05',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599400800,FALSE,'2020-09-06',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599404400,1599422400,FALSE,'2020-09-06',2,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599494400,FALSE,'2020-09-07',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599498000,1599512400,FALSE,'2020-09-07',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599588000,FALSE,'2020-09-08',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599591600,1599602400,FALSE,'2020-09-08',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599663600,FALSE,'2020-09-09',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599667200,1599674400,FALSE,'2020-09-09',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599760800,FALSE,'2020-09-10',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599764400,1599778800,FALSE,'2020-09-10',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599840000,FALSE,'2020-09-11',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599843600,1599872400,FALSE,'2020-09-11',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599912000,FALSE,'2020-09-12',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599915600,1599919200,FALSE,'2020-09-12',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1599994800,FALSE,'2020-09-13',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599998400,1600005600,FALSE,'2020-09-13',3,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600081200,FALSE,'2020-09-14',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600084800,1600088400,FALSE,'2020-09-14',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600189200,FALSE,'2020-09-15',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600192800,1600203600,FALSE,'2020-09-15',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600254000,FALSE,'2020-09-16',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600257600,1600286400,FALSE,'2020-09-16',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600351200,FALSE,'2020-09-17',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600354800,1600372800,FALSE,'2020-09-17',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600430400,FALSE,'2020-09-18',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600434000,1600459200,FALSE,'2020-09-18',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600516800,FALSE,'2020-09-19',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600520400,1600527600,FALSE,'2020-09-19',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600610400,FALSE,'2020-09-20',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600614000,1600628400,FALSE,'2020-09-20',4,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600693200,FALSE,'2020-09-21',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600696800,1600725600,FALSE,'2020-09-21',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600790400,FALSE,'2020-09-22',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600794000,1600822800,FALSE,'2020-09-22',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600858800,FALSE,'2020-09-23',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600862400,1600887600,FALSE,'2020-09-23',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600952400,FALSE,'2020-09-24',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600956000,1600959600,FALSE,'2020-09-24',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601049600,FALSE,'2020-09-25',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601053200,1601064000,FALSE,'2020-09-25',5,7,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598292000,FALSE,'2020-08-24',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598295600,1598313600,FALSE,'2020-08-24',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598353200,FALSE,'2020-08-25',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598356800,1598360400,FALSE,'2020-08-25',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598450400,FALSE,'2020-08-26',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598454000,1598472000,FALSE,'2020-08-26',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598536800,FALSE,'2020-08-27',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598540400,1598565600,FALSE,'2020-08-27',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598634000,FALSE,'2020-08-28',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598637600,1598648400,FALSE,'2020-08-28',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598724000,FALSE,'2020-08-29',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598727600,1598731200,FALSE,'2020-08-29',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598792400,FALSE,'2020-08-30',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598796000,1598821200,FALSE,'2020-08-30',1,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598871600,FALSE,'2020-08-31',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598875200,1598889600,FALSE,'2020-08-31',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598983200,FALSE,'2020-09-01',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598986800,1598990400,FALSE,'2020-09-01',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599055200,FALSE,'2020-09-02',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599058800,1599084000,FALSE,'2020-09-02',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599134400,FALSE,'2020-09-03',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599138000,1599159600,FALSE,'2020-09-03',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599242400,FALSE,'2020-09-04',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599246000,1599249600,FALSE,'2020-09-04',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599310800,FALSE,'2020-09-05',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599314400,1599339600,FALSE,'2020-09-05',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599404400,FALSE,'2020-09-06',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599408000,1599415200,FALSE,'2020-09-06',2,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599490800,FALSE,'2020-09-07',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599494400,1599508800,FALSE,'2020-09-07',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599562800,FALSE,'2020-09-08',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599566400,1599580800,FALSE,'2020-09-08',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599656400,FALSE,'2020-09-09',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599660000,1599667200,FALSE,'2020-09-09',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599750000,FALSE,'2020-09-10',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599753600,1599768000,FALSE,'2020-09-10',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599829200,FALSE,'2020-09-11',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599832800,1599850800,FALSE,'2020-09-11',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599930000,FALSE,'2020-09-12',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599933600,1599958800,FALSE,'2020-09-12',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600012800,FALSE,'2020-09-13',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600016400,1600020000,FALSE,'2020-09-13',3,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600088400,FALSE,'2020-09-14',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600092000,1600106400,FALSE,'2020-09-14',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600171200,FALSE,'2020-09-15',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600174800,1600200000,FALSE,'2020-09-15',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600261200,FALSE,'2020-09-16',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600264800,1600275600,FALSE,'2020-09-16',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600365600,FALSE,'2020-09-17',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600369200,1600376400,FALSE,'2020-09-17',4,8,1,6,'UnAllocated');



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600437600,FALSE,'2020-09-18',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600441200,1600444800,FALSE,'2020-09-18',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600520400,FALSE,'2020-09-19',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600524000,1600549200,FALSE,'2020-09-19',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600610400,FALSE,'2020-09-20',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600614000,1600617600,FALSE,'2020-09-20',4,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600711200,FALSE,'2020-09-21',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600714800,1600740000,FALSE,'2020-09-21',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600783200,FALSE,'2020-09-22',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600786800,1600808400,FALSE,'2020-09-22',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600862400,FALSE,'2020-09-23',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600866000,1600876800,FALSE,'2020-09-23',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600966800,FALSE,'2020-09-24',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600970400,1600984800,FALSE,'2020-09-24',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601053200,FALSE,'2020-09-25',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601056800,1601071200,FALSE,'2020-09-25',5,8,1,6,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598266800,FALSE,'2020-08-24',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598270400,1598295600,FALSE,'2020-08-24',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598353200,FALSE,'2020-08-25',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598356800,1598382000,FALSE,'2020-08-25',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598446800,FALSE,'2020-08-26',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598450400,1598464800,FALSE,'2020-08-26',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598540400,FALSE,'2020-08-27',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598544000,1598558400,FALSE,'2020-08-27',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598612400,FALSE,'2020-08-28',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598616000,1598644800,FALSE,'2020-08-28',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598709600,FALSE,'2020-08-29',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598713200,1598742000,FALSE,'2020-08-29',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598796000,FALSE,'2020-08-30',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598799600,1598828400,FALSE,'2020-08-30',1,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598871600,FALSE,'2020-08-31',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598875200,1598904000,FALSE,'2020-08-31',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598965200,FALSE,'2020-09-01',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598968800,1598976000,FALSE,'2020-09-01',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599066000,FALSE,'2020-09-02',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599069600,1599098400,FALSE,'2020-09-02',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599138000,FALSE,'2020-09-03',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599141600,1599152400,FALSE,'2020-09-03',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599242400,FALSE,'2020-09-04',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599246000,1599267600,FALSE,'2020-09-04',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599318000,FALSE,'2020-09-05',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599321600,1599339600,FALSE,'2020-09-05',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599400800,FALSE,'2020-09-06',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599404400,1599426000,FALSE,'2020-09-06',2,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599498000,FALSE,'2020-09-07',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599501600,1599512400,FALSE,'2020-09-07',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599570000,FALSE,'2020-09-08',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599573600,1599580800,FALSE,'2020-09-08',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599670800,FALSE,'2020-09-09',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599674400,1599681600,FALSE,'2020-09-09',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599750000,FALSE,'2020-09-10',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599753600,1599757200,FALSE,'2020-09-10',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599840000,FALSE,'2020-09-11',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599843600,1599858000,FALSE,'2020-09-11',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599912000,FALSE,'2020-09-12',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599915600,1599944400,FALSE,'2020-09-12',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1599998400,FALSE,'2020-09-13',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600002000,1600009200,FALSE,'2020-09-13',3,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600092000,FALSE,'2020-09-14',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600095600,1600106400,FALSE,'2020-09-14',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600182000,FALSE,'2020-09-15',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600185600,1600189200,FALSE,'2020-09-15',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600254000,FALSE,'2020-09-16',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600257600,1600264800,FALSE,'2020-09-16',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600362000,FALSE,'2020-09-17',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600365600,1600383600,FALSE,'2020-09-17',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600444800,FALSE,'2020-09-18',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600448400,1600459200,FALSE,'2020-09-18',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600516800,FALSE,'2020-09-19',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600520400,1600524000,FALSE,'2020-09-19',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600614000,FALSE,'2020-09-20',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600617600,1600639200,FALSE,'2020-09-20',4,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600693200,FALSE,'2020-09-21',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600696800,1600704000,FALSE,'2020-09-21',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600797600,FALSE,'2020-09-22',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600801200,1600812000,FALSE,'2020-09-22',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600858800,FALSE,'2020-09-23',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600862400,1600884000,FALSE,'2020-09-23',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600945200,FALSE,'2020-09-24',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600948800,1600956000,FALSE,'2020-09-24',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601049600,FALSE,'2020-09-25',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601053200,1601071200,FALSE,'2020-09-25',5,9,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598281200,FALSE,'2020-08-24',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598284800,1598310000,FALSE,'2020-08-24',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598364000,FALSE,'2020-08-25',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598367600,1598392800,FALSE,'2020-08-25',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598450400,FALSE,'2020-08-26',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598454000,1598461200,FALSE,'2020-08-26',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598540400,FALSE,'2020-08-27',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598544000,1598562000,FALSE,'2020-08-27',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598630400,FALSE,'2020-08-28',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598634000,1598648400,FALSE,'2020-08-28',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598698800,FALSE,'2020-08-29',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598702400,1598709600,FALSE,'2020-08-29',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598810400,FALSE,'2020-08-30',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598814000,1598828400,FALSE,'2020-08-30',1,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598893200,FALSE,'2020-08-31',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598896800,1598911200,FALSE,'2020-08-31',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598972400,FALSE,'2020-09-01',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598976000,1598986800,FALSE,'2020-09-01',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599044400,FALSE,'2020-09-02',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599048000,1599069600,FALSE,'2020-09-02',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599148800,FALSE,'2020-09-03',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599152400,1599177600,FALSE,'2020-09-03',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599220800,FALSE,'2020-09-04',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599224400,1599238800,FALSE,'2020-09-04',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599318000,FALSE,'2020-09-05',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599321600,1599350400,FALSE,'2020-09-05',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599397200,FALSE,'2020-09-06',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599400800,1599404400,FALSE,'2020-09-06',2,10,1,1,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599490800,FALSE,'2020-09-07',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599494400,1599512400,FALSE,'2020-09-07',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599566400,FALSE,'2020-09-08',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599570000,1599577200,FALSE,'2020-09-08',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599667200,FALSE,'2020-09-09',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599670800,1599674400,FALSE,'2020-09-09',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599757200,FALSE,'2020-09-10',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599760800,1599782400,FALSE,'2020-09-10',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599843600,FALSE,'2020-09-11',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599847200,1599872400,FALSE,'2020-09-11',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599919200,FALSE,'2020-09-12',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599922800,1599926400,FALSE,'2020-09-12',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1599998400,FALSE,'2020-09-13',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600002000,1600030800,FALSE,'2020-09-13',3,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600088400,FALSE,'2020-09-14',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600092000,1600102800,FALSE,'2020-09-14',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600185600,FALSE,'2020-09-15',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600189200,1600196400,FALSE,'2020-09-15',4,10,1,7,'UnAllocated');



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600272000,FALSE,'2020-09-16',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600275600,1600297200,FALSE,'2020-09-16',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600347600,FALSE,'2020-09-17',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600351200,1600358400,FALSE,'2020-09-17',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600448400,FALSE,'2020-09-18',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600452000,1600477200,FALSE,'2020-09-18',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600538400,FALSE,'2020-09-19',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600542000,1600567200,FALSE,'2020-09-19',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600614000,FALSE,'2020-09-20',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600617600,1600624800,FALSE,'2020-09-20',4,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600704000,FALSE,'2020-09-21',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600707600,1600714800,FALSE,'2020-09-21',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600772400,FALSE,'2020-09-22',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600776000,1600804800,FALSE,'2020-09-22',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600869600,FALSE,'2020-09-23',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600873200,1600880400,FALSE,'2020-09-23',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600948800,FALSE,'2020-09-24',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600952400,1600970400,FALSE,'2020-09-24',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601049600,FALSE,'2020-09-25',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601053200,1601074800,FALSE,'2020-09-25',5,10,1,7,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598284800,FALSE,'2020-08-24',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598288400,1598313600,FALSE,'2020-08-24',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598360400,FALSE,'2020-08-25',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598364000,1598378400,FALSE,'2020-08-25',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598439600,FALSE,'2020-08-26',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598443200,1598461200,FALSE,'2020-08-26',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598533200,FALSE,'2020-08-27',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598536800,1598565600,FALSE,'2020-08-27',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598612400,FALSE,'2020-08-28',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598616000,1598619600,FALSE,'2020-08-28',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598716800,FALSE,'2020-08-29',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598720400,1598734800,FALSE,'2020-08-29',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598799600,FALSE,'2020-08-30',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598803200,1598810400,FALSE,'2020-08-30',1,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598896800,FALSE,'2020-08-31',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598900400,1598914800,FALSE,'2020-08-31',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598958000,FALSE,'2020-09-01',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598961600,1598986800,FALSE,'2020-09-01',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599062400,FALSE,'2020-09-02',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599066000,1599080400,FALSE,'2020-09-02',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599130800,FALSE,'2020-09-03',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599134400,1599152400,FALSE,'2020-09-03',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599235200,FALSE,'2020-09-04',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599238800,1599253200,FALSE,'2020-09-04',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599307200,FALSE,'2020-09-05',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599310800,1599325200,FALSE,'2020-09-05',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599390000,FALSE,'2020-09-06',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599393600,1599408000,FALSE,'2020-09-06',2,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599498000,FALSE,'2020-09-07',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599501600,1599516000,FALSE,'2020-09-07',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599584400,FALSE,'2020-09-08',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599588000,1599613200,FALSE,'2020-09-08',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599670800,FALSE,'2020-09-09',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599674400,1599681600,FALSE,'2020-09-09',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599757200,FALSE,'2020-09-10',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599760800,1599775200,FALSE,'2020-09-10',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599847200,FALSE,'2020-09-11',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599850800,1599872400,FALSE,'2020-09-11',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599912000,FALSE,'2020-09-12',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599915600,1599919200,FALSE,'2020-09-12',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1600020000,FALSE,'2020-09-13',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600023600,1600034400,FALSE,'2020-09-13',3,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600099200,FALSE,'2020-09-14',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600102800,1600124400,FALSE,'2020-09-14',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600189200,FALSE,'2020-09-15',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600192800,1600214400,FALSE,'2020-09-15',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600261200,FALSE,'2020-09-16',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600264800,1600286400,FALSE,'2020-09-16',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600347600,FALSE,'2020-09-17',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600351200,1600372800,FALSE,'2020-09-17',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600444800,FALSE,'2020-09-18',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600448400,1600452000,FALSE,'2020-09-18',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600534800,FALSE,'2020-09-19',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600538400,1600556400,FALSE,'2020-09-19',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600621200,FALSE,'2020-09-20',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600624800,1600646400,FALSE,'2020-09-20',4,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600696800,FALSE,'2020-09-21',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600700400,1600729200,FALSE,'2020-09-21',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600776000,FALSE,'2020-09-22',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600779600,1600804800,FALSE,'2020-09-22',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600858800,FALSE,'2020-09-23',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600862400,1600866000,FALSE,'2020-09-23',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600945200,FALSE,'2020-09-24',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600948800,1600974000,FALSE,'2020-09-24',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601056800,FALSE,'2020-09-25',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601060400,1601067600,FALSE,'2020-09-25',5,11,1,10,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598259600,1598266800,FALSE,'2020-08-24',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598270400,1598302800,FALSE,'2020-08-24',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598346000,1598364000,FALSE,'2020-08-25',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598367600,1598396400,FALSE,'2020-08-25',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598432400,1598461200,FALSE,'2020-08-26',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598464800,1598468400,FALSE,'2020-08-26',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598518800,1598533200,FALSE,'2020-08-27',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598536800,1598565600,FALSE,'2020-08-27',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598605200,1598612400,FALSE,'2020-08-28',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598616000,1598641200,FALSE,'2020-08-28',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598691600,1598724000,FALSE,'2020-08-29',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598727600,1598756400,FALSE,'2020-08-29',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598778000,1598788800,FALSE,'2020-08-30',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598792400,1598806800,FALSE,'2020-08-30',1,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598864400,1598875200,FALSE,'2020-08-31',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598878800,1598893200,FALSE,'2020-08-31',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598950800,1598983200,FALSE,'2020-09-01',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1598986800,1598994000,FALSE,'2020-09-01',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599037200,1599069600,FALSE,'2020-09-02',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599073200,1599080400,FALSE,'2020-09-02',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599123600,1599148800,FALSE,'2020-09-03',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599152400,1599177600,FALSE,'2020-09-03',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599210000,1599217200,FALSE,'2020-09-04',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599220800,1599249600,FALSE,'2020-09-04',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599296400,1599321600,FALSE,'2020-09-05',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599325200,1599339600,FALSE,'2020-09-05',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599382800,1599408000,FALSE,'2020-09-06',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599411600,1599433200,FALSE,'2020-09-06',2,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599469200,1599487200,FALSE,'2020-09-07',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599490800,1599494400,FALSE,'2020-09-07',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599555600,1599584400,FALSE,'2020-09-08',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599588000,1599616800,FALSE,'2020-09-08',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599642000,1599649200,FALSE,'2020-09-09',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599652800,1599660000,FALSE,'2020-09-09',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599728400,1599760800,FALSE,'2020-09-10',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599764400,1599793200,FALSE,'2020-09-10',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599814800,1599843600,FALSE,'2020-09-11',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599847200,1599876000,FALSE,'2020-09-11',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599901200,1599915600,FALSE,'2020-09-12',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599919200,1599922800,FALSE,'2020-09-12',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599987600,1599994800,FALSE,'2020-09-13',3,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1599998400,1600012800,FALSE,'2020-09-13',3,12,1,2,'UnAllocated');



INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600074000,1600084800,FALSE,'2020-09-14',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600088400,1600110000,FALSE,'2020-09-14',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600160400,1600174800,FALSE,'2020-09-15',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600178400,1600207200,FALSE,'2020-09-15',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600246800,1600257600,FALSE,'2020-09-16',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600261200,1600264800,FALSE,'2020-09-16',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600333200,1600351200,FALSE,'2020-09-17',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600354800,1600380000,FALSE,'2020-09-17',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600419600,1600452000,FALSE,'2020-09-18',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600455600,1600477200,FALSE,'2020-09-18',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600506000,1600527600,FALSE,'2020-09-19',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600531200,1600542000,FALSE,'2020-09-19',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600592400,1600610400,FALSE,'2020-09-20',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600614000,1600624800,FALSE,'2020-09-20',4,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600678800,1600704000,FALSE,'2020-09-21',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600707600,1600736400,FALSE,'2020-09-21',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600765200,1600772400,FALSE,'2020-09-22',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600776000,1600779600,FALSE,'2020-09-22',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600851600,1600858800,FALSE,'2020-09-23',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600862400,1600869600,FALSE,'2020-09-23',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600938000,1600948800,FALSE,'2020-09-24',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1600952400,1600963200,FALSE,'2020-09-24',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601024400,1601038800,FALSE,'2020-09-25',5,12,1,2,'UnAllocated');
INSERT INTO shifts(timeslot_from,timeslot_to,isAllocated,shift_start_date,roster_id,staff_id,phol_id,group_id,title) VALUES  (1601042400,1601053200,FALSE,'2020-09-25',5,12,1,2,'UnAllocated');




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
