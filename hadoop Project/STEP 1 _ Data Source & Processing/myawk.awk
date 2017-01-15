#!/bin/bash/awk -f

						# ***** MSC BIG DATA --- Big Data Project --- DAHANI ZAKARIA ----- ***** #

#*** This is a sample of what we get before the awk script : (I removed many prix tag to have two pdv tag in the sample.

#		 <pdv id="1000001" latitude="4620114" longitude="519791" cp="01000" pop="R">

#		<prix nom="Gazole" id="1" maj="2013-09-23 09:19:53.795804" valeur="1325"/>
#		<prix nom="Gazole" id="1" maj="2013-09-24 11:17:54.984788" valeur="1325"/>
#		<prix nom="Gazole" id="1" maj="2013-09-25 09:43:55.516666" valeur="1325"/>
#		<prix nom="Gazole" id="1" maj="2013-09-26 09:20:45.099964" valeur="1315"/>
#		<prix nom="Gazole" id="1" maj="2013-09-27 10:24:56.571814" valeur="1315"/>
#		<prix nom="Gazole" id="1" maj="2013-09-27 11:20:31.270462" valeur="1312"/>
#		<prix nom="Gazole" id="1" maj="2013-09-28 09:32:18.002204" valeur="1312"/>
#		<prix nom="Gazole" id="1" maj="2013-09-29 10:19:10.632462" valeur="1312"/>
#		<prix nom="Gazole" id="1" maj="2013-10-01 08:46:08.229087" valeur="1312"/>
#		<prix nom="Gazole" id="1" maj="2013-10-02 09:24:38.200487" valeur="1309"/>

#		</pdv>
#		<pdv id="1000002" latitude="4621842" longitude="522767" cp="01000" pop="R">
#		<prix nom="Gazole" id="1" maj="2013-01-03 09:12:28.687127" valeur="1299"/>
#		<prix nom="Gazole" id="1" maj="2013-01-04 09:27:40.415383" valeur="1309"/>
#		<prix nom="Gazole" id="1" maj="2013-01-05 09:09:56.995296" valeur="1309"/>
#		<prix nom="Gazole" id="1" maj="2013-01-06 09:47:34.556167" valeur="1309"/>
#		<prix nom="Gazole" id="1" maj="2013-01-07 10:12:50.283467" valeur="1309"/>
#		<prix nom="Gazole" id="1" maj="2013-01-08 09:59:09.304395" valeur="1315"/>
#		<prix nom="Gazole" id="1" maj="2013-01-10 09:24:08.515181" valeur="1319"/>

#		</pdv>


# ******* awk script *****************
#********
#******** Each pdv node has severals price, so in orther to have all the price of the same pdv, we copy/remove the pdv node per id and we copy it in the beginning of each line containing the price tag, so we put the pdv tag #******** before each price tag.
#******** BUT WE CHANGE the pdv tag when we find the closing tag </pdv> and so on.
#********

# =======>  !!!! FOR YOUR INFORMAION : THE myawk.awk FILE SHOULD BE IN THE XMLData DIRECTORY , I put it there<==========

	BEGIN { 

			tag = "</pdv>" ; 	# changing point
			pdv_line = "";		# to put al the pdv tag
			change_pdv = "true";	# boolean variable that informs us if we chage the pdv tag or not
			FS = "\n";		# file separator
			
		      }

	# looping phase, each loop is a line in the xml file
		{ 		
				if(change_pdv == "true") {	
				
					pdv_line=$0;	# During the changing step, we store the curent pdv node in the pdv_line variable, in the beginning of the script it's the first line.

					change_pdv = "false"; # We change the varible to false until we reach the </pdv> tag.
				}		
				
				 if($0 != tag && $0 != pdv_line && $0 != "") { 
					
				# If the current line neither tag, pdv_line nor empty line (that's why I removed the space using the sed command 
				# otherwise I would use ($0 != " "), because each empty line begin with a blank space.

					$0=pdv_line$0; # we concatenate the pdv_line with the curent price node
					print $0; # the result will be printed in the output file

				
				}
				else if($0 == tag)
				{
				#If not, if the current line is equal to tag : </pdv>, the the change_pdv will be true, and we get the next pdv_line in the following loop. 
					change_pdv = "true";
						
									
				}
				
				

			
		}
		
		

	

