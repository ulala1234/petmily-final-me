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
                <c:if test="${param.kindOfBoard eq '자유'}">
                    <p class="breadcrumbs mb-2">
                        <span class="mr-2"><span>Free Board<i class="ion-ios-arrow-forward"></i></span></span>
                    </p>
                    <h1 class="mb-0 bread">자유 게시판</h1>
                </c:if>
                <c:if test="${param.kindOfBoard eq '문의'}">
                    <p class="breadcrumbs mb-2">
                        <span class="mr-2"><span>Inquiry Board<i class="ion-ios-arrow-forward"></i></span></span>
                    </p>
                    <h1 class="mb-0 bread">문의 게시판</h1>
                </c:if>
            </div>
        </div>
    </div>
</section>


<!-- 게시판 List -->

<section class="ftco-section bg-light">
    <div class="container">

        <div class="modal-header">
            <div class="float-left">
                <a href="/board/list?kindOfBoard=${param.kindOfBoard}&sort=bno">
                    <button class="btn btn-primary" type="button">최신순</button>
                </a> &nbsp;
                <a href="/board/list?kindOfBoard=${param.kindOfBoard}&sort=bnoAsc">
                    <button class="btn btn-primary" type="button">오래된순</button>
                </a> &nbsp;
                <a href="/board/list?kindOfBoard=${param.kindOfBoard}&sort=viewCount">
                    <button class="btn btn-primary" type="button">조회순</button>
                </a> &nbsp;
            </div>
        </div> &nbsp; &nbsp;


        <br class="inner-main-body p-2 p-sm-3 collapse forum-content show">

        <!-- 목록 출력 -->

        <c:forEach var="board" items="${readBoardForm.title}">
            <div class="card mb-2">
                <div class="card-body p-2 p-sm-3">
                    <div class="media forum-item">

                        <!-- 글 번호 -->

                        <div class="media-body">
                            <small><i class="far fa-eye"></i>글번호 ${board.getBNumber()}</small>

                            <!-- 제목 -->

                            <div class="text-secondary">
                                <c:if test="${param.kindOfBoard eq '자유'}">
                                    <a href="/board/detail?kindOfBoard=${param.kindOfBoard}&bNumber=${board.getBNumber()}"
                                       class="text-body" style="font-size: 1.3em;">${board.title} []</a>
                                </c:if>
                                <c:if test="${param.kindOfBoard eq '문의'}">
                                    <c:choose>
                                        <c:when test="${authUser.grade ne '관리자' and authUser.getMNumber() ne board.getMNumber() and board.checkPublic eq 'N'}">
                                            <a class="text-body" style="font-size: 1.3em;">${board.title}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/board/detail?kindOfBoard=${param.kindOfBoard}&bNumber=${board.getBNumber()}"
                                               class="text-body" style="font-size: 1.3em;">${board.title}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </div>

                            <!-- 작성자, 작성 날짜 -->

                            <div class="text-muted">
                                <small><a href="javascript:void(0)">by ${board.name}</a><span>
									<i class="far fa-comment ml-2"></i>
									</span>date ${board.wrTime} </small>
                            </div>

                        </div>

                        <!-- list 공개 / 비공개 -->

                        <div class="text-muted small text-center align-self-center">
                            <c:if test="${param.kindOfBoard eq '자유'}"></c:if>
                            <c:if test="${param.kindOfBoard eq '문의'}">
                                <c:if test="${board.checkPublic eq 'Y'}">
                                    <span><i class="far fa-comment ml-2"></i></span>
                                    <a class="text-body" style="font-size: 1.3em;">공개</a>
                                </c:if>
                                <c:if test="${board.checkPublic eq 'N'}">
                                    <span><i class="far fa-comment ml-2"></i></span>
                                    <a class="text-body" style="font-size: 1.3em;">비공개</a>
                                </c:if>
                            </c:if>

                            <div>
                                조회수 : ${board.viewCount}
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- 글쓰기 버튼  -->
        </br>
        <span class="modal-footer">
				<button type="button" class="btn btn-primary"
                        onclick="location.href='/board/auth/write?kindOfBoard=${param.kindOfBoard}'">글쓰기</button>
			</span>

        <!-- 페이징 처리 -->

        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul>
                        <c:if test="${readBoardForm.hasBoard()}">
                            <li>
                                <c:if test="${readBoardForm.startPage > 5}">
                                    <a href="/board/list?kindOfBoard=${param.kindOfBoard}&pbNumber=${readBoardForm.startPage - 5}&sort=${param.sort}">&lt;</a>
                                </c:if>
                            </li>
                            <li>
                                <c:forEach var="pbNum" begin="${readBoardForm.startPage}"
                                           end="${readBoardForm.endPage}">
                                    <c:if test="${readBoardForm.currentPage == pbNum}">
                            <li class="active">
                                <a href="/board/list?kindOfBoard=${param.kindOfBoard}&pbNumber=${pbNum}&sort=${param.sort}">${pbNum}</a>
                            </li>
                        </c:if>
                        <c:if test="${readBoardForm.currentPage != pbNum}">
                            <li>
                                <a href="/board/list?kindOfBoard=${param.kindOfBoard}&pbNumber=${pbNum}&sort=${param.sort}">${pbNum}</a>
                            </li>
                        </c:if>
                        </c:forEach>
                        </li>
                        <li>
                            <c:if test="${readBoardForm.endPage < readBoardForm.totalPages}">
                                <a href="/board/list?kindOfBoard=${param.kindOfBoard}&pbNumber=${readBoardForm.startPage + 5}&sort=${param.sort}">&gt;</a>
                            </c:if>
                        </li>
                        </c:if>
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