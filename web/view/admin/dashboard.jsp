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
                    <!-- Area Chart Example-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-area"></i>
                            Area Chart Example
                        </div>
                        <div class="card-body">
                            <canvas id="myAreaChart" width="100%" height="30"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data Table Example
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Author</th>
                                            <th>Publisher</th>
                                            <th>Description</th>
                                            <th>Genre</th>
                                            <th>Date</th>
                                            <th>Category</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listBook}" var="book">
                                            <tr>
                                                <td name="id">${book.book_id}</td>
                                                <td name="name">${book.name}</td>
                                                <td name="image">
                                                    <img style="width: 30%" src="${pageContext.request.contextPath}/image/${book.image}" alt="alt"/>
                                                </td>
                                                <td name="author">${book.author}</td>
                                                <td name="publisher">${book.publisher}</td>
                                                <td name="description">${book.description}</td>
                                                <td name="genre">${book.genre}</td>
                                                <td name="date">${book.publication_date}</td>
                                                <td name="category">
                                                    <c:forEach items="${requestScope.listCategory}" var="category">
                                                        <c:if test="${category.category_id == book.category_id}">
                                                            ${category.name}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td name="price">${book.price}</td>
                                                <td name="quantity">${book.quantity}</td>
                                                <td>
                                                    <div style="display: flex;gap: 10%;justify-content: center;align-items: center">
                                                        <button type="button" class="btn btn-primary"
                                                                data-toggle="modal" 
                                                                data-target="#editProductModal"
                                                                onclick="editProductModal(this)">
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn btn-danger" 
                                                                data-toggle="modal" data-target="#delete-product-modal"
                                                                onclick="deleteProductModal('${book.book_id}')">
                                                            Delete
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
        <script src="${pageContext.request.contextPath}/lib/ckeditor/ckeditor.js"></script>
        <script src="${pageContext.request.contextPath}/lib/ckfinder/ckfinder.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/translations/vi.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/media-embed/media-embed.js"></script>
        <%@include file="../common/admin/logoutModal.jsp" %>
        <jsp:include page="addProductModal.jsp"></jsp:include>
        <jsp:include page="deleteProductModal.jsp"></jsp:include>
        <jsp:include page="editProductModal.jsp"></jsp:include>
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
