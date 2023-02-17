<%-- 
    Document   : addfeedback
    Created on : Feb 13, 2023, 11:18:54 AM
    Author     : Trang
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <!-- icon -->
            <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/favicon.ico" type="image/x-icon">
            <!-- link Fonts -->
            <link
                href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
                rel="stylesheet"
                />
            <!--BOOTSTRAP5-->
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"
                />
            <link href="<%=request.getContextPath()%>/maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="<%=request.getContextPath()%>/maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="<%=request.getContextPath()%>/cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <!--FONTAWESOME-->
            <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
                integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
                />

            <!-- CSS -->
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/linearicons.css">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/themify-icons.css">
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
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/queries.css" />
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/homepage.css" />


            <title>Add Feedback</title>

            <style>
                .rating {
                    display: inline-block;
                    position: relative;
                    height: 50px;
                    line-height: 50px;
                    font-size: 50px;
                }

                .rating label {
                    position: absolute;
                    top: 0;
                    left: 0;
                    height: 100%;
                    cursor: pointer;
                }

                .rating label:last-child {
                    position: static;
                }

                .rating label:nth-child(1) {
                    z-index: 5;
                }

                .rating label:nth-child(2) {
                    z-index: 4;
                }

                .rating label:nth-child(3) {
                    z-index: 3;
                }

                .rating label:nth-child(4) {
                    z-index: 2;
                }

                .rating label:nth-child(5) {
                    z-index: 1;
                }

                .rating label input {
                    position: absolute;
                    top: 0;
                    left: 0;
                    opacity: 0;
                }

                .rating label .icon {
                    float: left;
                    color: transparent;
                }

                .rating label:last-child .icon {
                    color: #000;
                }

                .rating:not(:hover) label input:checked ~ .icon,
                .rating:hover label:hover input ~ .icon {
                    color: #fcc603;
                }

                .rating label input:focus:not(:checked) ~ .icon:last-child {
                    color: #000;
                    text-shadow: 0 0 5px #09f;
                }
            </style>
            <script>
                let starValue = 0;
                /* for star rating */
                function starChange(value) {
                    console.log('New star rating: ' + value);
                    starValue = value;
                }

                /* for submit feedback */
                function submitFeedback() {
                    document.getElementById('star-value').value = starValue;
                    document.getElementById('submit-feedback').submit();
                }

            </script>
        </head>
        <body>
            <%@include file="../header.jsp" %>
            
            	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<nav class="d-flex align-items-center">
                                                                                                                            Add feedback
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

            <div class="container">

                <div class="row mt-3">

                    <div class="col-md-7">
                        <div class="card">
                            <div class="feedback-form mt-5 mb-5 ml-5 mr-5">

                                <div class="header">
                                    <h3 class="text-dark">Add feedback for product</h3>
                                </div>

                                <div class="star-rating">
                                    <form class="rating">
                                        <label>
                                            <input type="radio" name="stars" value="1" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="2" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="3" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>   
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="4" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="5" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                        </label>
                                    </form>
                                </div>

        
                                    <div class="feedback-text">
                                        <form action="<%=request.getContextPath()%>/addfeedback" id="submit-feedback" method="POST" onsubmit="submitFeedback()" >                                    
                                        <label for="feedback-text" class="form-label">Your Feedback: </label>
                                        <textarea name="feedback-text" class="form-control" id="feedback-text" rows="5" placeholder="Write your Feedback here"></textarea>
                                        <input type="hidden" id="star-value" name="star-value">                                        
                                        <input type="hidden" id="productID" name="productID" value="${product.getProductID()}">
                                        <button type="submit" class="btn btn-warning mt-5" >Submit</button>                                   
                                         </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>                            
            </div>

            <!--Start footer-->
            <jsp:include page="../footer.jsp" />
            <!--End footer-->

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



    </html>

