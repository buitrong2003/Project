/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var sortByBook = (page, url) => {
    let parameter = document.querySelector('.form-sort');
    window.location.href = `category${url}page=${page}&sort=${parameter.value}`;
};
function nextPageButton(page, totalPage, url) {
    const currentPage = parseInt(page);
    const limitPage = parseInt(totalPage);
    if (currentPage < totalPage) {
        window.location.href = `category${url}&page=${currentPage + 1}`;
    }
}
function prevPageButton(page, url) {
    const currentPage = parseInt(page);
    if (currentPage > 1) {
        window.location.href = `category${url}&page=${currentPage - 1}`;
    }
}
var getCategory = (category) => {
    let menuCategory = document.querySelector('.menu-category');
    let nameCategory = document.querySelector('.name');
    let action = document.querySelector('.action-category');
    action.value = "category";
    nameCategory.name = 'keyCategory';
    nameCategory.value = category;
    menuCategory.action = "category";
    menuCategory.submit();
};
var performSearch = () => {
    let keyword = document.getElementById('searchInput');
    let option = document.getElementById('chooseOption');
    if (keyword.value.length !== 0) {
        window.location.href = `category?search=searchBy${option.value}&keyword=${keyword.value}`;
    }
};

function getDetails(id) {
    function parseBookString(inputString) {
        let book = {};
        inputString.match(/(\w+)=(.+?)(?=\s\w+=|$)/g).forEach(match => {
            let [key, value] = match.split('=');
            value = value.replace(/,/g, '');
            if (key === 'book_id' || key === 'quantity' || key === 'category_id' || key === 'book_hot') {
                book[key] = parseInt(value);
            } else if (key === 'price') {
                book[key] = parseFloat(value);
            } else if (key === 'publication_date') {
                let date = new Date(value);
                let formattedDateString = date.toISOString().slice(0, 10);
                book[key] = formattedDateString;
            } else {
                book[key] = value;
            }
        });
        return book;
    }
    let inputString = document.getElementById(id).value;
    let book = parseBookString(inputString);
    let bookJSON = JSON.stringify(book);
    let encodedBookJSON = encodeURIComponent(bookJSON);
    let url = "details?book=" + encodedBookJSON;
    window.location.href = url;
}

