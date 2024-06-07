
package com.ram;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
         PrintWriter out=response.getWriter();
         
         String id=request.getParameter("id");
         int ids=Integer.parseInt(id);
         
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Rambabu@5566");

			PreparedStatement st = con.prepareStatement("select * from stu where id=?");
			st.setInt(1, ids);
			

		ResultSet rs = st.executeQuery();
		 out.println("<table border='2px'><tr>");
         out.println("<th>id</th>");
         out.println("<th>name</th>");
         out.println("<th>course</th>");
         out.println("<th>cgpa</th>");
         out.println("<th>address</th>");
         out.println("</tr>");
        
			while(rs.next()){
				 ids=rs.getInt("id");
				String student_name=rs.getString("student_name");
				String course=rs.getString("course");
				String cgpa=rs.getBigDecimal("cgpa").toString();
				String address=rs.getString("address");
				
				
		        
				 out.println("<tr>");
		         out.println("<th>"+ids+"</th>");
		         out.println("<th>"+student_name+"</th>");
		         out.println("<th>"+course+"</th>");
		         out.println("<th>"+cgpa+"</th>");
		         out.println("<th>"+address+"</th>");
		         out.println("</tr>");
		         
			}
			 out.println("</table>");

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}