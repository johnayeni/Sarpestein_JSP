<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <title>Cart</title>
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
                <form class="navbar-form navbar-left form-inline">
                    <div class="form-group">
                        <input type="text" name="search" placeholder="Search.." class="input-md form-control" style="border-radius: 0px;width: 400px;">
                    </div>
                    <button type="submit" class="btn btn-md btn-danger" style="border-radius: 0px;">Search</button>
                </form>
                <!-- trigger for loging modal -->
                <li><a data-toggle="modal" data-target="#myModal">Your Account</a></li>
                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">LOGIN</h4>
                            </div>
                            <div class="modal-body">
                                <p>Dont have an account? <a href="registerForm.html">Create Account</a></p>
                                <form>
                                    <div class="form-group">
                                        <label for="email">Email address:</label>
                                        <input type="email" class="form-control" name="email" required autofocus>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <input type="password" class="form-control" name="pwd" required>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox"> Remember me</label>
                                    </div>
                                    <button type="submit" class="btn btn-block btn-danger">Log In</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
                <li><a href="#">Cart<span class="badge" style="background-color: firebrick;">0</span></a></li>
            </ul>
        </div>
    </div>
</nav>
<hr>

<!-- help popover button -->
<button class="btn btn-default btn-lg btn-info" data-toggle="popover" data-placement="top" data-content="Call us on 090088888" style="border-radius: 7px; position: fixed; bottom: 5px;right: 5px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); z-index: 2;">Help</button>

<!-- check out button -->
<button class="btn btn-default btn-lg btn-danger" style="border-radius: 0px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);z-index: 2;position: fixed;top: 15%;">CHECKOUT</button>


<div class="container" style="margin-top: 100px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <h1>Cart Items</h1>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                Panel content
            </div>
            <div class="panel-footer">Panel footer</div>
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