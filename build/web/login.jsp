<%@ include file="db.jsp" %>
<%
if(request.getParameter("submit")!=null){
   String email=request.getParameter("email");
   String pass=request.getParameter("password");

   PreparedStatement ps=conn.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
   ps.setString(1,email);
   ps.setString(2,pass);
   ResultSet rs=ps.executeQuery();
   if(rs.next()){
     session.setAttribute("userId", rs.getInt("id"));
     response.sendRedirect("products.jsp");
   } else {
     out.println("<p style='color:red'>Invalid login</p>");
   }
}
%>
<h2>User Login</h2>
<form method="post">
  Email: <input type="email" name="email"><br>
  Password: <input type="password" name="password"><br>
  <input type="submit" name="submit" value="Login">
</form>
