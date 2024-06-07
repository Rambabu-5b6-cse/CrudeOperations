<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.io.*" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style type="text/css">
.block {
	margin: 2% auto;
	width: 400px;
	height: 400px;
	padding: 5px 5px 5px 5px;
	display: block;
	background-color:#EF9F8F;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
}

h2, p ,h4{
	margin-left: 15%;
}

.sec {
	margin-top: 10%;
}

button {
	margin-left: 15%;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-right: 30px;
	padding-left: 30px;
	border-color: none;
	background-color: #AADDDC;
	font-weight: bold;
	color: white;
}

button:hover {
	background-color:  097D7A;
}

button:active {
	background-color:097D7A;
	color: black;
}

a {
	text-decoration: none;
	color: white;
}

a:active {
	color: black;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-right: 20px;
	padding-left: 20px;
}</style>
</head>
<body>
<%
String id=request.getParameter("id");
int ids=Integer.parseInt(id);
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Rambabu@5566");
	PreparedStatement ps=con.prepareStatement("select * from stu where id=? ");
	ps.setInt(1,ids);
	ResultSet rs=ps.executeQuery();

	
		if(rs.next()){
			out.println("       <div class='block'> <div class='sec'>");

			out.println("  <button  class='btn'type='button'><a href='login.html'>Home</a></button>");
			out.println(" <hr/>");

			out.println("<h2>u are a valid user....</h2>");
			out.println("<p><robot>do u want to upadte you details</robot></p>");
			out.println(" <button  class='btn'type='button'><a  href='updating.html'>Click Here</a></button>");

			out.println("</div></div>");

	

		}
		else{
			out.println("       <div class='block'> <div class='sec'>");

			out.println("  <button  class='btn'type='button'><a href='login.html'>Home</a></button>");
			out.println(" <hr/>");

			out.println("<h2>User ID not valid....</h2>");


			out.println("</div></div>");
		
		}

	
		


	ps.close();
	con.close();
}
catch(Exception e){
	out.println(e);
	
	
}

%>


</body>
</html>