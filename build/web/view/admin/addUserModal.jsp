<%-- 
    Document   : addProductModal
    Created on : Mar 2, 2024, 12:54:57 AM
    Author     : d
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel">Add User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductFormUser" action="user?action=add" method="POST" enctype="multipart/form-data">
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">User name:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error"></div>
                    </div>
                    <!-- Author -->
                    <div class="form-group">
                        <label for="name">Password:</label>
                        <input type="password" class="form-control" id="passwordInput" name="password">
                        <div id="passwordError" class="error"></div>
                    </div>
                    <!--Email -->
                    <div class="form-group">
                        <label for="name">Email:</label>
                        <input type="email" required="" placeholder="Email" class="form-control" id="emailInput" name="email">
                        <div id="emailError" class="error"></div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="imageUser">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageUser" 
                                       name="image" onchange="displayImageAddUser(this)">
                                <label class="custom-file-label" >Choose file</label>
                            </div>
                        </div>
                        <img id="previewImageUser" src="#" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                    <!-- type -->
                    <div class="form-group">
                        <label for="category">Role: </label>
                        <div class="input-group">
                            <select class="custom-select" id="category" name="type">
                                <c:forEach items="${requestScope.listRole}" var="role">
                                    <option value="${role.name_role}">${role.name_role}</option>
                                </c:forEach>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Category</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addProductFormUser" onclick="validateFormAddUser()">Add</button>
            </div>
        </div>
    </div>
</div>
<script>
    function isValidEmail(email) {
        // Biểu thức chính quy để kiểm tra địa chỉ email
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }
    
    function validateFormAddUser() {
        let name = $('#nameInput').val();
        let password = $('#passwordInput').val();
        let email = $('#emailInput').val();
        // Xóa thông báo lỗi hiện tại
        $('.error').html('');
        
        // Kiểm tra từng trường và hiển thị thông báo lỗi tương ứng
        if (name === '') {
            $('#nameError').html('Tên không được để trống');
        }
        if (password === '') {
            $('#passwordError').html('Mật khẩu không được để trống');
        }
        if (email === '') {
            $('#emailError').html('Email không được để trống');
        } else if (!isValidEmail(email)) { // Sử dụng hàm isValidEmail trực tiếp
            $('#emailError').html('Email không hợp lệ');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addProductFormUser').submit();
        } else {
            event.preventDefault();
        }
    }
    function displayImageAddUser(input) {
        var previewImage = document.getElementById("previewImageUser");
        console.log(previewImage);
        console.log(input);
        var file = input.files[0];
        console.log(file);
        var reader = new FileReader();
        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        };
        reader.readAsDataURL(file);
    }
</script>