<%-- 
    Document   : addproduct
    Created on : Mar 6, 2023, 1:18:36 PM
    Author     : Admin
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
                        <form action="AddProduct" method="post">
                            <div class="modal-header">						
                                <h4 class="text-warning">New product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					

                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input name="pname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="Description" class="form-control" id="Description" rows="5" placeholder="Write product description here"></textarea>
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
                                    <input value="${detail.amount}" name="Amount" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>StatusID</label>
                                    <input name="sttID" type="text" class="form-control" required>
                                </div>
                                
                                <div class="form-group">
                                    <label>BrandID</label>
                                    <input  name="brandID" type="text" class="form-control" required>
                                </div>

                            <div class="form-group">
                                <label>Category</label>
                                <select name="Category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${requestScope.listCategorys}" var="category">
                                        <option  value="<%=request.getContextPath()%>/category?catId=${category.getCategoryId()}">${category.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="Save">
                        <button type="button" class="btn btn-light"><a href="<%=request.getContextPath()%>/seller/sellerdashboard.jsp">Back</a></button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

    </div>


    <script src="<%=request.getContextPath()%>/js/manager.js" type="text/javascript"></script>
</body>
</html>
