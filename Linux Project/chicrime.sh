#!/bin/bash

							# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #


#------------------------------------------------------------------------ Start Of The Program --------------------------------------------------------------------------------------------------------#

#--------------------------------------------------------- Globals Variables Declaration & Initialization -----------------------------------------#

#We declare variables that will check the existence of each option in the "getopts" and we set them at "false"
#We also declare variables that will stock the argument of each option if it is required

	OPTION_h_EXIST=false;
	OPTION_v_EXIST=false;

	OPTION_f_EXIST=false;
	OPTION_f_ARG=""

	OPTION_l_EXIST=false;
	OPTION_c_EXIST=false;
	OPTION_r_EXIST=false;
	OPTION_t_EXIST=false;

	OPTION_T_EXIST=false;
	OPTION_T_ARG="";

	OPTION_d_EXIST=false;

	OPTION_D_EXIST= false;
	OPTION_D_ARG="";

	OPTION_Y_EXIST=false;
	OPTION_Y_ARG="";

	OPTION_A_EXIST=false;
	OPTION_A_ARG="";


#------------------------------------------------------------- Functions Calls -----------------------------------------------------------------------#

# For each commande in the Shell we call the function corresponding to the option mentionned
# We use here the function "source" that works exactly like the function "include()" used in some web programming languages like in "PHP", and it allows us to import code from a file within the specified # path mentionned as parameter
# The description of each function is mentionned within the coresponding file.


	source includes/functionInitOption.sh;  	# Variables Initialization

	source includes/functionExecuteOption.sh;	# Program Core : Options Execution


	source includes/featuresImplementation/functionHelpMessage.sh; 				# chicrime.sh -f <dataset> -h

	source includes/featuresImplementation/functionProgAuthor.sh; 				# chicrime.sh -f <dataset> -v

	source includes/featuresImplementation/functionShowPath.sh;				# chicrime.sh -f <dataset> -f <file>

	source includes/featuresImplementation/functionPrintList.sh;				# chicrime.sh -f <dataset> -l

	source includes/featuresImplementation/functionPrintCrimeNbr.sh;			# chicrime.sh -f <dataset> -c

	source includes/featuresImplementation/functionPrintCrimeSR.sh;				# chicrime.sh -f <dataset> -r

	source includes/featuresImplementation/functionListPrimaryType.sh;			# chicrime.sh -f <dataset> -t

	source includes/featuresImplementation/functionFilterResultPrimaryType.sh;		# chicrime.sh -f <dataset> -T <primarytype>

	source includes/featuresImplementation/functionListCrimeDescription.sh;			# chicrime.sh -f <dataset> -d		

	source includes/featuresImplementation/functionFilterResultDescription.sh;		# chicrime.sh -f <dataset> -D <description>

	source includes/featuresImplementation/functionFilterResultYear.sh;			# chicrime.sh -f <dataset> -Y <year>

	source includes/featuresImplementation/functionFilterResultArrested.sh;			# chicrime.sh -f <dataset> -A yes OR chicrime.sh -f <dataset> -A no



	#Call for the functions errorMessage_OPT and errorMessage_ARG if an option is invalid or a required argument is not found - OPT stands for OPTION, ARG stands for ARGUMENT - 

	# If an option is invalid (?)

	errorMessage_OPT()
	{

		echo "Error : INVALID OPTION: -$1 !!!"; 
		echo "Use option -h for more details";
	}

	# If a equired argument is not found (:)

	errorMessage_ARG()
	{

		echo "Error : Option -$1 require an argument !!!"; 
		echo "Use option -h for more details"; 
	}


	# Call for the getopts function in order to treat each option mentionned in the command line

	while getopts ":hvf:lcrtT:dD:Y:A:" option; do
	
	  case "$option" in
	
	
		# If a equired argument is not found (:), we call the function errorMessage_ARG.

		:) errorMessage_ARG $OPTARG ;
	 		exit;;
	
		# For each option we call the function_init_option to initialize the corresponding option and argument if required

		h) function_init_option $option ;; 			#Show basic help message and exit

		v) function_init_option $option ;;			#Show program's authors and exit  

		f) function_init_option $option "$OPTARG" ;;		#Path to the dataset file
	
		l) function_init_option $option ;; 			#Prints IDs, case numbers, dates, primary types,descriptions, blocks and GPS coordinates of crimes

		c) function_init_option $option ;; 			#Prints number of crimes

		r) function_init_option $option ;; 			#Prints the crime solving rate

		t) function_init_option $option ;; 			#List all different primary types of crimes

		T) function_init_option $option "$OPTARG" ;;		#Filter results on crimes where the primary type is <primarytype>

		d) function_init_option $option ;; 			#List all different descriptions of crimes

		D) function_init_option $option "$OPTARG" ;; 		#Filter results on crimes where the description is <description>

		Y) function_init_option $option "$OPTARG" ;; 		#Filter results on crimes which happened during year <year>

		A) function_init_option $option "$OPTARG" ;; 		#Filter results on crimes for which a person was arrested or (no one was arrested)


		# If an option is invalid (?), we call the function errorMessage_OPT

		?) errorMessage_OPT $OPTARG ;
			exit;;
	
	

		esac

	done

#--------------------------------------------------------- Call for the function_execute_option -----------------------------------------#

		function_execute_option;

#------------------------------------------------------------------------ End Of The Program --------------------------------------------------------------------------------------------------------#






