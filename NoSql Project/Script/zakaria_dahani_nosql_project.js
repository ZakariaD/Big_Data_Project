				/**************************************************************************************************************************************************/
				/**************************************************************************************************************************************************/
				/******************************************************************* ABOUT ************************************************************************/
				/***																		***/
				/***						 												***/
				/***	Author Full Name : Dahani Zakaria						  							***/
				/*** 											 							***/
				/*** 	Version : 0.0.1									  							***/	
				/***											 							***/
				/***	Project: NoSQL	Project	MSc Big Data ENSAI                                                                                              ***/
				/***											 							***/
				/***	Script Link :  https://github.com/ZakariaD/NoSqlProject.git                                     					***/
				/*** 											  							***/
				/***	DataBase/Language : MongoDB/JavaScript						  							***/
				/*** 										          							***/
				/*** 	DataSet used : All								  							***/
				/***											  							***/
				/***	DataSets Description :								  							***/
				/***											  							***/
				/*** 		---Name : NYC Wi-Fi Hotspot Locations					  							***/
				/***		---About : Location of wifi hotspots in the city with basic descriptive information.						***/
				/*** 		---URL : https://nycopendata.socrata.com/City-Government/NYC-Wi-Fi-Hotspot-Locations/yjub-udmw/data 	       			***/
				/*** 																		***/		
				/***								  										***/
				/*** 		---Name : DOHMH New York City Restaurant Inspection Results		  							***/
				/***		---About :  Restaurant inspections, violations, grades and adjudication information						***/
				/*** 		---URL : https://nycopendata.socrata.com/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59/data                ***/
				/*** 											  							***/ 
				/*** 								                          							***/
				/*** 		---Name : NYPD Motor Vehicle Collisions					  							***/
				/***		---About : Details of Motor Vehicle Collisions in New York City provided by the Police Department (NYPD)			***/
				/*** 		---URL : https://nycopendata.socrata.com/Public-Safety/NYPD-Motor-Vehicle-Collisions/h9gi-nx95/data          			***/
				/*** 											  							***/
				/*** 		---Name : 311 Service Requests from 2010 to Present			  							***/
				/***		---About : All 311 Service Requests from 2010 to present. This information is automatically updated daily			***/
				/*** 		---URL : https://nycopendata.socrata.com/Social-Services/311-Service-Requests-from-2010-to-Present/erm2-nwe9/data          	***/
				/*** 											  							***/			 
				/*** 								                          							***/
				/***											 							***/
				/*** 											  							***/
				/***	Files type : All the dataSets are in csv Files format				  							***/
				/***											  							***/
				/*** 								                          							***/
				/***											 							***/
				/*** 											  							***/
				/**************************************************************************************************************************************************/
				/**************************************************************************************************************************************************/
				/**************************************************************************************************************************************************/


/************************************Declaration phase**************************************/
/***
*** Instead of creating the database named "NoSqlProject" and 5 collections named 
*** 
*** wifi, restaurant, collisions, services and statistics respectively
***
*** 
*** All will be created automaticly thaks to the "mongoimport" command which will create/import the database, dataSet and the fourth corresponding collections
***
*** The last collections is dedicated to show the final results statistics
*** 
***/

/*  Commands TO BE used in the sell command (Path to be modified)

mongoimport --db NoSqlProject --collection collisions --type csv --file NYPD_Motor_Vehicle_Collisions.csv --headerline;
mongoimport --db NoSqlProject --collection restaurant --type csv --file DOHMH_New_York_City_Restaurant_Inspection_Results.csv --headerline;
mongoimport --db NoSqlProject --collection wifi --type csv --file NYC_Wi-Fi_Hotspot_Locations_Map.csv --headerline;
mongoimport --db NoSqlProject --collection services --type csv --file 311_Service_Requests_from_2010_to_Present.csv --headerline;

*/

/*
db.createCollection("wifi");
db.createCollection("restaurant");
db.createCollection("collisions");
db.createCollection("services");
*/

//use NoSqlProject; //using the NoSqlProject as current database

//Connecting to the database
var connect = new Mongo();
var db = connect.getDB("NoSqlProject");

db.createCollection("statistics");

var bestBorough = null; //To store the best borough coresponding to predefined criterions
var bestStreet = new Array();//To store the best street(s) in the choosen borough



