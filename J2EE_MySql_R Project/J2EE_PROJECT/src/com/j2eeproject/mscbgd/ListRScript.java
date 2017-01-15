package com.j2eeproject.mscbgd;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListRScript
 */

@WebServlet("/ListRScript")
public class ListRScript extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//We create an object dbExtract to access to the Data Bases j2eeproject
	//and to call the method for Extrating and Deleting data from R_table
	ConnectDataBase db = new ConnectDataBase();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// We retrieve the parametre id_delete send by the delete url in the list_r_script.jsp page
		if(request.getParameter("id_delete") != null)
		{
			int id = Integer.parseInt(request.getParameter("id_delete"));
			
			//We call the method deleteReccord to delete the reccord that corresponds to the given id
			db.deleteReccord(id);
		}
		
		//The return of the method called is a list generic type of R_CODE
		List<R_CODE> r_code = db.extractReccord();
		
		//We put the object r_code that contains all the reccord from the R_table
		//as a value of the list_script attribute
		request.setAttribute("list_script", r_code);
		
		//We forwad the request to the list_r_script.jsp that will list all the scripts
		this.getServletContext().getRequestDispatcher("/WEB-INF/list_r_script.jsp").forward(request, response);		

	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
