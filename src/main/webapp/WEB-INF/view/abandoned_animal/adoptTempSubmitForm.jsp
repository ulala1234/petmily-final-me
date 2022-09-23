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

        .arr {
            margin: auto;
            display: block;
            width: 100px;
        }

        h1 {
            font-weight: 400;
            font-family: 'Merriweather', serif
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
                    <span class="mr-2"><span>Adopt / Temp - Submit<i class="ion-ios-arrow-forward"></i></span></span>
                </p>
                <h1 class="mb-0 bread">입양 / 임시보호하기</h1>
            </div>
        </div>
    </div>
</section>

<!-- servey form -->
<div class="container survey">
    <h1 id="title" class="text-center">입양 / 임시보호 신청서</h1>

    <p id="description" class="text-center" style="color: red">* 다음
        양식을 채워주세요</p>
    <p id="description" class="text-left">* 임시 보호의 최소 기간은 2개월입니다.</p>

    <form id="adoptTempSubmitForm"
          action="/abandoned_animal/auth/adopt_temp?abNumber=${param.abNumber}"
          method="post">

        <div class="form-group">
            <label id="name-label">* 가족이 될 동물</label> <input id="name"
                                                             type="name" name="name" class="form-control"
                                                             value=${animalName
                                                                     } readonly>
        </div>

        <div class="form-group">
            <label id="name-label">* 이름</label> <input id="name" type="name"
                                                       name="name" class="form-control" value=${memberName } readonly>
        </div>

        <br/>

        <div class="radiobuttons">
            <p>1. 선택</p>
            <ul style="list-style: none;">
                <li class="radio"><input name="adoptOrTemp" value="adopt"
                                         type="radio" class="userRatings" required><label>입양</label></li>
                <li class="radio"><input name="adoptOrTemp" value="temp"
                                         type="radio" class="userRatings" required><label>임시보호</label></li>
            </ul>
        </div>

        <div class="form-group">
            <label for="exampleFormControlSelect2">2. 거주 지역</label> <select
                name="residence" class="form-control" id="residence" required>
            <option>서울특별시</option>
            <option>경기도</option>
            <option>인천광역시</option>
            <option>강원도</option>
            <option>경상북도</option>
            <option>경상남도</option>
            <option>부산광역시</option>
            <option>대구광역시</option>
            <option>울산광역시</option>
            <option>전라남도</option>
            <option>전라북도</option>
            <option>광주광역시</option>
            <option>충청남도</option>
            <option>충청북도</option>
            <option>대전광역시</option>
            <option>세종특별자치시</option>
            <option>제주특별자치도</option>
        </select>
        </div>

        <div class="radiobuttons">
            <p>3. 결혼 여부</p>
            <ul style="list-style: none;">
                <li class="radio"><input name="maritalStatus" value="married"
                                         type="radio" class="userRatings" required><label>기혼</label></li>
                <li class="radio"><input name="maritalStatus" value="single"
                                         type="radio" class="userRatings" required><label>미혼</label></li>
            </ul>
        </div>

        <div class="form-group">
            <label id="job-label">4. 직업</label> <input id="job" type="name"
                                                       name="job" class="form-control" placeholder="직업을 입력해주세요."
                                                       required>
        </div>

        <!-- 후에 설문 구현 -->
        <!-- <p id="description" class="text-center" style="color: red">* 이제부터
            설문을 시작하겠습니다.</p>

        <div class="radiobuttons">
            <p>1. 예전에 반려동물을 키우신 적이 있으신가요?</p>
            <ul style="list-style: none;">
                <li class="radio"><input name="radio-buttons" value="3"
                    type="radio" class="userRatings"><label>예</label></li>
                <li class="radio"><input name="radio-buttons" value="3"
                    type="radio" class="userRatings"><label>아니오</label></li>
            </ul>
        </div>
        <div class="message">
            <textarea name="comment" id="comments" cols="30" rows="5"
                placeholder="(만일 있으시다면 어떤 종류의 동물인지, 얼마나 오래 키우셨는지, 지금은 어떻게 되었는지 적어주세요.)"
                optional></textarea>
        </div>-->

        <br/>
        <br/>
        <div class="arr">
            <button id="submit" type="submit" class="btn btn-secondary"
                    style="float: center">제출
            </button>
        </div>
        <br/>
        <br/>

        <!-- 폼 참고 -->
        <!-- <div class="col">
            <label id="name-label">First Name</label> <input id="name"
                type="name" class="form-control" placeholder="First name" required>
        </div>

        <div class="col">
            <label for="formGroupExampleInput">Last Name</label> <input
                id="last-name" type="name" class="form-control"
                placeholder="Last name" required>
        </div>
        <br />

        <div class="form-group">
            <label id="email-label">Email address</label> <input id="email"
                type="email" class="form-control" aria-describedby="emailHelp"
                placeholder="Enter email" required> <small id="emailHelp"
                class="form-text text-muted">We'll never share your email
                with anyone else.</small>
        </div>

        <div class="form-group">
            <label id="number-label">Your age</label> <input id="number"
                type="number" min="15" max="125" class="form-control" id="number"
                placeholder="Age" required>
        </div>

        <div class="form-group">
            <label for="exampleFormControlSelect2">Qualification</label> <select
                class="form-control" id="dropdown">
                <option>Primary Education</option>
                <option>Secondary Eduction</option>
                <option>Bachelors Degree</option>
                <option>Masters</option>
                <option>PHd</option>
            </select>
        </div>

        <div class="radiobuttons">
            <p>Whats Better?</p>
            <ul style="list-style: none;">
                <li class="radio"><input name="radio-buttons" value="3"
                    type="radio" class="userRatings"><label>Front-End</label></li>
                <li class="radio"><input name="radio-buttons" value="3"
                    type="radio" class="userRatings"><label>Back-End</label></li>
            </ul>
        </div>

        <div>
            <p>What would you like us to change?</p>
            <ul class="checkboxlabel">
                <li class="checkbox" style="list-style: none;"><label>
                        <input name="prefer" value="1" type="checkbox"
                        class="userRatings">Front-end Projects
                </label></li>
                <li class="checkbox" style="list-style: none;"><label>
                        <input name="prefer" value="1" type="checkbox"
                        class="userRatings">Back-end Projects
                </label></li>
                <li class="checkbox" style="list-style: none;"><label>
                        <input name="prefer" value="1" type="checkbox"
                        class="userRatings">Website Layout
                </label></li>
                <li class="checkbox" style="list-style: none;"><label>
                        <input name="prefer" value="1" type="checkbox"
                        class="userRatings">Easier challenges
                </label></li>
            </ul>
        </div>

        <div class="message">
            <p>Message to us</p>
            <textarea name="comment" id="comments" cols="30" rows="5"
                placeholder="What would you like to tell us?" optional></textarea>
        </div>
        <br />
        <div>
            <button id="submit" type="submit" class="btn btn-secondary"
                style="float: right">Submit</button>
        </div> -->
    </form>
</div>
<!-- servey form end -->

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