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
                <h1 class="mb-0 bread">후원 관리</h1>
            </div>
        </div>
    </div>
</section>
<br>

<div class="container survey">

    <h1 id="title" class="text-center">후원 관리 상세보기</h1>
    <p id="description" class="text-center"></p> <br><br>

    <div class="form-group">
        <label name="name-label">후원받을 동물</label>
        <input id="abName"
               type="name" name="name" class="form-control"
               value="${animalName}"
               readonly>
    </div>

    <div class="form-group">
        <label name="name-label">이름</label>
        <input id="mName"
               type="name" name="name" class="form-control"
               value="${memberName}"
               readonly>
    </div>

    <div class="form-row">
        <div class="col">
            <label for="exampleFormControlSelect2">은행명</label>
            <input id="bank"
                   type="name" name="bank" class="form-control"
                   value="${donationDetail.bank}"
                   readonly>
        </div>

        <div class="col">
            <label name="name-label">예금주</label>
            <input id="accountHolder"
                   type="name" name="accountHolder" class="form-control"
                   value="${donationDetail.accountHolder}"
                   readonly>
        </div>

        <div class="col">
            <label for="formGroupExampleInput">계좌번호</label>
            <input id="accountNumber"
                   type="name" name="accountNumber" class="form-control"
                   value="${donationDetail.accountNumber}"
                   readonly>
        </div>
    </div>
    <div class="form-group">
        <label name="name-label">후원금</label>
        <input id="donaSum"
               type="name" name="donaSum" class="form-control"
               value="${donationDetail.donaSum}"
               readonly>
    </div>
    <div class="modal-footer justify-content-center">
        <input type="button" id="modify" class="btn btn-primary" value="수정"
               onclick="location.href='/admin/donation/modify?dNumber=${donationDetail.getDNumber()}'">
        <input type="button" id="delete" class="btn btn-primary" value="삭제"
               onclick="if(confirm('정말로 삭제하시겠습니까?'))
               { return location.href='/admin/donation/delete?dNumber=${donationDetail.getDNumber()}';}">
    </div>
     </div>
        <div class="modal-footer">
            <input type="button" id="toList" class="btn btn-primary" value="목록으로"
                   onclick="location.href='/admin/donation'">
        </div>
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