<%-- 
    Document   : ViewCartComplete
    Created on : Feb 10, 2023, 11:53:00 PM
    Author     : Tu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Cart</title>
        <!--
                CSS
                ============================================= -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/linearicons.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/themify-icons.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
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

        <!-- Start Header Area -->
        <jsp:include page="../header.jsp" />
        <!-- End Header Area -->

        <!-- Start Banner Area -->

        <!-- End Banner Area -->

        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Cart complete</h1>
                    </div>
                </div>
            </div>
        </section>

        <!--Ship address-->

        <div class="container mt-5 p-3 rounded cart">
            <div class="row no-gutters justify-content-between">
                <div class="col-md-7 pl-3">
                    <div class="product-details mr-2">
                        <div class="d-flex flex-row align-items-center"><i class="fa fa-long-arrow-left"></i><span class="ml-2">Continue Shopping</span></div>
                        <hr>
                        <h6 class="mb-0">Shopping cart</h6>
                        <div class="d-flex justify-content-between"></div>
                        <c:forEach items="${requestScope.listCartProduct}" var="item">
                            <div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded">
                                <c:forEach items="${requestScope.list_productImg}" var="img_item" >
                                    <c:if test="${img_item.getProduct().getProductID() == item.getProduct().getProductID()}">
                                        <c:set var="category" value="${item.getProduct().getCategory().getCategoryName()}"></c:set>
                                        <c:set var="brand" value="${item.getProduct().getBrand().getBrandName()}"></c:set>
                                        <div class="d-flex flex-row"><img class="rounded" src="<%=request.getContextPath()%>/assets/product_img/${category}/${brand}/${img_item.getProductImgUrl()}" width="40">
                                            <div class="ml-2"><span class="font-weight-bold d-block">${item.getProduct().getProductName()}</span></div>
                                        </div>
                                        <div class="d-flex flex-row align-items-center"><span class="d-block">${item.getAmount()}</span><span class="d-block ml-5 font-weight-bold">$${item.getProduct().getSellPrice()}</span><i class="fa fa-trash-o ml-3 text-black-50"></i></div>
                                        </c:if>
                                </c:forEach>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-4">
                    <c:set var="shipaddress" value="${requestScope.shipaddress}"></c:set>
                    <div class="payment-info">
                        <div class="d-flex justify-content-between align-items-center font-weight-bold"><h2>Ship address</h2></div>

                        <div><h5 class="credit-card-label text-black-50">Fullname: <span class="text-dark">${shipaddress.getFullName()}</span></h5></div>
                        <div><h5 class="credit-card-label text-black-50">Email: <span class="text-dark">${shipaddress.getUser().getEmail()}</span></h5></div>
                        <div><h5 class="credit-card-label text-black-50">Phone Number: <span class="text-dark">${shipaddress.getUser().getPhoneNum()}</span></h5></div>
                        <div><h5 class="credit-card-label text-black-50">City: <span class="text-dark">${shipaddress.getShipCity().getCityName()}</span></h5></div>
                        <div><h5 class="credit-card-label text-black-50">District: <span class="text-dark">${shipaddress.getDistrict().getDistrictName()}</span></h5></div>
                        <div><h5 class="credit-card-label text-black-50">Address detail: <span class="text-dark">${shipaddress.getAddressDetail()}</span></h5></div>
                        <div><a href="ViewListAddress">Change ship address</a></div>
                        <hr class="line">
                        <div class="d-flex justify-content-between information"><span>Total</span><span>$${requestScope.total}</span></div>
                        <button class="btn btn-danger btn-block mt-3"><a href="<%=request.getContextPath()%>/order?action=addOrder&cartId=${requestScope.cartId}&shipAddressId=${requestScope.shipaddress.getId()}&total=${requestScope.total}">Order</a></button>
                    </div>
                </div>
            </div>
        </div>

        <!--End Ship address-->
        <!--================End Cart Area =================-->

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
    </body>
</html>

