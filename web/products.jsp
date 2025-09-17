<%@ include file="db.jsp" %>
<%
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM products");
%>
<h2>Product Catalog</h2>
<table border="1">
<tr><th>Name</th><th>Price</th><th>Action</th></tr>
<% while(rs.next()){ %>
<tr>
  <td><%=rs.getString("name")%></td>
  <td>?<%=rs.getDouble("price")%></td>
  <td><a href="cart.jsp?add=<%=rs.getInt("id")%>">Add to Cart</a></td>
</tr>
<% } %>
</table>
<a href="cart.jsp">View Cart</a>
