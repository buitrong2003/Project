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
                <form id="editBookForm" action="product?action=edit" method="POST" enctype="multipart/form-data">
                    <!--id-->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idEditInput" name="id">
                    </div>
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="nameEditInput" name="name">
                        <div id="nameEditError" class="error"></div>
                    </div>
                    <!--Author-->
                    <div class="form-group">
                        <label for="name">Author:</label>
                        <input type="text" class="form-control" id="authorEditInput" name="author">
                        <div id="authorEditError" class="error"></div>
                    </div>
                    <!--Publisher-->
                    <div class="form-group">
                        <label for="publisher">Publisher:</label>
                        <input type="text" class="form-control" id="publisherEditInput" name="publisher">
                        <div id="publisherEditError" class="error"></div>
                    </div>
                    <!--date -->
                    <div class="form-group">
                        <label for="date">Date:</label>
                        <input type="date" class="form-control" id="dateEditInput" name="date">
                        <div id="dateEditError" class="error"></div>
                    </div>
                    <!-- gene --> 
                    <div class="form-group">
                        <label for="genre">Genre:</label>
                        <input type="text" class="form-control" id="genreEditInput" name="genre">
                        <div id="genreEditError" class="error"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceEditInput" name="price">
                        <div id="priceEditError" class="error"></div>
                    </div>
                    <!--Quantity-->
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityEditInput" name="quantity">
                        <div id="quantityEditError" class="error"></div>
                    </div>
                    <!--Category-->
                    <div class="form-group">
                        <label for="category">Category: </label>
                        <div class="input-group">
                            <select class="custom-select" id="categoryEditInput" name="category">
                                <c:forEach items="${listCategory}" var="category">
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
                                <input type="file" class="custom-file-input" id="imageEdit" name="image"
                                       onchange="displayImage2(this)">
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                        <input type="hidden" id="currentImage" name="currentImage" value="">
                    </div>
                    <!--Description-->
                    <div class="form-group">
                        <label for="descriptionEditInput">Description:</label>
                        <textarea class="form-control" id="descriptionEdit" name="description"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editBookForm"
                        onclick="validateForm2()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm2() {
        let name = $('#nameEditInput').val();
        let author = $('#authorEditInput').val();
        let publisher = $('#publisherEditInput').val();
        let price = $('#priceEditInput').val();
        let quantity = $('#quantityEditInput').val();
        let category = $('#categoryEditInput').val();
        let genre = $('#genreEditInput').val();
        let date = $('#dateEditInput').val();
        let description = $('#descriptionEditInput').val(); // Thêm kiểm tra cho trường Description
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
            $('#editBookForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImage2(input) {
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
    function editProductModal(button) {
        let id = $(button).closest('tr').find('td[name="id"]').text().trim();
        let name = $(button).closest('tr').find('td[name="name"]').text().trim();
        let author = $(button).closest('tr').find('td[name="author"]').text().trim();
        let price = $(button).closest('tr').find('td[name="price"]').text().trim().split('$')[0];
        let quantity = $(button).closest('tr').find('td[name="quantity"]').text().trim();
        let categoryText = $(button).closest('tr').find('td[name="category"]').text().trim();
        let description = $(button).closest('tr').find('td[name="description"]').text().trim();
        let image = $(button).closest('tr').find('td[name="image"]').find('img').attr('src');
        let publisher = $(button).closest('tr').find('td[name="publisher"]').text().trim();
        let date = $(button).closest('tr').find('td[name="date"]').text().trim();
        let genre = $(button).closest('tr').find('td[name="genre"]').text().trim();
        $('#idEditInput').val(id);
        $('#nameEditInput').val(name);
        $('#authorEditInput').val(author);
        $('#priceEditInput').val(price);
        $('#quantityEditInput').val(quantity);
        $('#publisherEditInput').val(publisher);
        $('#dateEditInput').val(date);
        $('#genreEditInput').val(genre);
        //loop through category list to select the category
        $('#categoryEditInput option').each(function () {
            if ($(this).text() === categoryText) {
                $(this).prop('selected', true);
            }
        });
        $('#descriptionEdit').val(description);
        $('#previewImage2').attr('src', image);
        $('#previewImage2').css('display', 'block');
        let filename = image.substring(image.lastIndexOf('/') + 1);
        $('#currentImage').val(filename);
    }
</script>