/************************************Collections Update**************************************/
/***
*** In order to keep only the important fields to our study, I did serveral update on the four collections
*** 
*** Next, I tried to unify all the common fields names in orther to facilitate the coding
*** Also, I tried to skip the space in some names to avoid possible bugs
***
*** I changed also some fields values to make them similar
***
*** Finaly, I removed all the empty, missing an unspecified fileds 
***
*** I Store a JavaScript Function named "updateNoSqlProjectDB" on the Server
*** 
***/

db.system.js.save(
   {
     _id: "updateNoSqlProjectDB",
     value : function() 
	{ 

		print("\n\n\t\tPlease Wait some minutes until the processing is done ... !!!\n\n");

		//Deleting the unecessary fields in the collisions collection
		db.collisions.update({ },{ $unset: 
			{ 
			"DATE" : "","TIME" : "","ZIP CODE" : "","LATITUDE" : "","LONGITUDE" : "","LOCATION" : "","CROSS STREET NAME" : "","OFF STREET NAME" : "","NUMBER OF PERSONS INJURED" : "",
			"NUMBER OF PEDESTRIANS INJURED" : "","NUMBER OF PEDESTRIANS KILLED" : "","NUMBER OF CYCLIST INJURED" : "","NUMBER OF CYCLIST KILLED" : "","NUMBER OF MOTORIST INJURED" : "",
			"NUMBER OF MOTORIST KILLED" : "","CONTRIBUTING FACTOR VEHICLE 1" : "","CONTRIBUTING FACTOR VEHICLE 2" : "","CONTRIBUTING FACTOR VEHICLE 3" : "","CONTRIBUTING FACTOR VEHICLE 4" : "",
			"CONTRIBUTING FACTOR VEHICLE 5" : "","UNIQUE KEY" : "","VEHICLE TYPE CODE 1" : "","VEHICLE TYPE CODE 2" : "","VEHICLE TYPE CODE 3" : "",
			"VEHICLE TYPE CODE 4" : "","VEHICLE TYPE CODE 5" : ""
			}
		},{ multi: true })											
	
		//Deleting the unecessary fields in the wifi collection
		db.wifi.update({ },{ $unset: 
			{ 
			"OBJECTID" : "","Provider" : "","Name" : "","Lat" : "","Long_" : "","X" : "","Y" : "","Location_T" : "","Remarks" : "",
			"City" : "","SSID" : "","SourceID" : "","Location (Lat, Long)" : ""

			}
		},{ multi: true })

		//Deleting the unecessary fields in the restaurant collection
		db.restaurant.update({ },{ $unset: 
			{ 

			"CAMIS" : "", "BUILDING" : "","ZIPCODE" : "","PHONE" : "","CUISINE DESCRIPTION" : "","INSPECTION DATE" : "","ACTION" : "","VIOLATION CODE" : "",
			"VIOLATION DESCRIPTION" : "","GRADE DATE" : "","RECORD DATE" : "","INSPECTION TYPE" : ""

			}
		},{ multi: true })

		//Deleting the unecessary fields in the services collection
		//This one is a Big file so it will took some time to update it
		db.services.update({ },{ $unset: 
			{ 

			"Unique Key" : "","Created Date" : "","Closed Date" : "","Agency Name" : "","Descriptor" : "","Location Type" : "","Incident Zip" : "","Incident Address" : "","Cross Street 1" : "",
			"Cross Street 2" : "","Intersection Street 1" : "","Intersection Street 2" : "","Address Type" : "","City" : "","Landmark" : "","Facility Type" : "","Status" : "","Due Date" : "",
			"Resolution Description" : "","Resolution Action Updated Date" : "","Community Board" : "","X Coordinate (State Plane)" : "","Y Coordinate (State Plane)" : "",
			"Park Facility Name" : "","Park Borough" : "","School Name" : "","School Number" : "","School Region" : "","School Code" : "","School Phone Number" : "",
			"School Address" : "","School City" : "","School State" : "","School Zip" : "","School Not Found" : "","School or Citywide Complaint" : "","Vehicle Type" : "",
			"Taxi Company Borough" : "","Taxi Pick Up Location" : "","Bridge Highway Name" : "","Bridge Highway Direction" : "","Road Ramp" : "","Bridge Highway Segment" : "",
			"Garage Lot Name" : "","Ferry Direction" : "","Ferry Terminal Name" : "","Latitude" : "","Longitude" : "","Location" : ""
			}
		},{ multi: true })


		//Unifying the fileds names on all the collections
		db.restaurant.updateMany({},{$rename : {"BORO":"BOROUGH", "STREET":"STREET_NAME","CRITICAL FLAG":"CRITICAL_FLAG"}});
		db.collisions.updateMany({},{$rename : {"ON STREET NAME":"STREET_NAME", "NUMBER OF PERSONS INJURED":"NUMBER_OF_PERSONS_INJURED", "NUMBER OF PERSONS KILLED":"NUMBER_OF_PERSONS_KILLED"}});
		db.wifi.updateMany({},{$rename : {"Boro":"BOROUGH"}});
		db.services.updateMany({},{$rename : {"Borough":"BOROUGH","Street Name":"STREET_NAME", "Complaint Type":"Complaint_Type"}});

		//Unifying the fileds values on all the corresponding collections
		db.wifi.updateMany({ "BOROUGH": "QN" },{ $set: { "BOROUGH" : "QUEENS" } })
		db.wifi.updateMany({ "BOROUGH": "SI" },{ $set: { "BOROUGH" : "STATEN ISLAND" } })
		db.wifi.updateMany({ "BOROUGH": "BX" },{ $set: { "BOROUGH" : "BRONX" } })
		db.wifi.updateMany({ "BOROUGH": "QU" },{ $set: { "BOROUGH" : "QUEENS" } })
		db.wifi.updateMany({ "BOROUGH": "BK" },{ $set: { "BOROUGH" : "BROOKLYN" } })
		db.wifi.updateMany({ "BOROUGH": "MN" },{ $set: { "BOROUGH" : "MANHATTAN" } })

		//Removing Empty, Missing and Unspecified fileds on the coresponding collections
		db.collisions.remove( { "BOROUGH": "" } )
		db.restaurant.remove( { "BOROUGH": "Missing" } )
		db.services.remove( { "BOROUGH": "Unspecified" } )


	
	}
   }
)

