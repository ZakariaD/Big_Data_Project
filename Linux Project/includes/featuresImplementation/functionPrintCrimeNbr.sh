#!/bin/bash

						# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- chicrime.sh -f <dataset> -c -----------------------------------------#

# We treat all the possibles combinations mentionned in the function_execute_option that correspond to the option c


printCrimeNbr() 
{
	arg_primary_type=$1;
	arg_description=$2;
	arg_year=$3;
	arg_arrested="";
	

	# We replace the "yes" or "no" in the command line with "true" or "false" so that it will match with the ones in the file


	if [[ $4 == "yes" ]]
	then

		arg_arrested="true";

	elif [[ $4 == "no" ]]
	then

		arg_arrested="false";
	fi
	

	# In order to avoid problems with special caracter such as spaces, we use he double quotes "" around each variable within the awk command
	# Normaly we could use simply the "' '" quotes around variables but we will have the message "runaway string constant" if there is a space in the alue of the variable
	# that why we added another double quotes inside the "' '" quotes

	# In order to print number of crimes, we create 15 arrays named nbrCrime[1], nbrCrime[2], ...,nbrCrime[15]
	# Each array correspond to one combination of options


	awk '
		BEGIN { 
			FS = ",";

			for (j=1;j<=15;j++) {

				nbrCrime[j]= 0;
			}			
			
		      }

		    { 		
				if($6 == "'"$arg_primary_type"'" && $7 == "'"$arg_description"'" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[1] += 1;
					
					
				
				}
				
				else if($6 == "'"$arg_primary_type"'" && $7 == "'"$arg_description"'" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
		
					nbrCrime[2] += 1;

				}

				else if($6 == "'"$arg_primary_type"'" && $7 == "'"$arg_description"'" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[3] += 1;
				
				}
			
				else if($6 == "'"$arg_primary_type"'" && "'"$arg_description"'" == "" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[4] += 1;
				
				}

				else if("'"$arg_primary_type"'" == "" && $7 == "'"$arg_description"'" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[5] += 1;
				
				}

				else if($6 == "'"$arg_primary_type"'" && $7 == "'"$arg_description"'" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") { 
					
					nbrCrime[6] += 1;
				
				}

				else if($6 == "'"$arg_primary_type"'" && "'"$arg_description"'" == "" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
					
					nbrCrime[7] += 1;
				
				}
					
				else if($6 == "'"$arg_primary_type"'" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[8] += 1;
				
				}
				
				else if("'"$arg_primary_type"'" == "" && $7 == "'"$arg_description"'" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
					
					nbrCrime[9] += 1;
				
				}
					
				else if("'"$arg_primary_type"'" == "" && $7 == "'"$arg_description"'" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[10] += 1;
				
				}

				else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[11] += 1;
				
				}

				else if($6 == "'"$arg_primary_type"'" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") { 
					
					nbrCrime[12] += 1;
				
				}

				else if("'"$arg_primary_type"'" == "" && $7 == "'"$arg_description"'" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") { 
					
					nbrCrime[13] += 1;
				
				}

				else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
					
					nbrCrime[14] += 1;
				
				}

				else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					nbrCrime[15] += 1;
				
				}
							

		     }
			
		 END { 

			

			if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" with description \"","'"$arg_description"'", 
					"\" during year \"","'"$arg_year"'","\" for which a person was arrested is :\n\n",nbrCrime[1],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" with description \"","'"$arg_description"'", 
					"\" during year \"","'"$arg_year"'","\" for which no one was arrested is :\n\n",nbrCrime[1],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" with description \"","'"$arg_description"'", 
						"\" during year \"","'"$arg_year"'","\" is :\n\n",nbrCrime[2],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" with description \"","'"$arg_description"'", 
						"\" for which a person was arrested is :\n\n",nbrCrime[3],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" with description \"","'"$arg_description"'", 
						"\" for which no one was arrested is :\n\n",nbrCrime[3],"\n";

			}

			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" during year \"","'"$arg_year"'",
						"\" for which a person was arrested is :\n\n",nbrCrime[4],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\"during year \"","'"$arg_year"'",
						"\" for which no one was arrested is :\n\n",nbrCrime[4],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes with description\"","'"$arg_description"'","\" during year \"","'"$arg_year"'",
						"\" for which a person was arrested is :\n\n",nbrCrime[5],"\n";

			}
			
			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes with description \"","'"$arg_description"'","\" during year \"","'"$arg_year"'",
						"\" for which no one was arrested is :\n\n",nbrCrime[5],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" with description \"","'"$arg_description"'", 
						"\" is :\n\n",nbrCrime[6],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" during year \"","'"$arg_year"'","\" is :\n\n",nbrCrime[7],"\n";

			}
			
			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" for which a person was arrested is :\n\n",nbrCrime[8],"\n";

			}

			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" for which no one was arrested is :\n\n",nbrCrime[8],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes with description \"","'"$arg_description"'", 
							"\" during year \"","'"$arg_year"'","\" is :\n\n",nbrCrime[9],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes with description \"","'"$arg_description"'","\" for which a person was arrested is :\n\n",nbrCrime[10],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes with description \"","'"$arg_description"'","\" for which no one was arrested is :\n\n",nbrCrime[10],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes during year \"","'"$arg_year"'","\" for which a person was arrested is :\n\n",nbrCrime[11],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes during year \"","'"$arg_year"'","\" for which no one was arrested is :\n\n",nbrCrime[11],"\n";

			}

			else if("'"$arg_primary_type"'" != "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes of type \"","'"$arg_primary_type"'","\" is :\n\n",nbrCrime[12],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" != "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes with description \"","'"$arg_description"'","\" is :\n\n",nbrCrime[13],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" != "" && "'"$arg_arrested"'" == "") {

				print "\nthe number of crimes during year \"","'"$arg_year"'","\" is :\n\n",nbrCrime[14],"\n";

			}
						
			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "true") {

				print "\nthe number of crimes for which a person was arrested is :\n\n",nbrCrime[15],"\n";

			}

			else if("'"$arg_primary_type"'" == "" && "'"$arg_description"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "false") {

				print "\nthe number of crimes for which no one was arrested is :\n\n",nbrCrime[15],"\n";

			}

			else {

				print "\nthe number of crimes is :\n\n",NR,"\n";

			}

		     }
				    
            	     ' Crimes_-_2001_to_present.csv
}
