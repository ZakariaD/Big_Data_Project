

												# ***** MSC BIG DATA --- Big Data Project --- DAHANI ZAKARIA ----- ***** #

# We remove the existing yearlyGasData directory and all its content (if it exists)
 
hadoop fs -rm -r -f /user/hdfs/BigDataProject/yearlyGasData


# We load the yearly data sets and put the extracted xml file into BigDataProject directory


wget https://donnees.roulez-eco.fr/opendata/annee/2013 -O data_2013.zip && unzip data_2013.zip && rm data_2013.zip | hadoop fs -put *_annuel_*.xml /user/hdfs/BigDataProject

wget https://donnees.roulez-eco.fr/opendata/annee/2014 -O data_2014.zip && unzip data_2014.zip && rm data_2014.zip | hadoop fs -put *_annuel_*.xml /user/hdfs/BigDataProject

wget https://donnees.roulez-eco.fr/opendata/annee/2015 -O data_2015.zip && unzip data_2015.zip && rm data_2015.zip | hadoop fs -put *_annuel_*.xml /user/hdfs/BigDataProject

wget https://donnees.roulez-eco.fr/opendata/annee/2016 -O data_2016.zip && unzip data_2016.zip && rm data_2016.zip | hadoop fs -put *_annuel_*.xml /user/hdfs/BigDataProject


# We create the daily data working directory into BigDataProject directory

hadoop fs -mkdir /user/hdfs/BigDataProject/yearlyGasData

# We move the xml file into the new working directory yearlyGasData

hadoop fs -mv /user/hdfs/BigDataProject/*_annuel_*.xml  /user/hdfs/BigDataProject/yearlyGasData


# Concatenating and formatting the yearly xml data


hadoop fs -cat /user/hdfs/BigDataProject/yearlyGasData/*_annuel_*.xml | sed '1d'|sed '/<adresse/d' |sed '/<ville/d'|sed '/<ouverture/d'|sed '/<service/d'| sed '/<services/d'|sed '/<\/services>/d'|sed '/<fermeture/d'| sed '/<rupture/d'| sed '/<prix\/>/d'|sed '/<pdv_liste>/d' | sed '/<\/pdv_liste>/d' | sed 's/^[[:space:]]*//g'| awk 'BEGIN { tag = "</pdv>" ; pdv_line = ""; change_pdv = "true"; FS = "\n";} {if(change_pdv == "true") { pdv_line=$0; change_pdv = "false";} if($0 != tag && $0 != pdv_line && $0 != "") { $0=pdv_line$0; print $0;} else if($0 == tag){change_pdv = "true";}}' | sed 's|/>|/></pdv>|g' | hadoop fs -put - /user/hdfs/BigDataProject/yearlyGasData/formattedYearlyData.xml

# We remove all the non-formatted xml files

hadoop fs -rm /user/hdfs/BigDataProject/yearlyGasData/*_annuel_*.xml