/************************************BestBorough**************************************/
/***
*** The best Borough is the one with the maximum free wifi hotspot, the maximum number of restaurant and the maximum number of service agencies
*** If they differ, we choose the the borough that correspond to the maximum of the three criterions
*** 
*** I store a JavaScript Function named "chooseBestBorough" on the Server
***
*** 
*** The chooseBestBorough() function return an object named "bestBorough" containing the name of the best Borough
***
***/


db.system.js.save(
   {
     _id: "chooseBestBorough",
     value : function() { 
		
		var BO =  db.restaurant.distinct("BOROUGH"); //BO = [ "MANHATTAN", "QUEENS", "BROOKLYN", "STATEN ISLAND", "BRONX" ]

		var tot_distinct_restaurant = new Array();
		var tot_distinct_services = new Array();

		var max_borough_restaurant="";
		var max_borough_wifi="";
		var max_borough_services="";

		var tot_max_restaurant=0;
		var tot_max_wifi=0;
		var tot_max_services=0;

		var wifi_filter = db.wifi.aggregate([
							     { $match: { Type: "Free" } },
							     { $group: { _id: "$BOROUGH", total: { $sum: 1 } } },
							     { $sort: { total: -1 } }
							   ]);


		db.createCollection("resultWifi");
		db.resultWifi.insert(wifi_filter.toArray());

		db.resultWifi.find().limit(1).forEach(function(myObj) {  

									max_borough_wifi = myObj._id; 
									tot_max_wifi = myObj.total; })

		db.resultWifi.drop();

		
		for (index in BO){ 

			tot_distinct_restaurant[index] = db.restaurant.distinct("DBA",{BOROUGH:BO[index]}).length;

			tot_distinct_services[index] = db.services.distinct("Agency",{BOROUGH:BO[index]}).length; }			

 

		for(index in tot_distinct_restaurant) {
	
			if(tot_distinct_restaurant[index] > tot_max_restaurant) { 

				tot_max_restaurant = tot_distinct_restaurant[index]; 
				max_borough_restaurant=BO[index];}
	
			if(tot_distinct_services[index] > tot_max_services) { 

				tot_max_services = tot_distinct_services[index];
				max_borough_services=BO[index];}
			
			}


		if(max_borough_wifi == max_borough_restaurant &&  max_borough_wifi == max_borough_services) {  
 
									bestBorough = max_borough_wifi;

									} else if (tot_max_wifi >= tot_max_restaurant && tot_max_wifi >= tot_max_services) {

									
									bestBorough = max_borough_wifi;} else if (tot_max_restaurant >= tot_max_wifi && tot_max_restaurant >= tot_max_services) {

									bestBorough = max_borough_restaurant;} else if (tot_max_services >= tot_max_wifi && tot_max_services >= tot_max_restaurant) {

									bestBorough = max_borough_services;
							
									}
								

		
		return(bestBorough);
						

	
	}
   })




