#! /usr/bin/env python3

import csv
import sys
import psycopg2
from psycopg2 import extras

db_host = sys.argv[-5]  # localhost
db_port = sys.argv[-4]  # 5432
db_name = sys.argv[-3]
db_user = sys.argv[-2]  # postgres
db_password = sys.argv[-1]  # postgres

# names of the csv files which contain the data
user_csv_name = sys.argv[1]
artist_csv_name = sys.argv[2]
festival_csv_name = sys.argv[3]
country_csv_name = sys.argv[4]
ticket_csv_name = sys.argv[5]
playcount_csv_name = sys.argv[6]
festivalgenre_csv_name = sys.argv[7]
friend_csv_name = sys.argv[8]



# ------------------------------------------------------------------------------------------------------------------------------------------


def csv_to_dict(csv_name, delimiter):
    """
    You can call this function to read a csv file into a DictReader.
    Specify the suitable delimiter (either ',' or '\t') depending on the corresponding csv file.
    """
    input_file = csv.DictReader(open(csv_name, 'r', encoding='utf-8'), delimiter=delimiter)
    return input_file


# ------------------------------------------------------------------------------------------------------------------------------------------


# SQL connection
sql_con = psycopg2.connect(host=db_host, port=db_port, database=db_name, user=db_user, password=db_password)
# cursor, for DB operations
cur = sql_con.cursor()

####################### You can define functions to insert the data here #######################

if __name__ == "__main__":
    
    ####################### You can insert the data here directly or by calling the functions you defined #######################

    # commit the changes, this makes the database persistent
    sql_con.commit()

    # close connections
    cur.close()
    sql_con.close()
