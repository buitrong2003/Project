<%-- 
    Document   : dashboard
    Created on : Mar 1, 2024, 10:12:13 PM
    Author     : d
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin - Dashboard</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/css/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css"/>
        <!-- CKFinder -->
        <style>
            .error{
                color:red;
            }
        </style>
    </head>

    <body id="page-top">
        <!--Navbar-->
        <%@include file="../common/admin/navbar.jsp" %>
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="../common/admin/sideBar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <%@include file="../common/admin/breadcrumbs.jsp" %>
                    <!-- Icon Cards-->
                    <%@include file="../common/admin/iconCard.jsp" %>
                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data Table Example
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <c:forEach items="${listOrder}" var="order">
                                    <c:forEach items="${listCustomer}" var="customer">
                                        <c:if test="${customer.id == order.id_customer}">
                                            <div style="display: flex">
                                                <div style="margin-right: 1%">Khách hàng: </div>
                                                <div style="margin-right: 1%">${customer.name}</div>
                                                <div style="margin-right: 1%">Phone: </div>
                                                <div style="margin-right: 1%">${customer.phone}</div>
                                                <div>Email: </div>
                                                <div style="margin-right: 1%">${customer.email}</div>
                                                <div>Địa chỉ: </div>
                                                <div>${customer.address}</div>
                                            </div>
                                            <div style="display: flex">
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
                                            </div>
                                        </c:if>                    
                                    </c:forEach>
                                    <div style="display: flex">
                                        <div style="font-weight: bold;">Trạng thái: </div>
                                        <c:forEach items="${listStatus}" var="status">
                                            <c:if test="${status.id == order.id_status}">
                                                <div>${status.name}</div>
                                            </c:if>
                                        </c:forEach>
                                        <button style="margin-left: 2%;margin-bottom: 2%" type="button" class="btn btn-primary"
                                                data-toggle="modal" 
                                                data-target="#editProductModal"
                                                onclick="editProductModalOrder('${order.id_status}', '${order.order_id}')">
                                            Edit
                                        </button>
                                        <button style="margin-left: 2%;margin-bottom: 2%" type="button" class="btn btn-danger" 
                                                data-toggle="modal" data-target="#delete-product-modal"
                                                onclick="deleteProductModalOrder('${order.order_id}', '${order.id_customer}')">
                                            Delete
                                        </button>
                                    </div>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>                                           
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
                                    <div class="orderID${order.order_id}" style="display: none">${order.order_id}</div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                <!-- Sticky Footer -->
                <%@include file="../common/admin/footer.jsp" %>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        <%@include file="../common/admin/logoutModal.jsp" %>
        <jsp:include page="deleteOrder.jsp"></jsp:include>
        <jsp:include page="editOrderUser.jsp"></jsp:include>
            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/js/admin/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/js/admin/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/js/admin/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>
        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/js/admin/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>
    </body>

</html>
