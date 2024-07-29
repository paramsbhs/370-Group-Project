import mysql.connector

# Replace these values with your database details
db_config = {
    'host': 'localhost',         # or your database server address
    'user': 'root',     # your MySQL username
    'password': '0143', # your MySQL password
    'database': 'sport_social_media'  # the database you want to use
}

try:
    connection = mysql.connector.connect(**db_config)
    if connection.is_connected():
        print("Connected to MySQL database")

    # Create a cursor object
    cursor = connection.cursor()

    # Query 1: Teams for racket sports
    query1 = """
    SELECT DISTINCT `TeamId`
    FROM `Team`
    WHERE `Requirements` LIKE '%Racket%';
    """
    cursor.execute(query1)
    racket_teams = cursor.fetchall()
    print("Teams for racket sports:")
    for team in racket_teams:
        print(team)

except mysql.connector.Error as err:
    print("Error:", err)

finally:
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
        print("\nMySQL connection is closed")