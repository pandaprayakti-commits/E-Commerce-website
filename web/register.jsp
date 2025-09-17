<%@ include file="db.jsp" %>
<%
if(request.getParameter("submit")!=null){
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String pass=request.getParameter("password");

   PreparedStatement ps=conn.prepareStatement("INSERT INTO users(name,email,password) VALUES(?,?,?)");
   ps.setString(1,name);
   ps.setString(2,email);
   ps.setString(3,pass);
   ps.executeUpdate();
   out.println("<p>Registered Successfully! <a href='login.jsp'>Login</a></p>");
}
%>
<h2>User Registration</h2>
<form method="post">
  Name: <input type="text" name="name"><br>
  Email: <input type="email" name="email"><br>
  Password: <input type="password" name="password"><br>
  <input type="submit" name="submit" value="Register">
</form>

