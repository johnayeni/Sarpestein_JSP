<%
    session = request.getSession(false);
    String user = (String) session.getAttribute("user_id");
    String cart = (String) session.getAttribute("cart");
    if (cart == null || cart == ""){
        session.setAttribute("msg", "Empty Cart");
        response.sendRedirect("index.jsp");
    }
    else if (user == null || user == ""){
        session.setAttribute("msg", "You need to log in");
        response.sendRedirect("customer-login-form.jsp");
    }
    else{
%>
<!DOCTYPE html>
<html>
<head>
    <title>PAY OUT</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/form-style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<div class="main">
    <h1>SARPERSTEIN | PAY OUT FORM</h1>
    <div class="content">

        <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default', //Types: default, vertical, accordion
                    width: 'auto', //auto or any width like 600px
                    fit: true   // 100% fit in a container
                });
            });

        </script>
        <div class="sap_tabs">
            <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                <div class="pay-tabs">
                    <h2>Select Payment Method</h2>
                    <ul class="resp-tabs-list">
                        <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span><label class="pic1"></label>Credit Card</span></li>
                        <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span><label class="pic2"></label>Debit Card</span></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="resp-tabs-container">
                    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                        <div class="payment-info">
                            <h3>Delivery Info</h3>
                            <form action="order.jsp" method="POST">
                                <div class="tab-for">
                                    <legend>
                                        <h5>DELIVERY ADDRESS</h5>
                                        <textarea rows="5"  name="delivery address" required></textarea>
                                    </legend>
                                </div>
                                <legend>
                                    <h3 class="pay-title">Credit Card Info</h3>
                                    <div class="tab-for">
                                        <h5>NAME ON CARD</h5>
                                        <input type="text" value="" required>
                                        <h5>CARD NUMBER</h5>
                                        <input class="pay-logo" type="text"  placeholder="0000-0000-000"  required minlength="11" maxlength="11">
                                    </div>
                                    <div class="transaction">
                                        <div class="tab-form-left user-form">
                                            <h5>EXPIRATION</h5>
                                            <ul>
                                                <li>
                                                    <input type="number" class="text_box" type="text" placeholder="6" min="1" max="31" required />
                                                </li>
                                                <li>
                                                    <input type="number" class="text_box" type="text" placeholder="2017" min="2017" required />
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="tab-form-right user-form-rt">
                                            <h5>CVV NUMBER</h5>
                                            <input type="text" placeholder="xxx" required minlength="3" maxlength="3">
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </legend>
                                <button class="verify">Verify Card</button>
                                <input type="submit" value="SUBMIT" class ="submit">
                            </form>
                            <div class="single-bottom">
                                <ul>
                                    <li>
                                        <input type="checkbox"  id="brand" value="" required>
                                        <label for="brand"><span></span>By checking this box, I agree to the Terms & Conditions & Privacy Policy.</label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
                        <div class="payment-info">
                            <div class="payment-info">
                                <h3>Delivery Info</h3>
                                <form action="order.jsp" method="POST">
                                    <div class="tab-for">
                                        <legend>
                                            <h5>DELIVERY ADDRESS</h5>
                                            <textarea rows="5"  name="delivery address" required></textarea>
                                        </legend>
                                    </div>
                                    <legend>
                                        <h3 class="pay-title">Debit Card Info</h3>
                                        <div class="tab-for">
                                            <h5>NAME ON CARD</h5>
                                            <input type="text" value="" required>
                                            <h5>CARD NUMBER</h5>
                                            <input class="pay-logo" type="text" placeholder="0000-0000-000" required minlength="11" maxlength="11">
                                        </div>
                                        <div class="transaction">
                                            <div class="tab-form-left user-form">
                                                <h5>EXPIRATION</h5>
                                                <ul>
                                                    <li>
                                                        <input type="number" class="text_box" type="text" placeholder="6" min="1" max="31" />
                                                    </li>
                                                    <li>
                                                        <input type="number" class="text_box" type="text" placeholder="2017" min="2017"/>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="tab-form-right user-form-rt">
                                                <h5>CVV NUMBER</h5>
                                                <input type="text" placeholder="xxx" minlength="3" maxlength="3">
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </legend>
                                    <input type="submit" class="submit" value="SUBMIT" disabled>
                                </form>
                                <div class="single-bottom">
                                    <ul>
                                        <li>
                                            <input type="checkbox"  id="brand" value="" required>
                                            <label for="brand"><span></span>By checking this box, I agree to the Terms & Conditions & Privacy Policy.</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
<%
    }
%>