

												# ***** MSC BIG DATA --- Big Data Project --- DAHANI ZAKARIA ----- ***** #

# ********** [cloudera@quickstart ~]$ *********************

#****** 1. Creating the work directories ******/  IF you are going to use BigDataProject folder please, please copy it in the cloudera desktop and skip to 2.

cd Desktop

mkdir BigDataProject

cd BigDataProject

mkdir XMLData

cd XMLData

mkdir yearlyData dailyData


#****** 2. Loading/Extracting/Removing data per year in the yearlyData Directory, the result is the xml file per year ******/

cd yearlyData

wget https://donnees.roulez-eco.fr/opendata/annee/2013 -O data_2013.zip && unzip data_2013.zip && rm data_2013.zip

wget https://donnees.roulez-eco.fr/opendata/annee/2014 -O data_2014.zip && unzip data_2014.zip && rm data_2014.zip

wget https://donnees.roulez-eco.fr/opendata/annee/2015 -O data_2015.zip && unzip data_2015.zip && rm data_2015.zip

wget https://donnees.roulez-eco.fr/opendata/annee/2016 -O data_2016.zip && unzip data_2016.zip && rm data_2016.zip


# ***** 3. To store this data into XMLGasData table and next to GasTable table, we have to make sure the data is formatted as per hive requirement ********/
#***
#***	a. Each tag should be in same line.
#***	b. <?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?> should not be present.
#***	c. As we require only pdv data, no need of <pdv_liste> and </pdv_liste> tags.
#***	d. Each <pvd></pvd> should be in single line.
#***  	To achieve this we will be using LINUX command as below using the | for chaining operations.

#*** ======> We are still in the yearlyData Directory !!!!

cat *_annuel_*.xml | sed '1d'|sed '/<adresse/d' |sed '/<\/adresse>/d' |sed '/<ville/d'|sed '/<\/ville>/d'|sed '/<ouverture/d'|sed '/<service/d'| sed '/<services/d'|sed '/<\/services>/d'|sed '/<fermeture/d'| sed '/<rupture/d'| sed '/<prix\/>/d'|sed '/<pdv_liste>/d' | sed '/<\/pdv_liste>/d' | sed 's|^[[:space:]]*||g'| awk -f '/home/cloudera/Desktop/BigDataProject/XMLData/myawk.awk' | sed 's|/>|/></pdv>|g'> formattedYearlyData.xml


# We remove all the non-formatted xml files

rm *_annuel_*.xml


#*** Explaination :

#*** cat *_annuel_*.xml  ==> We read/concatenate the xml files corresponding to each year.

#*** sed '1d' ==> This command will delete the first line in xml files (<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?><pdv_liste>)

#*** sed '/<adresse/d' and sed '/<\/adresse>/d'==> This command will remove all the line containing the adresse tags wich begin with <adresse (to remove also the ones with attributes if there are) or finish with </adresse>

#*** The same for the the following node : ville, ouverture, service, services, fermeture, rupture and pdv_liste.

#*** sed '/<prix\/>/d'  ==> This command will remove all the empty prix tags.

#*** sed '/<prix\/>/d'  ==> This command will remove all the empty prix tags.

#*** Each empty line within the xml file starts with a blank space, so in orther tp have a pure empty line we remove the blank spaces from the beginning's lines using the sed 's|^[[:space:]]*||g' commande,

#*** This will also remove the spaces separating each prix tag and the beginning's line.

#*** awk -f ../XMLData/myawk.awk ==> see the myawk.awk file for more detail.

#*** sed 's|/>|/></pdv>|g' ==> This command will replace the end of each line which is : /> by </pdv>, so finaly each line will have the following form :

#***  example : <pdv id="1000001" latitude="4620114" longitude="519791" cp="01000" pop="R"> <prix nom="Gazole" id="1" maj="2013-09-23 09:19:53.795804" valeur="1325"/></pdv>

#*** Please have a look at testsample.xml and FormattedTestSample.xml for more detail

#*** ==> each line is one record of our Hive table, attributes are Hive fields.


# ***** 4. Loading & Formatting daily data : we do the same as we did for the yealyData

cd ../dailyData

wget https://donnees.roulez-eco.fr/opendata/jour -O daily_data.zip && unzip daily_data.zip && rm daily_data.zip


cat *_quotidien_*.xml | sed '1d'|sed '/<adresse/d' |sed '/<ville/d'|sed '/<ouverture/d'|sed '/<service/d'| sed '/<services/d'|sed '/<\/services>/d'|sed '/<fermeture/d'| sed '/<rupture/d'| sed '/<prix\/>/d'|sed '/<pdv_liste>/d' | sed '/<\/pdv_liste>/d' | sed 's|^[[:space:]]*||g'| awk -f '/home/cloudera/Desktop/BigDataProject/XMLData/myawk.awk' | sed 's|/>|/></pdv>|g'> formattedDailyData.xml

rm *_quotidien_*.xml









