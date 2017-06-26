<%--
  Created by IntelliJ IDEA.
  User: MAYOWA
  Date: 25-Jun-17
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<%@page import = "java.util.logging.Level"%>
<%@page import = "java.util.logging.Logger"%>
<%@page import = "java.util.Arrays"%>
<%
    String filename = request.getParameter("catalogue");
    try{
        BufferedReader br = new BufferedReader(new FileReader("C:\\" +filename));
        String line;
        while((line = br.readLine()) != null){

            String[] arr = line.split(";");
            System.out.println(Arrays.toString(arr));
            String Device_Type = arr[0];
            String Brand_Name = arr[1];
            String ram = arr[2];
            String Storage_Size = arr[3];
            String Screen_Size = arr[4];
            String Cost = arr[5];
            String Supplier = arr[6];

            try {
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db", "root", "");
                String sql = "INSERT INTO catalogue (device_type, brand_name, ram, storage_size, screen_size, cost, supplier)VALUES ('"+Device_Type+"', '"+Brand_Name+"', '"+ram+"', '"+Storage_Size+"', '"+Screen_Size+"', '"+Cost+"', '"+Supplier+"')";
                Statement st = (Statement) con.createStatement();
                st.executeUpdate(sql);


                con.setAutoCommit(true);
                con.close();
            }
            catch (SQLException ex) {
                out.write(ex.getMessage());
            }
        }
        response.sendRedirect("cpanel.jsp");
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>
