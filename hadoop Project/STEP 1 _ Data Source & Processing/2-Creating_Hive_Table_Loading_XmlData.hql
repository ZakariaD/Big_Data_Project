												

						-- ***** MSC BIG DATA --- Big Data Project --- DAHANI ZAKARIA ----- ***** ----

--- [cloudera@quickstart ~]$ hive


-- 1- We create a new database for the project


CREATE DATABASE big_data_project;
USE big_data_project;

-- 2- We create Intermediate table to store the formatted XML file yearly data as a String

CREATE TABLE XMLGasData(xmldata String);

LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/BigDataProject/XMLData/yearlyData/formattedYearlyData.xml' INTO table xmlgasdata;


-- 3- We create the final table to be used in the project that will store the formatted XML data

CREATE TABLE GasData(
    pdv_id int,
    pdv_latitude int,
    pdv_longitude int,
    pdv_cp int,
    pdv_pop string,
    prix_nom string,
    prix_id int,
    prix_maj string,
    prix_valeur int)
    ROW FORMAT DELIMITED
    STORED AS PARQUET;


-- 4- We insert the formatted data from XMLGasData table to GasData table.

INSERT OVERWRITE TABLE GasData SELECT
    xpath_int(xmldata, 'pdv/@id'),
    xpath_int(xmldata, 'pdv/@latitude'),
    xpath_int(xmldata, 'pdv/@longitude'),
    xpath_int(xmldata, 'pdv/@cp'),
    xpath_string(xmldata, 'pdv/@pop'),
    xpath_string(xmldata, 'pdv/prix/@nom'),
    xpath_int(xmldata, 'pdv/prix/@id'),
    xpath_string(xmldata, 'pdv/prix/@maj'),
    xpath_int(xmldata, 'pdv/prix/@valeur')
    from XMLGasData;

-- In CLOUDERA 5.8.0, This work nice with the dailyData file and many samples of yearlyData with small size to run the project, beacause of the problem of YARN memory, when I use the yearlyData files the Map/Reduce jobs are 
-- stuck at 0% as follow :

-- Hadoop job information for Stage-1: number of mappers: 2; number of reducers: 0
-- 2017-01-01 03:59:46,122 Stage-1 map = 0%,  reduce = 0%
-- 2017-01-01 04:00:46,715 Stage-1 map = 0%,  reduce = 0%, Cumulative CPU 34.52 sec
-- 2017-01-01 04:01:47,060 Stage-1 map = 0%,  reduce = 0%, Cumulative CPU 79.1 sec
-- 2017-01-01 04:02:47,652 Stage-1 map = 0%,  reduce = 0%, Cumulative CPU 123.16 sec
-- 2017-01-01 04:03:47,919 Stage-1 map = 0%,  reduce = 0%, Cumulative CPU 168.04 sec
-- ... and so on infinily


-- 5- We have no more use of the XMLGasData, so we drop it

DROP TABLE XMLGasData;






