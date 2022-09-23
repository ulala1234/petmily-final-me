<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/login.css">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Loding font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">
</head>
<body>

<div class="section">
    <div class="container">
        <div class="form">
            <div class="left-side">
                <div>
                    <form action="/login" method="post">
                     <div class="login" id="login">
                        <b><a href="${pageContext.request.contextPath}/"
                             style="text-decoration: none; color: black"><h2>Petmily</h2></a></b>
                        </div>
                        <div class="form-inputs">
                            <input type="text" name="id" placeholder="아이디" required="required"/>
                            <%--                        <input type="text" placeholder="Email Address">--%>
                            <div class="password">
                                <input id="password" name="pw" type="password" placeholder="비밀번호" required="required"/>
                                    <span class="showpass" onclick="toggle()">
                            <img id="changepasseye" src="https://i.imgur.com/d1M6y1W.jpg"> </span>
                                <p class="random_password"></p>
                            </div>
                            <br>
                            <div class="login">
                                <div>
                                    <button type="submit" class="btn btn-lg btn-block btn-success">로그인</button>
                                    <br>
                                    <div class="join"><a style="text-decoration:none" href="/join">회원가입</a></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="right-side" OnClick="location.href ='/'" style="cursor:pointer;">
                <h2>Petmily</h2>
            </div>
        </div>
    </div>
</div>
</body>
</html>