/**
 * 
 * @author 		  : Zakaria Dahani
 *   
 * @description	  : Executing R code using J2EE
 * 
 * @title		  :  R code within J2EE
 * 
 * @version		  : 1.0
 *
 * @Date_édition   : Friday 28, 2016
 *  
 */

/**
 * Servlet implementation class From : the Main servlet wich allows to show the from page (form_view.jsp)
 */


package com.j2eeproject.mscbgd;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.Statement;

import javax.script.*;

@WebServlet("/Form")
public class Form extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//We create an object db to access to the Data Bases j2eeproject
	//and to call the methods for Adding and Updating data in R_table
	
	ConnectDataBase db = new ConnectDataBase();
	
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		this.getServletContext().getRequestDispatcher("/WEB-INF/form_view.jsp").forward(request, response);		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String add_update = request.getParameter("add_update");
		
		//we checkthe values of the variable add_update
		if(add_update.equals("yes_no"))
		{
			
			//We create an instance from R_CODE
			R_CODE r_code = new R_CODE();
			
			//We retrieve parameter send from the form
			r_code.setCodeName(request.getParameter("code_name"));
			r_code.setCodeScript(request.getParameter("code_script"));	
			
			//We add the reccord to the data base using the addReccord Method from the class ConnectDataBase
			db.addReccord(r_code);
			
			//We forward the request to the coresponding directory see : web.xml
			this.getServletContext().getRequestDispatcher("/r_table_script").forward(request, response);	
		}
		else if(add_update.equals("no_yes"))
		{
			
			int id = Integer.parseInt(request.getParameter("code_id"));
			String name = request.getParameter("code_name");
			String script = request.getParameter("code_script");
			
			//We update the reccord to the data bases using the updateReccord Method from the class ConnectDataBase
			db.updateReccord(id, name, script);
			
			//We forward the request to the coresponding directory see : web.xml
			this.getServletContext().getRequestDispatcher("/r_table_script").forward(request, response);
		}
			

		
		
	    
	}
	
	
	

}
