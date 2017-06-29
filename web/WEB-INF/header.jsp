<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <title>Sarperstein</title>
</head>

<body style="background-color: #F5F5F5;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Sarperstein</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <%
                    session = request.getSession(false);
                    String user_id = (String) session.getAttribute("user_id");
                    if (user_id != null){
                        out.write("<li><a href=\"home.jsp\">"+"Welcome  "+session.getAttribute("user_name").toString()+"</a></li>" +
                                "<li><a href=\"logout.jsp\">LogOut</a></li>");
                    }
                    else{
                        out.write(
                                "<li><a data-toggle=\"modal\" data-target=\"#myModal\">Your Account</a></li>" +
                                        "<div id=\"myModal\" class=\"modal fade\" role=\"dialog\">" +
                                        "<div class=\"modal-dialog\">" +
                                        "<div class=\"modal-content\">" +
                                        "<div class=\"modal-header\">" +
                                        "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>" +
                                        "<h4 class=\"modal-title\">LOGIN</h4>" +
                                        "</div>" +
                                        "<div class=\"modal-body\">" +

                                        "<p>Dont have an account? <a href=\"registerForm.jsp\">Create Account</a></p>" +
                                        "<form action=\"login.jsp\" method=\"post\">" +
                                        "<div class=\"form-group\">" +
                                        "<label for=\"email\">Email address:</label>" +
                                        "<input type=\"email\" class=\"form-control\" name=\"email\" required autofocus>" +
                                        "</div>" +
                                        "<div class=\"form-group\">" +
                                        "<label for=\"pwd\">Password:</label>" +
                                        "<input type=\"password\" class=\"form-control\" name=\"pwd\" required>" +
                                        "</div>" +
                                        "<div class=\"checkbox\">" +
                                        "<label><input type=\"checkbox\"> Remember me</label>" +
                                        "</div>" +
                                        "<button type=\"submit\" class=\"btn btn-block btn-danger\">Log In</button>" +
                                        "</form>" +
                                        "</div>" +
                                        "<div class=\"modal-footer\">" +
                                        "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>" +
                                        "</div>" +
                                        "</div>" +

                                        "</div>" +
                                        "</div>"

                        );
                    }
                %>
                <li><a href="cart.jsp">Cart  <span class="badge" style="background-color: firebrick;">
        <%
            //check the count of the users cart is logged in
            session = request.getSession(false);
            String car = (String) session.getAttribute("cart");
            int count  = 0;
            if (car != null){
                String[] arr = car.split(";");
                if (!arr[0].equals("")){
                    count = arr.length;
                }
            }
            out.write(String.valueOf(count));
        %>
                </span></a></li>
            </ul>
        </div>
    </div>
</nav>
<hr>

<div class="container" style="margin-top: 100px;margin-bottom: 50px;background-color: white;height: 50px;padding: 0px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
        <%--Trigger search modal--%>
        <button id="searchButton" data-toggle="modal" data-target="#searchModal" style="width: 100%;height: 200%;font-size: 300%;" class="btn btn-lg btn-danger" >Search</button>
        <!-- Modal -->
        <div id="searchModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">TELL US WHAT YOU WANT</h4>
                    </div>
                    <div class="modal-body">
                        <form action="results.jsp">
                            <div class="form-group">
                                <label for="device_type">Type Of Device</label>
                                <select class="form-control" name="device_type">
                                    <option value="Laptop">--Laptop--</option>
                                    <option value="Tablet">--Tablet</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="brand_name">Brand</label>
                                <select class="form-control" name="brand_name">
                                    <%
                                        Connection conn;
                                        PreparedStatement stt;
                                        ResultSet res;

                                        int acer_count = 0;
                                        int dell_count= 0;
                                        int asus_count= 0;
                                        int tecno_count= 0;
                                        int sharp_count= 0;
                                        int sony_count= 0;
                                        int samsung_count= 0;
                                        int lenovo_count= 0;
                                        int laptop_count= 0;
                                        int tablet_count= 0;
                                        try{
                                            String sql = "SELECT DISTINCT brand_name FROM catalogue";
                                            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db" , "root", "");
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            while(res.next()){
                                                out.write("<option value="+res.getString("brand_name")+">--"+res.getString("brand_name")+"--</option>");
                                            }
                                            sql = "SELECT brand_name  FROM catalogue WHERE brand_name = 'ACER'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            acer_count = res.getRow();

                                            sql = "SELECT  brand_name FROM catalogue WHERE brand_name = 'ASUS'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            asus_count = res.getRow();

                                            sql = "SELECT  brand_name FROM catalogue WHERE brand_name = 'DELL'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            dell_count = res.getRow();

                                            sql = "SELECT  brand_name FROM catalogue WHERE brand_name = 'TECHNO'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            tecno_count = res.getRow();

                                            sql = "SELECT  brand_name  FROM catalogue WHERE brand_name = 'SHARP'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            sharp_count = res.getRow();

                                            sql = "SELECT  brand_name FROM catalogue WHERE brand_name = 'SONY'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            sony_count = res.getRow();

                                            sql = "SELECT  brand_name FROM catalogue WHERE brand_name = 'SAMSUNG'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            samsung_count = res.getRow();

                                            sql = "SELECT  brand_name FROM catalogue WHERE brand_name = 'LENOVO'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            lenovo_count = res.getRow();

                                            sql = "SELECT  device_type FROM catalogue WHERE device_type = 'Laptop'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            laptop_count = res.getRow();

                                            sql = "SELECT device_type FROM catalogue WHERE device_type = 'Tablet'";
                                            stt = (PreparedStatement) conn.prepareStatement(sql);
                                            res = stt.executeQuery();
                                            res.last();
                                            tablet_count = res.getRow();
                                            conn.close();
                                        }
                                        catch(Exception ex){
                                            out.write("<option value=\"\">--No Results--</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="ram">RAM size[GB]</label>
                                <input type="number" class="form-control" name="ram" min="1" max="64">
                            </div>
                            <div class="form-group">
                                <label for="storage_size">Storage size[GB]</label>
                                <input type="number" class="form-control" name="storage_size" min="1" max="2000">
                            </div>
                            <div class="form-group">
                                <label for="screen_size">Screen size</label>
                                <input type="number" class="form-control" name="screen_size" min="5" max="17">
                            </div>
                            <div class="form-group">
                                <label for="min">Minimum Price[N]</label>
                                <input type="number" class="form-control" name="min">
                            </div>
                            <div class="form-group">
                                <label for="max">Maximum Price[N]</label>
                                <input type="number" class="form-control" name="max">
                            </div>
                            <button type="submit" class="btn btn-block btn-danger">GO</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
</div>