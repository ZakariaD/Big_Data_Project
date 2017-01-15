
										-- ***** MSC BIG DATA --- Big Data Project --- DAHANI ZAKARIA ----- ***** ----

--- [cloudera@quickstart ~]$ hive

-- 1- We create dailData table to store the formatted XML file daily data as a String each day.

USE big_data_project;

CREATE TABLE dailyData(d_data String);

LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/BigDataProject/XMLData/dailyData/formattedDailyData.xml'  INTO table dailyData;

-- 2- We insert the formatted data from dailyData table to GasData table.

INSERT OVERWRITE TABLE GasData SELECT
    xpath_int(d_data, 'pdv/@id'),
    xpath_int(d_data, 'pdv/@latitude'),
    xpath_int(d_data, 'pdv/@longitude'),
    xpath_int(d_data, 'pdv/@cp'),
    xpath_string(d_data, 'pdv/@pop'),
    xpath_string(d_data, 'pdv/prix/@nom'),
    xpath_int(d_data, 'pdv/prix/@id'),
    xpath_string(d_data, 'pdv/prix/@maj'),
    xpath_int(d_data, 'pdv/prix/@valeur')
    from dailyData;

-- Total MapReduce CPU Time Spent: 2 minutes 24 seconds 90 msec

-- 3- We empty the dailyData table to not have redundante data.

TRUNCATE TABLE dailyData;









  





