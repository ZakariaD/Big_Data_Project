#!/bin/bash

# We remove the existing dailyGasData directory and all its content (if it exists)
 
hadoop fs -rm -r -f /user/hdfs/BigDataProject/dailyGasData

# We load the daily data set and put the extracted xml file into BigDataProject directory

wget  https://donnees.roulez-eco.fr/opendata/jour -O daily_data.zip && unzip daily_data.zip && rm daily_data.zip | hadoop fs -put *_quotidien_*.xml /user/hdfs/BigDataProject

#We create the daily data working directory into BigDataProject directory

hadoop fs -mkdir /user/hdfs/BigDataProject/dailyGasData

# We move the xml file into the new working directory dailyGasData

hadoop fs -mv /user/hdfs/BigDataProject/*_quotidien_*.xml  /user/hdfs/BigDataProject/dailyGasData

# We format the xml file, but this time within hadoop, I put the awk script in the same line, because I couldn't execute the myawk.awk script with the importation within HDFS !!!
# I tried also using the myawk.awk file as an input variable: awk -f '${input}' and I specified in the inputbox the path to the awk script, but it didn't work as well.

hadoop fs -cat /user/hdfs/BigDataProject/dailyGasData/*_quotidien_*.xml | sed '1d'|sed '/<adresse/d' |sed '/<ville/d'|sed '/<ouverture/d'|sed '/<service/d'| sed '/<services/d'|sed '/<\/services>/d'|sed '/<fermeture/d'| sed '/<rupture/d'| sed '/<prix\/>/d'|sed '/<pdv_liste>/d' | sed '/<\/pdv_liste>/d' | sed 's/^[[:space:]]*//g'| awk 'BEGIN { tag = "</pdv>" ; pdv_line = ""; change_pdv = "true"; FS = "\n";} {if(change_pdv == "true") { pdv_line=$0; change_pdv = "false";} if($0 != tag && $0 != pdv_line && $0 != "") { $0=pdv_line$0; print $0;} else if($0 == tag){change_pdv = "true";}}' | sed 's|/>|/></pdv>|g' | hadoop fs -put - /user/hdfs/BigDataProject/dailyGasData/formattedDailyData.xml

# We remove the original xml file and we keep the formatted one

hadoop fs -rm /user/hdfs/BigDataProject/dailyGasData/*_quotidien_*.xml
