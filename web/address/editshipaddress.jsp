<%-- 
    Document   : editshipaddress
    Created on : Feb 17, 2023, 4:47:04 PM
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
                                <form action="EditShipAddress2" method="post" >
                                    <div class="card-body p-md-5 text-black">
                                        <h3 class="mb-4 text-uppercase">EDIT SHIP ADDRESS INFO</h3>
                                        
                                        <div class="form-outline mb-4">
                                            <input value="${listS.id}" type="text" id="form3Example3" name="id" class="form-control form-control-lg" readonly >
                                            <label class="form-label" for="form3Example3">ID</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input value="${listS.fullName}" type="text" id="form3Example3" name="Fullname" class="form-control form-control-lg" >
                                            <label class="form-label" for="form3Example3">Full Name</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input value="${listS.phoneNum}" type="text" id="form3Example8" name="PhoneNum" class="form-control form-control-lg" >
                                            <label class="form-label" for="form3Example8">Phone Num</label>
                                        </div>


                                        <div class="form-outline mb-4">
                                            <input value="${listS.addressDetail}" type="text" id="form3Example3" name="AddressDetail" class="form-control form-control-lg" >
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
                                            <div class="col-md-12 form-group">
                                                <h3 class="text-danger">${mess}</h3>
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
