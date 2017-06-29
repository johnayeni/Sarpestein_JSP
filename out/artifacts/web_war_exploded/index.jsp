<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%@include file="WEB-INF/header.jsp" %>
<!-- help popover button -->
<button class="btn btn-default btn-lg btn-info" data-toggle="popover" data-placement="top" data-content="Call us on 090088888" style="border-radius: 7px; position: fixed; bottom: 5px;right: 5px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); z-index: 2;">Help</button>

<div class="container" style="margin-top: 100px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
  <div class="row">
    <div class="col-md-2" style="margin: 0px; padding: 0px;">
      <ul class="list-group">
        <li class="list-group-item">OUR PRODUCTS</li>
        <a href="results.jsp?device_type=Laptop&brand_name=&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item"><b>Laptops</b>  <span class="badge"><%=laptop_count%></span></li></a>
        <a href="results.jsp?device_type=Tablet&brand_name=&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item"><b>Tablets</b>  <span class="badge"><%=tablet_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=DELL&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Dell  <span class="badge"><%=dell_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=ASUS&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Asus  <span class="badge"><%=asus_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=ACER&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Acer  <span class="badge"><%=acer_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=TECHNO&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Tecno  <span class="badge"><%=tecno_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=SHARP&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Sharp  <span class="badge"><%=sharp_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=SONY&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Sony  <span class="badge"><%=sony_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=SAMSUNG&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Samsung  <span class="badge"><%=samsung_count%></span></li></a>
        <a href="results.jsp?device_type=&brand_name=LENOVO&ram=&storage_size=&screen_size=&min=&max="><li class="list-group-item">Lenovo  <span class="badge"><%=lenovo_count%></span></li></a>
      </ul>
    </div>
    <div class="col-md-6" style="margin: 0px; padding: 0px;">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          <li data-target="#myCarousel" data-slide-to="4"></li>
          <li data-target="#myCarousel" data-slide-to="5"></li>
          <li data-target="#myCarousel" data-slide-to="6"></li>
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
          <div class="item">
            <img src="img/img4.JPG" alt="New York" class="img-responsive center-block" style="width:100%;height: 400px;">
          </div>
          <div class="item">
            <img src="img/img5.JPG" alt="New York" class="img-responsive center-block" style="width:100%;height: 400px;">
          </div>
          <div class="item">
            <img src="img/img6.JPG" alt="New York" class="img-responsive center-block" style="width:100%;height: 400px;">
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4" style="margin: 0px; padding: 0px;">
      <img src="img/wallpaper4.JPG" class="img-responsive center-block" style="height: 400px;">
    </div>
  </div>
</div>


<div class="container" style="margin-top: 20px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
  <div class="row">
    <div class="col-md-3">
      <img src="img/dod.jpg" class="img-responsive center-block" style="max-height: 300px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    </div>
    <div class="col-md-9">
      <ul class="nav nav-tabs nav-justified">
        <li class="active"><a data-toggle="tab" href="#home">Best Sellers</a></li>
        <li><a data-toggle="tab" href="#menu1">Search For Item</a></li>
      </ul>
      <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
          <div class="row">
            <%
              Connection con;
              PreparedStatement st;
              ResultSet resultSets;
              for (int i = 0; i <= 6; i++){
                try{

                  String sql = "SELECT * FROM catalogue WHERE id = '"+ i +"'";
                  con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db" , "root", "");
                  st = (PreparedStatement) con.prepareStatement(sql);
                  resultSets = st.executeQuery();
                  while(resultSets.next()){
                    String id = resultSets.getString("id");
                    String device_type = resultSets.getString("device_type");
                    String brand_name = resultSets.getString("brand_name");
                    String storage_size = resultSets.getString("storage_size");
                    String ram_size = resultSets.getString("ram");
                    String screen_size = resultSets.getString("screen_size");
                    String price = resultSets.getString("cost");
                    String supplier = resultSets.getString("supplier");
                    if (id.equals("")){
                      out.write("No Items Found");
                      break;
                    }
                    out.write("<div class=\"col-md-4  well\" style=\"background-color: white;\">" +
                            "<h3>"+brand_name+"  </h3><small>"+device_type+"</small>" +
                            "<hr>"+
                            "<h4>"+ram_size + "gb RAM    "+storage_size + " gb</h4>" +
                            "<hr>"+
                            "<h4>"+screen_size + "\"</h4>" +
                            "<hr>"+
                            "<h4>Price: N "+price+"</h4>" +
                            "<img src=\"img/"+brand_name.toLowerCase()+".jpg\" class=\"img-responsive center-block\" style=\"width: 50%;\">" +
                            "<div class=\"btn-group\" role=\"group\" aria-label=\"...\">" +
                            "<button id=button"+id+" class=\"btn btn-block btn-danger btn-lg\" style=\"border-radius: 0px;\">Add To Cart</button>" +
                            "<button href=\"#\" class=\"btn btn-block btn-info btn-lg\" style=\"border-radius: 0px;\">View Details</button>" +
                            "</div>" +
                            "</div>" +
                            "<script>" +
                            "$(document).ready(function(){" +
                            "$(\"#button"+id+"\").click(function(){" +
                            "$(\"#button" + id + "\").text(\"Adding .......\");" +
                            "$(\"#button" + id + "\").animate({opacity: '0'}, \"slow\");" +
                            "$(\"#button" + id + "\").animate({opacity: '1'}, \"slow\", function(){" +
                            "$(\"#button" + id + "\").text(\"Add To Cart\");" +
                            "});" +
                            "    $.post(\"add-to-cart.jsp\" ," +
                            "    {" +
                            "        id: " + id +
                            "    }," +
                            "    function(data, status){" +
                            "        alert(\"Item Added\");" +
                            "    });" +
                            "window.location.reload();" +
                            "});" +
                            "});" +
                            "</script>");
                  }

                }

                catch(Exception ex){
                  out.write("An error occured: " + ex.getMessage());
                }
              }

            %>
          </div>
        </div>
        <div id="menu1" class="tab-pane fade">
          <%--Trigger search modal--%>
          <button data-toggle="modal" data-target="#searchModal" class="btn btn-block btn-lg btn-danger" style="border-radius: 0px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">Search</button>
      </div>
    </div>
    </div>
  </div>
</div>
<%@include file="WEB-INF/footer.jsp" %>

