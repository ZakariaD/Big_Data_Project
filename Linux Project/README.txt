Program Version 1.0 04/10/2016

Project Name : MSC BIG DATA - SHELL SCRIPTING

Project Author : DAHANI ZAKARIA


I. Files list
-------------

functionInitOption.sh	  			Variables Initialization

functionExecuteOption.sh			Program Core : Options Execution

functionHelpMessage.sh	 			Show basic help message

functionProgAuthor.sh 				Show program's authors

functionShowPath.sh				Path to the dataset file

functionPrintList.sh				Prints IDs, case numbers, dates, primary types,descriptions, blocks and GPS coordinates of crimes

functionPrintCrimeNbr.sh			Prints number of crimes

functionPrintCrimeSR.sh				Prints the crime solving rate

functionListPrimaryType.sh			List all different primary types of crimes

functionFilterResultPrimaryType.sh		Filter results on crimes where the primary type is <primarytype>

functionListCrimeDescription.sh			List all different descriptions of crimes

functionFilterResultDescription.sh		Filter results on crimes where the description is <description>

functionFilterResultYear.sh			Filter results on crimes which happened during year <year>

functionFilterResultArrested.sh			Filter results on crimes for which a person was arrested or (no one was arrested)


II. Files Tree
--------------

All the files listed above are in the includes directory and also are, except the first 2 ones, in the featuresImplementation directory. 
The Data Set, the README.txt file, the chrime.sh file and the includes directory must be in the same directory.

III. Program Design
-------------------

The program is written in bash and awk scripting langage.

The program is designed as follow :


Command Line (options) ---> source (includes) ---> getopts ---> function_init_option (or error handling) ---> function_execute_option ---> Call for funcion that correspond to the options


IV. General Usage Notes
-----------------------

To start the user have to write first the instruction : chicrime.sh -f <dataset>

This is the liste of the options that the user can add to the obove instruction :

-h, -v, -l, -c, -r, -t, -T <argument>, -d, -D <argument>, -Y <argument>, -A <argument>





