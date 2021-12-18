import mariadb
import sys

# Connect to MariaDB
try:
    conn=mariadb.connect(
        user='Irwin',
        port=3306,
        database='Insurance'
    )

# Get to data in database
cur = conn.cursor()

cur.execute('SELECT POLICY_ID FROM CUSTOMER')

# Prints the data info
for (POLICY_ID) in cur:
    print('Policy ID of Customer is:' {POLICY_ID})