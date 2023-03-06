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
                        <h1>My Blogs</h1>
                        <nav class="d-flex align-items-center">
                            <a href="<%=request.getContextPath()%>/home">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="<%=request.getContextPath()%>/mylistblog">My Blog</a>
                            
                        </nav>
                        
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Blog Categorie Area =================-->

        <!--================Blog Categorie Area =================-->

        <!--================Blog Area =================-->
        <section class="blog_area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="blog_left_sidebar">
                            <c:forEach var="blog" items="${listBlog}">

                                    <article class="row blog_item">
                                        <div class="col-md-3">
                                            <div class="blog_info text-right">
                                                <div class="post_tag">
                                                    <h3><a class="active" >${blog.category.categoryName}</a></h3>

                                                </div>
                                                <ul class="blog_meta list">
                                                <li>${blog.viewer} view <i class="lnr lnr-eye"></i></a</li>
                                                <li>${blog.createTime} <i class="lnr lnr-calendar-full"></i></li>
                                                </ul>

                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="blog_post">
                                                <img src="<%=request.getContextPath()%>/assets/blog_img/${blog.imageLink}" alt="">
                                                <div class="blog_details">
                                                    <a>
                                                        <h2>${blog.title}</h2>
                                                    </a>
                                                    <p></p>
                                                    <a href="editblog?id=${blog.id}" class="white_bg_btn">Edit</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                

                            </c:forEach>
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <c:set var="page" value="${page}"/>
                                    <c:forEach begin="${1}" end="${num}" var="i">
                                        <li class="page-item"><a class="page-link ${i==page?"current":""}" href="mylistblog?page=${i}">${i}</a></li>
                                        </c:forEach>
                                </ul>
                            </nav>

                        </div>

                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            
                            <aside class="col-md-12 mt-5 text-center" >
                                <a href="addnewblog" class="active"> Add Blog</a>
                            </aside>
                            
                           <aside class="single-sidebar-widget tag_cloud_widget">
                                <h4 class="widget_title">Tag Clouds</h4>
                                <ul class="list">
                                    <li><a href="#">Laptop</a></li>
                                    <li><a href="#">Smartphone</a></li>
                                    <li><a href="#">Accessories</a></li>
                                    <li><a href="#">Tablet</a></li>
                                </ul>
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