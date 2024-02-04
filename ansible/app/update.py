import sys
import psycopg2

try:
    connection = psycopg2.connect(user="postgres", 
                                password="secret",
                                host="db",
                                port = "5432",
                                database="hit_counter")
except Exception as err:
    print(f"Unexpected {err=}, {type(err)=}")
    sys.exit(1)
    
print("Got connection to database waiting for input of nc command")
with connection as conn:
    for line in sys.stdin:     
        try:
            with conn.cursor() as curs:
                curs.execute("SELECT hits FROM hit_count WHERE id = 1;")
                hits = curs.fetchone()[0]
                print (f"Current hit count in database {hits}")
                hits = hits + 1
                SQLCOMMAND=f"UPDATE hit_count SET hits='{hits}' WHERE id=1"
                curs.execute(SQLCOMMAND)
                print(f"Database updated with value {hits} for hit count")
        except Exception as err:
            print(f"Unexpected {err=}, {type(err)=}")
            sys.exit(1)
        