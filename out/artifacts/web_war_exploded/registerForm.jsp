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
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <title>Register</title>
</head>

<nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Sarperstein</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <%--Trigger search modal--%>
                    <button data-toggle="modal" data-target="#searchModal" class="btn btn-lg btn-danger">Search</button>
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

                                                    try{
                                                        String sql = "SELECT DISTINCT brand_name FROM catalogue";
                                                        conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db" , "root", "");
                                                        stt = (PreparedStatement) conn.prepareStatement(sql);
                                                        res = stt.executeQuery();
                                                        while(res.next()){
                                                            out.write("<option value="+res.getString("brand_name")+">--"+res.getString("brand_name")+"--</option>");
                                                        }
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
                                            <input type="number" class="form-control" name="ram" min="1" max="2000">
                                        </div>
                                        <div class="form-group">
                                            <label for="screen_size">Screen size[GB]</label>
                                            <input type="number" class="form-control" name="screen_size" min="5" max="17">
                                        </div>
                                        <div class="form-group">
                                            <label for="cost">Price[N]</label>
                                            <input type="number" class="form-control" name="cost">
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
                </li>

                <%
                    session = request.getSession(false);
                    String u = (String) session.getAttribute("user_id");
                    if (u != null){
                        out.write("<li><a href=\"home.jsp\">"+"Welcome  "+session.getAttribute("user_name").toString()+"</a></li>");
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
                <li><a href="cart.jsp">Cart<span class="badge" style="background-color: firebrick;">
                    <% session = request.getSession(false);
                    String cart_num = (String) session.getAttribute("cart_num");
                    if (cart_num == null || cart_num == ""){
                        out.write("0");
                    }
                    else{
                        out.write(cart_num);
                    }%></span></a></li>
            </ul>
        </div>
    </div>
</nav>
<hr>

<!-- help popover button -->
<button class="btn btn-default btn-lg btn-info" data-toggle="popover" data-placement="top" data-content="Call us on 090088888" style="border-radius: 7px; position: fixed; bottom: 5px;right: 5px;z-index: 2;">Help</button>


<body style="background-color: #F5F5F5;">
<!-- Form to register a new user -->
<div class="container" style="margin-top: 100px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <h2>Register</h2>
    <form class="center-block" action="register.jsp" method="post">
        <div class="form-group">
            <label for="firstname">Firstname:</label>
            <input type="text" class="form-control" name="firstname" style="width: 100%;" required autofocus>
        </div>
        <div class="form-group">
            <label for="lastname">Lastname:</label>
            <input type="text" class="form-control" name="lastname" style="width: 100%;" required>
        </div>
        <div class="form-group">
            <label for="sex">Sex:</label>
            <select class="form-control" name="sex" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
        </div>
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" name="email" required>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" name="password" required>
        </div>
        <div class="checkbox">
            <label><input type="checkbox"> Remember me</label>
        </div>
        <button type="submit" class="btn btn-block btn-success">Submit</button>
    </form>
</div>


<%--Brand logo gallery--%>
<div class="container" style="margin-top: 20px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <div class="jumbotron" style="background-color: white;">
        <h1 class="text-center">We have the best brands available</h1>
    </div>


    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=SAMSUNG&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/samsungLogo.png" alt="samsung" width="600" height="400">
            </a>
        </div>
    </div>


    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=DELL&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/dellLogo.png" alt="dell" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=HP&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/hpLogo.png" alt="hp" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=SHARP&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/sharpLogo.jpg" alt="sharp" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=ASUS&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/asusLogo.png" alt="asus" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=LENOVO&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/lenovoLogo.png" alt="lenovo" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=SONY&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/sonyLogo.jpg" alt="sony" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=TECNO&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/tecnoLogo.png" alt="tecno" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=ACER&ram=&ram=&screen_size=&cost=">
                <img src="img/logos/acerLogo.png" alt="acer" width="600" height="400" class="img-responsive">
            </a>
        </div>
    </div>

</div>


<footer class="text-center" style="margin-top: 10px;background-color: grey; color: white;padding: 100px 50px 20px 50px;bottom: 0px;" >
    <!-- <div class="container"> -->
    <div class="row">
        <div class="col-md-4">
            <ul>
                <li data-toggle="modal" data-target="#contactModal">Contact Us</li>
                <!-- Modal -->
                <div id="contactModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body" style="color: black;">
                                <!-- contact form -->
                                <form>
                                    <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input type="text" class="form-control" name="name" style="width: 100%;" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Message:</label>
                                        <textarea rows="5" name="message" style="width: 100%;" required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-block btn-danger">Submit</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
                <li>About Us</li>
            </ul>
        </div>
    </div>
    <!-- </div> -->
    <p>&copy 2017 E-market</p>
</footer>
</body>
</html>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $('[data-toggle="popover"]').popover();
    });
</script>