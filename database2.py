#!/usr/bin/python
# -*- coding: utf-8 -*-

import sqlite3 as lite
import sys
from os import system, name

menu_options = """
Menu
----
0) Load data from csv files
1) Erase tables
2) Insert record into table
3) Delete record from table
4) Custom SQL query
5) Quit
"""

table_options = """
Tables
------
0) gsaOffice
1) managesAgency
2) customerAgencies
3) managesAgreements
4) rentalAgreement
5) has
6) go back
"""

def load_csv(cur):
    filename = "gsaOffice.csv"
    data = []
    try:
        # Load data into gsaOffice table
        with open(filename) as f:
            data = f.readlines()
        for entry in data:
            cur.execute("insert into gsaOffice values(" + entry + ");")

        # Load data into managesAgency table
        filename = "managesAgency.csv"
        with open(filename) as f:
            data = f.readlines()
        for entry in data:
            cur.execute("insert into managesAgency values(" + entry + ");")

        # Load data into customerAgencies table
        filename = "customerAgencies.csv"
        with open(filename) as f:
            data = f.readlines()
        for entry in data:
            cur.execute("insert into customerAgencies values(" + entry + ");")

        # Load data into managesAgreements table
        filename = "managesAgreements.csv"
        with open(filename) as f:
            data = f.readlines()
        for entry in data:
            cur.execute("insert into managesAgreements values(" + entry + ");")

        # Load data into rentalAgreement table
        filename = "rentalAgreement.csv"
        with open(filename) as f:
            data = f.readlines()
        for entry in data:
            cur.execute("insert into rentalAgreement values(" + entry + ");")

        # Load data into has table
        filename = "has.csv"
        with open(filename) as f:
            data = f.readlines()
        for entry in data:
            cur.execute("insert into has values(" + entry + ");")
    except:
        print("There was an error loading the csv data into the tables")
    
    print("")

def erase_tables(cur):
    print("Select a table to erase.")
    choice = int(input(table_options))

    tablename = ""
    if choice == 0:
        tablename = "gsaOffice"
    elif choice == 1:
        tablename = "managesAgency"
    elif choice == 2:
        tablename = "customerAgencies"
    elif choice == 3:
        tablename = "managesAgreements"
    elif choice == 4:
        tablename = "rentalAgreement"
    elif choice == 5:
        tablename = "has"
    elif choice != 6:
        print("Invalid input")
    
    try:
        if tablename != "":
            cur.execute("drop table " + tablename + ";")
            print("Table erased.")
    except:
        print("There was an error erasing that table.")
    
    print("")
    

def insert_record(cur):
    print("Select a table to insert into: ")
    choice = int(input(table_options))

    tablename = ""
    if choice == 0:
        tablename = "gsaOffice"
    elif choice == 1:
        tablename = "managesAgency"
    elif choice == 2:
        tablename = "customerAgencies"
    elif choice == 3:
        tablename = "managesAgreements"
    elif choice == 4:
        tablename = "rentalAgreement"
    elif choice == 5:
        tablename = "has"
    elif choice != 6:
        print("Invalid input")

    try:
        if tablename != "":
            cur.execute("select * from " + tablename + ";")
            data = cur.fetchall()
            print("Your table: ")
            for rec in data:
                for field in rec:
                    print(field,"\t",end='')
                print()
            print("Now, enter your insert statement.")
            custom_query(cur)
    except:
        print("There was an error printing that table.")


def delete_record(cur):
    print("Select a table to delete from: ")
    choice = int(input(table_options))

    tablename = ""
    if choice == 0:
        tablename = "gsaOffice"
    elif choice == 1:
        tablename = "managesAgency"
    elif choice == 2:
        tablename = "customerAgencies"
    elif choice == 3:
        tablename = "managesAgreements"
    elif choice == 4:
        tablename = "rentalAgreement"
    elif choice == 5:
        tablename = "has"
    elif choice != 6:
        print("Invalid input")

    try:
        if tablename != "":
            cur.execute("select * from " + tablename + ";")
            data = cur.fetchall()
            print("Your table: ")
            for rec in data:
                for field in rec:
                    print(field,"\t",end='')
                print()
            print("Now, enter your delete statement.")
            custom_query(cur)
    except:
        print("There was an error printing that table.")
    

def custom_query(cur):
    myStmt = input('Enter SQL Statement :')
    if myStmt != "quit":
        cur.execute(myStmt)
        data = cur.fetchall()
        print("The results are: ")
        for rec in data:
            for field in rec:
                print(field,"\t",end='')
            print()
    print()
    myWait = input('Press enter to continue :') 



def main_menu(cur):
    choice = -1
    while choice != 5:
        choice = int(input(menu_options))
        system('cls')
        if choice == 0:
            load_csv(cur)
        elif choice == 1:
            erase_tables(cur)
        elif choice == 2:
            insert_record(cur)
        elif choice == 3:
            delete_record(cur)
        elif choice == 4:
            custom_query(cur)
        elif choice != 5:
            print("Invalid menu option. Please try again.")

    print("Good bye!")


def main():
    con = None
    try:
        con = lite.connect("soap.db")
        cur = con.cursor()
        main_menu(cur)
        con.commit()
        con.close()

    except lite.Error as e:
        print("Error %s:" % e.args[0])
        sys.exit(1)


if __name__ == "__main__":
    main()