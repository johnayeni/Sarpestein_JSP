<%--Brand logo gallery--%>
<div class="container" style="margin-top: 20px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <div class="jumbotron" style="background-color: white;">
        <h1 class="text-center">We have the best brands available</h1>
    </div>


    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=SAMSUNG&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/samsungLogo.png" alt="samsung" width="600" height="400">
            </a>
        </div>
    </div>


    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=DELL&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/dellLogo.png" alt="dell" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=HP&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/hpLogo.png" alt="hp" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=SHARP&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/sharpLogo.jpg" alt="sharp" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=ASUS&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/asusLogo.png" alt="asus" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=LENOVO&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/lenovoLogo.png" alt="lenovo" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=SONY&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/sonyLogo.jpg" alt="sony" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=TECNO&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/tecnoLogo.png" alt="tecno" width="600" height="400">
            </a>
        </div>
    </div>

    <div class="responsive">
        <div class="gallery">
            <a  href="results.jsp?device_type=&brand_name=ACER&ram=&storage_size=&screen_size=&min=&max=">
                <img src="img/logos/acerLogo.png" alt="acer" width="600" height="400" class="img-responsive">
            </a>
        </div>
    </div>

</div>

<div class="container" style="margin-top: 20px;background-color: white;padding: 40px;border-radius: 10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);">
    <div class="row">
        <div class="col-md-12">
            <h4>Why Shop on Sarperstein</h4>
            <p>At Sarperstein, you are guaranteed an online shopping experience like never before. With several items to choose from, Sarperstein offers a wide selection of items that spans across the most polular brand of devices. We have special deals all the time and we are always there for any special season like the Black Friday 2017 in November, Christmas, New Year and every special season there is. We bring the very best products and deals on Sarperstein. Plus, our delivery is fast and our services are effective. Shop on Sarperstein today and enjoy a safe online shopping experience.</p>
        </div>
    </div>
</div>

<footer class="container-fluid text-center" style="margin-top: 20px;background-color: grey; color: white;padding: 100px 50px 20px 50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <ul>
                    <!-- trigger for the modal -->
                    <li data-toggle="modal" data-target="#contactModal"><h2>Contact Us</h2></li>
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
                    <li><h2>About Us</h2></li>
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