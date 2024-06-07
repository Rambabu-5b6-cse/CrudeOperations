<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page import="java.sql.*" import="java.io.*" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: antiquewhite;
}
.error{
	margin: 2% auto;
	width: 400px;
	height: 400px;
	padding: 5px 5px 5px 5px;
	display: block;
	background-color: blue;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
}
.block {
	margin: 2% auto;
	width: 400px;
	height: 400px;
	padding: 5px 5px 5px 5px;
	display: block;
	background-color: blue;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
}

h2,h4, p {
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
	background-color: lightgreen;
	font-weight: bold;
	color: white;
}

button:hover {
	background-color: green;
}

button:active {
	background-color: green;
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
String name = request.getParameter("name");
String course = request.getParameter("course");
String cgpa=request.getParameter("cgpa");
String address=request.getParameter("address");
int ids=Integer.parseInt(id);

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Rambabu@5566");
	PreparedStatement st=con.prepareStatement("update stu set student_name=?,course=?,cgpa=?,address=? where id=?");
	st.setString(1,  name);
	st.setString(2,course);
	st.setBigDecimal(3, new java.math.BigDecimal(cgpa));
	st.setString(4,address);
	st.setInt(5, ids);
	int i=st.executeUpdate();
	if(i>0){
	
		
		
		out.println("<div class='block'>");
		out.println("<button  class='btn'type='button'><a href='login.html'>Home</a></button>");
		out.println(" <hr/>");
		out.println("<h2>successfully updated ..</h2>");
		out.println("<h4>do you want to verify your updated deatils ..</h4>");
		out.println(" <button  class='btn'type='button'><a href='Retrieveall.jsp'>Click Here</a></button>");

		
		
		
		out.println("</div>");
	}
	else{
		out.println("<h3></h3>");
		
		
		out.println("<div class='block'>");
		out.println("<button  class='btn'type='button'><a href='login.html'>Home</a></button>");
		out.println(" <hr/>");
		out.println("<h2>not successfully updated ..</h2>");



		
		
		
		out.println("</div>");
	}

	

	
		


	st.close();
	con.close();
}
catch(Exception e){
	out.println(e);
	
	
}

%>

</body>
</html>