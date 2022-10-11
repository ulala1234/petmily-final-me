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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<body>

<div class="section">
    <div class="container">
        <div class="form">
            <div class="left-side">
                <div>
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
                            <input type="text" name="email" id="email" placeholder="이메일 주소" required="required"
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                            <p class="login-text">이메일 형식으로 입력하세요</p>
                            <input type="button" name="sendEmail" id="sendEmail" class="btn-sub" value="이메일 인증하기">
                            <input type="text" name="verificationCode" id="verificationCode" placeholder="인증번호를 입력해주세요" required="required">
                            <input type="button" name="emailCode" id="emailCode" class="btn-sub" value="인증번호 확인">
                            <p class="login-text" id="emailCode-text" style="color: red">인증되지 않았습니다.</p>
                            <input type="tel" name="phone" placeholder="연락처" required="required"
                                   pattern="^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$"
                                   oninput="this.value = this.value.replace(/[^0-9-]/g, '');">
                            <p class="login-text">핸드폰 번호 형식으로 입력하세요</p>
                            <div class="login">
                                <button type="submit" id="submit-btn" class="btn btn-lg btn-block btn-success">회원가입</button>
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

<script>
    $("#sendEmail").on("click", function () {
        const emailAuth = {
            address: document.getElementById('email').value
        };

        if(emailAuth.address == '') {
            alert('인증번호를 받을 이메일 주소를 입력 해 주세요.');
            return;
        }

        $.ajax({
            type:'post',
            url:'/join/mailCheck',
            contentType: 'application/json',
            dataType: 'text',
            data:JSON.stringify(emailAuth),
            success: function(){
                alert("인증번호를 해당 이메일로 발송했습니다.\n확인해주세요.");
            },
            error: function() {
                alert("인증번호 전송 실패하였습니다.\n작성된 메일을 다시 확인해주세요.");
            }
        });
    });

    $("#emailCode").on("click", function () {
        const insert_code = document.getElementById('verificationCode');

        const emailAuth = {
            address: document.getElementById('email').value,
            code: insert_code.value
        };

        const text = document.getElementById('emailCode-text');

        if(insert_code.value == '') {
            alert('인증번호를 입력 해 주세요.');
            return;
        }

        $.ajax({
            type:'post',
            url:'/join/codeCheck',
            contentType: 'application/json',
            dataType: 'text',
            data:JSON.stringify(emailAuth),
            success: function(result){
                if(result == 1) {
                    text.innerText = '인증되었습니다.';
                    $('#emailCode-text').css('color', 'blue');
                    $('#verificationCode').attr('readonly', 'true');
                }
                else {
                    text.innerText = '인증 번호가 다릅니다.';
                }
            },
            error: function() {
                alert("번호 확인에 실패하였습니다.");
            }
        })
    });

    $("#submit-btn").on("click", function (e) {
        const text = document.getElementById('emailCode-text').innerText;
        if(text != '인증되었습니다.') {
           alert("모든 값을 입력하고, 이메일 인증도 해 주세요");
           e.preventDefault();
        }
    });
</script>

</body>
</html>