/************************************BestStreet**************************************/
/***
*** The best street corresponding to the best borough is the one with an "A" grade, a "Not Critical" flag and a score equal to 0.
*** We just got one named "PARK AVENUE" 
*** 
*** I store a JavaScript Function named "chooseBestStreet" on the Server
*** the street we got is the best of the best street, because all the scores that are <= 13, are good and correspond to an "A" grade. 
***
*** In order to have more alternatives, I add those with a score <= 2.
*** 
*** The chooseBestStreet() function return an object named "bestStreet" containing the names of the 5 best street ordered: score = 0 and score <= 2.
***/




db.system.js.save(
   {
     _id: "chooseBestStreet",
     value : function() 
	{ 

		var best_bo = chooseBestBorough();
		var inc = 0;

		var restaurant_filter  = db.restaurant.aggregate([
								     { $match: { BOROUGH:"MANHATTAN", GRADE: "A", CRITICAL_FLAG: "Not Critical" , SCORE :{ $eq : 0 } }},
								     { $group: { _id: "$STREET_NAME", total: { $sum: 1 } } },
								     { $sort: { total: -1 } }

								   ])

		var restaurant_filter_alternatives  = db.restaurant.aggregate([

								     { $match: { BOROUGH:best_bo, GRADE: "A", CRITICAL_FLAG: "Not Critical" , SCORE :{ $lte: 2 } }},
								     { $group: { _id: "$STREET_NAME", total: { $sum: 1 } } },
								     { $sort: { total: -1 } }

								   ])


		db.createCollection("resultRestaurant");

		db.resultRestaurant.insert(restaurant_filter.toArray());
		db.resultRestaurant.insert(restaurant_filter_alternatives.toArray());

		db.resultRestaurant.find().limit(5).forEach(function(obj){    bestStreet[inc]= obj._id; inc++; })

		db.resultRestaurant.drop();



		
		return(bestStreet);
	
	}
   }
)




//Statistics of the best street

/************************************Statistics for the best street(s)**************************************/
/***
*** I proposed to my sister the street with the restaurant score is = 0; 
*** But I gave her statistics of the 5 best streets in the best borough obtained using the restaurant criterions including the one I proposed in the first range
*** So, it is up to her to judge !!!
*** 
*** First statistic : number of different restaurant on each street with an "A" grade and a "Not Critical" flag
*** Second statistic : number of hotSpot station with free wifi on each street
*** Third statistic : number of person killed on each street
*** Fourth statistic : % of agencies present on each street
*** 
*** We Obtain the following results : 
***
*** Street Name : First statistic, Second statistic, Third statistic, Fourth statistic
*** 
*** "PARK AVENUE" :  75, 4, 5, 80%  
*** "BROADWAY": 513, 94, 6, 90%
*** "3 AVENUE": 176, 54, 6, 85%
*** "LEXINGTON AVENUE": 152, 3, 2, 85%
*** "7 AVENUE": 123, 2, 3, 85%
***
*** So if we ignore the score = 0 , and we focus on those with a score <= 2 (also good), obviously My sister will choose the second street "BROADWAY",
***
*** becuse it has 513 restaurants, 94 free hotSpot wifi, 6 people killed and 90% of the agency services availables !!!
***
***
*** Finaly we insert the results in the collection named "statistics", a document per street name
***
***/

