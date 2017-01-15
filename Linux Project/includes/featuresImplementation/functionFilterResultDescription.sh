#!/bin/bash


							# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- # chicrime.sh -f <dataset> -D <description> -----------------------------------------#

# We treat all the possibles combinations mentionned in the function_execute_option that correspond to the option D


filterResultDesc()
{
	arg_description=$1;
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

	# In the awk print function, we could simply use $0, but there is a "," in the location colone

	awk '
		BEGIN { FS = "," ;}

		{ 	
				if($7 == "'"$arg_description"'" && $18 == "'"$arg_year"'" && $9 == "'"$arg_arrested"'") { 
					
					print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,"(",$20,";",$21,")","\n";
					
				
				}
			
				else if($7 == "'"$arg_description"'" && $18 == "'"$arg_year"'" && "'"$arg_arrested"'" == "") { 
					
					print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,"(",$20,";",$21,")","\n";
					
				
				}

				else if($7 == "'"$arg_description"'" && "'"$arg_year"'" == "" && $9 == "'"$arg_arrested"'") { 
					
					print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,"(",$20,";",$21,")","\n";
					
				
				}
			
				else if($7 == "'$arg_description'" && "'"$arg_year"'" == "" && "'"$arg_arrested"'" == "") { 
					
					print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,"(",$20,";",$21,")","\n";
					
				
				}

				
			
		}
				    
             ' Crimes_-_2001_to_present.csv

}
