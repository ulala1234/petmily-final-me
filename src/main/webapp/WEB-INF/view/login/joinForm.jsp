<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Petmily-Don't buy, Do Adopt</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Loding font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

        <!-- Custom Styles -->
        <link rel="stylesheet" type="text/css" href="/resources/css/styles.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <script src="/resources/js/joinCheck.js"></script>
</head>
<body>

<div class="section">
    <div class="container">
        <div class="form">
            <div class="left-side">
                <div>
                	<span class="brand">
                        <a href="${pageContext.request.contextPath}/"
                           style="text-decoration: none; color: black">
                            <h4><b>Petmily</b></h4>
                        </a>
                	</span>
                    <form action="/join" method="post">
                        <div class="form-inputs">
                            <input type="text" name="id" placeholder="아이디" required="required">
                            <div class="password">
                                <input id="pw" name="pw" type="password" placeholder="비밀번호" required="required">
                                <span class="showpass" onclick="toggle()">
                            		<img id="changepasseye" src="https://i.imgur.com/d1M6y1W.jpg">
                            	</span>
                                <p class="random_password"></p>
                                <input id="passwordCheck" name="confirmPw" type="password" placeholder="비밀번호 확인"
                                       required="required">
                                <span class="showpass" onclick="toggle()">
                            		<img id="changepasseyecheck" src="https://i.imgur.com/d1M6y1W.jpg">
                            	</span>
                                <p class="random_password"></p>
                            </div>
                            <input type="text" name="name" placeholder="이름(닉네임)" required="required">
                            <input type="date" name="birth" placeholder="생년월일" required="required">
                            <input type="text" name="gender" placeholder="성별(F or M 입력)" required="required"
                                   oninput="this.value = this.value.replace(/[^FM]/g, '');" maxlength="1">
                            <input type="text" name="email" placeholder="이메일 주소" required="required"
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                            <p class="login-text">이메일 형식으로 입력하세요</p>
                            <input type="tel" name="phone" placeholder="연락처" required="required"
                                   pattern="^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$"
                                   oninput="this.value = this.value.replace(/[^0-9-]/g, '');">
                            <p class="login-text">핸드폰 번호 형식으로 입력하세요</p>
                            <div class="login">
                                <button type="submit" class="btn btn-lg btn-block btn-success">회원가입</button>
                            </div>
                            <p class="login-text">계정이 이미 있습니까? <a href="/login">login</a></p>
                        </div>
                    </form>
                </div>
            </div>
            <div class="right-side" OnClick="location.href ='/'"  style="cursor:pointer;">
                <h2>Petmily</h2>
            </div>
        </div>
    </div>
</div>
</body>
</html>