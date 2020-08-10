#!/usr/bin/python
# -*- coding: utf-8 -*-

from sqlite3 import Error
import sys
from os import system, name

## Create the database
def create_connection(db_file):
    """ create a database connection to a SQLite database """
    database_connection = None
    try:
        database_connection = sqlite3.connect(db_file)
        print(sqlite3.version)
        return database_connection
    except Error as e:
        print(e)

if __name__ == '__main__':
    #Create a new database called SOAP if not exists
    database_connection = create_connection("./SOAP.db")

    #Get cursor object
    cursor = database_connection.cursor()

    #Execute the scripts
    #Read the sql file provided by the team, SQL.sql in the same directory
    sql_file = open("SQL.sql").read()
    cursor.executescript(sql_file)
#----------------Finished the first tasks of creating tables---------------#

    database_connection.commit()