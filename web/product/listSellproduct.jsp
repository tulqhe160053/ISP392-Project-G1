<%-- 
    Document   : listSellproduct
    Created on : Feb 21, 2023, 9:20:06 PM
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

        <jsp:include page="../header.jsp" />
        <div class="d-flex justify-content-center align-items-center mb-3">
            <h4 class="text-right"></h4>
        </div> 
        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px"<span> </span></div>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Products</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="<%=request.getContextPath()%>/addproduct" class="btn btn-success" data-toggle="modal"> <span>Add New Product</span></a>
                            <a href="<%=request.getContextPath()%>/categoryseller" class="btn btn-warning" > <span>Manage Categories</span></a>						
                        </div>
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Original Price</th>
                            <th>Sell Price</th>
                            <th>Sale Percent</th>
                            <th>Category</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Brand</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="p">
                            <tr>
                                <td>${p.productID}</td>
                                <td>${p.productName}</td>
                                <td><img src="assets/product_img/${p.category.categoryName}/${p.brand.brandName}/${p.img.productImgUrl}" alt="error" style="width: 50px"></td>
                                <td>${p.originalPrice}$</td>
                                <td>${p.sellPrice}$</td>
                                <td>${p.salePercent}</td>
                                <td>${p.category.categoryName}</td>
                                <td>${p.amount}</td>
                                <td>${p.productStatus.statusName}</td>
                                <td>${p.brand.brandName}</td>


                                <td>
                                    <a href="editproduct?pid=${p.productID}" class="edit" data-toggle="modal"><i class="icofont-ui-edit" data-toggle="tooltip" title="Edit">Edit  </i></a>
                                    <a href="deleteproduct?pid=${p.productID}" onclick="return confirm('Are you sure you want to delete these Product?');" class="text-danger" data-toggle="modal"><i class="icofont-ui-delete" data-toggle="tooltip" title="Delete">Delete</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Add Product -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add_product" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="file" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-control" required>
                                    <c:forEach items="${listC}" var="c">
                                        <<option value="${c.cid}">${c.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>        
    <jsp:include page="../footer.jsp" />
</html>
