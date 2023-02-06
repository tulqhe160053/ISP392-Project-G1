<!DOCTYPE html>
<html lang="zxx" class="no-js">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1>Blog Detail</h1>
                    <nav class="d-flex align-items-center">
                        <a >Blog<span class="lnr lnr-arrow-right"></span></a>
                        <a >Blog Detail</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    

    <!--================Blog Area =================-->
    <section class="blog_area">
        <c:set var="blog" value="${requestScope.blog}"/>
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog_left_sidebar">
                        
                        <article class="row blog_item">
                            <div class="col-md-3">
                                <div class="blog_info text-right">
                                    <div class="post_tag">
                                        <h3>${blog.category.categoryName}</h3>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="blog_post">
                                    <img src="<%=request.getContextPath()%>/assets/blog_img/${blog.imageLink}" alt="">
                                    <div class="blog_details">
                                        <a>
                                            <h2>${blog.title}</h2>
                                            <h5>${blog.description}</h5>
                                            <h5>${blog.content}</h5>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </article>
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search Posts" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
                                </span>
                            </div><!-- /input-group -->
                            <div class="br"></div>
                        </aside>
                    </div>
                </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

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