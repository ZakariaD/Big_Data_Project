#!/bin/bash

				
							# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- chicrime.sh -f <dataset> -A yes OR chicrime.sh -f <dataset> -A no -----------------------------------------#


filterResultArrest()
{
	arg_arrested="";

	# We replace the "yes" or "no" in the command line with "true" or "false" so that it will match with the ones in the file

	if [[ $1 == "yes" ]]			#Filter results on crimes for which a person was arrested
	
	then

		arg_arrested="true";

	elif [[ $1 == "no" ]]			#Filter results on crimes for which no one was arrested
	
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
				if($9 == "'"$arg_arrested"'") { 
					
					print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,"(",$20,";",$21,")","\n";
				

				}
			
		}
				    
             ' Crimes_-_2001_to_present.csv

}
