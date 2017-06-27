<%
    session = request.getSession(false);
    String item_id = request.getParameter("id");
    String cart = (String) session.getAttribute("cart");
    String ids[] = cart.split(";");
    String new_ids = "";
    for(String id: ids){
        if (!id.equals(item_id)){
            new_ids += id + ";";
        }
    }
    session.setAttribute("cart", new_ids);
    response.sendRedirect("cart.jsp");
%>