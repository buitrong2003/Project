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
                <h5 class="modal-title" id="addBookModalLabel">Add</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="product?action=add" method="POST" enctype="multipart/form-data">
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error"></div>
                    </div>
                    <!-- Author -->
                    <div class="form-group">
                        <label for="name">Author:</label>
                        <input type="text" class="form-control" id="authorInput" name="authorInput">
                        <div id="authorError" class="error"></div>
                    </div>
                    <!--publisher -->
                    <div class="form-group">
                        <label for="name">Publisher:</label>
                        <input type="text" class="form-control" id="publisherInput" name="publisherInput">
                        <div id="publisherError" class="error"></div>
                    </div>
                    <!--publication_date-->
                    <div class="form-group">
                        <label for="name">Date:</label>
                        <input type="date" class="form-control" id="dateInput" name="dateInput">
                        <div id="dateError" class="error"></div>
                    </div>
                    <!--genre -->
                    <div class="form-group">
                        <label for="name">Genre:</label>
                        <input type="text" class="form-control" id="genreInput" name="genreInput">
                        <div id="genreError" class="error"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceInput" name="price">
                        <div id="priceError" class="error"></div>
                    </div>
                    <!--Quantity-->
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityInput" name="quantity">
                        <div id="quantityError" class="error"></div>
                    </div>
                    <!--Category-->
                    <div class="form-group">
                        <label for="category">Category: </label>
                        <div class="input-group">
                            <select class="custom-select" id="category" name="category">
                                <c:forEach items="${requestScope.listCategory}" var="category">
                                    <option value="${category.category_id}">${category.name}</option>
                                </c:forEach>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Category</button>
                            </div>
                        </div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image" onchange="displayImage(this)">
                                <label class="custom-file-label" >Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                    <!--Description-->
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea id="description" class="form-control" name="description"></textarea>
                        <div id="descriptionError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addProductForm" onclick="validateForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        let name = $('#nameInput').val();
        let author = $('#authorInput').val();
        let publisher = $('#publisherInput').val();
        let price = $('#priceInput').val();
        let quantity = $('#quantityInput').val();
        let category = $('#category').val();
        let genre = $('#genreInput').val();
        let date = $('#dateInput').val();
        let description = $('#description').val(); // Thêm kiểm tra cho trường Description

        // Xóa thông báo lỗi hiện tại
        $('.error').html('');

        // Kiểm tra từng trường và hiển thị thông báo lỗi tương ứng
        if (name === '') {
            $('#nameError').html('Tên không được để trống');
        }

        if (author === '') {
            $('#authorError').html('Tên tác giả không được để trống');
        }

        if (publisher === '') {
            $('#publisherError').html('Nhà xuất bản không được để trống');
        }

        if (price === '') {
            $('#priceError').html('Giá không được để trống');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceError').html('Giá phải là số và không được nhỏ hơn 0');
        }

        if (quantity === '') {
            $('#quantityError').html('Số lượng không được để trống');
        } else if (!$.isNumeric(quantity) || !Number.isInteger(parseFloat(quantity))) {
            $('#quantityError').html('Số lượng phải là số nguyên và không được nhỏ hơn 0');
        } else if (parseInt(quantity) < 0) {
            $('#quantityError').html('Số lượng phải lớn hơn hoặc bằng 0');
        }

        if (category === '') {
            $('#categoryError').html('Danh mục không được để trống');
        }

        if (genre === '') {
            $('#genreError').html('Thể loại không được để trống');
        }

        if (date === '') {
            $('#dateError').html('Ngày xuất bản không được để trống');
        }

        if (description === '') { // Kiểm tra trường Description
            $('#descriptionError').html('Mô tả không được để trống');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addProductForm').submit();
        } else {
            event.preventDefault();
        }
    }


    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        };
        reader.readAsDataURL(file);
    }


</script>