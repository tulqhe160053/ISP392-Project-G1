<%-- 
    Document   : category
    Created on : Jan 26, 2023, 1:13:00 PM
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
        <title>Category</title>
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
    <body id="category">

        <!-- Start Header Area -->
        <jsp:include page="../header.jsp" />
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <div class="container">
            <div class="row text-center mb-3"><h1>Category</h1></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="row">
                        <c:forEach items="${requestScope.listCategorys}" var="category">
                            <div class="col-lg-3 col-md-4 h-auto mb-3">
                                <button type="button" class="btn btn-warning btn-lg w-100 h-auto"><a href="<%=request.getContextPath()%>/category?catId=${category.getCategoryId()}" class="text-dark" style="text-decoration: none">${category.getCategoryName()}</a></button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>


        <div class="container">
            <c:forEach items="${requestScope.listCategorys}" var="category">
                <c:if test="${category.getCategoryId() == requestScope.catId}">

                    <div class="row justify-content-center">
                        <div class="col-lg-6 text-center">
                            <div class="section-title">
                                <h1>${category.getCategoryName()}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.list_products}" var="product">
                            <c:if test="${product.getCategory().getCategoryId() == category.getCategoryId()}">
                                <c:forEach var="productImg" items="${requestScope.list_productImg}">
                                    <c:if test="${productImg.getProduct().getProductID() == product.getProductID()}">
                                        <div class="card ml-3 mb-3" style="width: 18rem;">
                                            <img src="<%=request.getContextPath()%>/assets/product_img/${category.getCategoryName()}/${product.getBrand().getBrandName()}/${productImg.getProductImgUrl()}" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">${product.getProductName()}</h5>
                                                <p class="card-text">Color: ${product.getColor()}</p>
                                                <p class="card-text text-danger">Price: ${product.getSellPrice()}$</p>
                                                <a href="<%=request.getContextPath()%>/product?productId=${product.getProductID()}" class="btn btn-primary">View detail</a>
                                                <form action="<%=request.getContextPath()%>/cart" method="get" style="display: inline-block">
                                                    <input type="hidden" name="productId" value="${product.getProductID()}" />
                                                    <input type="hidden" name="amount" value="1" />
                                                    <button type="submit" class="btn btn-danger" value="submit" >Add to cart</button>
                                                </form>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>

                </c:if>
            </c:forEach>
        </div>
    </div>

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
