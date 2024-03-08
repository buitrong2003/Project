<%-- 
    Document   : category
    Created on : Mar 4, 2024, 10:34:33 PM
    Author     : d
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin - Dashboard</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Page level plugin CSS-->
        <link href="../css/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/colReorder-bootstrap4.css"/>
        <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
        <!-- CKFinder -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.16.1/plugins/ckfinder/ckfinder.js"></script>
        <style>
            .error{
                color:red;
            }
        </style>
    </head>
    <body>
        <%@include file="../common/admin/navbar.jsp" %>
        <div id="wrapper">
            <%@include file="../common/admin/sideBar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <%@include file="../common/admin/breaduser.jsp" %>
                    <!-- Icon Cards-->
                    <%@include file="../common/admin/iconCard.jsp" %>
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
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Email</th>
                                            <th>Image</th>
                                            <th>Type</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listUser}" var="user">
                                            <tr>
                                                <td name="nameUser">${user.user_name}</td>
                                                <td name="passwordUser">${user.password}</td>
                                                <td name="emailUser">${user.email}</td>
                                                <td name="image"><img src="../image/${user.image}" alt="alt"/></td>
                                                <td name="type">
                                                    <c:forEach items="${requestScope.listRole}" var="role">
                                                        <c:if test="${role.name_role == user.type}">
                                                            ${role.name_role}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <div style="display: flex;gap: 10%;justify-content: center;align-items: center">
                                                        <button type="button" class="btn btn-primary"
                                                                data-toggle="modal" 
                                                                data-target="#editProductModal"
                                                                onclick="editProductModalUser(this)">
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn btn-danger" 
                                                                data-toggle="modal" data-target="#delete-product-modal"
                                                                onclick="deleteProductModalUser('${user.user_name}')">
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
            </div>
            <%@include file="../common/admin/footer.jsp" %>
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <%@include file="../common/admin/logoutModal.jsp" %>
            <jsp:include page="addUserModal.jsp"></jsp:include>
            <jsp:include page="edituser.jsp"></jsp:include>
            <jsp:include page="deleteuser.jsp"></jsp:include>
            <!-- Bootstrap core JavaScript-->
            <script src="../js/admin/jquery.min.js"></script>
            <script src="../js/admin/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="../js/admin/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="../js/admin/Chart.min.js"></script>
            <script src="../js/admin/jquery.dataTables.js"></script>
            <script src="../js/admin/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../js/admin/sb-admin.min.js"></script>
            <script src="../js/admin/colReorder-bootstrap4-min.js"></script>
            <script src="../js/admin/colReorder-dataTables-min.js"></script>
            <!-- Demo scripts for this page-->
            <script src="../js/admin/datatables-demo.js"></script>
            <script src="../js/admin/chart-area-demo.js"></script>
            <script src="../js/admin/colReorder-dataTables-min.js"></script>
            <script src="../js/admin/colReorder-bootstrap4-min.js"></script>
        </div>
    </body>
</html>
