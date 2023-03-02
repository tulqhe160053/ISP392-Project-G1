<%-- 
    Document   : viewaddress
    Created on : Feb 7, 2023, 12:08:12 AM
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

       <div class="d-flex justify-content-center align-items-center mb-3">
                            <h4 class="text-right"></h4>
                        </div> 
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px"<span> </span></div>

    <link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css" integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">
        
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="osahan-account-page-left shadow-sm bg-white h-100">
                    <div class="border-bottom p-4">
                        <div class="osahan-user text-center">
                            <div class="osahan-user-media">
                                <img class="mb-3 rounded-pill shadow-sm mt-1" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="gurdeep singh osahan">
                                <div class="osahan-user-media-body">
                                    <h6 class="mb-2">${sessionScope.user.userName}</h6>
                                    <p class="mb-1">${sessionScope.user.phoneNum}</p>
                                    <p>${sessionScope.user.email}</p>
                                    <p class="mb-0 text-black font-weight-bold"><a class="primary-btn" href="AddAddress"><i class="icofont-ui-edit"></i> ADD ADDRESS</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="nav nav-tabs flex-column border-0 pt-4 pl-5 pb-4" id="myTab" role="tablist">
                        
                    </ul>
                </div>
            </div>
                                   
            <div class="col-md-9">
                <div class="osahan-account-page-right shadow-sm bg-white p-4 h-100">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade  active show" id="addresses" role="tabpanel" aria-labelledby="addresses-tab">
                            <h4 class="font-weight-bold mt-0 mb-4">Addresses List</h4>
                            <div class="row">
                                <c:forEach items="${listA}" var="o">
                                    <div class="col-md-6">
                                        <div class="bg-white card addresses-item mb-4 border border-primary shadow">
                                            <div class="gold-members p-4">
                                                <div class="media">
                                                    <div class="mr-3"><i class="icofont-ui-home icofont-3x"></i></div>
                                                    <div class="media-body">
                                                        <h6 class="mb-1 text-secondary">${o.fullName}</h6>
                                                        <p class="text-black">${o.phoneNum}
                                                        <p class="text-black">${o.addressDetail}
                                                        </p>
                                                        <p class="text-black">${o.district.districtName},${o.shipCity.cityName}
                                                        </p>
                                                        <p class="mb-0 text-black font-weight-bold">
                                                            <a class="text-primary mr-3" data-toggle="modal" data-target="#add-address-modal" href="EditShipAddress?aid=${o.id}"><i class="icofont-ui-edit"></i> EDIT</a>
                                                            <a class="text-danger" data-toggle="modal" data-target="#delete-address-modal" href="DeleteAddress?aid=${o.id}"><i class="icofont-ui-delete"></i> DELETE</a>
                                                            
                                                            <c:if test="${o.getIsUse() == true}">
                                                                <i class="ml-1 fa fa-check" style="color: green"></i>
                                                            </c:if>
                                                            <c:if test="${o.getIsUse() != true}">
                                                                <a class="btn btn-primary" href="updateaddress?addressId=${o.getId()}" style="margin-left: 104px;">Set default</a> 
                                                            </c:if>
                                                                                                                       
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                    <div class="mt-5 text-center"></div>
                                    <div class="mt-4 text-center"></div>
                                    
</body>        
 <jsp:include page="../footer.jsp" />
</html>
