<%@ include file="db.jsp" %>
<%
java.util.Map<Integer,Integer> cart=(java.util.Map<Integer,Integer>)session.getAttribute("cart");
if(cart==null){ cart=new java.util.HashMap<>(); session.setAttribute("cart",cart); }

if(request.getParameter("add")!=null){
   int pid=Integer.parseInt(request.getParameter("add"));
   cart.put(pid, cart.getOrDefault(pid,0)+1);
}
%>
<h2>Your Shopping Cart</h2>
<%
double total=0;
for(int pid:cart.keySet()){
   PreparedStatement ps=conn.prepareStatement("SELECT * FROM products WHERE id=?");
   ps.setInt(1,pid);
   ResultSet rs=ps.executeQuery();
   if(rs.next()){
     double price=rs.getDouble("price");
     int qty=cart.get(pid);
     total+=price*qty;
%>
<p><%=rs.getString("name")%> - Qty: <%=qty%> - ?<%=price*qty%></p>
<%
   }
}
%>
<p>Total: ?<%=total%></p>
<a href="checkout.jsp">Proceed to Checkout</a>