db.system.js.save(
   {
     _id: "showStatistics",
     value : function() 
	{ 
		
	var bbo = chooseBestBorough();
	var bst = chooseBestStreet();

	var stat_restaurant = new Array();
	var stat_wifi = new Array();
	var stat_collisions = new Array();
	var stat_services = new Array();


	//First statistic : number of different restaurant on each street with an "A" grade and a "Not Critical" flag
	for( index in bst) {stat_restaurant[index] = db.restaurant.distinct("DBA",{BOROUGH:bbo, STREET_NAME:{$regex: bst[index], $options: "i"}, GRADE : "A", CRITICAL_FLAG : "Not Critical"}).length;}

	//Second statistic : number of hotSpot stations with free wifi on each street
	var wifi_bst = null;

	for(index in bst) {

		wifi_bst = db.wifi.aggregate([
							     { $match: { Type: "Free", Location: {$regex: bst[index], $options: "i"} } },
							     { $group: { _id: "$Type", total: { $sum: 1 } } },
							     { $sort: { total: -1 } }

							   ]);
		
		stat_wifi[index] = 0;
		db.createCollection("statWifi");
		db.statWifi.insert(wifi_bst.toArray());
		db.statWifi.find().forEach(function(obj){    stat_wifi[index] += obj.total; });
		db.statWifi.drop();
		
		}
	
	//Third statistic : number of person killed on each street
	var collisions_bst = null;

	for(index in bst) {

		collisions_bst = db.collisions.aggregate([
								     { $match: { BOROUGH: bbo ,STREET_NAME: {$regex: bst[index] , $options: "i"}} },
								     { $group: { _id: "$STREET_NAME", total: { $sum: "$NUMBER_OF_PERSONS_KILLED" } } },
								     { $sort: { total: 1 } }
								   ]);


		stat_collisions[index] = 0;
		db.createCollection("statCollisions");
		db.statCollisions.insert(collisions_bst.toArray());
		db.statCollisions.find().forEach(function(obj){    stat_collisions[index] += obj.total; });
		db.statCollisions.drop();
		
		}
	
	//Fourth statistic : % of agencies present on each street (we divide by the total number of different agencies within the best borough

	for(index in bst) {

		stat_services[index] = null;

		stat_services[index] = 100*db.services.distinct("Agency",{ BOROUGH: bbo,STREET_NAME: {$regex: bst[index], $options: "i"}}).length/db.services.distinct("Agency",{ BOROUGH: bbo}).length+"%";
	
			}


		print("\n***********The best BOROUGH is ===============> "+bbo+"\n");	
		print("***********The best STREETs in "+bbo+" are ==============> "+bst+"\n");

		//For each street we create a document containing the different statistics

		db.statistics.deleteMany({}); //To not have redundant results 

		db.statistics.insert([{ _id:"==============> "+bbo+" <==============="}]); //The best Borough
		
		var rank = 1 // The order of importance of each street

		for(index in bst) {


			db.statistics.insert([
					    
				{ _id: bst[index], ranking : rank, restaurant: stat_restaurant[index], wifi: stat_wifi[index], collisions: stat_collisions[index], services: stat_services[index] },
					     
			 ]
			);
			
			rank++;
		}


		print("\n\n\t\tFor a detailed results please type the following command =====> \t *** db.statistics.find().pretty() *** \t     <======\n");;
		
	}
   }
)



db.system.js.save(
   {
     _id: "showHelp",
     value : function() 
	{  

				print("\n\n/************************************************* WELCOME ****************************************************************************************/");
				print("/****************************************************** TO YOUR ***********************************************************************************/");
				print("/************************************************************ HELP ********************************************************************************/");
				print("/***																	        ***/");
				print("/***	                  *** PLEASE FOLLOW THE INSTRUCTIONS BELLOW TO HAVE THE ACCUTRATES RESULTS ***	                    		        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/***	1- IF YOU LOAD THE zakaria_dahani_nosql_project.js SCRIPT FOR THE FIRST TIME                                                            ***/");
				print("/***																	        ***/");
				print("/***        ==> YOU HAVE TO UPDATE THE DATABASE BY CALLING THE  updateNoSqlProjectDB() IN THE SHELL                    	       	                ***/");
				print("/***																	        ***/");
				print("/***	2- TO SHOW THE BEST BOROUGH, CALL THE chooseBestBorough() FUNCTION IN THE SHELL							        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/***	3- TO SHOW THE BESTS STREETS, CALL THE chooseBestStreet() FUNCTION IN THE SHELL							        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/***	4- TO SHOW THE GLOBAL STATISTICS, CALL THE showStatistics() FUNCTION IN THE SHELL						        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/***	5- TO SHOW THE HELP AGAIN, CALL THE showHelp() FUNCTION IN THE SHELL								        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/***	PS: IT TAKES SOME MINUTES TO HAVE THE RESULTS, BECAUSE THE TOTAL SIZE TO PROCESS IS ABOUT 7.354GB ESPECIALLY FOR THE UPDATE	        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/***																	        ***/");
				print("/**************************************************************************************************************************************************/");
				print("/**************************************************************************************************************************************************/");
				print("/**************************************************************************************************************************************************/");

	}



   }
)


				




/******************** Functions Call *************************************/

db.loadServerScripts(); //Loading Functions from the server

showHelp(); //Calling the showHelp() Function


//updateNoSqlProjectDB(); // Calling the updateNoSqlProjectDB() function

//showStatistics(); //Calling the functions showStatistics()

//db.statistics.find().pretty(); //Showing the results

























