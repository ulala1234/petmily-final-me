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

<section class="hero-wrap hero-wrap-2" style="background-image: url(/resources/petsitting-master/images/bg_2.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs mb-2">
                    <span class="mr-2"><span>Abandoned Animal<i class="ion-ios-arrow-forward"></i></span></span>
                </p>
                <h1 class="mb-0 bread">유기동물 조회</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">


        <div class="modal-header">

            <!-- 검색 바 -->
            <form action="/abandoned_animal/list" method="get">
                <div class="form-group row">

                    <div class="col">
                        <select name="species" class="form-control">
                            <option value="allSpecies" selected>모든 동물</option>
                            <option value="개">강아지</option>
                            <option value="고양이">고양이</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>

                    <div class="col">
                        <select name="gender" class="form-control">
                            <option value="allGender" selected>모든 성별</option>
                            <option value="-">모름</option>
                            <option value="M">수컷</option>
                            <option value="F">암컷</option>
                        </select>
                    </div>

                    <div class="col">
                        <select name="animalState" class="form-control">
                            <option value="allAnimalState" selected>모든 상태</option>
                            <option value="보호">보호중</option>
                            <option value="임보">임시 보호중</option>
                        </select>
                    </div>

                    <div class="col">
                        <input type="text" name="keyword" class="form-control" placeholder="검색어">
                    </div>

                    <div class="col">
                        <input type="submit" class="btn btn-primary" value="검색">
                    </div>

                </div>
            </form>
        </div>
        <br>



        <div class="row">
            <c:forEach var="abandonedAnimal" items="${abandonedAnimals.content}">
                <div class="col-md-6 col-lg-3 ftco-animate"
                     onclick="location.href='/abandoned_animal/detail?abNumber=${abandonedAnimal.abNumber}'">
                    <div class="staff">
                        <div class="img-wrap d-flex align-items-stretch">
                            <div class="img align-self-stretch"
                                 style="background-image: url(/admin/upload?filename=${abandonedAnimal.imgPath});"></div>
                        </div>

                        <div class="text pt-3 px-3 pb-4 text-center">
                            <h3>${abandonedAnimal.name}</h3>
                            <span class="position mb-2">${abandonedAnimal.location}</span>
                            <div class="faded">
                                <p>${abandonedAnimal.admissionDate}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul>
                        <li>
                            <c:if test="${abandonedAnimals.startPage > 5}">
                                <a href="${pageContext.request.contextPath}/abandoned_animal/list?pageNo=${abandonedAnimals.startPage - 5}">&lt;</a>
                            </c:if>
                        </li>
                        <c:forEach var="pNo" begin="${abandonedAnimals.startPage}" end="${abandonedAnimals.endPage}">
                            <c:if test="${abandonedAnimals.currentPage == pNo}">
                                <li class="active">
                                    <a href="${pageContext.request.contextPath}/abandoned_animal/list?pageNo=${pNo}">${pNo}</a>
                                </li>
                            </c:if>
                            <c:if test="${abandonedAnimals.currentPage != pNo}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/abandoned_animal/list?pageNo=${pNo}">${pNo}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <li>
                            <c:if test="${abandonedAnimals.endPage < abandonedAnimals.totalPages}">
                                <a href="${pageContext.request.contextPath}/abandonedAnimals/list?pageNo=${abandonedAnimals.startPage + 5}">&gt;</a>
                            </c:if>
                        </li>
                    </ul>
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