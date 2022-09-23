<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
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
	<link rel="stylesheet" href="/css/bootstrap.css">
</head>


<!-- 헤더 -->

<%@ include file="/WEB-INF/view/include/header.jspf" %>

<!-- 현재 페이지 -->

<section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <h1 class="mb-0 bread">유기동물 관리</h1>
            </div>
        </div>
    </div>
</section>

<!-- 게시판 List -->

<section class="ftco-section bg-light">
	<div class="container">
		<div class="inner-main-body p-sm-3 collapse forum-content show">

			<!-- 목록 출력 -->
			<div class="d-flex flex-row align-items-center">
				<div class="col-sm-5 col-lg-12 text-center">
					<table class="table table-hover bg-white">

						<thead>
						<tr class="table table-border">
							<th>유기동물 번호</th>
							<th>보호소 번호</th>
							<th>입소 날짜</th>
							<th>발견 장소</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
						</thead>
						<c:forEach var="abandonedAnimal" items="${abandonedAnimals.content}">
							<tbody>

							<tr>
								<td class="col-md-2">${abandonedAnimal.abNumber}</td>
								<td class="col-md-1">${abandonedAnimal.getSNumber()}</td>
								<td class="col-md-2">${abandonedAnimal.admissionDate}</td>
								<td class="col-md-1">${abandonedAnimal.location}</td>
								<td class="col-md-1">${abandonedAnimal.animalState}</td>
								<td class="col-md-3">
								    <input type="button" id="detail" class="btn btn-primary" value="상세" onclick="location.href='/abandoned_animal/detail?abNumber=${abandonedAnimal.abNumber}'">
								    <input type="button" id="modify" class="btn btn-primary" value="수정" onclick="location.href='/admin/animal/abandoned/modify?abNumber=${abandonedAnimal.abNumber}'">
                                    <input type="button" id="delete" class="btn btn-primary" value="삭제" onclick="location.href='/admin/animal/abandoned/delete?abNumber=${abandonedAnimal.abNumber}'">
								</td>
							</tr>

							</tbody>
						</c:forEach>
					</table>

				</div>
			</div>

			<!-- 글쓰기 버튼  -->

			<span class="modal-footer">
				<button type="button" class="btn btn-primary"
						onclick="location.href='/admin/animal/abandoned/write'">글쓰기</button>
			</span>

			<!-- 페이징 처리 -->

			<div class="row mt-5">
                        <div class="col text-center">
                            <div class="block-27">
                                <ul>
                                    <li>
                                        <c:if test="${abandonedAnimals.startPage > 5}">
                                            <a href="/admin/animal/abandoned?pageNo=${abandonedAnimals.startPage - 5}">&lt;</a>
                                        </c:if>
                                    </li>
                                    <c:forEach var="pNo" begin="${abandonedAnimals.startPage}" end="${abandonedAnimals.endPage}">
                                        <c:if test="${abandonedAnimals.currentPage == pNo}">
                                            <li class="active">
                                                <a href="/admin/animal/abandoned?pageNo=${pNo}">${pNo}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${abandonedAnimals.currentPage != pNo}">
                                            <li>
                                                <a href="/admin/animal/abandoned?pageNo=${pNo}">${pNo}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <li>
                                        <c:if test="${abandonedAnimals.endPage < abandonedAnimals.totalPages}">
                                            <a href="/admin/animal/abandoned?pageNo=${abandonedAnimals.startPage + 5}">&gt;</a>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
		</div>
	</div>

</section>
<!-- 게시판 List 끝 -->

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