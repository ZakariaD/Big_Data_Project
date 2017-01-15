#!/bin/bash

						# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- chicrime.sh -f <dataset> -h -----------------------------------------#


helpMessage()
{
	echo "
-h 			Show basic help message 

-v 			Show program's authors 

-f <file> 		Path to the dataset file

-l			Prints IDs, case numbers, dates, primary types, 
			descriptions, blocks and GPS coordinates of crimes

-c			Prints number of crimes

-r			Prints the crime solving rate

-t			List all different primary types of crimes

-T <primarytype>	Filter results on crimes where the primary type is <primarytype>

-d			List all different descriptions of crimes

-D <description>	Filter results on crimes where the description is <description>

-Y <year>		Filter results on crimes which happened during year <year>

-A yes			Filter results on crimes for which a person was arrested

-A no			Filter results on crimes for which no one was arrested
		
		
	   "
		
}
