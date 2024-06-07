<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
<style>
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
}

</style>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String course = request.getParameter("course");
	String cgpa = request.getParameter("cgpa");
	String address = request.getParameter("address");
	int ids = Integer.parseInt(id);
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Rambabu@5566");
		
		PreparedStatement st = con.prepareStatement("insert into stu values(?,?,?,?,?)");
		st.setInt(1, ids);
		st.setString(2, name);
		st.setString(3, course);
		st.setBigDecimal(4, new java.math.BigDecimal(cgpa));
		st.setString(5, address);
		int x = st.executeUpdate();

	
			if (x > 0) {
		out.println("       <div class='block'> <div class='sec'>");

		out.println("  <button  class='btn'type='button'><a href='login.html'>Home</a></button>");
		out.println(" <hr/>");

		out.println("<h2>inserted suc....</h2>");
		out.println("<p><robot>Do you want to insert more</robot></p>");
		out.println(" <button  class='btn'type='button'><a href='login.html'>Click Here</a></button>");

		out.println("</div></div>");

			} 

		 else {
			out.println("<h1>inseted false...</h1>");
		}
	}

	catch (Exception e) {
		out.println("<div class='error'>");
		out.println("<button  class='btn'type='button'><a href='login.html'>Home</a></button>");
		out.println(" <hr/>");
		out.println("<h2>You enetred Id is occupied by another member</h2>");
		out.println("<h4>choose another ID</h4>");
		out.println(" <button  class='btn'type='button'><a href='login.html'>Click Here</a></button>");

		
		
		
		out.println("</div>");
	}
	%>
</body>
</html>