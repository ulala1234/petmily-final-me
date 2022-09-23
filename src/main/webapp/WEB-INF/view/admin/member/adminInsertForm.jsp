<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Petmily-Don't buy, Do Adopt</title>
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
                            <img src="https://i.imgur.com/zpXluzv.png">
                            <small>Petmily</small>
                        </a>
                	</span>
                    <form action="/admin/member/insert" method="post">
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

                            <input id="submit_button" type="submit" value="회원정보 등록">

                        </div>
                    </form>
                </div>
            </div>
            <div class="right-side">
                <h2>Petmily</h2>
                <span class="circle1"></span>
                <span class="circle2"></span>
                <span class="circle3"></span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                    <path fill="#000" fill-opacity="1"
                          d="M0,96L48,122.7C96,149,192,203,288,229.3C384,256,480,256,576,234.7C672,213,768,171,864,176C960,181,1056,235,1152,229.3C1248,224,1344,160,1392,128L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
                </svg>
            </div>
        </div>
    </div>
</div>
</body>
</html>