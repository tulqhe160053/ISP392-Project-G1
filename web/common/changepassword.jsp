<%-- 
    Document   : ChangePassword
    Created on : Jan 28, 2023, 3:23:51 PM
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
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/fav.png">
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
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner">
                            <h3>Change Your Password</h3>
                            <form class="row login_form" action="<%=request.getContextPath()%>/changepassword" method="post" id="contactForm" novalidate="novalidate">
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="name" name="oldPassword" placeholder="Enter your old-password" maxlength="6" required>                          
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="name" name="newPassword" placeholder="Enter your new-password" maxlength="6" required>                          
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="name" name="reNewPassword" placeholder="Re-enter your new-password" maxlength="6" required>                          
                                </div>
                                
                                <div class="col-md-12 form-group">
                                    <h3 class="text-danger">${mess}</h3>
                                </div>

                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" class="primary-btn">Change</button>
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