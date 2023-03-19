<%-- 
    Document   : edituser
    Created on : Feb 5, 2023, 6:13:54 PM
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
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

   

        
        <div class="container-fluid rounded bg-white mt-5 mb-5">
            <div class="col">
                <div class="border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span> </span></div>
                    
                </div>
                <div class="border-right d-flex justify-content-center align-items-center ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <h4 class="text-right">User Edit</h4>
                        </div>
                        <form  action="<%=request.getContextPath()%>/edituser" method="post" id="contactForm">
                            <div class="row mt-3">
                                <div class="col-md-12"><label for = "pwd">Username</label>
                                    <input type="text" class="form-control" name="userName" value="${sessionScope.user.userName}" ></div>

                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label for = "pwd">Current gender: ${sessionScope.user.gender}</label></div>
                            </div>


                            <div class="row mt-3">
                                <div class="col-md-5"> 
                                    <select name="gender" class="form-control" placeholder="Gender" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Gender'" required>
                                        <option <c:if test="${sessionScope.user.gender == 'male'}">selected</c:if> value="male">male</option>
                                        <option <c:if test="${sessionScope.user.gender == 'female'}">selected</c:if> value="female">female</option>
                                    </select>
                                </div>
                                <div class="col-md-12 mt-3"><label for = "pwd">Email</label>
                                    <input type="email" class="form-control" name="email" value="${sessionScope.user.email}" placeholder="Email"   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" required></div>
                                    
                                <div class="col-md-12 mt-3"><label for = "pwd">Phone Number</label>
                                    <input type="num" class="form-control" name="PhoneNum" value="${sessionScope.user.phoneNum}" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'" required></div>
                                <div class="col-md-12 form-group">
                                                <h3 class="text-danger">${mess}</h3>
                                </div>    
                                    <div class="col-md-12 mt-3"><label for = "pwd">UserID: </label>
                                        <input type="text" class="form-control" name="userId" value="${sessionScope.user.getUserID()}" readonly >
                                </div>


                                <div class="col-md-12 mt-4"><label for = "pwd">Status:</label>
                                    <input type="text" class="form-control" name="userId" value="${sessionScope.user.getUserStatus().getStatusName()}" readonly >
                                </div>
                            </div>
                            <div class="mt-5 text-center"><button value="submit" type="submit" class="primary-btn" >Save</button></div>
                        </form>
                    </div>
                </div>

            </div>
        </div>  
    </div>
</div>

        <jsp:include page="../footer.jsp" />
</html>