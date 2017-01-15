package com.j2eeproject.mscbgd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * class ConnectDataBase : allows to connect to the j2eeproject data base,
 *  add reccord, extract, update and delete reccord from the R_table
 */

public class ConnectDataBase 
{

	private Connection connection;
	private Statement statement;
    private ResultSet result;
   
    List<R_CODE> listScript = new ArrayList<R_CODE>();
    
    public ConnectDataBase()
    {
    	this.connection = null;
    	this.statement = null;
        this.result = null;
    }

    //Method to connect to the data base using the corresponding driver, see WEB-INF/lib
    private void loadDatabase() 
	{
		/* We load the MySql JDBC Driver */
		try {
		    Class.forName( "com.mysql.jdbc.Driver" );
		} catch ( ClassNotFoundException e ) {

		}
        
		//We connect to the j2eeproject data bases
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2eeproject", "root", "zd3220");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
	}
	
    //method to add reccord in the R_table
	public void addReccord(R_CODE r_code)
	{
		//we connect to the data bases
		loadDatabase();
        
		//we use the prepared request to add reccord
        try {
        	
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO R_table(code_name, code_script) VALUES(?, ?);");
            preparedStatement.setString(1, r_code.getCodeName()); // we add the code name
            preparedStatement.setString(2, r_code.getCodeScript()); // we add the code script
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
	
	}
	
	//Method to extract reccord from the R_table
	public List<R_CODE> extractReccord()
	{
		//we connect to the data bases
		loadDatabase();

		try 
		{
			// we create a statement to execute queries
			statement = connection.createStatement();
		

	        // Query execution
	        result = statement.executeQuery("SELECT id,code_name, code_script FROM R_table;");
	
	        // we retrieve data
	        while (result.next()) 
	        {
	        	int code_id = result.getInt("id");
	            String code_name = result.getString("code_name");
	            String code_script = result.getString("code_script");
	            
	            R_CODE r_code = new R_CODE();
	            
	            r_code.setCodeId(code_id);
	            r_code.setCodeName(code_name);
	            r_code.setCodeScript(code_script);
	            
	            // For each loop, we add the r_code object to the list
	            listScript.add(r_code);
	        
	        }
	        
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
        return listScript;

	}
	
	 //method to modify reccord in the R_table
	public void updateReccord(int code_id, String code_name,String code_script)
	{
		//we connect to the data bases
		loadDatabase();
        
		//we use the prepared request to modify reccord
        try {
        	
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE R_table SET code_name=? , code_script=? where id=?;");
            preparedStatement.setString(1, code_name); // we add the new code name
            preparedStatement.setString(2, code_script); // we add the new code script
            preparedStatement.setInt(3, code_id); // we specify the code id

            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
	
	}
	
	//method to delete reccord in the R_table
	public void deleteReccord(int code_id)
	{
		//we connect to the data bases
		loadDatabase();
        
		//we use the prepared request to delete reccord
        try {
        	
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM R_table WHERE id=?;");
            preparedStatement.setInt(1, code_id); // we specify the id

            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
	
	}
	
}









