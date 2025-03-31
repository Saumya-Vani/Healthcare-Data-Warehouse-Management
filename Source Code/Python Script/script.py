import pandas as pd
import psycopg2

# Redshift connection details
REDSHIFT_DBNAME = '' #add your database name 
REDSHIFT_USER = ''  #add your user name
REDSHIFT_PASSWORD = ''  #add your password
REDSHIFT_HOST = ''  #add your host
REDSHIFT_PORT = ''  #add your port

try:
    # Connect to Redshift
    conn = psycopg2.connect(
        dbname=REDSHIFT_DBNAME,
        user=REDSHIFT_USER,
        password=REDSHIFT_PASSWORD,
        host=REDSHIFT_HOST,
        port=REDSHIFT_PORT
    )
    print("Connection to Redshift successful.")
    
    # Create a cursor object
    cursor = conn.cursor()
    
    # SQL Query to fetch data
    query = """
    SELECT patientid, appointmentid, gender, scheduledday, appointmentday, 
           age, neighbourhood, scholarship, hipertension, diabetes, 
           alcoholism, handicap, sms_received, showed_up
    FROM healthcare_data;
    """
    
    # Execute the query
    cursor.execute(query)
    
    # Fetch all rows
    data = cursor.fetchall()
    
    # Column names
    columns = [
        'patientid', 'appointmentid', 'gender', 'scheduledday', 'appointmentday', 
        'age', 'neighbourhood', 'scholarship', 'hipertension', 'diabetes', 
        'alcoholism', 'handicap', 'sms_received', 'showed_up'
    ]
    
    # Convert to Pandas DataFrame
    df = pd.DataFrame(data, columns=columns)
    print("Data fetched successfully:")
    print(df.head())  # Display the first few rows of the DataFrame
    
except Exception as e:
    print(f"Error: {e}")
finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if conn:
        conn.close()
    print("Connection closed.")
