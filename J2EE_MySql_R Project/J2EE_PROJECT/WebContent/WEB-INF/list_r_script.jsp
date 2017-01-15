<%@ page pageEncoding="UTF-8" %>

<%@ page import="com.j2eeproject.mscbgd.R_CODE, java.util.ArrayList, java.util.List, javax.script.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="./CSS_CODE/style.css">
<title>Test</title>
</head>
<body>

   <table>
   
	  <thead>
	    <tr>
	      <th colspan="4">J2EE Project</th>
	    </tr>
	    <tr>
	      <th>Id</th>
	      <th>Name</th>
	      <th>Script</th>
	      <th colspan="2">Option</th>
	    </tr>
	  </thead>
	  
	  <tbody>
  
  
  <%  
  //We create a script engine manager:
  ScriptEngineManager manager = new ScriptEngineManager();
  //We create a Renjin engine:
  ScriptEngine engine = manager.getEngineByName("Renjin");
  
		//We retrieve the object list_script
		List<R_CODE> list = (List<R_CODE>)request.getAttribute("list_script");
		
		for(R_CODE r : list)
		{
			%>
				<tr>
	     			 <td>
	     			 	<% 
	     			 		out.println(r.getCodeId());
	     				%>
	     				
	     			 </td>
	     			 <td>
	     			 	
	     			 	<%
	     					out.println(r.getCodeName());
	     			 	%>
	     			 
	     			 </td>
	     			 <td>
	     			 	
	     			 	<%
	     			 		out.println("<a href=\"javascript:alert('"+engine.eval(r.getCodeScript())+"')\">Execute</a>");
	     			 	%>
	     			 
	     			 </td>
	     			 <td>
				       
				        <a href="form?id_edit=<% out.print(r.getCodeId()); %>&name=<% out.print(r.getCodeName()); %>&script=<% out.print(r.getCodeScript()); %>"><img src="./imgs/edit.png" alt="edit" /></a>
				        <a href="r_table_script?id_delete=<% out.print(r.getCodeId()); %>"><img src="./imgs/trash.png" alt="delete" /></a>
				      
				      </td>
				   
				  </tr> 
				 
			<% 
			    
     			 
     }
	
	%>
	
		</tbody>
	
	</table>

</body>
</html>