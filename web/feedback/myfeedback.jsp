<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Feedback</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    </head>    
    
    <!-- Start Header Area -->
    <jsp:include page="../header.jsp" />
    <!-- End Header Area -->



    <!--================Feedback Area =================-->
    <section class="cart_area">
        <div class="container">
            <div><h2>My Feedback</h2></div>
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">ProductName</th>
                                <th scope="col">Star</th>
                                <th scope="col">Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="sum" value="0"></c:set>
                            <c:forEach items="${listProduct}" var="product">
                                <c:set var="category" value="${product.getCategory()}"></c:set>
                                <c:set var="imgLink" value="${product.getImgLink()}"></c:set>
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="./assets/imgProduct/${category.getCategoryName()}/${imgLink}" alt="error" style="width: 50px">
                                            </div>
                                            <div class="media-body">
                                                <p>${product.getProductName()}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>${product.getColor()}</h5>
                                    </td>
                                    <td>
                                        <h5>$${product.getOriginalPrice()}</h5>
                                    </td>
                                    <td>                                                  
                                        <h5>$${product.getSellPrice()}</h5>
                                    </td>
                                    <td>                                                  
                                        <h5>${category.getCategoryName()}</h5>
                                    </td>
                                    <td>                                                  
                                        <h5>${product.getAmount()}</h5>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger" ><a class="text-white" href="product?action=deleteProduct&productId=${product.getProductId()}"><i class="fa fa-trash"></i></a></button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- Start footer -->
    <%@include file="../footer.jsp" %>

    <!-- End footer -->

    <!-- Start Script -->
    <script src="<%=request.getContextPath()%>/assets/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/templatemo.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>