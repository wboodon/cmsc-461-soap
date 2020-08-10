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
footageManages       numeric(8,2),
primary key (officeName));

create table managesAgency(
officeName           varchar(20),
agencyID              numeric(8,0),
primary key (officeName, agencyID));

create table customerAgencies(
agencyID              numeric(8,0),
agencyName        varchar(20),
agencyAddress     varchar(20) not null,
agencyCity            varchar(20),
agencyPhone        numeric(10,0)),
primary key (agencyID));

create table managesAgreements(
officeName      varchar(20),
uid                    numeric(8,0),
primary key (officeName, uid));

create table rentalAgreement(
uid	                  numeric(8,0),
rentAmount        numeric(10,2),
endDate              numeric(8,0)),   
primary key (uid));

create table has(
agencyID         numeric(8,0),
uid                    numeric(8,0)),
primary key (agencyID, uid));
