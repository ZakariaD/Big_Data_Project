#!/bin/bash


							# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- Options treatment and execution-----------------------------------------#

# Here is the function called function_execute_option that will check the existence of each option and execute the required treatment


function_execute_option()
{
	
	if [[ $OPTION_f_EXIST == true ]]	# Each command line have to start with : chicrime.sh -f <dataset>, so we check in first place the exitence of the option "f" 
	then
		
		# For each existing option we call the correspondinf function and we set it to false to not be treated twice
			
				
		if [[ $OPTION_h_EXIST == true ]]
		then

			helpMessage;
			OPTION_h_EXIST= false;
			exit;

		
		elif [[ $OPTION_v_EXIST == true ]]
		then

			progAuthor;
			OPTION_v_EXIST= false;
			exit;


		#We treat all the possibles combinations that could occure with the following options 
		#We put the double quotes "" around the variables to avoid problems such as with specials caracters (like spaces in the description) when the parameters 
		#--- will be send to the corresponding function

		elif [[ $OPTION_t_EXIST == true ]]
		then
		
		

			if [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then
				
				listPrimaryType "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_t_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

		

			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				listPrimaryType "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_t_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				listPrimaryType "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_t_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				listPrimaryType "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_t_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;

							
			elif [[ $OPTION_D_EXIST == true ]]
			then

				listPrimaryType "$OPTION_D_ARG" "" "";

				OPTION_t_EXIST= false;
				OPTION_D_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true ]]
			then

				listPrimaryType "" "$OPTION_Y_ARG" "";

				OPTION_t_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_A_EXIST == true ]]
			then

				listPrimaryType "" "" "$OPTION_A_ARG";

				OPTION_t_EXIST= false;
				OPTION_A_EXIST= false;

			else

				listPrimaryType;

				OPTION_t_EXIST= false;
																			
			fi



		elif [[ $OPTION_d_EXIST == true ]]
		then
		
			
			if [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then
				
				listCrimeDescription "$OPTION_T_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_d_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

				
			elif [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				listCrimeDescription "$OPTION_T_ARG" "$OPTION_Y_ARG" "";

				OPTION_d_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				listCrimeDescription "$OPTION_T_ARG" "" "$OPTION_A_ARG";

				OPTION_d_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_A_EXIST= false;

						
			elif [[ $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				listCrimeDescription "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_d_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

							
			elif [[ $OPTION_T_EXIST == true ]]
			then

				listCrimeDescription "$OPTION_T_ARG" "" "";

				OPTION_d_EXIST= false;
				OPTION_T_EXIST= false;

				
			elif [[ $OPTION_Y_EXIST == true ]]
			then

				listCrimeDescription "" "$OPTION_Y_ARG" "";

				OPTION_d_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_A_EXIST == true ]]
			then

				listCrimeDescription "" "" "$OPTION_A_ARG";

				OPTION_d_EXIST= false;
				OPTION_A_EXIST= false;

			else

				listCrimeDescription;

				OPTION_d_EXIST= false;
																			
			fi

		

		elif [[ $OPTION_c_EXIST == true ]]
		then
		
			
			if [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then
				
				printCrimeNbr "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

					
			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "" "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

						
			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "$OPTION_D_ARG" "" "";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;

					
			elif [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "" "$OPTION_Y_ARG" "";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "" "" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printCrimeNbr "" "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_c_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "" "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "" "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_T_EXIST == true ]]
			then

				printCrimeNbr "$OPTION_T_ARG" "" "" "" "";

				OPTION_c_EXIST= false;
				OPTION_T_EXIST= false;

			elif [[ $OPTION_D_EXIST == true ]]
			then

				printCrimeNbr "" "$OPTION_D_ARG" "" "";

				OPTION_c_EXIST= false;
				OPTION_D_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true ]]
			then

				printCrimeNbr "" "" "$OPTION_Y_ARG" "";

				OPTION_c_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_A_EXIST == true ]]
			then

				printCrimeNbr "" "" "" "$OPTION_A_ARG";

				OPTION_c_EXIST= false;
				OPTION_A_EXIST= false;

			else

				printCrimeNbr;

				OPTION_c_EXIST= false;
																			
			fi
		


		elif [[ $OPTION_l_EXIST == true ]]
		then
		
				
			if [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then
				
				printList "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

						
			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printList "" "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "$OPTION_D_ARG" "" "";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;

				
			elif [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "" "$OPTION_Y_ARG" "";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "" "" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printList "" "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_l_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printList "" "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				printList "" "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_T_EXIST == true ]]
			then

				printList "$OPTION_T_ARG" "" "" "" "";

				OPTION_l_EXIST= false;
				OPTION_T_EXIST= false;

			elif [[ $OPTION_D_EXIST == true ]]
			then

				printList "" "$OPTION_D_ARG" "" "";

				OPTION_l_EXIST= false;
				OPTION_D_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true ]]
			then

				printList "" "" "$OPTION_Y_ARG" "" "";

				OPTION_l_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_A_EXIST == true ]]
			then

				printList "" "" "" "$OPTION_A_ARG";

				OPTION_l_EXIST= false;
				OPTION_A_EXIST= false;
			else

				printList;

				OPTION_l_EXIST= false;
																			
			fi	



		elif [[ $OPTION_r_EXIST == true ]]
		then
		
			if [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then
				
				printCrimeSR "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG";

				OPTION_r_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_D_EXIST == true ]]
			then

				printCrimeSR "$OPTION_T_ARG" "$OPTION_D_ARG" "";

				OPTION_r_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;

			elif [[ $OPTION_T_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printCrimeSR "$OPTION_T_ARG" "" "$OPTION_Y_ARG";

				OPTION_r_EXIST= false;
				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;
	
			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				printCrimeSR "" "$OPTION_D_ARG" "$OPTION_Y_ARG";

				OPTION_r_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_T_EXIST == true ]]
			then

				printCrimeSR "$OPTION_T_ARG" "" "" "";

				OPTION_r_EXIST= false;
				OPTION_T_EXIST= false;

			elif [[ $OPTION_D_EXIST == true ]]
			then

				printCrimeSR "" "$OPTION_D_ARG" "";

				OPTION_r_EXIST= false;
				OPTION_D_EXIST= false;

			elif [[ $OPTION_Y_EXIST == true ]]
			then

				printCrimeSR "" "" "$OPTION_Y_ARG" "";

				OPTION_r_EXIST= false;
				OPTION_Y_EXIST= false;
		
			else

				printCrimeSR;

				OPTION_r_EXIST= false;
																			
			fi

			
		
		elif [[ $OPTION_T_EXIST == true ]]
		then
		
			if [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then
				
				filterResultPrimaryType "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_Y_EXIST == true ]]
			then

				filterResultPrimaryType "$OPTION_T_ARG" "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_D_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				filterResultPrimaryType "$OPTION_T_ARG" "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;
		
			elif [[ $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then

				filterResultPrimaryType "$OPTION_T_ARG" "" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

								
			elif [[ $OPTION_D_EXIST == true ]]
			then

				filterResultPrimaryType "$OPTION_T_ARG" "$OPTION_D_ARG" "" "";

				OPTION_T_EXIST= false;
				OPTION_D_EXIST= false;

				
			elif [[ $OPTION_Y_EXIST == true ]]
			then

				filterResultPrimaryType "$OPTION_T_ARG" "" "$OPTION_Y_ARG" "";

				OPTION_T_EXIST= false;
				OPTION_Y_EXIST= false;

			elif [[ $OPTION_A_EXIST == true ]]
			then

				filterResultPrimaryType "$OPTION_T_ARG" "" "" "$OPTION_A_ARG";

				OPTION_T_EXIST= false;
				OPTION_A_EXIST= false;

			else

				filterResultPrimaryType "$OPTION_T_ARG" "" "" "";

				OPTION_T_EXIST= false;
																			
			fi



		elif [[ $OPTION_D_EXIST == true ]]
		then
		
			if [[ $OPTION_Y_EXIST == true && $OPTION_A_EXIST == true ]]
			then
				
				filterResultDesc "$OPTION_D_ARG" "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

												
			elif [[ $OPTION_Y_EXIST == true ]]
			then

				filterResultDesc "$OPTION_D_ARG" "$OPTION_Y_ARG" "";

				OPTION_D_EXIST= false;
				OPTION_Y_EXIST= false;

				
			elif [[ $OPTION_A_EXIST == true ]]
			then

				filterResultDesc "$OPTION_D_ARG" "" "$OPTION_A_ARG";

				OPTION_D_EXIST= false;
				OPTION_A_EXIST= false;

			else

				filterResultDesc "$OPTION_D_ARG" "" "";

				OPTION_D_EXIST= false;
																			
			fi


			
		elif [[ $OPTION_Y_EXIST == true ]]
		then
		
			if [[ $OPTION_A_EXIST == true ]]
			then

				filterResultYear "$OPTION_Y_ARG" "$OPTION_A_ARG";

				OPTION_Y_EXIST= false;
				OPTION_A_EXIST= false;

						
			else

				filterResultYear "$OPTION_Y_ARG" "";

				OPTION_Y_EXIST= false;
																			
			fi

		elif [[ $OPTION_A_EXIST == true ]]
		then
		
					
				filterResultArrest "$OPTION_A_ARG";

				OPTION_A_EXIST= false;


		else

				showPath "$OPTION_f_ARG";
	

		fi

	


	fi

}
