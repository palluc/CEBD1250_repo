#https://stackoverflow.com/questions/35684400/how-to-use-python-3-5-1-with-a-mysql-database

import pymysql
import pymysql.cursors

#conn= pymysql.connect(host='localhost', port=8080, user='root',password='example',db='employees')
conn= pymysql.connect(host='localhost', port=3306, user='root',password='pawsware15!',db='pawsware')
a=conn.cursor()

sql_breed=('LOAD DATA INFILE \'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\breed_labels.csv\' '
          'INTO TABLE breed '
          'FIELDS TERMINATED BY \',\' '
          'ENCLOSED BY \'"\' '
          'LINES TERMINATED BY \'\\n\' '
          'IGNORE 1 ROWS;')
print(sql_breed)

a.execute(sql_breed)
conn.commit()
print('here')
conn.close()


import mysql.connector
from mysql.connector import Error

import csv
import MySQLdb

db = mysql.connector.connect(
    host='localhost',
    database='Local instance MySQL90',
    user='root',
    password='pawswareCREBD1250'
)


cursor = db.cursor()

breed_csv = csv.reader(file('C:\Users\Luciana\CEBD1250\Project\data\breed.csv'))
#view the dataframe

for row in breed_csv:

    cursor.execute("insert into breed(breed_ID, btype, breedname) values(%s, %s, %s)", row )




color_csv = csv.reader(file('color.csv'))
#view the dataframe

for row in color_csv:
    cursor.execute("insert into color(color_ID, colorname) values(%s, %s)", row )




lookup_csv = csv.reader(file('lookup.csv'))
#view the dataframe

for row in lookup_csv:
    cursor.execute("insert into lookup(lookup_code, code, value) values(%s, %s, %s)", row )



#close the connection to the database.
mydb.commit()




cursor.close()

print("Done")

