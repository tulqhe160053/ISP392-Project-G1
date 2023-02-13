<%-- 
    Document   : viewuser2
    Created on : Feb 5, 2023, 5:34:41 PM
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

        <jsp:include page="header.jsp" />

   

        
        <div class="container-fluid rounded bg-white mt-5 mb-5">
            <div class="col">
                <div class="border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span> </span></div>
                    
                </div>
                <div class="border-right d-flex justify-content-center align-items-center ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <h4 class="text-right">User Detail</h4>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12"><label for = "pwd">Username: </label>
                                <a  class="text-right"> ${sessionScope.user.userName}</a>
                                </div>
                                
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-md-12"><label for = "pwd">Gender: </label>
                            <a  class="text-right"> ${sessionScope.user.gender}</a>
                            </div>
                        </div>


                        <div class="row mt-3">                          
                         
                            <div class="col-md-12 mt-3"><label for = "pwd">Email: </label>
                                <a  class="text-right"> ${sessionScope.user.email}</a></div>
                                
                            <div class="col-md-12 mt-3"><label for = "pwd">Phone Number: </label>
                                <a  class="text-right"> ${sessionScope.user.phoneNum}</a></div>
                           
                                <div class="col-md-12 mt-3"><label for = "pwd">Role: </label>
                                    <a  class="text-right"> ??</a>
                                </div>

                            <div class="col-md-12 mt-4"><label for = "pwd">Status: </label>
                                <a  class="text-right"> ??</a>
                            </div>


                        </div>
                        <div class="mt-5 text-center"><a class="primary-btn" href="edituser.jsp">Edit User</a></div>
                        <div class="mt-4 text-center"><a class="primary-btn" href="changepassword.jsp">Change Password</a></div>
                    </div>
                </div>

            </div>
        </div>  
    </div>
</div>

</body>
        <jsp:include page="footer.jsp" />
</html>