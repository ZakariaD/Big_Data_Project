<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>CodeMirror: R mode</title>
<meta charset="utf-8"/>
<link rel=stylesheet href="./CSS_CODE/docs.css">

<link rel="stylesheet" href="./CSS_CODE/codemirror.css">
<script src="./JS_CODE/codemirror.js"></script>
<script src="./JS_CODE/r.js"></script>
<style>_
      .CodeMirror { border-top: 1px solid silver; border-bottom: 1px solid silver; }
      .cm-s-default span.cm-semi { color: blue; font-weight: bold; }
      .cm-s-default span.cm-dollar { color: orange; font-weight: bold; }
      .cm-s-default span.cm-arrow { color: brown; }
      .cm-s-default span.cm-arg-is { color: brown; }
    </style>

<style>
      .CodeMirror { border-top: 1px solid silver; border-bottom: 1px solid silver; }
      .cm-s-default span.cm-semi { color: blue; font-weight: bold; }
      .cm-s-default span.cm-dollar { color: orange; font-weight: bold; }
      .cm-s-default span.cm-arrow { color: brown; }
      .cm-s-default span.cm-arg-is { color: brown; }
    </style>

<article>

			<%
				int id= 0; 						//The R_code id
				String name = "";				//The R_code name
				String script = "";				//The R_code id
				String add_update = "yes_no";	//Variable to check if we want to add or to update a record
				
				// We retrieve the parametres send by the edit url in the list_r_script.jsp page
				if(request.getParameter("id_edit") != null && request.getParameter("name") != null && request.getParameter("script") != null)
				{
					id = Integer.parseInt(request.getParameter("id_edit"));
					name = request.getParameter("name");
					script = request.getParameter("script");
					add_update = "no_yes";
				}
			%>
			
<h1 align="center">R Form</h1>

<form method="post" action="form">

		<input type="hidden" name="add_update" value=<% out.print(add_update); %> >
		<input type="hidden" name="code_id" value=<% out.print(id); %> >
		
		<label for = "code_name">Your R Code Name : </label><br />
		<input type = "text" id = "code_name" name = "code_name" value=<% out.print(name); %> > <br /><br />
		
		<label for = "code_script">Your R Script : </label>
		<textarea id="code_script" name="code_script">
	
		# Write your code here
		
		<% out.print(script); %>
			
		</textarea><br /><br />
		
		<input type="submit" />

</form>

    <script>
      var editor = CodeMirror.fromTextArea(document.getElementById("code_script"), {});
    </script>


    

  </article>
