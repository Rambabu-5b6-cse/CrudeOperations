<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleting</title>
    <style>
        body{
          
       
            background-color: antiquewhite;
        }
     .block {
margin:2% auto ;
width:400px;
height:400px;
padding:5px 5px 5px 5px;
display:block;
background-color:#EF9F8F;
box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;

     }
h3, p{
    margin-left: 15%;
 
  }
  .sec{
    margin-top: 10%;
  }
  button{

    margin-left: 15%;
    padding-top:10px;
    padding-bottom:10px;
    padding-right: 30px;
    padding-left: 30px;
    border-color: none;
	background-color: #AADDDC;
    font-weight: bold;
    color:white;
  }
  button:hover{
	background-color:  097D7A;
  }
  button:active{
	background-color:097D7A;
    color: black;
  }
  a{
    text-decoration: none;
    color: white;
    font-weight: bold;

  }
  a:active{
    color: black;
    padding-top:10px;
    padding-bottom:10px;
    padding-right: 20px;
    padding-left: 20px;


  }
  .error{color:red;
  font-weight: bolder;

  }
  .sucess{
  color: green;
  font-weight: bold;}
    </style>
</head>
<body>
<%
String id=request.getParameter("id");
int ids=Integer.parseInt(id);
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Rambabu@5566");
	PreparedStatement ps=con.prepareStatement("delete from stu where id=? ");
	ps.setInt(1,ids);
    int i=ps.executeUpdate();
    if(i>0)
    {
    	
    	
    	
    	out.println("       <div class='block'> <div class='sec'>");

        
    	out.println("  <button  class='btn'type='button'><a href='login.html'>Home</a></button>");
    	out.println(" <hr/>");
        

    	out.println("<h3 class='sucess' >successfully deleted....</h3>");
    	out.println("<p><robot>do you want to check</robot></p>");
    	out.println(" <button  class='btn'type='button'><a href='Retrieveall.jsp'>click here</a></button>");

    	out.println("</div></div>");

    }
    else{
    	out.println("       <div class='block'> <div class='sec'>");

        
    	out.println("  <button  class='btn'type='button'><a href='login.html'>Home</a></button>");
    	out.println(" <hr/>");
        

    	out.println("<h3 class='error'>User ID not valid....</h3>");
    	
    	out.println(" <button  class='btn'type='button'><a href='delete.html'>Ok</a></button>");

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