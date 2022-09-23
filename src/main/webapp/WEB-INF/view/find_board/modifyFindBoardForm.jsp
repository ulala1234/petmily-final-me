<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Petmily-Don't buy, Do Adopt</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<%@ include file="/WEB-INF/view/include/header.jspf" %>

<section class="hero-wrap hero-wrap-2"
         style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs mb-2"><span>Find Animal Board - Modify<i class="ion-ios-arrow-forward"></i></span>
                </p>
                <h1 class="mb-0 bread">반려동물 찾아요 - 글 수정하기</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="inner-wrapper">
            <div class="inner-main1">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="contact">
                            <form class="form" name="enq" method="post"
                                  action="${pageContext.request.contextPath}/findBoard/auth/modify?faNumber=${findMod.faNumber}"
                                  enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="title" id="threadTitle"
                                                   placeholder="제목을 입력해주세요" autofocus="" required="required"
                                                   value="${findMod.title}"/>
                                        </div>

                                        <hr color="#6c757d" width="100%">

                                        <div><label for="speciesInput">종:</label><br>
                                            <div class="form-check form-check-inline">
                                                <c:choose>
                                                    <c:when test="${findMod.species == '개'}">
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="개" checked/>개<span>&emsp;</span>
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="고양이"/>고양이<span>&emsp;</span>
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="기타"/>기타<span>&emsp;</span>
                                                    </c:when>
                                                    <c:when test="${findMod.species == '고양이'}">
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="개"/>개<span>&emsp;</span>
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="고양이" checked/>고양이<span>&emsp;</span>
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="기타"/>기타<span>&emsp;</span>
                                                    </c:when>
                                                    <c:when test="${findMod.species == '기타'}">
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="개"/>개<span>&emsp;</span>
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="고양이"/>고양이<span>&emsp;</span>
                                                        <input type="radio" class="form-check-input" name="species"
                                                               id="speciesInput" value="기타" checked/>기타
                                                    </c:when>
                                                </c:choose></div>
                                            <div class="write-input">
                                                <label for="kindInput">품종:</label><input type="text"
                                                                                         class="form-control"
                                                                                         name="kind" id="kindInput"
                                                                                         value="${findMod.kind}"
                                                                                         required="required"/>
                                                <label for="locationInput">실종 장소:</label><input type="text"
                                                                                                class="form-control"
                                                                                                name="location"
                                                                                                id="locationInput"
                                                                                                value="${findMod.location}"
                                                                                                required="required"/>
                                            </div>
                                        </div>

                                        <hr color="#6c757d" width="100%">
                                        <textarea rows="20" class="form-control" name="content" id="content"
                                                  placeholder=" 내용을 입력해주세요"
                                                  required="required">${findMod.content}</textarea>

                                        <div class="custom-file form-control-sm mt-3"
                                             style="max-width: 300px;">
                                            <input type="file" name="imgPath" id="file" accept="image/*">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-light" onclick="history.back()">취소</button>
                                    <button type="submit" class="btn btn-primary">수정</button>
                                </div>
                            </form>
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
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"></circle>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"></circle>
    </svg>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
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
<script src="/resources/petsitting-master/js/google-map.js"></script>
<script src="/resources/petsitting-master/js/main.js"></script>

</html>