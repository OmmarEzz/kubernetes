"""
This script runs the application using a development server.
It contains the definition of routes and views for the application.
"""

# Importing Flask from flask repository
from flask import Flask
# Importing redis from Redis and RedisError repositories
from redis import Redis, RedisError
# Importing HTTP-requests object from flask repository
from flask import request
# Importing os and socket objects from Python:3.0 repository
import os
import socket
# Importing PostgreSQL client adapter object from Python:3.0 repository
import psycopg2;

# Creating redis data store object
redis = Redis(host="redis", db=0, socket_connect_timeout=2, socket_timeout=2)
# Creating Flask web application framework object
app = Flask(__name__)

# Make the WSGI interface available at the top level so wfastcgi can get it.
wsgi_app = app.wsgi_app

# Performing default routing
@app.route('/')
def main_empty():
    # Returning string buffer containing the applications web-page being generated
    return "<html><head><script type=\"text/javascript\">function doSearch() { var xhttp = new XMLHttpRequest(); xhttp.onreadystatechange = function() \
        { if (this.readyState == 4 && this.status == 200) { document.getElementById(\"result\").innerHTML = xhttp.responseText; } }; \
        xhttp.open(\"GET\", \"/search?text=\" + document.getElementById(\"query\").value, true); xhttp.send(); } </script></head><body onload=\"doSearch();\"> \
        <table border=\"0\"><tr><td align=\"center\"><b>Docker\'s Indexed Search App v.1.00a</b></td></tr><tr><td><table border=\"0\"><tr><td>Search:</td><td> \
        <input id=\"query\" type=\"text\" onkeyup=\"doSearch();\" onpaste=\"doSearch();\"></td><td><input type=\"submit\" onclick=\"doSearch();\"></td></tr></table> \
        </tr><tr><td><center><p id=\"result\">&nbsp;</p></center></td></tr></table></body></html>";

# Performing /search routing
@app.route('/search')
def search():
    # Getting value of the /search?text=query_string URL-parameter
    search_pattern = request.args.get("text");

    # Connecting to PostgreSQL database server by using PostgreSQL Python client adapter object
    conn=psycopg2.connect(database="phonebook", user="postgres", host="172.17.0.2", password="12345")

    # Getting the initial value of database connection curson
    cursor = conn.cursor()

    pg_query_string = "\0";
    # Performing a check if the search pattern /search?text=query_string is not equal to an empty string
    if search_pattern != "\0":
        # If not, construct a query string based on SQL statement performing the conditional query to
        # get a resulting set of rows that exactly or partially match the given condition
        pg_query_string = """SELECT person_id, person_name, phone FROM public.persons WHERE \
            person_name ILIKE '%""" + search_pattern + """%' OR phone ILIKE '%""" + search_pattern + """%';"""
    # If yes, construct a query string based on SQL statement, fetching all rows from public.person table
    else: pg_query_string = """SELECT person_id, person_name, phone FROM public.persons;""";

    # Executing SQL statement contained in query_string buffer using curson object
    cursor.execute(pg_query_string)

    # Generating html table and its header as the contents of html string buffer
    html = "<table border=\"0\">";
    html += "<tr><th>#</th><th>Person Name</th><th>Phone</th></tr>"

    # Assigning the initial value of row_id counter variable to 0
    row_id = 0
    # Fetching all rows from the query resultant set and assign the array of rows to rows variable
    rows = cursor.fetchall()
    # Iterating through the array of rows
    for row in rows:
        # For each row, generating html table row with column values obtained from the SQL query resultant set
        # Performing a check if the current row_id value is odd (e.g. row_id % 2 != 0)
        # If so, set table row's background style color to `light-grey', otherwise using `white` color
        html += "<tr style=\"background-color:" + \
            ("#eee" if (row_id % 2) != 0 else "#fff") + "\">";
        html += "<td>" + str(row[0]) + "</td>";
        html += "<td>" + row[1]      + "</td>";
        html += "<td>" + row[2]      + "</td></tr>";
        # Incrementing the value of row_id counter variable
        row_id = row_id + 1;

    # Generating the html table closing tag
    html += "</table>";

    # Returning the html document containing the search results html table
    return html;

if __name__ == '__main__':
    import os
    # Getting the value of hostname (e.g. 0.0.0.0) from the environment
    HOST = os.environ.get('SERVER_HOST', '0.0.0.0')
    try:
        # Getting the value of app's TCP-port equal to 80 from the environment
        PORT = int(os.environ.get('SERVER_PORT', '80'))
    except ValueError:
        PORT = 5555
    # Launching the web-application
    app.run(HOST, PORT)
