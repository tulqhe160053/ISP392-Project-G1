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
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="<%=request.getContextPath()%>/home"><img src="<%=request.getContextPath()%>/img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <li class="nav-item "><a class="nav-link" href="<%=request.getContextPath()%>/home">Home</a></li>
                                <li class="nav-item active">
                                    <a href="<%=request.getContextPath()%>/listblog" class="nav-link ">Blog</a>
                                </li>
                                <c:if test="${sessionScope.user == null}">
                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/common/login.jsp" class="nav-link">Sign in</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/common/register.jsp" class="nav-link">Sign up</a>
                                    </li>
                                </c:if>

                                <c:if test="${sessionScope.user != null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Hello ${sessionScope.user.userName}</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/common/viewuser.jsp">My Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="ViewListAddress">My Address</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mylistblog">My blog</a></li>
                                                <c:if test="${sessionScope.user.getRole().getRoleID() == 1}">
                                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user">Admin Dashboard</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.user.getRole().getRoleID() == 3}">
                                                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/listorder">My Order</a></li>
                                                </c:if>

                                            <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/logout">Log Out</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="nav-item">
                                    <form action="<%=request.getContextPath()%>/viewcart" method="post">
                                        <button type="submit" class="btn"><span class="ti-bag position-relative"></span></button> 
                                    </form>                               
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Blog Page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="<%=request.getContextPath()%>/home">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="<%=request.getContextPath()%>/listblog">Blog</a>
                        </nav>
                        <div class="br"></div>

                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

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
                                                <li> Author : ${blog.user.userName} <i class="lnr lnr-user "></i></li>
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
                                                <a href="<%=request.getContextPath()%>/blogdetail?id=${blog.id}" class="white_bg_btn">View More</a>
                                            </div>
                                        </div>
                                    </div>
                                </article>

                            </c:forEach>
                            <c:if test="${requestScope.check.equals('list')}">
                                <nav class="blog-pagination justify-content-center d-flex">
                                    <ul class="pagination">
                                        <c:set var="page" value="${page}"/>
                                        <c:if test="${requestScope.page > 1}">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="listblog?page=${requestScope.page-1}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="listblog?page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${requestScope.num > requestScope.page}">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="listblog?page=${requestScope.page+1}">Next</a></li>
                                            </c:if>  
                                    </ul>
                                </nav>
                            </c:if>
                            
                            <c:if test="${requestScope.check.equals('search')}">
                                <nav class="blog-pagination justify-content-center d-flex">
                                    <ul class="pagination">
                                        <c:set var="page" value="${page}"/>
                                        <c:if test="${requestScope.page > 1}">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog1?key=${requestScope.key}&page=${requestScope.page-1}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog1?key=${requestScope.key}&page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${requestScope.num > requestScope.page}">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog1?key=${requestScope.key}&page=${requestScope.page+1}">Next</a></li>
                                            </c:if>  
                                    </ul>
                                </nav>
                            </c:if>
                            <c:if test="${requestScope.check.equals('filter')}">
                                <nav class="blog-pagination justify-content-center d-flex">
                                    <ul class="pagination">
                                        <c:set var="page" value="${page}"/>
                                        <c:if test="${requestScope.page > 1}">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogcategory?catid=${requestScope.id}&page=${requestScope.page-1}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogcategory?catid=${requestScope.id}&page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${requestScope.num > requestScope.page}">
                                            <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogcategory?catid=${requestScope.id}&page=${requestScope.page+1}">Next</a></li>
                                            </c:if>  
                                    </ul>
                                </nav>
                            </c:if>
                            
                            
                            
                        </div>

                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget search_widget">
                                <div class="input-group">
                                    <form action = "searchblog1">
                                        <input type="text" name = "key" class="form-control" placeholder="Search here">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit"><i class="lnr lnr-magnifier" value = "search" ></i></button>
                                        </span>
                                    </form>
                                </div><!-- /input-group -->
                                <div class="br"></div>
                            </aside>
                            <aside class="single_sidebar_widget author_widget">
                                <img class="author_img rounded-circle" src="img/blog/author.png" alt="">
                                <h4>ISP392 G1</h4>
                                <div class="social_icon">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-github"></i></a>
                                    <a href="#"><i class="fa fa-behance"></i></a>
                                </div>

                                <div class="br"></div>
                            </aside>
                            <aside class="single_sidebar_widget popular_post_widget">
                                <h3 class="widget_title">Popular Posts</h3>
                                <c:forEach var="blog" items="${topBlog}">
                                    <div class="media post_item">

                                        <img width="50px"  src="<%=request.getContextPath()%>/assets/blog_img/${blog.imageLink}" alt="post">
                                        <div class="media-body">

                                            <a href="<%=request.getContextPath()%>/blogdetail?id=${blog.id}">
                                                <h3>${blog.title}</h3>
                                            </a>
                                            <p>${blog.viewer} view </p>

                                        </div>

                                    </div>
                                </c:forEach>
                                <div class="br"></div>
                            </aside>
                            <aside class="single-sidebar-widget newsletter_widget">
                                <h4 class="widget_title">Newsletter</h4>
                                <p>
                                    Here, I focus on a range of items and features that we use in life without
                                    giving them a second thought.
                                </p>
                                <div class="form-group d-flex flex-row">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                                        </div>
                                        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter email"
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email'">
                                    </div>
                                    <a href="#" class="bbtns">Subcribe</a>
                                </div>
                                <p class="text-bottom">You can unsubscribe at any time</p>
                                <div class="br"></div>
                            </aside>
                            <aside class="single-sidebar-widget tag_cloud_widget">
                                <h4 class="widget_title">Tag Clouds</h4>
                                <ul class="list">
                                    <c:forEach items="${category}" var="c">
                                        <li><a  href="blogcategory?catid=${c.categoryId}">${c.categoryName}</a></li>
                                        </c:forEach>
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