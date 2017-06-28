<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>

<%
    session = request.getSession(false);
    String user = (String) session.getAttribute("user_id");
    if (user != null){
        session.setAttribute("msg", "You Have to log out of current account");
        response.sendRedirect("index.jsp");
    }
    String fname, lname, sex, email, password;
    PreparedStatement stt;
    ResultSet rs;
    fname = request.getParameter("firstname");
    lname = request.getParameter("lastname");
    sex = request.getParameter("sex");
    email = request.getParameter("email");
    password = request.getParameter("password");

    String sql = "INSERT INTO users (firstname, lastname, sex, email, password)VALUES ('"+fname+"', '"+lname+"', '"+sex+"', '"+email+"', '"+password+"')";
    try{
        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db" , "root", "");
        Statement st = (Statement) con.createStatement();
        st.executeUpdate(sql);
        con.setAutoCommit(true);

        String sql2 = "SELECT * FROM users WHERE email = '"+ email+"' AND password = '"+ password+"'";
        stt = (PreparedStatement) con.prepareStatement(sql2);
        rs = stt.executeQuery();
        while(rs.next()){
            session.setAttribute("user_id", rs.getString("id"));
            session.setAttribute("user_name", rs.getString("firstname"));
        }
        response.sendRedirect("cart.jsp");
    }
    catch (Exception ex){
        out.write(ex.getMessage());
    }
%>