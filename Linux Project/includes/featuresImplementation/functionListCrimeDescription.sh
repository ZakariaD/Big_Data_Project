#!/bin/bash

						# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- chicrime.sh -f <dataset> -d -----------------------------------------#

# We treat all the possibles combinations mentionned in the function_execute_option that correspond to the option d

listCrimeDescription()
{
	arg_primary_type=$1;
	arg_year=$2;
	arg_arrested="";
	
	# We replace the "yes" or "no" in the command line with "true" or "false" so that it will match with the ones in the file

	if [[ $3 == "yes" ]]
	then

		arg_arrested="true";

	elif [[ $3 == "no" ]]
	then

		arg_arrested="false";
	fi

	# In order to avoid problems with special caracter such as spaces, we use he double quotes "" around each variable within the awk command
	# Normaly we could use simply the "' '" quotes around variables but we will have the message "runaway string constant" if there is a space in the alue of the variable
	# that why we added another double quotes inside the "' '" quotes

	# In order to print the differents descriptions, we create 2 arrays named originalArray[] and finalArray[]
	# In the finalArray[] we will just the differents values present in the originalArray[]
	# To do so we have to check case in the originalArray[] exist in the finalArray[] that's why we created boolean variable boolean_exist

	awk '
		BEGIN { 
			FS = "," ;
			boolean_exist = "false" ;
			counter = 1 ;
			n = 1;
			print "\nPlease wait until the processing is done ...\n";
			print "With n > 1 000 000 it will take more time to process. You can test with n = 10 , 100, 1 000 or 10 000 it works in a fews seconds\n";
			
		      }

		NR >= 2 { 
					
				if($6 == "'"$arg_primary_type"'" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
					
				}
					

				else if($6 == "'"$arg_primary_type"'" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
		
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;

				}

				else if($6 == "'"$arg_primary_type"'" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
				
				}
			
				else if("'"$arg_primary_type"'" == "" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
				
				}
			
				else if($6 == "'"$arg_primary_type"'" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
				
				}
						
				else if("'"$arg_primary_type"'" == "" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
				
				}
					
				else if("'"$arg_primary_type"'" == "" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
				
				}

				else if("'"$arg_primary_type"'" == "" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") { 
					
					originalArray[n] = $7;
							
					finalArray[n] = 0;
				
					n=n+1;
				
				}

							
		}
		
		END { 

				for (i=1;i<=n;i++) {
				
					for (j=i;j<=n;j++) {

						if(originalArray[i] == originalArray[j]) {

							for(k=1;k<=n;k++) {
							
								if(finalArray[k] == originalArray[i]) {
								
									boolean_exist = "true";
									break;
		
								}
							
								else { boolean_exist = "false" ; }

							}
				
							if(boolean_exist == "false") {

								finalArray[counter] = originalArray[i];
								counter += 1;
								boolean_exist = "true" ;
	
							}

						}

					}
					

				}
			
			
			for (i=1;i<=counter-1; i++) {
				
				print finalArray[i],"";
			}
			
		    }

	   ' Crimes_-_2001_to_present.csv


	
}
