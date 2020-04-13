<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	try {
		String strImage = request.getParameter("strImage");
		System.out.println("Image--->" + strImage);
		String uname = request.getParameter("uname");
		System.out.println("UserNAme--->" + uname);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "root");

		PreparedStatement ps = con.prepareStatement("insert into base64image(Name,Image) values(?,?)");
		ps.setString(1, uname);
		ps.setString(2, strImage);
		int s = ps.executeUpdate();
		System.out.println("Row Affected=" + s);
		// TODO: Save image as String into Database;
		System.out.println(strImage);
		//request.setAttribute("imageDataAsString", strImage);
		//request.setAttribute("uname", uname);
		pageContext.forward("showImage.jsp");
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>