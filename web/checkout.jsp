<%@ include file="db.jsp" %>
<%
if(session.getAttribute("userId")==null){
  response.sendRedirect("login.jsp");
  return;
}
java.util.Map<Integer,Integer> cart=(java.util.Map<Integer,Integer>)session.getAttribute("cart");
if(cart!=null && !cart.isEmpty()){
   int uid=(int)session.getAttribute("userId");
   double total=0;
   for(int pid:cart.keySet()){
      PreparedStatement ps=conn.prepareStatement("SELECT price FROM products WHERE id=?");
      ps.setInt(1,pid);
      ResultSet rs=ps.executeQuery();
      if(rs.next()) total+=rs.getDouble(1)*cart.get(pid);
   }
   PreparedStatement orderPs=conn.prepareStatement("INSERT INTO orders(user_id,total) VALUES(?,?)",Statement.RETURN_GENERATED_KEYS);
   orderPs.setInt(1,uid);
   orderPs.setDouble(2,total);
   orderPs.executeUpdate();
   ResultSet ors=orderPs.getGeneratedKeys(); ors.next();
   int orderId=ors.getInt(1);

   for(int pid:cart.keySet()){
      int qty=cart.get(pid);
      PreparedStatement itemPs=conn.prepareStatement("INSERT INTO order_items(order_id,product_id,quantity) VALUES(?,?,?)");
      itemPs.setInt(1,orderId);
      itemPs.setInt(2,pid);
      itemPs.setInt(3,qty);
      itemPs.executeUpdate();
   }
   session.removeAttribute("cart");
   out.println("<h2>Order placed! Order ID: "+orderId+"</h2>");
} else {
   out.println("<p>Your cart is empty</p>");
}
%>
