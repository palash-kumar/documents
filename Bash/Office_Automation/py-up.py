import cx_Oracle
#import pyodbc 
# DB Start
#cx_Oracle.init_oracle_client(lib_dir=r"/home/maestro/instantclient_21_3")


connection = cx_Oracle.connect(
    user="maximlocal",
    password="maxim1234",
    dsn="114.31.10.244/msoft")

print("Successfully connected to Oracle Database")

cursor = connection.cursor()

# Create a table

#cursor.execute("""
 #   begin
 #      execute immediate 'drop table todoitem';
 #      exception when others then if sqlcode <> -942 then raise; end if;
 #  end;""")

#cursor.execute("""
#    create table todoitem (
#        id number generated always as identity,
#        description varchar2(4000),
#        creation_ts timestamp with time zone default current_timestamp,
#        done number(1,0),
#        primary key (id))""")

# Insert some data

#rows = [ ("Task 1", 0 ),
#         ("Task 2", 0 ),
#         ("Task 3", 1 ),
#         ("Task 4", 0 ),
#         ("Task 5", 1 ) ]

cursor.execute("UPDATE USER_SETTINGS SET SVALUE = 'YES' WHERE SNAME = 'MOB_VERI' AND USER_ID = 6113")
print(cursor.rowcount, "Rows Inserted")

connection.commit()

# Now query the rows back
for row in cursor.execute("select * from USER_SETTINGS WHERE SNAME = 'MOB_VERI' AND USER_ID = 6113"):
    if (row[1]):
        print(row[0], "is done")
    else:
        print(row[0], "is NOT done")
