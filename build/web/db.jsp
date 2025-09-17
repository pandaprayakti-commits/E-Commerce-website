<%@ page import="java.sql.*" %>
<%
  String dbURL = "jdbc:mysql://localhost:3306/ecommerce";
  String dbUser = "root";
  String dbPass = "root";
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
%>
