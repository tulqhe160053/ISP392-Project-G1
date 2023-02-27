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

                            <a  href="<%=request.getContextPath()%>/mylistblog?ID=${blog.user.userID}"> Back to View my blogs</a>
                        </nav>

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
                        <c:set var="b" value="${requestScope.blog}"/>
                        <form action="editblog?id=${b.id}" method="post" enctype='multipart/form-data'>
                            <div class="row">
                                <div class="col-md-12 border-right">
                                    <div class="d-flex flex-column align-items-start text-start p-3 py-5"><img width="300px" src="<%=request.getContextPath()%>/assets/blog_img/${b.imageLink}" alt="alt"/></div>
                                    <div class="d-flex flex-column align-items-start text-start"><input type="file" name = "image" id="uploadfile"/></div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label for = "pwd">Title</label><input name="title" type="text" class="form-control" value="${b.title}" placeholder="enter title"></div>

                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label for = "pwd">Desciption</label><textarea type = "text" name = "des" class="form-control" >${b.description}</textarea></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label for = "pwd">Content</label><textarea type = "text" name = "content" class="form-control" >${b.content}</textarea></div>
                                <div class="col-md-12"><label for = "pwd">Category</label>
                                    <select class="form-select" name="catid">
                                        <c:forEach items="${category}" var="c">
                                            <option <c:if test="${b.category.getCategoryName() == c.getCategoryName()}">selected</c:if> value="${c.getCategoryId()}">${c.getCategoryName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>


                            </div>
                            <div class="row">
                                <div class="col-md-12 mt-5 text-center">
                                    <button class="btn btn-primary" type="submit">Save</button>
                                    <button class="btn btn-secondary" type="reset">Enter Again</button>
                                </div>
                            </div>
                        </form>

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