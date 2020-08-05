/*
The project description says: "bulk load data into tables from csv files,
erase the tables, insert a record into the tables, delete a record from
the tables, and select records from the tables".

The bulk load data into tables is done. 

"Drop table" erases the table, aka done.

We inserted fake info into each table.
 
We technically deleted all the info from the tables with the command we
used, but if you use a where clause and say the data you want to find to
delete we can also do that. We selected to display all info from the
tables. Really unclear if we should be displaying specific things or not.
*/

create table gsaOffice(
officeName               varchar(20), 
officeCity                   varchar(20), 
footageManages       numeric(8,2).
primary key (officeName))
insert into gsaOffice values (‘Red Office’, ’Baltimore’, 6000.00); 
delete from gsaOffice;
drop table gsaOffice;
select  * from gsaOffice;
 
 
 
create table managesAgency(
officeName           varchar(20),
agencyID              numeric(8,0),
primary key (officeName, agencyID))
insert into managesAgency values (‘Yellow Office’, 57342842); 
delete from managesAgency;
drop table managesAgency;
select  *  from managesAgency;
 
 
 
create table customerAgencies(
agencyID              numeric(8,0),
agencyName        varchar(20),
agencyAddress     varchar(20) not null,
agencyCity            varchar(20),
agencyPhone        numeric(10,0))
primary key (agencyID))
insert into customerAgency values (33427742, ‘NSA’, ‘500 Defense Hwy’, ‘Fort Meade’, 4102220000); 
delete from customerAgencies;
drop table customerAgencies;
select  *  from customerAgencies;
 
 
 
create table managesAgreements(
 officeName      varchar(20),
 uid                    numeric(8,0) 
primary key (officeName, uid))
insert into managesAgreements values (‘Purple Office’, 10952642); 
delete from managesAgreements;
drop table managesAgreements;
select  *  from managesAgreements;
 
 
 
 
create table rentalAgreement(
uid	                  numeric(8,0),
rentAmount        numeric(10,2),
endDate              numeric(8,0))      
primary key (uid))
insert into rentalAgreement values (90942642, 3401.75, 12312021); 
delete from rentalAgreement;
drop table rentalAgreement;
select  *  from rentalAgreement;
 
 
 
create table has(
agencyID         numeric(8,0),
uid                    numeric(8,0))
primary key (agencyID, uid))
insert into has values (8842611, 83427611); 
drop table has;
delete from has;
select  *  from has;
