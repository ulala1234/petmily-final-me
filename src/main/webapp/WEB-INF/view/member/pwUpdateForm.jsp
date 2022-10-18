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
                    <form action="/member/pwChange?email=${email}&id=${id}" id="pwUpdate" method="post">
                        <div class="login" id="login">
                            <b><a style="text-decoration: none; color: black"><h2>비밀번호<br>재설정</h2></a></b>
                        </div>
                        <div class="form-inputs">
                            <div>
                                <div class="password"><input type="password" name="pw" id="pw" placeholder="새 비밀번호" required="required"/>
                                </div>
                                <div><input type="password" name="confirmPw" id="confirmPw" placeholder="비밀번호 확인"
                                            required="required"/></div>
                            </div>
                            <br>
                            <div>
                                <span><button type="button" class="btn btn-default"
                                              onclick="location.href='/login'">취소</button></span>
                                <span><button type="button" class="btn btn-default btn-success"
                                              onclick="pwUpdate(); return false;">확인</button></span>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function pwUpdate() {

        if ($("#pw").val() == null || $("#pw").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#pw").focus();

            return false;
        }

        if ($("#confirmPw").val() == null || $("#confirmPw").val() == "") {
            alert("비밀번호 확인을 입력해주세요.");
            $("#confirmPw").focus();

            return false;
        }

        if ($("#pw").val() != $("#confirmPw").val()) {
            alert("비밀번호가 일치하지 않습니다.");
            $("#confirmPw").focus();

            return false;
        }

        if (confirm("비밀번호를 변경하시겠습니까?")) {
            $("#pwUpdate").submit();

            return false;
        }
    }

</script>

</body>
</html>