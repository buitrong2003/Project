<%-- 
    Document   : login
    Created on : Feb 3, 2024, 1:41:00 AM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUpUser.css"/>
    </head>
    <body>
        <div class="container" id="container">
            <div id="signUp-acount" class="form-container sign-in-container">
                <form action="register" method="post">
                    <h1>Create Account</h1>
                    <span>or use your email for registration</span>                   
                    <input type="hidden" name="role" value="1"/>
                    <input type="hidden" name="type" value="User" />
                    <input type="text" name="username" value="${requestScope.userName}" placeholder="Name" required="" />
                    <div style="margin-right: 70%" id="errorAcount" class="errorUsername">${requestScope.error}</div>
                    <input type="email" name="email" value="${requestScope.email}" placeholder="Email" required="" />
                    <div class="password-container">
                        <input type="password" value="${requestScope.password}" name="password" id="passwordInput" placeholder="Password" class="passwordInput"  oninput="validatePassword()" required="" />
                        <span class="togglePassword" onclick="togglePassword(this)">👁️</span>
                        <div id="passwordError" class="error"></div>
                    </div>
                    <div class="password-container">
                        <input type="password" value="${requestScope.password}" id="confirmPasswordInput" placeholder="Enter again Password" oninput="validatePassword()" class="passwordInput" />
                        <span class="togglePassword" onclick="togglePassword(this)">👁️</span>
                        <div id="confirmPasswordError" class="error"></div>
                    </div>
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div id="change-left" class="overlay-panel overlay-right">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" onclick="getSignUp()" id="signIn">Sign In</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/signUpUser.js"></script>
    </body>
</html>
