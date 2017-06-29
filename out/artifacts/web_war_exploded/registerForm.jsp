<%
    session = request.getSession(false);
    String user = (String) session.getAttribute("user_id");
    if (user != null){
        session.setAttribute("msg", "You Have to log out of current account");
        response.sendRedirect("index.jsp");
    }
%>
<%@include file="WEB-INF/header.jsp" %>
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


<%@include file="WEB-INF/footer.jsp" %>