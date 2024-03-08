<%-- 
    Document   : profile
    Created on : Mar 7, 2024, 5:36:07 PM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
        <link rel="stylesheet" href="css/profile.css"/>
    </head>
    <body>
        <div>
            <%@include file="common/header.jsp" %>
        </div>
        <div style="margin-top: 7%" class="container rounded bg-white mb-5 ">
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 border">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <form action="profile" method="post" enctype="multipart/form-data">
                            <div id="avatarContainer">
                                <img onclick="openFileUploader()" id="avatar" src="image/${sessionScope.acount.image == null ? "user.png" : sessionScope.acount.image}" alt="Avatar">
                                <input type="file" class="custom-file-input" id="uploadInput" name="image">   
                                <input type="hidden" name="currentImage" value="user.png"/>
                            </div>
                            <canvas id="canvas" style="display:none;"></canvas>
                            <input type="hidden" name="type" value="User" />
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Username</label>
                                    <input type="text" class="form-control" placeholder="username" value="${sessionScope.acount.user_name}" 
                                           name="name" readonly>
                                </div>
                                <div class="col-md-12"><label class="labels">Email</label>
                                    <input type="text" name="email" class="form-control" placeholder="email" value="${sessionScope.acount.email}" 
                                           >
                                </div>
                                <div class="col-md-12"><label class="labels">Password</label>
                                    <input type="password" class="form-control" placeholder="password" value="${sessionScope.acount.password}" 
                                           maxlength="11"
                                           minlength="10" name="password">
                                </div>                             
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save
                                    Profile</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/profile.js"></script>
        <%@include file="common/footer.jsp" %>       
    </body>
</html>
