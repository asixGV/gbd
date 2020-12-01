#
# MySQL 8 Shell
#
# This example shows a simple X DevAPI script to work with relational data
#
from mysqlsh import mysqlx # needed in case you run the code outside of the shell
# SQL CREATE TABLE statement
CREATE_TBL = """
CREATE TABLE `supermercat2`.`caixer` (
  `id_caixer` int NOT NULL,
  `dni_caixer` varchar(30) NOT NULL,
  `nom_caixer` char(50) NOT NULL,
  `cognom_caixer` char(50) NOT NULL,
  `ntelf_caixer` char(15) DEFAULT NULL,
  PRIMARY KEY `id` (`id_caixer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
"""
print
# column list, user data structUre
COLUMNS = ['id_caixer', 'dni_caixer', 'nom_caixer', 'cognom_caixer', 'ntelf_caixer']
user_info = {
  'host': 'localhost',
  'port': 33060,
  'user': 'root',
  'password': 'root',
}

print("Resultats taula caixer --> ")
# Get a session (connection)
my_session = mysqlx.get_session(user_info)
# Precautionary drop schema
my_session.drop_schema('supermercat2')
# Create the database (schema)
my_db = my_session.create_schema('supermercat2')
# Execute the SQL statement to create the table
sql_res = my_session.sql(CREATE_TBL).execute()
# Get the table object
my_tbl = my_db.get_table('caixer')
# Insert some rows (data)
my_tbl.insert(COLUMNS).values(4421,'DNI00049', 'Celsius', 'GBD', 761241821).execute()
my_tbl.insert(COLUMNS).values(2,'DNI00002', 'Applé', 'Mogo', 961241821).execute()
my_tbl.insert(COLUMNS).values(59291,'DNI00041', 'Appe', 'Pep', 361241821).execute()
my_tbl.insert(COLUMNS).values(42,'DNI00121', 'GReycat', 'Cent', 42241821).execute()
my_tbl.insert(COLUMNS).values(232,'DNI00031', 'JOom', 'Roma', 31241821).execute()
my_tbl.insert(COLUMNS).values(1231,'DNI00671', 'Pascal', 'Amor', 111241821).execute()


print
# Execute a simple select (SELECT ∗ FROM)
my_res = my_tbl.select(COLUMNS).execute()
# Display the results . Demonstrates how to work with results
# Print the column names followed by the rows
column_names = my_res.get_column_names()
column_count = my_res.get_column_count()
for i in range(0,column_count):
    if i < column_count - 1:
        print "{0}, ".format(column_names[i]),
    else:
        print "{0}".format(column_names[i]),
print
for row in my_res.fetch_all():
    for i in range(0,column_count):
        if i < column_count - 1:
            print "{0}, ".format(row[i]),
        else:
            print "{0}".format(row[i]),
    print


print
print("Canviant el id de la taula amb DNI00049 (= 123) i ensenyant els resultats amb id més alt de 200. --> ")

my_tbl.update().set('id_caixer', '123').where("id_caixer LIKE 4421").execute()
my_res = my_tbl.select(COLUMNS).execute()
my_tbl.delete().where('id_caixer < 200').execute()
my_res = my_tbl.select(COLUMNS).execute()
# Display the results
for row in my_res.fetch_all():
    print row
my_session.drop_schema('supermercat2')
