/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function togglePassword(element) {
    const passwordInput = element.previousElementSibling;
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    element.textContent = type === 'password' ? '👁️' : '👁️‍🗨️';
}

var getSignUp = () => {
    window.location.href = "login";
};
const passwordInput = document.getElementById('passwordInput');
const confirmPasswordInput = document.getElementById('confirmPasswordInput');
const passwordError = document.getElementById('passwordError');
const confirmPasswordError = document.getElementById('confirmPasswordError');

function validatePassword() {
    const password = passwordInput.value;
    const confirmPassword = confirmPasswordInput.value;
    if (password.length < 5 || password.length > 8) {
        passwordError.textContent = "Password must be between 5 and 8 characters";
    } else {
        passwordError.textContent = "";
    }
    if (password !== confirmPassword) {
        confirmPasswordError.textContent = "Passwords do not match";
    } else {
        confirmPasswordError.textContent = "";
    }
}
let error = document.querySelectorAll('.error');
// Xử lý sự kiện submit của form
document.querySelector('form').addEventListener('submit', function (e) {
    // Kiểm tra nếu có lỗi
    error.forEach(err => {
        if (err.textContent !== "") {
            e.preventDefault();
        }
    });
    // Ngăn chặn hành vi mặc định của sự kiện submit
});
