<%-- 
    Document   : addaddress
    Created on : Feb 16, 2023, 8:19:13 PM
    Author     : thaib
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
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
    </head>


    <body>

        <jsp:include page="../header.jsp" />
        <div class="d-flex justify-content-center align-items-center mb-3">
            <h4 class="text-right"></h4>
        </div> 
        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px"<span> </span></div>

        <div class="container py-5">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col">
                    <div class="card my-4 shadow-3">
                        <div class="row g-0">
                            <div class="col-xl-6 d-xl-block bg-image">
                                <img src="https://mdbcdn.b-cdn.net/img/Others/extended-example/delivery.webp" alt="Sample photo"
                                     class="img-fluid" />
                                <div class="mask" style="background-color: rgba(0, 0, 0, 0.6)">
                                    <div class=" justify-content-center align-items-center h-100">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <form action="AddAddress2" method="post" >
                                    <div class="card-body p-md-5 text-black">
                                        <h3 class="mb-4 text-uppercase">ADD SHIP ADDRESS INFO</h3>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example3" name="Fullname" class="form-control form-control-lg" >
                                            <label class="form-label" for="form3Example3">Full Name</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example8" name="PhoneNum" class="form-control form-control-lg" >
                                            <label class="form-label" for="form3Example8">Phone Num</label>
                                        </div>


                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example3" name="AddressDetail" class="form-control form-control-lg" >
                                            <label class="form-label" for="form3Example3">Address</label>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <select name="district" class="select">
                                                    <option value="0">District</option>
                                                    <c:forEach items="${listD}" var= "o">
                                                        <option value="${o.districtID}">${o.districtName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <select name="city" class="select">
                                                    <option value="0">City</option>
                                                    <c:forEach items="${listC}" var= "o">
                                                        <option value="${o.cityID}">${o.cityName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="d-flex justify-content-end pt-3">
                                                <input value="SAVE ADDRESS" type="submit" class="primary-btn">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


    </body>        
    <jsp:include page="../footer.jsp" />
</html>
