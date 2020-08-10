/*
cat SQL.sql | sqlite3 soap.db
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
