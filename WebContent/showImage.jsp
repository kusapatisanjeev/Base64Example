<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script src="jquery.min.js"></script>
</head>
<body>
	<h1>String shown as Image</h1>
	<table border="1" width="300" height="400" align="center">
		<tr>
			<th>Name of Student</th>
			<th>Image of Student</th>
		</tr>

		<%
			String name, image;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root",
						"root");
				Statement st = (Statement) con.createStatement();
				ResultSet rs = st.executeQuery("Select name,image from base64Image");
				while (rs.next()) {
					out.println("<tr><td>" + rs.getString(1) + "</td>");
		%>
		<td><img src='<%=rs.getString(2)%>' height='50px;' width='100px' /></td>
		</tr>
		<%
			}
				out.println("</table>");
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		%>
	
</body>
</html>
