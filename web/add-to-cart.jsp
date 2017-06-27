<%
    String id = request.getParameter("id");
    session = request.getSession(false);
    String cart = "";
    cart += (String) session.getAttribute("cart");
    cart += id + ";";
    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp");
%>