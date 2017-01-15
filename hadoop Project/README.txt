Program Version 1.0 07/01/2017

Project Name : MSC BIG DATA - Setting up a featured data platform for processing pricing data on Hadoop

Project Author : DAHANI ZAKARIA

I. Folder list
-------------

STEP 1 : Data Source & Processing			1-Loading_Formatting_XmlData .sh	2-Creating_Hive_Table_Loading_XmlData.hql	myawk.awk	README		/sample		

STEP 2 : Add_Daily_Data_To_Hive_Table			/Using_Hive	/Using_Spark

STEP 3 :Oozie Workflows & Coordinators			/1- Running_Hive_Add_Daily	/2- Running_All (Shell_Collect_Daily+ Hive_Add_Daily)	README

STEP 4 : NoteBook_Zepplin	
			
XMLData							myawk.awk	/dailyData	/yearlyData	
 
OozieScript						Hadoop-command.sh	/hive_shell_oozie_script	

ExtraWork 						1_yearly_data_shell.sh		2_yearly_data_hive.hql		3_daily_data_shell.sh		4_daily_data_hive.hql


II. Root Directory
--------------

All the folders listed above are in the "/home/cloudera/Desktop/BigDataProject" directory

III. Hadoop Distribution
-------------------

All the work has been done in Cloudera CDH V5.8.0 QuickStart VM, except for the zeppline part because of a problem of installation in Cloudera, so it was used in Hortonworks.


IV. General Usage Notes
-----------------------

To start, the user have the choice to use the given BigDataProject directory and put it in the "/home/cloudera/Desktop/" directory, or to use the fisrt part in the shell command script (1-Loading_Formatting_XmlData.xml) used in STEP 1.

The folder STEP 1, STEP 2, STEP 3 and STEP 4 have to be openned in order, and the order to open the files/directories inside is also and have to be openned in order.

The XMLData and the OozieScript folders are primordial for the project and the communication between the ordered folders and HDFS.

In order to coordinate all the project steps, The ExtraWork folder will be used for this task.


!!!!! ===============> DON'T FORGET TO PUT THE myawk.awk SCRIPT (if it dosen't) IN THE XMLData DIRECTORY, IT IS VERY CRITICAL STARTING POINT <============= !!!!!


V. LICENSE
----------

Copyright 2017-2018	Z@D Corporation. All right reserved.

Program and its use are subject to an open source license agreement.






