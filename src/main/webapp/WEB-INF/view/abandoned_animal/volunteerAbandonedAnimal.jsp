<!-- 신청서 폼 Bootstrap 참고 사이트, https://codepen.io/jeetgohil/pen/gdwVeV -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Petmily-Don't buy, Do Adopt</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link
            href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
            rel="stylesheet">

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/css?family=Merriweather"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway"
          rel="stylesheet">

    <link rel="stylesheet" href="/resources/petsitting-master/css/animate.css">

    <link rel="stylesheet"
          href="/resources/petsitting-master/css/owl.carousel.min.css">
    <link rel="stylesheet"
          href="/resources/petsitting-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/magnific-popup.css">


    <link rel="stylesheet"
          href="/resources/petsitting-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet"
          href="/resources/petsitting-master/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/resources/petsitting-master/css/flaticon.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/style.css">

    <style>
        .checkboxlabel {
            display: flex;
            justify-content: space-between;
            text-align: justify;
        }

        .message {
            display: flex;
            justify-content: space-between;
        }

        textarea {
            width: 82%;
        }

        .radiobuttons {
            display: flex;
        }

        .survey {
            font-family: 'Raleway', sans-serif;
            margin-top: 25px;
        }

        h1 {
            font-weight: 400;
            font-family: 'Merriweather', serif
        }

        .arr {
            margin: auto;
            display: block;
            width: 100px;
        }

        #description {
            font-family: 'Merriweather', serif
        }

        @media ( max-width: 500px) {
            .checkboxlabel {
                display: block;
            }
        }
    </style>
</head>

<%@ include file="/WEB-INF/view/include/header.jspf" %>

<body>
<section class="hero-wrap hero-wrap-2"
         style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs mb-2">
                    <span class="mr-2"><span>Volunteer Abandoned Animal - Submit<i
                            class="ion-ios-arrow-forward"></i></span></span>
                </p>
                <h1 class="mb-0 bread">봉사하기</h1>
            </div>
        </div>
    </div>
</section>

<!-- Apply form start -->
<div class="container survey">
    <h1 id="title" class="text-center">봉사 신청서</h1>
    <p id="main-title" class="text-center">해당 유기동물 봉사 신청 폼입니다.</p>
    <small name="form-control" class="form-text text-muted text-center" >
                    ※ 자원봉사희망자 정보는 신청자와 관리센터만 볼 수 있습니다.</small>

    <form id="submit-form"
          action="/abandoned_animal/auth/volunteer?abNumber=${param.abNumber}"
          method="POST">

        <div class="form-row">
            <div class="col">
                <label id="name-label">유기동물 이름</label>
                <input readonly id="name"
                       type="text" value=${animalName } class="form-control">
            </div>
        </div>
        <br/>
        <div class="form-group">
            <label id="member-name-label">이름</label>
            <input readonly id="member-name"
                   type="text" value=${memberInfo.name } class="form-control"
                   aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label id="member-age">생년월일</label>
            <input readonly id="birth" type="text" value=${memberInfo.birth} min="15" max="125"
                   class="form-control" id="text">
        </div>

        <div class="form-group">
            <label id="member-phone">연락처</label>
            <input readonly id="phone" type="text" value=${memberInfo.phone} class="form-control"
                   aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label id="member-email">이메일</label>
            <input readonly id="email" type="text" value=${memberInfo.email} class="form-control"
                   aria-describedby="emailHelp">
        </div>

        <div class="form-row">
            <div class="col">
                <label for="formGroupExampleInput">봉사활동 기간</label>
                <input id="volunteerPeriod" type="number" class="form-control"
                       name="volunteerPeriod" placeholder="희망하는 봉사 활동 일 수를 기입해 주세요." required>
            </div>
            <div class="col">
                <label for="formGroupExampleInput">봉사 시작날짜</label>
                <input id="volunteerStartDate" type="date" class="form-control"
                       name="volunteerStartDay" placeholder="입력" required>
            </div>
        </div>

        <br/>
        <div class="arr">
            <button id="submit" type="submit" class="btn btn-secondary"
                    style="float: center">신청하기
            </button>
        </div>
    </form>

    <br/>

</div>
<!--Apply form end -->

<%@ include file="/WEB-INF/view/include/footer.jspf" %>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
    </svg>
</div>

<script src="/resources/petsitting-master/js/jquery.min.js"></script>
<script src="/resources/petsitting-master/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/petsitting-master/js/popper.min.js"></script>
<script src="/resources/petsitting-master/js/bootstrap.min.js"></script>
<script src="/resources/petsitting-master/js/jquery.easing.1.3.js"></script>
<script src="/resources/petsitting-master/js/jquery.waypoints.min.js"></script>
<script src="/resources/petsitting-master/js/jquery.stellar.min.js"></script>
<script src="/resources/petsitting-master/js/jquery.animateNumber.min.js"></script>
<script src="/resources/petsitting-master/js/bootstrap-datepicker.js"></script>
<script src="/resources/petsitting-master/js/jquery.timepicker.min.js"></script>
<script src="/resources/petsitting-master/js/owl.carousel.min.js"></script>
<script src="/resources/petsitting-master/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/petsitting-master/js/scrollax.min.js"></script>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/petsitting-master/js/google-map.js"></script>
<script src="/resources/petsitting-master/js/main.js"></script>
</body>
</html>