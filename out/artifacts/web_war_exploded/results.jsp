<%--<%@page import = "db.Catalogue"%>--%>
<%@page import = "db.DBHelper"%>
<%@page import = "db.HEOMData"%>
<%@ page import="db.Catalogue" %>

<%@include file="WEB-INF/header.jsp" %>
<!-- help popover button -->
<button class="btn btn-default btn-lg btn-info" data-toggle="popover" data-placement="top" data-content="Call us on 090088888" style="border-radius: 7px; position: fixed; bottom: 5px;right: 5px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); z-index: 2;">Help</button>


<div class="container-fluid" style="margin-top: 100px;background-color: white;padding-left: 5% ;padding-right: 5% ;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <h1>Search Results For : <small><%=request.getParameter("brand_name") + " " + request.getParameter("device_type")%></small></h1>
    <div class="row">
        <%
            String type = request.getParameter("device_type");
            String brand = request.getParameter("brand_name");
            double ram = 0;
            double storage = 0;
            double screen = 0;
            double min_cost = 0;
            double max_cost = 0;
            if (!(request.getParameter("ram").toString().equals(""))){
                ram = Double.parseDouble(request.getParameter("ram").toString());
            }
            if (!(request.getParameter("storage_size").toString().equals(""))){
                storage = Double.parseDouble(request.getParameter("storage_size").toString());
            }
            if (!(request.getParameter("screen_size").toString().equals(""))){
                screen = Double.parseDouble(request.getParameter("screen_size").toString());
            }
            if (!(request.getParameter("min").toString().equals(""))){
                min_cost = Double.parseDouble(request.getParameter("min").toString());
            }
            if (!(request.getParameter("max").toString().equals(""))){
                max_cost = Double.parseDouble(request.getParameter("max").toString());
            }
            Catalogue log = new Catalogue();
            String[] ids = log.GetMatchedItemsId(type, brand, ram, storage,screen,min_cost, max_cost);
//            int count = 0;
            Connection con;
            PreparedStatement st;
            ResultSet resultSets;
            for (int i = 0; i < 10; i++){


                try{

                    String sql = "SELECT * FROM catalogue WHERE id = '"+ ids[i] +"'";
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
                        out.write(
                                "<div class=\"col-md-4  well\" style=\"background-color: white;margin: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);\">" +
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
                        count++;
                    }

                }

                catch(Exception ex){
                    out.write("An error occured: " + ex.getMessage());
                }
            }

        %>
    </div>
    </div>
</div>

<%@include file="WEB-INF/footer.jsp" %>