<%-- 
   Document   : login
   Created on : Jan 16, 2023, 11:27:55 PM
   Author     : ducth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Karma Shop</title>

        <!--
                CSS
                ============================================= -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/linearicons.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/themify-icons.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
        <style>
            #message {
                display:none;
                background: #f1f1f1;
                color: #000;
                position: relative;
                padding: 20px;
                margin-top: 10px;
            }

            #message p {
                padding: 10px 35px;
                font-size: 18px;
            }

            
            
            
            .valid {
                color: green;
            }

            .valid:before {
                position: relative;
                left: -35px;
                
            }

            /* Add a red text color and an "x" icon when the requirements are wrong */
            .invalid {
                color: red;
            }

            .invalid:before {
                position: relative;
                left: -35px;
                
            }

        </style>
    </head>

    <body>

        <jsp:include page="../header.jsp" />

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">

                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Login Box Area =================-->
        <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/img/login.jpg" alt="">
                            <div class="hover">
                                <h4>Already have an account</h4>
                                <a class="primary-btn" href="<%=request.getContextPath()%>/common/login.jsp">Login</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner pt-3">
                            <h3>Register</h3>
                            <form name ="form1" class="row login_form pt-2" action="<%=request.getContextPath()%>/register" method="post" id="contactForm">
                                <div class="col-md-12 form-group">
                                    <input type="text" class="form-control" id="name" name="userName" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'" required>
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="psw" name="password" placeholder="Password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required>
                                </div>
                               <div id="message">
                                <h3>Password must contain the following:</h3>
                                <p id="letter" class="invalid">A lowercaseletter</p>
                                <p id="capital" class="invalid">A uppercase letter</p>
                                <p id="number" class="invalid">A number </p>
                                <p id="lengthPass" class="invalid">Minimum 6 characters</p>                              
                            </div>

                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="repassword" name="repass" placeholder="RePassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'RePassword'" required>
                                </div>

                                <div class="col-md-3 form-group">
                                    <label  for="gender" class="form-label">Gender </label>
                                </div>
                                <div class="col-md-9 form-group">

                                    <select name="gender" class="form-control" placeholder="Gender" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Gender'" required>
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>

                                </div>


                                <div class="col-md-12 form-group">
                                    <input type="email" class="form-control" id="em" name="email" placeholder="Email"   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" required>
                                </div>

                                <div class="col-md-12 form-group">
                                    <input type="num" class="form-control" id="phone" name="num" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'" required>
                                </div>

                                <div class="col-md-12 form-group">
                                    <h3 class="text-danger">${mess}</h3>
                                </div>




                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" class="primary-btn">Register</button>

                                </div>
                            </form>
                             

                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Login Box Area =================-->

        <!-- start footer Area -->
        <%@include file="../footer.jsp" %>
        <!-- End footer Area -->


        <script src="<%=request.getContextPath()%>/js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/js/vendor/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ajaxchimp.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.nice-select.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
        <script src="<%=request.getContextPath()%>/js/nouislider.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="<%=request.getContextPath()%>/js/gmaps.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/main.js"></script>

        <script>
                                        var myInput = document.getElementById("psw");
                                        var letter = document.getElementById("letter");
                                        var capital = document.getElementById("capital");
                                        var number = document.getElementById("number");
                                        var lengthpass = document.getElementById("lengthPass");

// When the user clicks on the password field, show the message box
                                        myInput.onfocus = function () {
                                            document.getElementById("message").style.display = "block";
                                        };

// When the user clicks outside of the password field, hide the message box
                                        myInput.onblur = function () {
                                            document.getElementById("message").style.display = "none";
                                        };

// When the user starts to type something inside the password field
                                        myInput.onkeyup = function () {
                                            // Validate lowercase letters
                                            var lowerCaseLetters = /[a-z]/g;
                                            if (myInput.value.match(lowerCaseLetters)) {
                                                letter.classList.remove("invalid");
                                                letter.classList.add("valid");
                                            } else {
                                                letter.classList.remove("valid");
                                                letter.classList.add("invalid");
                                            }

                                            // Validate capital letters
                                            var upperCaseLetters = /[A-Z]/g;
                                            if (myInput.value.match(upperCaseLetters)) {
                                                capital.classList.remove("invalid");
                                                capital.classList.add("valid");
                                            } else {
                                                capital.classList.remove("valid");
                                                capital.classList.add("invalid");
                                            }

                                            // Validate numbers
                                            var numbers = /[0-9]/g;
                                            if (myInput.value.match(numbers)) {
                                                number.classList.remove("invalid");
                                                number.classList.add("valid");
                                            } else {
                                                number.classList.remove("valid");
                                                number.classList.add("invalid");
                                            }

                                            // Validate length
                                            if (myInput.value.length >= 6) {
                                                lengthpass.classList.remove("invalid");
                                                lengthpass.classList.add("valid");
                                            } else {
                                                lengthpass.classList.remove("valid");
                                                lengthpass.classList.add("invalid");
                                            }
                                        };
        </script>

 
    </body>

</html>
