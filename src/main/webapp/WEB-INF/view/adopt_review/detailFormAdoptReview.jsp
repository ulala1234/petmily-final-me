<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <c:if test="${param.kindOfBoard eq '입양후기'}">
                    <p class="breadcrumbs mb-2">
                        <span class="mr-2"><span>Adopt Review Board - Detail<i class="ion-ios-arrow-forward"></i></span></span>
                    </p>
                    <h1 class="mb-0 bread">입양후기 게시판 - 상세보기</h1>
                </c:if>
            </div>
        </div>
    </div>
</section>

<!-- 글 상세보기 -->

<section class="ftco-section bg-light">
    <div class="container">
        <div class="media-body ml-3">

            <!-- content title, name, wrTime -->

            <div class="media-body ml-3">
                <b> <span style="font-size: 2em;">${detailForm.title}</span> </b>
                <h6 class="mt-1"></h6>
                <small><a href="javascript:void(0)">${detailForm.name}</a></small>
                <small><i class="far fa-comment ml-2"></i> date ${detailForm.wrTime} </small>
                <small><i class="far fa-comment ml-2"></i> 조회 ${detailForm.viewCount} </small>

                <!-- content 내용 -->

                <div class="modal-footer"></div>
                <c:choose>
                    <c:when test="${not empty detailForm.imgPath and detailForm.imgPath ne 'no_image.png'}">
                        <img width="50%" src="/adopt_review/upload?filename=${detailForm.imgPath}"><br><br>
                    </c:when>
                    <c:otherwise>
                        <img width="100%" src=" ">
                    </c:otherwise>
                </c:choose>
                <p>${detailForm.content}</p>
                <p>
                    <img src="images/image_2.jpg" alt="" class="img-fluid">
                </p>

                <!-- content 수정, 삭제 -->

                <div class="modal-footer">
                    <c:if test="${authUser.getMNumber() == detailForm.getMNumber()}">
                        <button type="button" class="btn btn-light"
                                onclick="location.href='/adopt_review/auth/modify?kindOfBoard=${param.kindOfBoard}&bNumber=${detailForm.getBNumber()}'">
                            수정
                        </button>

                        <button type="button" class="btn btn-light"
                                onclick="if(confirm('정말로 삭제하시겠습니까?'))
                        {return location.href='/adopt_review/auth/delete?kindOfBoard=${param.kindOfBoard}&bNumber=${detailForm.getBNumber()}';}">
                            삭제
                        </button>
                    </c:if>

                    <!-- content 목록 이동 버튼 -->

                    <span>
            		<button type="button" class="btn btn-primary"
						<c:if test="${authUser.grade == '일반'}">
							onclick="location.href='/adopt_review/list?kindOfBoard=${param.kindOfBoard}'"
						</c:if>
						<c:if test="${authUser.grade == '관리자'}">
							onclick="location.href='/admin/board?kindOfBoard=${param.kindOfBoard}'"
						</c:if>>목록으로</button>
            	    </span>
                </div>

                <!-- 댓글 내용 -->

            </div>
        </div>
</section>

<!-- section -->

<!-- 풋터 -->

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