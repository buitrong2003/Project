<%-- 
    Document   : details
    Created on : Feb 5, 2024, 8:58:10 PM
    Author     : d
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css"/>
    </head>

    <body style=" background-color: #EBEBEB">
        <%@include file="common/header.jsp" %>
        <div class = "card-wrapper" style="margin-bottom: 6%">
            <div style="margin-top: 20%" class = "row">
                <!-- card left -->
                <div class = "product-imgs col-md-6">
                    <div class = "img-display">
                        <div class = "img-showcase">
                            <img style="height: 75vh;width: 100%" 
                                 src="image/${requestScope.book.image}" class="imageDetails" alt = "shoe image">                        
                        </div>
                    </div>
                </div>
                <!-- card right -->
                <div class = "product-content col-md-6">
                    <h2 style="font-weight: bold;margin-top: 7%" class = "product-title">${requestScope.book.name}</h2>
                    <div>Tác giả: ${requestScope.book.author}</div>
                    <div class = "product-rating">
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star-half-alt"></i>
                        <span>4.7(21)</span>
                    </div>
                    <div>Nhà xuất bản: ${requestScope.book.publisher}</div>
                    <div>Thể loại: ${requestScope.book.genre}</div>
                    <div>Mô tả: ${requestScope.book.description}</div>
                    <div class = "product-price">
                        <div style="display: flex">
                            <div>Giá cũ: </div>
                            <div style="text-decoration: line-through;color: red;margin-left: 2%" class = "new-price">
                                <script>
                                    var newPrice = ${book.price + 200000};
                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                    document.write('₫' + formattedPrice);
                                </script>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div>Giá mới: </div>
                            <div style="color: blue;margin-left: 2%" class = "new-price">
                                <script>
                                    var newPrice = ${book.price};
                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                    document.write('₫' + formattedPrice);
                                </script>
                            </div>
                        </div>
                    </div>                    
                    <div class="quantity-container">
                        <input style="border: 1px solid #8A8B89" type="button" class="quantity-button" value="-" onclick="decreaseValue()"> 
                        <input class="quantity-input" type="number" min="0" max="${requestScope.maxQuantityCart}" value="${requestScope.quantity == null ? (requestScope.maxQuantityCart == 0 ? 0 : 1) : requestScope.quantity}" id="numberInput">
                        <input style="border: 1px solid #8A8B89"  type="button" class="quantity-button" value="+" onclick="increaseValue('${requestScope.maxQuantityCart}')">
                    </div>
                    <div style="color: red" class="error">${requestScope.error}</div>
                    <div class = "purchase-info">
                        <button onclick="addToCart('${requestScope.book.getBook_id()}')" type = "button" class = "btn">
                            <input id="${requestScope.book.getBook_id()}" type="hidden" name="book" value="${requestScope.book}">
                            Add to Cart <i class = "fas fa-shopping-cart"></i>
                            <form class="addCart" action="details" method="post">
                                <input type="hidden" class="bookDetails" name="book">
                                <input type="hidden" class="quantityDetails" name="quantityBook"/>
                            </form>
                        </button>
                        <button type = "button" class = "btn">Compare</button>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <%@include file="common/footer.jsp" %>
        </div>
        <script src="${pageContext.request.contextPath}/js/details.js"></script>
    </body>

</html>
