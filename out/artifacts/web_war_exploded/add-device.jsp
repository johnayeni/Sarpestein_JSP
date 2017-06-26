<script>
    $(document).ready(function () {
        alert("Your Order was Successful!");
    });
</script>
<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>

<%
    String name, des, price, picture;

    name = request.getParameter("burger-name");
    des = request.getParameter("burger-description");
    price = request.getParameter("burger-price");
    picture = request.getParameter("burger-picture");
//    double p = Double.parseDouble(price);
//    int count = Integer.parseInt(price)/10;

    String sql = "INSERT INTO burger (burgerName, burgerDescription, burgerPrice, burgerPicture)VALUES ('"+name+"','"+des+"', '"+price+"', '"+picture+"')";
    try{
        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/burger" , "root", "");
        Statement st = (Statement) con.createStatement();
        st.executeUpdate(sql);
        con.setAutoCommit(true);
        response.sendRedirect("cpanel.jsp");
    }
    catch (Exception ex){
        out.write(ex.getMessage());
    }
%>