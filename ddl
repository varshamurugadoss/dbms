                                           ======
CREATE TABLE FLIGHT(FLIGHT_ID INTEGER CONSTRAINT FLI_ID_PK PRIMARY KEY,FLIGHT_NAME VARCHAR(10),MODEL VARCHAR(25));

Table created.

 DESC FLIGHT;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                 NOT NULL NUMBER(38)
 FLIGHT_NAME                                        VARCHAR2(10)
 MODEL                                              VARCHAR2(25)

ALTER THE TABLE FLIGHT ADD AVAILABILITY :
=======================================

ALTER TABLE FLIGHT ADD AVAILABILITY NUMBER(3);

Table altered.

SQL> DESC FLIGHT;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                 NOT NULL NUMBER(38)
 FLIGHT_NAME                                        VARCHAR2(10)
 MODEL                                              VARCHAR2(25)
 AVAILABILITY                                       NUMBER(3)

TRUNCATE DATA FROM TABLE FLIGHT:
================================

SQL> select * from flight;

 FLIGHT_ID FLIGHT_NAM MODEL                     AVAILABILITY
---------- ---------- ------------------------- ------------
       401 KINGFISHER XX5                                 60
       402 KINGFISHER XX7                                 70
       403 KINGFISHER XX8                                 80
       404 KINGFISHER XX9                                 90
       405 KINGFISHER XX4                                 40

SQL> truncate table flight;

Table truncated.

SQL> select * from flight;

no rows selected
=====================================================================================
                                        2. SCHEDULE:

1.CREATE A TABLE SCHEDULE WITH SCHEDULE ID AS PRIMARY KEY AND EMPLOYEE ID AS FORIEGN KEY:
=======================================================================================
COMMAND: create table Schedule (schedule_id integer, constraint sch_id_pk primary key(schedule_id),source varchar (20), destination varchar (20), s_date   varchar(10), d_date varchar(10),s_time varchar(10),d_time varchar(10),emp_id number(10));

Table created.


COMMAND: desc Schedule;
Name                                      Null?          Type
 ----------------------------------------- -------- ----------------------------
 SCHEDULE_ID                    NOT NULL                        NUMBER(38)
 SOURCE                                             VARCHAR2(20)
 DESTINATION                                            VARCHAR2(20)
 S_DATE                                             VARCHAR2(10)
 D_DATE                                             VARCHAR2(10)
 S_TIME                                             VARCHAR2(10)
 D_TIME                                             VARCHAR2(10)
 EMP_ID                                             NUMBER(10)


 ALTER THE TABLE SCHEDULE BY ADDING FLIGHT_ID FOREIGN KEY:
=========================================================

SQL>ALTER TABLE SCHEDULE ADD CONSTRAINT FLI_ID_FK FOREIGN KEY(FLIGHT_ID) REFERENCES FLIGHT(FLIGHT_ID);

Table altered.

SQL> DESC SCHEDULE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SCHEDULE_ID                NOT NULL                            NUMBER(38)
 SOURCE                                             VARCHAR2(20)
 DESTINATION                                            VARCHAR2(20)
 S_DATE                                             VARCHAR2(10)
 D_DATE                                             VARCHAR2(10)
 S_TIME                                             VARCHAR2(10)
 D_TIME                                             VARCHAR2(10)
 EMP_ID                                             NUMBER(10)
 FLIGHT_ID                                          NUMBER


=====================================================================================

3. TICKET :
===========
CREATE TABLE  TICKET WITH TICKET ID AS PRIMARY KEY:
===================================================

SQL> create table Ticket (ticket _id varchar (7),amount  varchar (15),date _booking varchar(10),num_ seats varchar (10),pass_ id  varchar(10),book_ id  varchar(10),bill _id varchar(10));

Table created.

