#!/bin/bash


								# ***** MSC BIG DATA --- SHELL SCRIPTING PROJECT ----- ***** #



#--------------------------------------------------------- Globals Variables Initialization -----------------------------------------#

# Here is the function called function_init_option that will initializes the globals variables corresponding to the send parameters from the getopts statement: option and argument



function_init_option()
{
	
	if [[ $1 == "h" ]]
	then
		OPTION_h_EXIST=true;
			
	elif [[ $1 == "v" ]]
	then
		OPTION_v_EXIST=true;
		
	elif [[ $1 == "f" ]]
	then
		OPTION_f_EXIST=true;
		OPTION_f_ARG=$2;
	
			
	elif [[ $1 == "l" ]]
	then
		OPTION_l_EXIST=true;
	
	elif [[ $1 == "c" ]]
	then
		OPTION_c_EXIST=true;

	elif [[ $1 == "r" ]]
	then
		OPTION_r_EXIST=true;

	elif [[ $1 == "t" ]]
	then
		OPTION_t_EXIST=true;
	
	elif [[ $1 == "T" ]]
	then
		OPTION_T_EXIST=true;
		OPTION_T_ARG=$2;

	elif [[ $1 == "d" ]]
	then
		OPTION_d_EXIST=true;

	elif [[ $1 == "D" ]]
	then
		OPTION_D_EXIST=true;
		OPTION_D_ARG=$2;

	elif [[ $1 == "Y" ]]
	then
		OPTION_Y_EXIST=true;
		OPTION_Y_ARG=$2;

	elif [[ $1 == "A" ]]
	then
		OPTION_A_EXIST=true;
		OPTION_A_ARG=$2;
	
	fi

}
