<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%
//    HttpSession session = request.getSession();
    //checking if a user is already logged in
        session = request.getSession(false);
        String user = (String) session.getAttribute("user_id");
        if (user != null){
            session.setAttribute("msg", "You Have to log out of current account");
            response.sendRedirect("index.jsp");
        }
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try{

            String email = request.getParameter("email").trim();
        String pwd = request.getParameter("pwd").trim();

        String sql = "SELECT * FROM users WHERE email = '"+ email+"' AND password = '"+ pwd+"'";

        boolean verify = false;
        String msg;

        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db" , "root", "");
        st = (PreparedStatement) con.prepareStatement(sql);
        rs = st.executeQuery();
        while(rs.next()){
            session.setAttribute("user_id", rs.getString("id"));
            session.setAttribute("user_name", rs.getString("firstname"));
        }
        boolean recordExits = rs.absolute(1);

        if(recordExits == true){
            verify = true;
        }

        if (verify == true){
            response.sendRedirect("cart.jsp");
        }
        else{
            session.setAttribute("msg", "Invalid login");
            response.sendRedirect("index.jsp?msg");
        }
        con.close();

    }
    catch(Exception ex){
        out.write("An error occured: " + ex.getMessage());
    }
%>