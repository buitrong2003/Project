<%-- 
    Document   : completedOrder
    Created on : Mar 9, 2024, 9:16:12 PM
    Author     : d
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="common/header.jsp" %>
        <div style="margin-top: 7%" class="container">
            <c:forEach items="${listOrder}" var="order">
                <div style="display: flex">
                    <c:forEach items="${listCustomer}" var="customer">
                        <c:if test="${customer.id == order.id_customer}">
                            <div style="font-weight: bold;margin-right: 1%">Thời gian: </div><div style="margin-right: 10%">${order.order_date}</div>
                            <div style="font-weight: bold;margin-right: 1%">Tổng tiền: </div> 
                            <div>
                                <script>
                                    var newPrice = ${order.total_amount};
                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                    document.write('₫' + formattedPrice);
                                </script>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div style="font-weight: bold;margin-right: 1%;margin-left: 40%">Trạng thái: </div>
                    <c:forEach items="${listStatus}" var="status">
                        <c:if test="${status.id == order.id_status}">
                            <div>${status.name}</div>
                        </c:if>
                    </c:forEach>
                </div>
                <table class="table">
                    <thead class="table-success">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listOrderDetails}" var="orderDetails">
                            <c:if test="${orderDetails.order_id == order.order_id}">
                                <c:forEach items="${listBook}" var="book">
                                    <c:if test="${book.book_id == orderDetails.book_id}">
                                        <tr>
                                            <td>${book.book_id}</td>
                                            <td>${book.name}</td>
                                            <td>
                                                <script>
                                                    var newPrice = ${book.price};
                                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                                    document.write('₫' + formattedPrice);
                                                </script>
                                            </td>
                                            <td>${orderDetails.quantity}</td>
                                            <td>
                                                <script>
                                                    var newPrice = ${orderDetails.price};
                                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                                    document.write('₫' + formattedPrice);
                                                </script>
                                            </td>   
                                        </tr>        
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </c:forEach>
        </div>
        <%@include file="common/footer.jsp" %>
    </body>
</html>
