#!/bin/bash

						# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- chicrime.sh -f <dataset> -r -----------------------------------------#

# We treat all the possibles combinations mentionned in the function_execute_option that correspond to the option r



printCrimeSR() 
{	
	arg_primary_type=$1;
	arg_description=$2;
	arg_year=$3;
		
	# In order to avoid problems with special caracter such as spaces, we use he double quotes "" around each variable within the awk command
	# Normaly we could use simply the "' '" quotes around variables but we will have the message "runaway string constant" if there is a space in the alue of the variable
	# that why we added another double quotes inside the "' '" quotes

	# In order to print number of crimes, we create 8 arrays named count_true[1], count_true[2], ...,count_true[8]
	# Each array correspond to one combination of options

	awk '

	BEGIN { 
			FS = ",";

			for (j=1;j<=8;j++) {

				count_true[j]= 0;
			}			
			
		      }

		{ 		
			if($9 == "true") {

				
						if($6 == "'"$arg_primary_type"'" && $7 == "'"$arg_description"'" && $18 == "'"$arg_year"'") { 
					
							count_true[1] += 1;
					
						}
				
						else if($6 == "'"$arg_primary_type"'" && $7 == "'"$arg_description"'" && "'"$arg_year"'" == "") { 
					
							count_true[2] += 1;
				
						}
			
						else if($6 == "'"$arg_primary_type"'" && "'"$arg_description"'" == "" && $18 == "'"$arg_year"'") { 
					
							count_true[3] += 1;
				
						}

						else if("'"$arg_primary_type"'" == "" && $7 == "'"$arg_description"'" && $18 == "'"$arg_year"'") { 
					
							count_true[4] += 1;
				
						}

						else if($6 == "'"$arg_primary_type"'" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "") { 
					
							count_true[5] += 1;
				
						}

						else if("'"$arg_primary_type"'" == "" && $7 == "'"$arg_description"'" && "'"$arg_year"'" == "") { 
					
							count_true[6] += 1;
				
						}

						else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && $18 == "'"$arg_year"'") { 
					
							count_true[7] += 1;
				
						}

						else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "") { 
					
							count_true[8] += 1;
				
						}
				}
								

		     }
					    
	END { 

			if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "") {

				printf("\n\tThe Crime Solving Rate of the type \"'"$arg_primary_type"'\" with description \"'"$arg_description"'\" for the year \"'"$arg_year"'\" is :\t %.2f",100 * count_true[1]/(NR - 1));

				print "%\n";

			}
			
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "") {

				printf("\n\tThe Crime Solving Rate of the type \"'"$arg_primary_type"'\" with description \"'"$arg_description"'\" is :\t %.2f",100 * count_true[2] / (NR - 1));

				print "%\n";

			}
			
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "") {

				printf("\n\tThe Crime Solving Rate of the type \"'"$arg_primary_type"'\" for the year \"'"$arg_year"'\" is :\t %.2f",100 * count_true[3] / (NR - 1));

				print "%\n";

			}
			
			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "") {

				printf("\n\tThe Crime Solving Rate with description \"'"$arg_description"'\" for the year \"'"$arg_year"'\" is :\t %.2f",100 * count_true[4] / (NR - 1));

				print "%\n";

			}
				
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "") {

				printf("\n\tThe Crime Solving Rate of the type \"'"$arg_primary_type"'\" is :\t %.2f",100 * count_true[5] / (NR - 1));

				print "%\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "") {

				printf("\n\tThe Crime Solving Rate with description \"'"$arg_description"'\" is :\t %.2f",100 * count_true[6] / (NR - 1));

				print "%\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "") {

				printf("\n\tThe Crime Solving Rate for the year \"'"$arg_year"'\" is :\t %.2f",100 * count_true[7] / (NR - 1));

				print "%\n";

			}
	
			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "") {

				printf("\n\tThe Crime Solving Rate is :\t %.2f",100 * count_true[8] / (NR - 1));

				print "%\n";

			}

		     }
				    
            	     ' Crimes_-_2001_to_present.csv

}
