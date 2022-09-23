<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Petmily-Don't buy, Do Adopt</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="/resources/petsitting-master/css/animate.css">

    <link rel="stylesheet" href="/resources/petsitting-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/magnific-popup.css">


    <link rel="stylesheet" href="/resources/petsitting-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/resources/petsitting-master/css/flaticon.css">
    <link rel="stylesheet" href="/resources/petsitting-master/css/style.css">
</head>

<%@ include file="/WEB-INF/view/include/header.jspf" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs mb-2">
                    <span class="mr-2"><span>Member - Mypage <i class="ion-ios-arrow-forward"></i></span></span>
                </p>
                <h1 class="mb-0 bread">마이페이지</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">${member.name}님의 마이페이지</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="wrapper">
                    <div class="row mb-5">
                        <div class="col-md-3">
                            <div class="dbox w-100 text-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-map-marker"></span>
                                </div>
                                <div class="text">
                                    <p><span>생년월일 : </span>${member.birth}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="dbox w-100 text-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-phone"></span>
                                </div>
                                <div class="text">
                                    <p><span>이메일 : </span>${member.email}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="dbox w-100 text-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-paper-plane"></span>
                                </div>
                                <div class="text">
                                    <p><span>전화번호 : </span>${member.phone}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="dbox w-100 text-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="fa fa-globe"></span>
                                </div>
                                <div class="text">
                                    <p><span>회원 등급 : </span>${member.grade}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row mb-5 pb-5">
                            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                                <div class="d-block services text-center">
                                    <div class="media-body p-4">
                                        <h3 class="heading">신청 내역</h3>
                                        <a href="/member/auth/myApply/adopt" class="btn-custom d-flex align-items-center justify-content-center"><span
                                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                                <div class="d-block services text-center">
                                    <div class="media-body p-4">
                                        <h3 class="heading">내가 쓴 게시글</h3>
                                        <a href="#" class="btn-custom d-flex align-items-center justify-content-center"><span
                                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                                <div class="d-block services text-center">
                                    <div class="media-body p-4">
                                        <h3 class="heading">찾아요 매칭 결과</h3>
                                        <a href="/member/auth/checkMatching" class="btn-custom d-flex align-items-center justify-content-center"><span
                                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5 pt-4">
                            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                                <div class="d-block services text-center">
                                    <div class="media-body p-4">
                                        <h3 class="heading">회원 정보 변경</h3>
                                        <a href="/member/auth/change_info"
                                           class="btn-custom d-flex align-items-center justify-content-center"><span
                                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                                <div class="d-block services text-center">
                                    <div class="media-body p-4">
                                        <h3 class="heading">회원 탈퇴</h3>
                                        <a href="/member/auth/withdraw"
                                           class="btn-custom d-flex align-items-center justify-content-center"><span
                                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/view/include/footer.jspf" %>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/petsitting-master/js/google-map.js"></script>
<script src="/resources/petsitting-master/js/main.js"></script>

</body>
</html>