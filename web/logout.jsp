<%--
  Created by IntelliJ IDEA.
  User: MAYOWA
  Date: 26-Jun-17
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    session = request.getSession();
    response.sendRedirect("index.jsp");
%>
