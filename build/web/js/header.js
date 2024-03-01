/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.querySelectorAll('.hidden-content div').forEach(item => {
    item.addEventListener('mouseover', function () {
        this.classList.add('hovered'); // Thêm lớp CSS khi hover vào
    });

    item.addEventListener('mouseout', function () {
        this.classList.remove('hovered'); // Xóa lớp CSS khi rời khỏi
    });
});
var getLogout = () => {
    window.location.href = "login";
};
var getSignUp = () => {
    window.location.href = "register";
};
var getSignIn = () => {
    window.location.href = "login";
};
var getToCart = () => {
    let cart = document.querySelector('.get-to-cart');
    cart.submit();
};

