<%-- 
    Document   : product-detail
    Created on : Jan 26, 2023, 2:36:15 PM
    Author     : Tu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/themify-icons.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    </head>
    <body>
        <!-- Start Header Area -->
        <jsp:include page="../header.jsp" />
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <nav class="d-flex align-items-center">
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Single Product Area =================-->
        <c:set var="product" value="${requestScope.product}"></c:set>
            <div class="product_image_area">
                <div class="container">
                    <div class="row s_product_inner">
                        <div class="col-lg-6">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/assets/product_img/${product.getCategory().categoryName}/${product.getBrand().brandName}/${requestScope.productImg.productImgUrl}" alt="">
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="s_product_text">
                            <h3>${product.getProductName()}</h3>
                            <h2>$${product.getSellPrice()}</h2>
                            <ul class="list">
                                <li><a class="active" href="<%=request.getContextPath()%>/product?action=listProduct&catId=${product.getCategory().getCategoryId()}"><span>Category:</span> ${product.getCategory().getCategoryName()}</a></li>
                                <li><span>Stock</span> : <span class="ml-4">${product.getProductStatus().getStatusName()}</span></li>
                            </ul>
                            <p>${product.getDescription()}</p>
                            <form action="<%=request.getContextPath()%>/cart" method="get">
                                <div class="product_count">
                                    <label for="qty">Quantity:</label>
                                    <input type="number" name="amount" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                                </div>
                                <div class="card_area d-flex align-items-center">
                                    <input type="hidden" name="action" value="addCart" />
                                    <input type="hidden" name="productId" value="${product.getProductID()}" />
                                    <button class="btn btn-danger" type="submit" value="submit">Add to cart</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->

        <!--================Product Description Area =================-->
        <section class="product_description_area">
            <div class="container">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                           aria-selected="false">Reviews</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <p>Beryl Cook is one of Britain’s most talented and amusing artists .Beryl’s pictures feature women of all shapes
                            and sizes enjoying themselves .Born between the two world wars, Beryl Cook eventually left Kendrick School in
                            Reading at the age of 15, where she went to secretarial school and then into an insurance office. After moving to
                            London and then Hampton, she eventually married her next door neighbour from Reading, John Cook. He was an
                            officer in the Merchant Navy and after he left the sea in 1956, they bought a pub for a year before John took a
                            job in Southern Rhodesia with a motor company. Beryl bought their young son a box of watercolours, and when
                            showing him how to use it, she decided that she herself quite enjoyed painting. John subsequently bought her a
                            child’s painting set for her birthday and it was with this that she produced her first significant work, a
                            half-length portrait of a dark-skinned lady with a vacant expression and large drooping breasts. It was aptly
                            named ‘Hangover’ by Beryl’s husband and</p>
                        <p>It is often frustrating to attempt to plan meals that are designed for one. Despite this fact, we are seeing
                            more and more recipe books and Internet websites that are dedicated to the act of cooking for one. Divorce and
                            the death of spouses or grown children leaving for college are all reasons that someone accustomed to cooking for
                            more than one would suddenly need to learn how to adjust all the cooking practices utilized before into a
                            streamlined plan of cooking that is more efficient for one person creating less</p>
                    </div>
                    <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="row total_rate">
                                    <div class="col-6">
                                        <div class="box_total">
                                            <h5>Overall</h5>
                                            <h4>5.0</h4>
                                            <h6>(03 Reviews)</h6>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="rating_list">
                                            <h3>Based on 3 Reviews</h3>
                                            <ul class="list">
                                                <li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                            class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                <li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                            class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                <li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                            class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                <li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                            class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                <li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                            class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="review_list">
                                    <c:forEach items="${requestScope.listFeedBack}" var="feedback">
                                        <div class="review_item">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="<%=request.getContextPath()%>/img/user.jpg" width="40" height="40" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <h4>${feedback.getUser().getUserName()}</h4>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <p>${feedback.getFeedbackDetail()}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="review_box">
                                    <form method="GET" action="<%=request.getContextPath()%>/addfeedback">
                                        <input type="hidden" name="productID" value="${product.getProductID()}" id="myValue"/>
                                        <button class="btn primary-btn" type="submit">Add a feedback</button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!--================End Product Description Area =================-->

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
