<%@page import="org.eclipse.jdt.internal.compiler.flow.TryFlowContext"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.io.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	

	height: 900px;
	align-content: center;
}
.container{
background-color:white;
margin-top:10%;
margin-bottom:40%;
padding:5px 5px 5px 5px;
box-shadow: 0px 8px 10px rgba(0, 0, 0, 0.20000000298023224);
}
.p-3{
font-weight: bold;
color:black;
}
.one{
background-color:red;
box-shadow: 0px 8px 10px rgba(0, 0, 0, 0.20000000298023224);}

.two{
background-color: green;
box-shadow: 0px 8px 10px rgba(0, 0, 0, 0.20000000298023224);
}
.btn
{
margin-top:3%;
margin-left:10%;}
.b {
background-color:lightgreen;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  font-weight:bold;

  cursor: pointer;
}
.b:hover{
background-color:green;
}
.a{
color:white;
text-decoration: none;}
.error{
height:200px;
width:auto;
text-align: center;}
}

</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>retrieving</title>
</head>
<body>

<div class="btn">
	<button type="button" class="b"><a class="a" href="login.html">Home</a></button>
	</div>
	<%
	String id = request.getParameter("id");
	int ids = Integer.parseInt(id);
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Rambabu@5566");
		PreparedStatement ps = con.prepareStatement("select * from stu where id=? ");
		ps.setInt(1, ids);
		ResultSet rs = ps.executeQuery();
		out.println("<div class='container px-4 text-center'>");
		out.println("  <div class='one'>");
		out.println(" <div class='row gx-5'>");
	

		out.println(" <div class='col-2'> ");
		out.println("  <div class='p-3'>id</div>");
		out.println("  </div>");
		out.println(" <div class='col-3'> ");
		out.println(" <div class='p-3'>name</div>");
		out.println("  </div>");
		out.println(" <div class='col-2'> ");
		out.println(" <div class='p-3'>course</div>");
		out.println("  </div>");
		out.println(" <div class='col-2'> ");
		out.println(" <div class='p-3'>cgpa</div>");
		out.println("  </div>");
		out.println(" <div class='col-3'> ");
		out.println(" <div class='p-3'>address</div>");
		out.println("  </div>");

		out.println("  </div>");
		out.println("  </div>");
		if(ps!=null){
		
		while (rs.next()) {
			out.println("  <div class='two'>");

			out.println(" <div class='row gx-5'>");
		

			out.println(" <div class='col-2'> ");
			out.println(" <div class='p-3'>" + rs.getInt("id") + "</div>");
			out.println("  </div>");

			out.println(" <div class='col-3'> ");
			out.println("<div class='p-3'>" + rs.getString("student_name") + "</div>");
			out.println("  </div>");

			out.println(" <div class='col-2'> ");
			out.println("<div class='p-3'>" + rs.getString("course") + "</div>");
			out.println("  </div>");

			out.println(" <div class='col-2'> ");
			out.println("<div class='p-3'>" + rs.getBigDecimal("cgpa").toString() + "</div>");
			out.println("  </div>");

			out.println(" <div class='col-3'> ");
			out.println("<div class='p-3'>" + rs.getString("address") + "</div>");
			out.println("  </div>");

			out.println("  </div>");
			out.println("  </div>");
			out.println("  </div>");

		}
		}
		
		

		ps.close();
		con.close();
	} 

	
	catch (Exception e) {
		out.println("<h3 class='error'>No details found with this ID</h3>");

	}
	%>
	

</body>
</html>