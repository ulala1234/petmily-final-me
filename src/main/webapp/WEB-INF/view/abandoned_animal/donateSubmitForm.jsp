<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Petmily-Don't buy, Do Adopt</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="/resources/petsitting-master/css/animate.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/jquery.timepicker.css">
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

        #description {
            font-family: 'Merriweather', serif
        }

        #arrange {
            float: right;
            position: relative;
            left: -50%;
        }

        .arr {
            margin: auto;
            display: block;
            width: 100px;
        }

        .inline {
            display: block;
        }

        @media ( max-width: 500px) {
            .checkboxlabel {
                display: block;
            }
        }
    </style>

    <script>
        function doOpenCheck(chk) {
            var obj = document.getElementsByName("donaSum");
            for (var i = 0; i < obj.length; i++) {
                if (obj[i] != chk) {
                    obj[i].checked = false;
                }
            }
        }

        function zero() {
            document.getElementById('blank').value = "";
        }
    </script>
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
                    <span class="mr-2"><span>Donate - Submit<i class="ion-ios-arrow-forward"></i></span></span>
                </p>
                <h1 class="mb-0 bread">후원하기</h1>
            </div>
        </div>
    </div>
</section>
<br>

<div class="container survey">

    <h1 id="title" class="text-center">후원하기</h1>
    <p id="description" class="text-center"></p> <br><br>

    <div class="form-group">
        <label id="name-label">후원받을 동물</label> <input id="name"
                                                      type="name" name="name" class="form-control" value="${animalName}"
                                                      readonly>
    </div>
    <div class="form-group">
        <label id="name-label">이름</label> <input id="name" type="name"
                                                 name="name" class="form-control" value="${memberName}" readonly>
    </div>

    <form name="donaform" id="survey-form" method="post"
          action="/abandoned_animal/auth/donate?abNumber=${param.abNumber}">
        <div class="form-row">
            <div class="col">
                <label for="exampleFormControlSelect2">은행명</label> <select
                    name="bank" class="form-control" id="dropdown">
                <option>국민은행</option>
                <option>IBK기업은행</option>
                <option>KEB하나은행</option>
                <option>신한은행</option>
                <option>우리은행</option>
                <option>한국씨티뱅크</option>
                <option>SC제일은행</option>
                <option>농협은행</option>
                <option>수협은행</option>
                <option>우체국</option>
                <option>토스</option>
                <option>카카오뱅크</option>
                <option>제주은행</option>
            </select>
            </div>
            <div class="col">
                <label id="name-label">예금주</label>
                <input name="accountHolder"
                       id="name" type="name" class="form-control" placeholder="예금주"
                       required>
            </div>
            <div class="col">
                <label for="formGroupExampleInput">계좌번호</label>
                <input name="accountNumber" id="last-name" type="name"
                       class="form-control" placeholder="계좌번호" required>
            </div>
        </div>
        <br><br>

        <div class="form-row">
            <div class="col">
                <label>
                    <input name="donaSum" value="20000" onclick="doOpenCheck(this);zero();"
                           type="checkbox" class="userRatings"> 20,000원
                </label>
            </div>
            <div class="col">
                <label>
                    <input name="donaSum" value="30000" onclick="doOpenCheck(this);zero();"
                           type="checkbox" class="userRatings"> 30,000원
                </label>
            </div>
            <div class="col">
                <label>
                    <input name="donaSum" value="50000" onclick="doOpenCheck(this);zero();"
                           type="checkbox" class="userRatings"> 50,000원
                </label>
            </div>
            <div class="col">
                <label>
                    <input name="donaSum" value="100000" onclick="doOpenCheck(this);zero();"
                           type="checkbox" class="userRatings"> 100,000원
                </label>
            </div>
            <div class="inline">
                <input id="blank" name="donaSum" onclick="doOpenCheck(this);"
                       type="text" placeholder="직접 입력"/> 원
            </div>
        </div>
        <br><br>

        <div class="arr">
            <button id="submit" type="submit" class="btn btn-secondary">후원하기</button>
        </div>
    </form>
    <br><br>
</div>

<%@ include file="/WEB-INF/view/include/footer.jspf" %>

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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/petsitting-master/js/google-map.js"></script>
<script src="/resources/petsitting-master/js/main.js"></script>
</body>
</html>