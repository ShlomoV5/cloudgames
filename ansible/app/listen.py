import sys
import psycopg2
import io

try:
    connection = psycopg2.connect(user="postgres", 
                                password="secret",
                                host="db",
                                port = "5432",
                                database="hit_counter")
except Exception as err:
    print(f"Unexpected {err=}, {type(err)=}")
    sys.exit(1)
    
print(f"Got connection to database - reading from standard input")

   
with connection as conn:
    for lineread in sys.stdin:
        print (f"lineread is {lineread}")
        try:
            if lineread and "GET" in lineread:             
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

        