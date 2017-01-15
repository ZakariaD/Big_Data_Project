Project Name : Setting up a featured data platform for processing pricing data on Hadoop

Download the project folders & files and put them into a "/home/cloudera/Desktop/BigDataProject" Directory.

For more details, please refer to README.txt

*** Set up a featured data platform for processing pricing data on Hadoop:

* Set-up the platform
* Develop data loading and storage to a table
* Develop a notebook with several visualizations

*** Infrastructure

* Hadoop Sandbox from Cloudera or Hortonworks

*** Data Sources

1 source of data will have to be used:

* Daily Gas stations prices from:
http://www.prix-carburants.gouv.fr/rubrique/opendata/

* Load yearly stock for current year
* Please consider loading 3 years of annual archives

*** Data Processing

Gas Station Prices

* Data must be loaded from files to a Hive table stored in Parquet file format
* Original file is available in XML format. This format may raise some issues
* Reading & loading data directly from the XML file to Hive table

*** Scheduling

Daily Gas Station Prices

* Data can be updated with daily increment
(http://donnees.roulez-eco.fr/opendata/jour)

* Develop a script (Spark, Hive) which add daily data to the Hive table
* Develop an Oozie workflow & coordinator to run this script
* Develop a shell script to collect daily file from the web site, and add it as a step to the Oozie job

*** Notebook

Using Zeppelin or Jupyter

* The notebook will propose several tables & visualizations based on gas prices data
* Consider evolution over time, over geography, etc.



