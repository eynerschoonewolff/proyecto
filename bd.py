import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="psicologia"
)

mycursor = mydb.cursor(dictionary=True)

def select(sql):
    mycursor.execute(sql)
    return mycursor.fetchall()

def insert(sql, values):
    mycursor.execute(sql, values)

    mydb.commit()

def update(sql):
  mycursor.execute(sql)
  mydb.commit()
