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
                <form id="editBookForm" action="order?action=edit" method="POST">
                    <!--id-->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idEditInput" name="id">
                    </div>
                    <!--Category-->
                    <div class="form-group">
                        <label for="category">Status: </label>
                        <div class="input-group">
                            <select class="custom-select" id="categoryEditInput" name="statusID">
                                <c:forEach items="${listStatus}" var="status">
                                    <option value="${status.id}">${status.name}</option>
                                </c:forEach>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Status</button>
                            </div>
                        </div>
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
        let category = $('#categoryEditInput').val();
        if (category === '') {
            $('#categoryError').html('Danh mục không được để trống');
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
    // function editProductModal(id, name, description, author, price, quantity, image, categoryId) { 
    function editProductModalOrder(idStatus, idOrder) {
        let idInput = document.getElementById('idEditInput');
        idInput.value = idOrder;
        console.log(idStatus);
        console.log(idOrder);
        //loop through category list to select the category
        $('#categoryEditInput option').each(function () {
            if ($(this).val() === idStatus) {
                console.log($(this).val());
                $(this).prop('selected', true);
            }
        });
    }
</script>