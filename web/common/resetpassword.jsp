<%-- 
    Document   : ResetPassword
    Created on : Jan 28, 2023, 3:41:09 PM
    Author     : Trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
               <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    </head>

    <body>

            <jsp:include page="../header.jsp" />

   

        <!--================Reset Box Area =================-->
        <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/img/login.jpg" alt="">
                            <div class="hover">
                                <h4>Have not an account?</h4>
                                <a class="primary-btn" href="<%=request.getContextPath()%>common/register.jsp">Register</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner">
                            <h3>Reset Password</h3>
                            <form class="row login_form" action="<%=request.getContextPath()%>/resetpassword" method="post" id="contactForm" novalidate="novalidate">
                                <div class="col-md-12 form-group">
                                    <input type="text" class="form-control" id="name" name="email" placeholder="Email" required>
                                </div>

<!--                                <div class="col-md-12 form-group">
                                    <h3 class="text-danger">${mess}</h3>
                                </div>-->

                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" class="primary-btn">Send Code</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Reset Box Area =================-->

        <jsp:include page="../footer.jsp" />
</html>