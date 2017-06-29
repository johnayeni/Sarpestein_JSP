<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%@page import = "db.Catalogue"%>
<%@page import = "db.DBHelper"%>
<%@page import = "db.HEOMData"%>
<%
    session = request.getSession(false);
    String cart = (String) session.getAttribute("cart");
    String user_id = (String) session.getAttribute("user_id");
    String user_name = (String) session.getAttribute("user_name");
    String address = request.getParameter("address");
    String[] arr = cart.split(";");
    for(String arrs: arr){
        String sql = "INSERT INTO users (user_id, user_name, item_id, delivery_address)VALUES ('"+user_id+"', '"+user_name+"', '"+arrs+"', '"+address+"')";
        try{
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db" , "root", "");
            Statement st = (Statement) con.createStatement();
            st.executeUpdate(sql);
            con.setAutoCommit(true);
        }
        catch (Exception ex){
            out.write(ex.getMessage());
        }
    }


    session.removeAttribute("cart");
    response.sendRedirect("index.jsp");
%>
