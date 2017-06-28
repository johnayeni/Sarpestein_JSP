<%
    try
    {
        Thread.sleep(5000);
    }
    catch(InterruptedException ex)
    {
        Thread.currentThread().interrupt();
    }
    session.removeAttribute("cart");
    response.sendRedirect("index.jsp");
%>
