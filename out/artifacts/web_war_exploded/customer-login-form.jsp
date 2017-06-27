<%
    session = request.getSession(false);
    String user = (String) session.getAttribute("user_id");
    if (user != null){
        session.setAttribute("msg", "You Have to log out of current account");
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>LOGIN</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!--fonts-->
    <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800" rel="stylesheet">
    <!--//fonts-->
</head>
<body>
<!--background-->
<!-- login -->
<h1>SARPERSTEIN</h1>
<div class="login-w3l">
    <div class="top-img-agileits-w3layouts">
        <h2 class="sub-head-w3-agileits">LOG IN</h2>
        <p>Fillout your details</p>
    </div>
    <div class="login-form">
        <form action="customer-login.jsp" method="post">
            <input type="email" name="email" placeholder="Email" required/>
            <input type="password" name="pwd" placeholder="Password" required/>
            <input type="submit" value="LOG IN">
        </form>
    </div>
    <!-- //login -->
</div>
<div class="clear"></div>
<!--//login-->
</body>
</html>