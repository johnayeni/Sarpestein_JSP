<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.servlet.http.HttpSession"%>
<%--<%--%>
  <%--HttpSession session = request.getSession(false);--%>
<%--%>--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
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
      <a class="navbar-brand" href="#">Sarperstein</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li>
        <%--Trigger search modal--%>
        <button data-toggle="modal" data-target="#searchModal" class="btn btn-lg btn-danger" >Search</button>
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
                    <label for="screen_size">Screen size</label>
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
          String user = (String) session.getAttribute("user_id");
          if (user != null){
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
        <li><a href="#">Cart<span class="badge" style="background-color: firebrick;">
        <% session = request.getSession(false);
          String cart_num = (String) session.getAttribute("cart_num");
          if (cart_num == null){
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
<button class="btn btn-default btn-lg btn-info" data-toggle="popover" data-placement="top" data-content="Call us on 090088888" style="border-radius: 7px; position: fixed; bottom: 5px;right: 5px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); z-index: 2;">Help</button>



<div class="container" style="margin-top: 100px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
  <div class="row">
    <div class="col-md-2" style="margin: 0px; padding: 0px;">
      <ul class="list-group">
        <li class="list-group-item">OUR PRODUCTS</li>
        <li class="list-group-item">Dell</li>
        <li class="list-group-item">Asus</li>
        <li class="list-group-item">Asus</li>
        <li class="list-group-item">Acer</li>
        <li class="list-group-item">Tecno</li>
        <li class="list-group-item">Sharp</li>
        <li class="list-group-item">Sony</li>
        <li class="list-group-item">Samsung</li>
        <li class="list-group-item">Lenovo</li>
      </ul>
    </div>
    <div class="col-md-6" style="margin: 0px; padding: 0px;">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="img/img1.JPG" alt="Los Angeles" class="img-responsive center-block" style="width:100%;height: 400px;">
          </div>

          <div class="item">
            <img src="img/img2.JPG" alt="Chicago" class="img-responsive center-block" style="width:100%;height: 400px;">
          </div>

          <div class="item">
            <img src="img/img3.JPG" alt="New York" class="img-responsive center-block" style="width:100%;height: 400px;">
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4" style="margin: 0px; padding: 0px;">
      <img src="img/wallpaper3.JPG" class="img-responsive center-block" style="height: 400px;">
    </div>
  </div>
</div>


<div class="container" style="margin-top: 20px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
  <div class="row">
    <div class="col-md-3">
      <img src="img/dod.jpg" class="img-responsive center-block" style="max-height: 300px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    </div>
    <div class="col-md-6">
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Best Sellers</a></li>
        <li><a data-toggle="tab" href="#menu1">Search For Item</a></li>
      </ul>
      <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
          <div class="row">
            <div class="well col-md-4" style="background-color: white;">
              <img src="img/img1.JPG" class="img-responsive">
              <p>Acer predator</p>
            </div>
            <div class="well col-md-4" style="background-color: white;">
              <img src="img/img1.JPG" class="img-responsive">
              <p>Acer predator</p>
            </div>
            <div class="well col-md-4" style="background-color: white;">
              <img src="img/img1.JPG" class="img-responsive">
              <p>Acer predator</p>
            </div>
          </div>
        </div>
        <div id="menu1" class="tab-pane fade">
          <%--Trigger search modal--%>
          <button data-toggle="modal" data-target="#searchModal" class="btn btn-block btn-lg btn-danger" style="border-radius: 0px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">Search</button>
      </div>
    </div>
    </div>
      <div class="col-md-3">
        <img src="img/laptop.jpg" class="img-responsive center-block">
      </div>
  </div>
</div>

<div class="container" style="margin-top: 20px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
  <div class="row">
    <div class="col-md-12">
      <h4>Why Shop on Sarpester</h4>
      <p>At Sarpester, you are guaranteed an online shopping experience like never before. With several items to choose from, Sarpester offers a wide selection of items that spans across the most polular brand of devices. We have special deals all the time and we are always there for any special season like the Black Friday 2017 in November, Christmas, New Year and every special season there is. We bring the very best products and deals on Sarpester. Plus, our delivery is fast and our services are effective. Shop on Sarpester today and enjoy a safe online shopping experience.</p>
    </div>
  </div>
</div>

<footer class="container-fluid text-center" style="margin-top: 20px;background-color: grey; color: white;padding: 100px 50px 20px 50px;">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <ul>
          <!-- trigger for the modal -->
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
                      <label for="name" class="pull-left">Name:</label>
                      <input type="text" class="form-control" name="name" style="width: 100%;" required>
                    </div>
                    <div class="form-group">
                      <label for="message" class="pull-left">Message:</label>
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
  </div>
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