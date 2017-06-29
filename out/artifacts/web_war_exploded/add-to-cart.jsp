<%
    String id = request.getParameter("id");
    session = request.getSession(false);
    String cart = (String) session.getAttribute("cart");
    if (cart == null){
        cart = "";
    }
    cart += id + ";";
    session.setAttribute("cart", cart);
%>