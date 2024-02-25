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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signInUser.css"/>
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>                   
                    <div>or use your account</div>
                    <div class="error">${requestScope.errorAcount}</div>
                    <input name="username" value="${requestScope.username}" type="text" placeholder="Name" required="" />
                    <div class="password-container">
                        <input name="password" value="${requestScope.password}" type="password" required="" placeholder="Password" class="passwordInput" />
                        <span class="togglePassword" onclick="togglePassword(this)">👁️</span>
                    </div>
                    <a href="#">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button onclick="getSubmit()" class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/signInUser.js"></script>
    </body>
</html>
