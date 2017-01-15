									
								-- ***** MSC BIG DATA --- Big Data Project --- DAHANI ZAKARIA ----- ***** ----

USE big_data_project;

LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/BigDataProject/XMLData/dailyData/formattedDailyData.xml'  INTO table dailyData;

INSERT OVERWRITE TABLE gasdata SELECT
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

TRUNCATE TABLE dailyData;

