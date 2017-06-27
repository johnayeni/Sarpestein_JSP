<%
    String id = request.getParameter("id");
    session = request.getSession(false);
    String cart = (String) session.getAttribute("cart");
    if (cart == null){
        cart = "";
    }
//    String c = (String) session.getAttribute("cart_num");
//    int cart_num = Integer.parseInt(c);
    cart += id + ";";
//    cart_num += 1;
    session.setAttribute("cart", cart);
//    session.setAttribute("cart_num", cart_num);
    response.sendRedirect("cart.jsp");
%>