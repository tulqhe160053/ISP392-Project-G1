<%-- 
    Document   : addproduct
    Created on : Mar 6, 2023, 1:18:36 PM
    Author     : Trang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Add Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<%=request.getContextPath()%>/css/managerproduct.css" rel="stylesheet" type="text/css"/>
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
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>



    <body>


        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="<%=request.getContextPath()%>/addproduct" method="post">
                            <div class="modal-header">						
                                <h3 class="text-warning">New product</h3>
                            </div>
                            <div class="modal-body">	

                                <div class="post_tag">
                                    <h4><select class="form-select active" name="catId">
                                            <option value="0">Category</option>
                                            <c:forEach items="${requestScope.listCategory}" var="cat">
                                                <option value="${cat.getCategoryId()}">${cat.getCategoryName()}</option>
                                            </c:forEach>
                                        </select>
                                    </h4>
                                </div>
                                
                                <div class="post_tag">
                                    <h4><select class="form-select active" name="brandID">
                                            <option value="0">Brand</option>
                                            <c:forEach items="${requestScope.listBrand}" var="brand">
                                                <option value="${brand.getBrandID()}">${brand.getBrandName()}</option>
                                            </c:forEach>
                                        </select>
                                    </h4>
                                </div>
                                
                                <label for="image">Image</label>
                                <input type="file" name="image"><br>

                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input name="pname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="Description" class="form-control" id="Description" rows="5" placeholder="Write product description here"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Color</label>
                                    <input name="color" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>OriginalPrice</label>
                                    <input name="OriginalPrice" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SellPrice</label>
                                    <input name="SellPrice" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SalePercent</label>
                                    <input name="SalePercent" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Amount</label>
                                    <input  name="Amount" type="text" class="form-control" required>
                                </div>

                                <div class="post_tag">
                                    <h4><select class="form-select active" name="sttID">
                                            <option value="0">Status</option>
                                            <c:forEach items="${requestScope.productStatus}" var="status">
                                                <option value="${status.getStatusID()}">${status. getStatusName()}</option>
                                            </c:forEach>
                                        </select>
                                    </h4>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Save">
                                <button type="button" class="btn btn-light"><a href="<%=request.getContextPath()%>/sellerdashboard">Back</a></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="<%=request.getContextPath()%>/js/manager.js" type="text/javascript"></script>


    </body>
</html>
