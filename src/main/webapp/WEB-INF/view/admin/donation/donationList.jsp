<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>-->
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
    <link rel="stylesheet" href="/css/bootstrap.css">
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
                <h1 class="mb-0 bread">후원 관리</h1>
            </div>
        </div>
    </div>
</section>

<!-- 후원 관리 List -->

<section class="ftco-section bg-light">
    <div class="container">
        <div class="inner-main-body p-2 p-sm-3 collapse forum-content show">

            <!-- 목록 출력 -->
            <div class="row align-items-start">
                <div class="col-lg-12">
                    <table class="table table-hover bg-white">

                        <thead>
                        <tr class="table table-border">
                            <th>후원 번호</th>
                            <th>후원 받을 동물</th>
                            <th>회원</th>
                            <th>금액</th>
                            <th>관리 버튼</th>
                        </tr>
                        </thead>
                        <c:forEach var="donation" items="${donationPageForm.content}">
                            <tbody>

                            <tr>
                                <td class="col-md-1">${donation.getDNumber()}</td>
                                <td class="col-md-2">
                                    <a href="/admin/donation/detail?dNumber=${donation.getDNumber()}&abNumber=${donation.abNumber}&mNumber=${donation.getMNumber()}"
                                       class="text-body">${donation.abName}</a>
                                </td>
                                <td class="col-md-2">
                                    <a href="/admin/donation/detail?dNumber=${donation.getDNumber()}&abNumber=${donation.abNumber}&mNumber=${donation.getMNumber()}"
                                       class="text-body">${donation.getMName()}</a>
                                </td>
                                <td class="col-md-1">${donation.donaSum}</td>
                                <td class="col-md-1">
                                    <input type="button" id="modify" class="btn btn-primary" value="수정"
                                           onclick="location.href='/admin/donation/modify?dNumber=${donation.getDNumber()}'">
                                    <input type="button" id="delete" class="btn btn-primary" value="삭제"
                                           onclick="if(confirm('정말로 삭제하시겠습니까?'))
                                                          { return location.href='/admin/donation/delete?dNumber=${donation.getDNumber()}';}">
                                </td>
                            </tr>

                            </tbody>

                        </c:forEach>
                    </table>
                </div>
            </div>

            <!-- 생성 버튼  -->

            <span class="modal-footer">
				<button type="button" class="btn btn-primary"
                        onclick="location.href='/admin/donation/create'">추가</button>
			</span>

			<!-- 관리자 페이지 이동 버튼  -->

			</div>
                <div class="modal-footer justify-content-center">
                    <input type="button" id="toAdmin" class="btn btn-primary" value="관리자 페이지로"
                           onclick="location.href='/admin'">
                </div>

            <!-- 페이징 처리 -->

            <div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                            <li>
                                <c:if test="${donationPageForm.startPage > 5}">
                                    <a href="/admin/donation/?pageNo=${donationPageForm.startPage - 5}">&lt;</a>
                                </c:if>
                            </li>
                            <li>
                                <c:forEach var="pNo" begin="${donationPageForm.startPage}"
                                           end="${donationPageForm.endPage}">
                                    <c:if test="${donationPageForm.currentPage == pNo}">
                            <li class="active">
                                <a href="/admin/donation?pageNo=${pNo}">${pNo}</a>
                            </li>
                            </c:if>
                            <c:if test="${donationPageForm.currentPage != pNo}">
                                <li>
                                    <a href="/admin/donation?pageNo=${pNo}">${pNo}</a>
                                </li>
                            </c:if>
                            </c:forEach>
                            </li>
                            <li>
                                <c:if test="${donationPageForm.endPage < donationPageForm.totalPages}">
                                    <a href="/admin/donation?pageNo=${donationPageForm.startPage + 5}">&gt;</a>
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- 후원 관리 List 끝 -->

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