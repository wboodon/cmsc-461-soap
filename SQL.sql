/*
Execute "sqlite3 soap.db" to create the database, then
".read SQL.sql" inside SQLite.

https://stackoverflow.com/questions/11643611/execute-sqlite-script
*/

create table gsaOffice
 (officeName               varchar(20), 
  officeCity                varchar(20), 
  footageManages            numeric(8,2),
  primary key (officeName)
  );

create table managesAgency
 (officeName               varchar(20),
  agencyID                  numeric(8,0),
  primary key (officeName, agencyID)
  );

create table customerAgencies
 (agencyID                 numeric(8,0),
  agencyName                varchar(20),
  agencyAddress             varchar(20) not null,
  agencyCity                varchar(20),
  agencyPhone               numeric(10,0),
  primary key (agencyID)
  );

create table managesAgreements
 (officeName               varchar(20),
  uid                       numeric(8,0),
  primary key (officeName, uid)
  foreign key (officeName) references gsaOffice
    on delete set null
  foreign key (uid) references rentalAgreement
    on delete set null
  );

create table rentalAgreement
 (uid	                    numeric(8,0),
  rentAmount                numeric(10,2),
  endDate                   numeric(8,0),   
  primary key (uid)
  );

create table has
 (agencyID                 numeric(8,0),
  uid                       numeric(8,0),
  primary key (agencyID, uid)
  foreign key (agencyID) references customerAgencies
    on delete set null
  foreign key (uid) references rentalAgreement
    on delete set null
  );
