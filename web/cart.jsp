<%@include file="WEB-INF/header.jsp" %>
<%int Total_price = 0;%>

<!-- help popover button -->
<button class="btn btn-default btn-lg btn-info" data-toggle="popover" data-placement="top" data-content="Call us on 090088888" style="border-radius: 7px; position: fixed; bottom: 5px;right: 5px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); z-index: 2;">Help</button>


<%--check out button--%>
<a href="checkout.jsp" class="btn btn-default btn-lg btn-primary" style="height: 100px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);z-index: 2;position: fixed;top: 20%;">CHECKOUT</a>


<%--Clear Cart Button--%>
<a href="clear-cart.jsp" class="btn btn-default btn-lg btn-danger" style="height: 100px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);z-index: 2;position: fixed;top: 30%;">CLEAR CART</a>


<div class="container" style="margin-top: 100px;background-color: white;padding: 40px;border-radius : 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <h1>Cart Items</h1>
    <%
        session = request.getSession(false);
        String cart = (String)session.getAttribute("cart");
        if (cart == null || cart == ""){
            out.write("<h3>No Items in cart</h3>");
        }
        else{
            String ids[] = cart.split(";");
            Connection con;
            PreparedStatement st;
            ResultSet rs;

            try {
                for(String id: ids){
                    String sql = "SELECT * FROM catalogue WHERE id = '" + id + "' ";
                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db", "root", "");
                    st = (PreparedStatement) con.prepareStatement(sql);
                    rs = st.executeQuery();
                    while (rs.next()) {
                        String brand = rs.getString("brand_name");
                        String type = rs.getString("device_type");
                        String cost = rs.getString("cost");
                        String ram = rs.getString("ram");
                        String screen = rs.getString("screen_size");
                        String supplier = rs.getString("supplier");
                        String item_id = rs.getString("id");
                        Total_price += Integer.parseInt(cost);
                        if (item_id == null || item_id == "" ) {
                            out.write("<h1>No items Ordered</h1>");
                        } else {
                            out.write("<div class=\"row\">\n" +
                                    "        <div class=\"col-md-12\">\n" +
                                    "            <div class=\"panel panel-primary\">\n" +
                                    "                <div class=\"panel-heading\">\n" +
                                    "                    <h3 class=\"panel-title\">" + brand + " " + type + "</h3>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"panel-body\">\n" +
                                    "                    <div class=\"row\">\n" +
                                    "                        <div class=\"col-md-6\">\n" +
                                    "                            <h3 class=\"text-center\">Price : N " + cost + "</h3>\n" +
                                    "                            <h3 class=\"text-center\">RAM : " + ram + "gb</h3>\n" +
                                    "                            <h3 class=\"text-center\">Srceen Size : " + screen + " \"</h3>\n" +
                                    "                        </div>\n" +
                                    "                        <div class=\"col-md-6\">\n" +
                                    "                            <img src=\"img/img1.JPG\" class=\"img-responsive img-thumbnail center-block\" style=\"width: 50%;\">\n" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"panel-footer\"><a href=\"remove-order.jsp?id=" + item_id + "\">Remove Order</a></div>\n" +
                                    "            </div>\n" +
                                    "        </div>\n" +
                                    "    </div>\n");

                        }
                    }
                }

            }
            catch (Exception ex){
                out.write("An error occured:" + ex.getMessage());
            }
        }


    %>
</div>

<%--Total price displayed--%>
<button  class="btn btn-default btn-lg btn-warning" style="height: 100px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);z-index: 2;position: fixed;top: 40%;">Total Price: N<%=Total_price%></button>


<%@include file="WEB-INF/footer.jsp" %>