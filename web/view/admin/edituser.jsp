<%-- 
    Document   : editProductModal
    Created on : Mar 3, 2024, 1:24:50 AM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBookModalLabel">Edit Book</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editBookForm" action="user?action=edit" method="POST" enctype="multipart/form-data">
                    <!--Name-->
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="nameEditInput" name="name">
                        <div id="nameEditError" class="error"></div>
                    </div>
                    <!--Password-->
                    <div class="form-group">
                        <label for="name">Password:</label>
                        <input type="text" class="form-control" id="passwordEditInput" name="password">
                        <div id="passwordEditError" class="error"></div>
                    </div>
                    <!--Email-->
                    <div class="form-group">
                        <label for="publisher">Email:</label>
                        <input type="text" class="form-control" id="emailEditInput" name="email">
                        <div id="emailEditError" class="error"></div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageEdit" name="image"
                                       onchange="displayImageUser(this)">
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                        <input type="hidden" id="currentImage" name="currentImage" value="">
                    </div>
                    <!--Role-->
                    <div class="form-group">
                        <label for="category">Role: </label>
                        <div class="input-group">
                            <select class="custom-select" id="categoryEditInput" name="type">
                                <c:forEach items="${listRole}" var="role">
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
                <button type="submit" class="btn btn-primary" form="editBookForm"
                        onclick="validateFormUser()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateFormUser() {
        let name = $('#nameEditInput').val();
        let password = $('#passwordEditInput').val();
        let email = $('#emailEditInput').val();
        // Xóa thông báo lỗi hiện tại
        $('.error').html('');
        // Kiểm tra từng trường và hiển thị thông báo lỗi tương ứng
        if (name === '') {
            $('#nameEditError').html('Tên không được để trống');
        }
        if (password === '') {
            $('#passwordEditError').html('Mật khẩu không được để trống');
        }

        if (email === '') {
            $('#emailEditError').html('Email không được để trống');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#editBookForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImageUser(input) {
        var previewImage = document.getElementById("previewImage2");
        var file = input.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        };
        reader.readAsDataURL(file);
    }

    // function editProductModal(id, name, description, author, price, quantity, image, categoryId) { 
    function editProductModalUser(button) {
        let name = $(button).closest('tr').find('td[name="nameUser"]').text().trim();
        let password = $(button).closest('tr').find('td[name="passwordUser"]').text().trim();
        let email = $(button).closest('tr').find('td[name="emailUser"]').text().trim();
        let categoryText = $(button).closest('tr').find('td[name="type"]').text().trim();
        let image = $(button).closest('tr').find('td[name="image"]').find('img').attr('src');
        $('#nameEditInput').val(name);
        $('#passwordEditInput').val(password);
        $('#emailEditInput').val(email);
        $('#categoryEditInput option').each(function () {
            if ($(this).text() === categoryText) {
                $(this).prop('selected', true);
            }
        });
        $('#previewImage2').attr('src', image);
        $('#previewImage2').css('display', 'block');
        let filename = image.substring(image.lastIndexOf('/') + 1);
        $('#currentImage').val(filename);
    }

</script>