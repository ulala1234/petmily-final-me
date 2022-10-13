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
                    <form action="/pwChange" method="post">
                        <div class="login" id="login">
                            <b><a style="text-decoration: none; color: black"><h4>비밀번호 찾기</h4></a></b>
                        </div>
                        <div class="form-inputs">
                            <input type="text" name="email" placeholder="이메일 주소" required="required"/>
                            <%-- <input type="text" placeholder="Email Address">--%>
                            <div>
                                <input id="text" name="id" type="id" placeholder="아이디" required="required"/>
                            </div>
                            <br>
                            <div>
                                <span><button type="button" class="btn btn-default"
                                              onclick="location.href='/login'">취소</button></span>
                                <span><button type="submit" class="btn btn-default btn-success">확인</button></span>
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

<script>
var msg = "${msg}";

		if (msg != "") {
			alert(msg);
		}

</script>
</body>
</html>