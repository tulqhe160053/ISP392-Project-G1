<%-- 
    Document   : index
    Created on : Jan 23, 2023, 9:54:46 PM
    Author     : Tu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <title>Karma Shop</title>
        <!--
                CSS
                ============================================= -->
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
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
    <body>
        <!-- Start Header Area -->
        <jsp:include page="../header.jsp" />
        <!-- End Header Area -->

        <!-- start banner Area -->
        <section class="slider">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <c:forEach items="${listSliders}" var="slider" varStatus="i">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${i.index}" <c:if test="${i.index==0}"> class="active" aria-current="true"</c:if> aria-label="Slide ${i.index}"></button>
                    </c:forEach>
                </div>
                <div class="carousel-inner">
                    <c:forEach items="${listSliders}" var="slider" varStatus="i">
                        <div class="carousel-item ${i.index==0?'active':''}">
                            <img src="<%=request.getContextPath()%>/assets/banner_img/${slider.getUrlImage()}" class="d-block w-100" alt="..." />
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
                    <span style="visibility: hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span style="visibility: hidden">Next</span>
                </button>
            </div>
        </section>




        <!-- End banner Area -->

        <!-- start features Area -->
        <section class="features-area section_gap">
            <div class="container">
                <div class="row features-inner">
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="<%=request.getContextPath()%>/img/features/f-icon1.png" alt="">
                            </div>
                            <h6>Free Delivery</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="<%=request.getContextPath()%>/img/features/f-icon2.png" alt="">
                            </div>
                            <h6>Return Policy</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="<%=request.getContextPath()%>/img/features/f-icon3.png" alt="">
                            </div>
                            <h6>24/7 Support</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="<%=request.getContextPath()%>/img/features/f-icon4.png" alt="">
                            </div>
                            <h6>Secure Payment</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end features Area -->

        <!-- Start category Area -->
        <section class="category-area mb-4">
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
        </section>
        <!-- End category Area -->

        <!--Search-->

        <section>
            <div class="container">
                <form action="<%=request.getContextPath()%>/home" method="get" class="form-inline">
                    <div class="d-flex flex-row mb-4" style="margin: 0 auto">
                        <input class="form-control " name="searchName" placeholder="Search" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search'"
                               required="" type="text">
                        <button type="submit" class="bb-btn btn bg-warning"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </div>
                </form>
            </div>

        </section>
        <!--End search-->

        <!-- start product Area -->
        <c:choose>  

            <c:when test="${requestScope.listSearch_products != null}"> 
                <c:set var="list" value="${requestScope.listSearch_products}"></c:set>
                    <div class="single-product-slider">
                        <div class="container">
                            <div class="row justify-content-center">
                            <c:forEach items="${list}" var="product">
                                <c:forEach var="productImg" items="${requestScope.list_productImg}">
                                    <c:if test="${productImg.getProduct().getProductID() == product.getProductID()}">
                                        <div class="card ml-3 mb-3" style="width: 18rem;">
                                            <img src="<%=request.getContextPath()%>/assets/product_img/${product.getCategory().getCategoryName()}/${product.getBrand().getBrandName()}/${productImg.getProductImgUrl()}" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">${product.getProductName()}</h5>
                                                <p class="card-text">Color: ${product.getColor()}</p>
                                                <p class="card-text text-danger">Price: ${product.getSellPrice()}$</p>
                                                <a href="product?productId=${product.getProductID()}" class="btn btn-primary">View detail</a>
                                                <form action="<%=request.getContextPath()%>/cart" method="get" style="display: inline-block">
                                                    <input type="hidden" name="productId" value="${product.getProductID()}" />
                                                    <input type="hidden" name="amount" value="1" />
                                                    <button type="submit" class="btn btn-danger" value="submit" >Add to cart</button>
                                                </form>

                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:when> 

            <c:otherwise>
                <section class="active-product-area">
                    <c:forEach items="${requestScope.listCategorys}" var="category">
                        <div class="single-product-slider">
                            <div class="container">
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
                                                        </div>
                                                        <div>
                                                            <a href="product?productId=${product.getProductID()}" class="btn btn-primary">View detail</a>
                                                            <!--                                                <form action="cart" method="get" style="display: inline-block">
                                                                                                                <input type="hidden" name="productId" value="${product.getProductID()}" />
                                                                                                                <input type="hidden" name="amount" value="1" />
                                                                                                                <button class="btn btn-danger" type="submit" value="submit">Add to cart</button>
                                                                                                            </form>-->
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
                                <div class="row">
                                    <a href="category?catId=${category.getCategoryId()}">View all product</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </section>
            </c:otherwise> 
        </c:choose>
        <!-- end product Area -->

        <!-- footer -->
        <%@include file="../footer.jsp" %>

        <script src="<%=request.getContextPath()%>/js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/js/vendor/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ajaxchimp.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.nice-select.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
        <script src="<%=request.getContextPath()%>/js/nouislider.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/countdown.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="<%=request.getContextPath()%>/js/gmaps.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/main.js"></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
    </body>
</body>
</html>
