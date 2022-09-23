<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Petmily-Don't buy, Do Adopt</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/css/freeBoard.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap">
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

<!-- 헤더 -->

<%@ include file="/WEB-INF/view/include/header.jspf" %>

<!-- 현재 페이지 -->

<section class="hero-wrap hero-wrap-2"
         style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <c:if test="${param.kindOfBoard eq '입양후기'}">
                    <p class="breadcrumbs mb-2">
                        <span class="mr-2"><span>Adopt Review Board - Write<i class="ion-ios-arrow-forward"></i></span></span>
                    </p>
                    <h1 class="mb-0 bread">입양 후기 게시판 - 글 작성</h1>
                </c:if>
            </div>
        </div>
    </div>
</section>

<!-- modifyForm 시작 -->

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="contact">

                    <!-- form 시작 -->

                    <form class="form" name="enq" method="post" action="/adopt_review/auth/write"  enctype='multipart/form-data'>
                        <div class="modal-body">
                            <div class="row">
                                <c:if test="${authUser.grade == '관리자'}">
                                    <div>
                                        <label for="mNumber">
                                            작성자 :
                                        </label>
                                        <select name="mNumber" id="mNumber">
                                            <c:forEach var="mem" items="${Mems}">
                                                <option value="${mem.getMNumber()}">${mem.getMNumber()} - ${mem.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <hr color="#6c757d" width="100%">
                                </c:if>
                                <div class="form-group">

                                    <!-- 글 title, content, kindOfBoard, wrTime -->

                                    <div>
                                        <input type="text" class="form-control" name="title"
                                               placeholder="제목을 입력해주세요" autofocus="" required="required"/>
                                    </div>
                                </div>
                                <textarea rows="20" name="content" class="form-control"
                                          placeholder="내용을 입력해주세요" required="required"/></textarea>
                                <input type="hidden" name="kindOfBoard" id="kindOfBoard" value="${param.kindOfBoard}"/>
                            </div>
                        </div>

                        <!-- 첨부파일 -->

                        <div>
                           <div class="custom-file form-control-sm mt-3" style="max-width: 300px;">
                             <input type="file" name="imgPath" id="file" accept="image/*">
                        </div>

                        <!-- checkPublic 공개 / 비공개 여부  -->

                            <c:if test="${param.kindOfBoard eq '입양후기'}">
                                <input type="hidden" name="checkPublic" value="Y"/>
                            </c:if>

                        <!-- 취소 버튼  -->

                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-dismiss="modal"
                                    onclick="location.href='/adopt_review/list?kindOfBoard=${param.kindOfBoard}'">취소
                            </button>

                            <!-- 글 등록 버튼  -->

                            <input type="submit" class="btn btn-primary" value="글 등록"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- modifyForm 끝 -->

<!-- 풋터 -->

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