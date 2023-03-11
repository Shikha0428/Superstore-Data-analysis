# Superstore-Data-analysis
----------------
Superstore Sales Analysis & Data Visualisation
![superstore](https://user-images.githubusercontent.com/126523797/224435484-7e03360e-f44b-4455-ad07-5ac845560371.png)


Project Description:

This project will train you how to use SQL to analyze a real-world database, how to extract the most useful information from the dataset, how to pre-process the data using Python for improved performance, how to use a structured query language to retrieve useful information from the database, and how to visualize the data using the PowerBI tool.

This is the real world data analysis project conducted by HiCounselor as a 2 week challenge.

The real dataset, client requirements, the tools which will be used, everything related to the project had been given in a sandbox link in their website.

It Contains 3 modules:

<img width="1016" alt="modules" src="https://user-images.githubusercontent.com/126523797/224436477-ac5e01d0-649d-4244-8be3-7215545b6422.png">

Module 1:

Let's start with module 1 by downloading superstore_final_dataset.csv in the given sandbox link.
<img width="1162" alt="2" src="https://user-images.githubusercontent.com/126523797/224437661-91f9fceb-139b-4cec-a7ab-2b627b2242d2.png">

To understand the sales and operations of Superstore, we are going to go through the data in Python and will proceed with some data cleaning.

The dataset may contain duplicate rows, excluding Row_ID column as Row_ID is unique identifier here. This is to avoid duplicate entry for the same product in the same order.

Step 1: Removing duplicate rows ( there could be duplicate rows excluding Row_ID column ).

So to identify the duplicate row df.duplicated() function is used except Row_ID column.
We Could see that 1 row is duplicated which is row#3407.

<img width="1028" alt="3" src="https://user-images.githubusercontent.com/126523797/224441289-cb6deca6-eb3d-4d1e-b7bb-34e577f4e186.png">

The duplicate row had been removed using df.drop_duplicates(subset=df.columns.difference(['Row_ID']))

<img width="741" alt="3" src="https://user-images.githubusercontent.com/126523797/224442903-0baba396-6232-42fc-8e5a-5deaaefa521c.png">

Step 2: Removing rows for which few values are missing.

We could see that using df.isnull() , there are 11 rows with null postal code.

<img width="1047" alt="p" src="https://user-images.githubusercontent.com/126523797/224452151-ec1e1264-ff68-4160-842d-e000c48aaf23.png">


Then we proceed with dropping the records with null values as it can interfere with the data analysis by df.dropna() function.

<img width="846" alt="4" src="https://user-images.githubusercontent.com/126523797/224443303-c2e1631b-d2dd-4192-a664-fdd94802e957.png">

Step 3: Remove irrelevant values from each column if any. Validation of all values for a column( order date and ship date value must be in correct date format ). For each entry in dataset ship date >= order date

<img width="1188" alt="5" src="https://user-images.githubusercontent.com/126523797/224446159-56ac48f5-172d-4416-88d7-0c7d0b26f052.png">

<img width="849" alt="date" src="https://user-images.githubusercontent.com/126523797/224447324-d51419ea-6970-4810-91c6-d895e578106c.png">

Step 4: Export the cleaned dataset as a .csv file: prefer UTF-8 encoding.

<img width="973" alt="l" src="https://user-images.githubusercontent.com/126523797/224448100-b66011aa-4554-45d1-87b2-4654608d9f01.png">

So now the dataset is very clean and ready to be exported to csv file with UTF-8 encoding. Superstore_cleaned_dataset.csv is now cleaned and ready for data analysis.

Step 5: Convert the pre-processed dataset into an SQL file and import it to table named "superstore" using credentials provided in "DataBase Info" Tab.

After finishing the data cleaning,now the requirement is to convert the cleaned csv to sql file and create a table called "superstore" in the PHP Admin.

SQL> CREATE TABLE superstore (
    Row_ID INT NOT NULL,
    Order_ID VARCHAR(255) NOT NULL,
    Order_Date DATE NOT NULL,
    Ship_Date DATE NOT NULL,
    Ship_Mode VARCHAR(255),
    Customer_ID VARCHAR(255) NOT NULL,
    Customer_Name VARCHAR(255),
    Segment VARCHAR(255),
    Country VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Postal_Code VARCHAR(255),
    Region VARCHAR(255),
    Product_ID VARCHAR(255) NOT NULL,
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
Product_Name VARCHAR(255),
    Sales DECIMAL(10, 2),
    PRIMARY KEY (Row_ID)
);
Then the SQL file has been imported into PHP admin by using given Username,Password as table superstore.
<img width="1259" alt="t" src="https://user-images.githubusercontent.com/126523797/224448837-06b6558d-a835-4a5d-95eb-2ecb4c146b04.png">

<img width="1273" alt="table" src="https://user-images.githubusercontent.com/126523797/224448576-3f207ab2-e90a-4ef9-88ab-0c624170747c.png">

Now the table has been created for data analysis using SQL. There were 14 tasks/data analysis requirement given. The SQL queries used to address those requirements has been attached as superstore.sql file.
 
From this Module 1 and 2 comes to an end.