COMMAND:  desc Ticket;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TICKET_ID                              NOT NULL   NUMBER(38)
 AMOUNT                                            VARCHAR2(15)
 DATE_BOOKING                                      VARCHAR2(10)
 DATE_CANCEL                                       VARCHAR2(10)
 NUM_SEATS                                         VARCHAR2(10)
 PASS_ID                                           VARCHAR2(10)
 BOOK_ID                                           VARCHAR2(10)
 CANCEL_ID                                         VARCHAR2(10)
 BILL_ID                                           VARCHAR2(10)



 ALTER TABLE FLIGHT TICKET BY ADDING FLIGHT ID AS FOREIGN KEY:
=============================================================

SQL> ALTER TABLE FLIGHT CONSTRAINT FLI_ID_FK FOREIGN KEY(FLIGHT_ID) REFERENCES FLIGHT(FLIGHT_ID);

Table altered.

COMMAND: desc Ticket;

Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TICKET_ID                                 NOT NULL NUMBER(38)
 AMOUNT                                             VARCHAR2(15)
 DATE_BOOKING                                       VARCHAR2(10)
 DATE_CANCEL                                        VARCHAR2(10)
 NUM_SEATS                                          VARCHAR2(10)
 PASS_ID                                            VARCHAR2(10)
 BOOK_ID                                            VARCHAR2(10)
 CANCEL_ID                                          VARCHAR2(10)
 BILL_ID                                            VARCHAR2
 FLIGHT_ID                                                  NUMBER(5




=====================================================================================
                                   3.PASSENGER

CREATE A TABLE PASSENGER WITH PASSENGER ID AS PRIMARY KEY AND REMAINING REQUIRED ATTRIBUTES TO STORE PASSENGER INFORMATION:

SQL> CREATE TABLE PASSENGER(PSG_ID INTEGER CONSTRAINT PSG_ID_pk PRIMARY KEY,
NAME VARCHAR(25) CONSTRAINT psg_name_nn NOT NULL,PSG_PWD INTEGER,STATE VARCHAR(25),CITY VARCHAR(20),FLAT_NO INTEGER,PSG_EMAIL VARCHAR(30),PSG_DOB INTEGER);

Table created.

COMMAND: desc Passenger;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PSG_ID                                    NOT NULL NUMBER(38)
 NAME                                      NOT NULL VARCHAR2(25)
 PSG_PWD                                                     NUMBER(38)
 STATE                                                              VARCHAR2(25)
 CITY                                                                VARCHAR2(20)
 FLAT_NO                                                         NUMBER(38)
 PSG_EMAIL                                                   VARCHAR2(30)
 PSG_DOB                                                       NUMBER(38)

ALTER THE TABLE PASSENGER BY ADDING CHECK CONSTRAINT FOR GENDER:
===============================================================
COMMAND: alter table Passenger add gender varchar(2) check(gender='fm' or gender='m');

Table altered.

COMMAND: desc Passenger;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PSG_ID                                    NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(25)
 PSG_PWD                                            NUMBER(38)
 STATE                                              VARCHAR2(25)
 CITY                                               VARCHAR2(20)
 FLAT_NO                                            NUMBER(38)
 PSG_EMAIL                                          VARCHAR2(30)
 PSG_DOB                                            NUMBER(38)
 GENDER                                             VARCHAR2(2)

ALTER THE TABLE PASSENGER BY MODIFYING THE DATA TYPE OF PSG_PWD AS UNIQUE ATTRIBUTE:

COMMAND: alter table passenger modify psg_pwd integer unique;

Table altered.

SQL> desc passenger;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PSG_ID                                    NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(25)
 PSG_PWD                                            NUMBER(38)
 ADDRESS                                            VARCHAR2(20)
 PSG_EMAIL                                          VARCHAR2(20)
 PSG_DOB                                            DATE
 GENDER                                             VARCHAR2(2)


=====================================================================================
                                        5.EMPLOYEE


CREATE A TABLE EMPLOY WITH EMP ID AS PRIMARY KEY AND REMAINING ATTRIBUTES REQUIRED FOR EMPLOYEE INFORMATION:
===========================================================================================================
SQL> CREATE TABLE EMPLOY(EMP_ID INTEGER CONSTRAINT EMP_ID_pk PRIMARY KEY,NAME VARCHAR(25),EMP_PWD INTEGER,STATE VARCHAR(25),CITY VARCHAR(20),ROLE VARCHAR(25),EMP_EXPERIENCE INTEGER, EMP_SAL INTEGER,EMP_OUALI VARCHAR(25),EMP_EMAIL VARCHAR(30),EMP_MOBILE_NO INTEGER,EMP_ADDR VARCHAR(50),EMP_DOB INTEGER);

Table created.

COMMAND:  desc Employ
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID                                    NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(25)
 EMP_PWD                                            NUMBER(38)
 STATE                                              VARCHAR2(25)
 CITY                                               VARCHAR2(20)
 ROLE                                               VARCHAR2(25)
 EMP_EXPERIENCE                                     NUMBER(38)
 EMP_SAL                                            NUMBER(38)
 EMP_OUALI                                          VARCHAR2(25)
 EMP_EMAIL                                          VARCHAR2(30)
 EMP_MOBILE_NO                                      NUMBER(38)
 EMP_ADDR                                           VARCHAR2(50)
 EMP_DOB                                            NUMBER(38)


ALTER THE TABLE EMPLOY BY ADDING GENDER AS AN ATTRIBUTE:
=======================================================

SQL> alter table Employ add gender varchar(2);

Table altered.

SQL>  desc Employ;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID                                    NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(25)
 EMP_PWD                                            NUMBER(38)
 STATE                                              VARCHAR2(25)
 CITY                                               VARCHAR2(20)
 ROLE                                               VARCHAR2(25)
 EMP_EXPERIENCE                                     NUMBER(38)
 EMP_SAL                                            NUMBER(38)
 EMP_OUALI                                          VARCHAR2(25)
 EMP_EMAIL                                          VARCHAR2(30)
 EMP_MOBILE_NO                                      NUMBER(38)
 EMP_ADDR                                           VARCHAR2(50)
 EMP_DOB                                            NUMBER(38)
 GENDER                                             VARCHAR2(2)

==================================================================================
                                        6.TRAVELS
                                        ==========
CREATE TABLE TRAVELS WITH PASSENGER ID AND FLIGHT ID AS FOREIGN KEY:
====================================================================

SQL> CREATE TABLE TRAVELS(TRA_DATE DATE,PSG_ID INTEGER,FLIGHT_ID INTEGER);

Table created.

SQL> desc travels;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TRA_DATE                                           DATE
 PSG_ID                                             NUMBER(38)
 FLIGHT_ID                                          NUMBER(38)

ALTER THE TABLE BY ADDING NAME AS AN ATTRIBUTE:
===============================================

SQL> alter table travels add name varchar(10);

Table altered.

SQL> desc travels;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TRA_DATE                                           DATE
 PSG_ID                                             NUMBER(38)
 FLIGHT_ID                                          NUMBER(38)
 NAME                                               VARCHAR2(10)

ALTER THE TABLE TRAVELS BY DROPING THE ATTRIBUTE NAME:
======================================================

SQL> alter table travels drop(name);

Table altered.

SQL> desc travels;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TRA_DATE                                           DATE
 PSG_ID                                             NUMBER(38)
 FLIGHT_ID                                        NUMBER(38)

=====================================================================================
                                        7.PAYMENT
                                        ==========
CREATE A TABLE PAYMENT WITH BILL ID AS PRIMARY KEY AND REQUIRED ATTRIBUTES FOR BILL:
===================================================================================

SQL> CREATE TABLE PAYMENT(BILL_ID INTEGER,CONSTRAINT PAY_ID_pk PRIMARY KEY(BILL_ID),PAY_DATE DATE,AMOUNT VARCHAR(20),TRANSACTION_ID INTEGER);

Table created.

COMMAND: desc payment

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BILL_ID                                   NOT NULL NUMBER(38)
 PAY_DATE                                           DATE
 AMOUNT                                             VARCHAR2(20)
 TRANSACTION_ID                               NUMBER(38)


ALTER THE TABLE PAYMENT BY RENAMING A ATTRIBUTE TRANSACTION ID TO TRANS ID:
=========================================================================

SQL> alter table payment rename column transaction_id to trans_id;

Table altered.

SQL> desc payment;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BILL_ID                                   NOT NULL NUMBER(38)
 PAY_DATE                                           DATE
 AMOUNT                                             VARCHAR2(20)
 TRANS_ID                                           NUMBER(38)
 TICKET_ID                                          NUMBER(38)


TRUNCATE DATA FROM TABLE PAYMENT:
================================

SQL> select * from payment;

   BILL_ID PAY_DATE  AMOUNT                 TRANS_ID  TICKET_ID
---------- --------- -------------------- ---------- ----------
       900 22-MAR-23 5000                        600        101
       800 24-MAR-23 13000                       600        103
       500 25-MAR-23 20000                       200        104

SQL> truncate table payment;

Table truncated.

SQL> select * from payment;

no rows selected
=====================================================================================
                                8.TICKET_SEATS

CREATE A TABLE TICKET SEATS WITH ATTRIBUTE TICKET ID:
====================================================

SQL> CREATE TABLE TICKET_SEATS(TICKET_ID INTEGER);

Table created.

SQL> desc ticket_seats;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TICKET_ID                                          NUMBER(38)

ALTER THE TABLE TICKET SEATS BY RENAMING THE COLUMN TICKET ID TO TIC ID:
=======================================================================

SQL> alter table ticket_seats rename column ticket_id to tic_id;

Table altered.

COMMAND: desc ticket_seats;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TIC_ID                                             NUMBER(38)
 SEATS                                     NOT NULL NUMBER(38)

=====================================================================================
                                9.PASSENGER PHNONE NUMBER

CREATE A TABLE PASSENGER PHONE NUMBER WITH PASSENGER ID :
========================================================

SQL> create table passenger_phnno(psg_id integer, psg_phnno number(10));

Table created.

SQL> ALTER TABLE PASSENGER ADD CONSTRAINT pg_phnno_uk UNIQUE(passenger_phnno);

SQL> desc passenger_phnno;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PSG_ID                                             NUMBER(38)
 PSG_PHNNO                                                          NUMBER(10)

=================================================================================
                                10.FLIGHT SCHEDULE

CREATE A TABLE FLIGHT SCHEDULE WITH FLIGHT ID AND SCHEDULE ID:
=============================================================

SQL> create table flight_schedule(flight_id integer, schedule_id number);

Table created.

SQL> desc flight_schedule;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                          NUMBER(38)
 SCHEDULE_ID                                     NUMBER

ALTER THE TABLE FLIGHT SCHEDULE BY ADDING A CONSTRAINT FLIGHT ID AND SCHEDULE ID AS FOREIGN KEY:
===============================================================================================

SQL> ALTER TABLE FLIGHT_SCHEDULE ADD CONSTRAINT FLI_ID_FK FOREIGN KEY(FLIGHT_ID) REFERENCES FLIGHT(FLIGHT_ID);

Table altered.

SQL> DESC FLIGHT_SCHEDULE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                          NUMBER(38)
 SCHEDULE_ID                                        NUMBER

COMMAND: ALTER TABLE FLIGHT_SCHEDULE ADD CONSTRAINT SCH_ID_FK FOREIGN KEY(SCHEDULE_ID) REFERENCES SCHEDULE(SCHEDULE_ID);

Table altered.

SQL> DESC FLIGHT_SCHEDULE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                          NUMBER(38)
 SCHEDULE_ID                                    NUMBER

DROP THE FOREIGN KEY CONSTARINT FROM FLIGHT ID:
==============================================

SQL> ALTER FLIGHT_SCHEDULE DROP CONSTRAINT FLI_ID_FK;

Table altered.

SQL> DESC FLIGHT_SCHEDULE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                          NUMBER(38)
 SCHEDULE_ID                                    NUMBER

===================================================================================

                                11.EMPLOYEE PROVIDES FOOD

CREATE A TABLE PROVIDES WITH FOOD ID AND EMP ID:
==============================================

SQL> create table Provides(food_id integer, emp_id number);

Table created.

COMMAND: desc provides;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                            NUMBER(38)

 EMP_ID                                             NUMBER


ALTER THE TABLE PROVIDES BY ADDING FOOD ID AND EMPLOY ID AS FOREIGN KEY:
========================================================================

SQL> ALTER TABLE PROVIDES ADD CONSTRAINT FO_ID_FK FOREIGN KEY(FOOD_ID) REFERENCES FOOD(FOOD_ID);

Table altered.

COMMAND: DESC PROVIDES;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                            NUMBER(38)
 EMP_ID                                             NUMBER

SQL> ALTER TABLE PROVIDES ADD CONSTRAINT EMPLY_ID_FK FOREIGN KEY(EMP_ID) REFERENCES EMPLOY(EMP_ID);

Table altered.

COMMAND:  DESC PROVIDES;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                            NUMBER(38)
 EMP_ID                                             NUMBER

=====================================================================================

                                12.EMPLOYEE MOBILE NUMBER

CREATE A TABLE EMPLOYEE MOBILE NUMBER WITH EMP ID AND EMP MOBILE NUMBER:
=========================================================================

COMMAND: create table Employee_Mobile_no(emp_mobile_no number(10),emp_id number);

Table created.

COMMAND: desc employee_mobile_no
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_MOBILE_NO                          NUMBER(10)
 EMP_ID                                             NUMBER

ALTER THE TABLE EMPLOYEE MOBILE NO BY ADDING EMP ID AS FOREIGN KEY:
===================================================================

SQL> ALTER TABLE EMPLOYEE_MOBILE_NO ADD CONSTRAINT EMPLOYEE_ID_FK FOREIGN KEY(EMP_ID) REFERENCES EMPLOY(EMP_ID);

Table altered.

SQL> DESC EMPLOYEE_MOBILE_NO;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_MOBILE_NO
 NUMBER(10)
 EMP_ID                                             NUMBER

=====================================================================================
                                                13.FOOD

CREATE A TABLE FOOD WITH FOOD ID AS PRIMARY ID AND REMAINING ATTRIBUTES:
=======================================================================

SQL> create table Food(food_id INTEGER,CONSTRAINT food_id_pk PRIMARY KEY(food_id),dealer_name varchar(10),food_name varchar(10),food_type varchar(2),no_items integer);

Table created.

COMMAND: desc food;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                   NOT NULL NUMBER(38)
 DEALER_NAME                                        VARCHAR2(10)
 FOOD_NAME                                          VARCHAR2(10)
 FOOD_TYPE                                          VARCHAR2(2)
 NO_ITEMS                                           NUMBER(38)

ALTER  THE TABLE FOOD BY ADDING EMP ID AS FOREIGN KEY:
======================================================

COMMAND: ALTER TABLE FOOD ADD CONSTRAINT EMPLOY_ID_FK FOREIGN KEY(EMP_ID) REFERENCES EMPLOY(EMP_ID);

Table altered.

SQL> desc food;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                   NOT NULL NUMBER(38)
 DEALER_NAME                                        VARCHAR2(10)
 FOOD_NAME                                          VARCHAR2(10)
 FOOD_TYPE                                          VARCHAR2(2)
 NO_ITEMS                                           NUMBER(38)
 EMP_ID                                             NUMBER(5)

=====================================================================================
                                14.MANAGES

CREATE A TABLE MANAGES WITH FLIGHT ID AND EMPLOYEE ID:
=====================================================

COMMAND: create table manages(flight_id integer,emp_id integer);
Table created.

COMMAND: DESC MANAGES;

 Name                                                                Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------
 EMP_ID                         NUMBER(38)

 FLIGHT_ID                      NUMBER(38)



 =====================================================================================
DROP  THE TABLE DUMMY:
======================

 COMMAND: DESC DUMMY
        Name                                      Null?    Type
        ----------------------------------------- -------- ----------------------------
        NAME                                             VARCHAR2(10)
        AGE                                                NUMBER(38)

 COMMAND: drop table dummy;

  Table dropped

  COMMAND: desc dummy;
  ERROR:
  ORA-04043: object dummy does not exist
======================================================================================

DISPLAYING OF TABLES:

1.desc passenger;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PSG_ID                                    NOT NULL NUMBER(38)
 NAME                                      NOT NULL VARCHAR2(25)
 PSG_PWD                                            NUMBER(38)
 ADDRESS                                            VARCHAR2(20)
 PSG_EMAIL                                          VARCHAR2(20)
 PSG_DOB                                            DATE
 GENDER                                             VARCHAR2(2)

=====================================================================================
2. desc ticket;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TICKET_ID                                 NOT NULL NUMBER(38)
 AMOUNT                                             VARCHAR2(15)
 DATE_BOOKING                                       DATE
 DATE_CANCEL                                        DATE
 NUM_SEATS                                          VARCHAR2(10)
 BOOK_ID                                            VARCHAR2(10)
 CANCEL_ID                                          VARCHAR2(10)
 FLIGHT_ID                                          NUMBER(38)
 BILL_ID                                            NUMBER(38)
 PSG_ID                                             NUMBER(38)

==================================================================================
3. desc payment;
  Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BILL_ID                                   NOT NULL NUMBER(38)
 PAY_DATE                                           DATE
 AMOUNT                                             VARCHAR2(20)
 TRANS_ID                                           NUMBER(38)
 TICKET_ID                                          NUMBER(38)
=================================================================================
4. desc flight;
  Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                 NOT NULL NUMBER(38)
 FLIGHT_NAME                               NOT NULL VARCHAR2(10)
 MODEL                                              VARCHAR2(25)
 AVAILABILITY                                       NUMBER(3)
=================================================================================
5. desc employ;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID                                    NOT NULL NUMBER(38)
 NAME                                      NOT NULL  VARCHAR2(25)
 EMP_PWD                                            NUMBER(38)
 ROLE                                               VARCHAR2(25)
 EMP_EXPERIENCE                                     NUMBER(38)
 EMP_SAL                                            NUMBER(38)
 EMP_OUALI                                          VARCHAR2(25)
 EMP_EMAIL                                          VARCHAR2(30)
 EMP_MOBILE_NO                                      NUMBER(38)
 EMP_ADDR                                           VARCHAR2(50)
 EMP_DOB                                            DATE
 GENDER                                             VARCHAR2(2)
====================================================================================
6. desc schedule;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SCHEDULE_ID                               NOT NULL NUMBER(38)
 SOURCE                                             VARCHAR2(20)
 DESTINATION                                        VARCHAR2(20)
 S_TIME                                             VARCHAR2(10)
 D_TIME                                             VARCHAR2(10)
 EMP_ID                                             NUMBER(10)
 DATE_DES                                           DATE
 DATE_SOURCE                                        DATE
====================================================================================
7. desc food;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                   NOT NULL NUMBER(38)
 DEALER_NAME                               NOT NULL VARCHAR2(10)
 FOOD_NAME                                          VARCHAR2(10)
 FOOD_TYPE                                          VARCHAR2(2)
 NO_ITEMS                                           NUMBER(38)
=====================================================================================
8. desc ticket_seats;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TIC_ID                                             NUMBER(38)
 SEATS                                     NOT NULL NUMBER(38)
===================================================================================
9. desc provides;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FOOD_ID                                            NUMBER(38)
 EMP_ID                                             NUMBER
=====================================================================================
10. desc manages;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID                                             NUMBER(38)
 FLIGHT_ID                                          NUMBER(38)
====================================================================================
11. desc passenger_phnno;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PSG_ID                                             NUMBER(38)
 PSG_NUM                                            NUMBER(10)
====================================================================================
12. desc flight_schedule;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FLIGHT_ID                                          NUMBER(38)
 SCHEDULE_ID                                        NUMBER
=====================================================================================
13. desc employee_mobile_no;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_MOBILE_NO                                      NUMBER(10)
 EMP_ID                                             NUMBER
======================================================================================
14. desc travels;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TRA_DATE                                           DATE
 PSG_ID                                             NUMBER(38)
 FLIGHT_ID                                          NUMBER(38)
=============================================
