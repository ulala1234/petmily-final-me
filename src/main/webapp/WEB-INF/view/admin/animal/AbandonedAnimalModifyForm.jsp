<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                <p class="breadcrumbs mb-2"><span>Find Animal Board - Write<i class="ion-ios-arrow-forward"></i></span>
                </p>
                <h1 class="mb-0 bread">유기동물 관리 - 글 수정하기</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-12">

                <!-- 폼 시작 -->

                <form class="form" name="enq" method="post" action="/admin/animal/abandoned/modify?abNumber=${modReq.abNumber}" enctype='multipart/form-data'>
                    <div class="modal-body">

                        <div class="row justify-content-start">
                            <div class="form-group col-md-6 col-lg-6">
                                <label for="name">이름:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" value="${modReq.name}" required="required"/>
                            </div>
                            <div class="form-group col-md-6 col-lg-6">
                                <label for="admissionDateInput">입소 날짜:</label>
                                <input type="date" class="form-control" name="admissionDate" id="admissionDateInput" required="required"/>
                            </div>
                        </div>

                        <hr color="#eee" width="100%">

                        <div class="form-group col-md-6 col-lg-6">
                            <label for="speciesInput">종:</label><br>
                            <div id="speciesInput" class="form-check form-check-inline">
                                <c:choose>
                                    <c:when test="${modReq.species == '개'}">
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput1" value="개" checked/>개<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput2" value="고양이"/>고양이<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput3" value="기타"/>기타
                                    </c:when>
                                    <c:when test="${modReq.species == '고양이'}">
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput1" value="개"/>개<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput2" value="고양이" checked/>고양이<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput3" value="기타"/>기타
                                    </c:when>
                                    <c:when test="${modReq.species == '기타'}">
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput1" value="개"/>개<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput2" value="고양이"/>고양이<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="species" id="speciesInput3" value="기타" checked/>기타
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="genderInput">성별:</label><br>
                            <div id="genderInput" class="form-check form-check-inline">
                                <c:choose>
                                    <c:when test="${fn:contains(modReq.gender, 'F')}">
                                        <input type="radio" class="form-check-input" name="gender" id="genderInput1" value="F" checked/>F<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="gender" id="sgenderInput2" value="M"/>M<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="gender" id="genderInput3" value="-"/>-
                                    </c:when>
                                    <c:when test="${fn:contains(modReq.gender, 'M')}">
                                        <input type="radio" class="form-check-input" name="gender" id="genderInput1" value="F"/>F<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="gender" id="sgenderInput2" value="M" checked/>M<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="gender" id="genderInput3" value="-"/>-
                                    </c:when>
                                    <c:when test="${fn:contains(modReq.gender, '-')}">
                                        <input type="radio" class="form-check-input" name="gender" id="genderInput1" value="F"/>F<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="gender" id="sgenderInput2" value="M"/>M<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="gender" id="genderInput3" value="-" checked/>-
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="animalState">상태:</label><br>
                            <div id="animalState" class="form-check form-check-inline">
                                <c:choose>
                                    <c:when test="${modReq.animalState == '입양'}">
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput1" value="입양" checked/>입양<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput2" value="임보"/>임시보호<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput3" value="보호"/>보호소<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput4" value="-"/>-
                                    </c:when>
                                    <c:when test="${modReq.animalState == '임보'}">
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput1" value="입양"/>입양<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput2" value="임보" checked/>임시보호<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput3" value="보호"/>보호소<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput4" value="-"/>-
                                    </c:when>
                                    <c:when test="${modReq.animalState == '보호'}">
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput1" value="입양"/>입양<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput2" value="임보"/>임시보호<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput3" value="보호" checked/>보호소<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput4" value="-"/>-
                                    </c:when>
                                    <c:when test="${modReq.animalState == '-'}">
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput1" value="입양"/>입양<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput2" value="임보"/>임시보호<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput3" value="보호"/>보호소<span>&emsp;</span>
                                        <input type="radio" class="form-check-input" name="animalState" id="animalStateInput4" value="-" checked/>-
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>

                        <hr color="#eee" width="100%">

                        <div class="row justify-content-start">
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="kindInput">품종:</label>
                                <input type="text" class="form-control" name="kind" id="kindInput" placeholder="모르는 경우 '모름' 작성" value="${modReq.kind}" required="required"/>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="ageInput">나이:</label>
                                <input type="text" class="form-control" name="age" id="ageInput" placeholder="숫자만 입력해주세요" value="${modReq.age}" required="required"/>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="weightInput">몸무게:</label>
                                <input type="text" class="form-control" name="weight" id="weightInput" placeholder="숫자만 입력해주세요" value="${modReq.weight}" required="required"/>
                            </div>
                        </div>

                        <hr color="#eee" width="100%">

                        <div class="row justify-content-between">
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="locationInput">발견 장소:</label>
                                <input type="text" class="form-control" name="location" id="locationInput" placeholder="모르는 경우 '모름' 작성" value="${modReq.location}" required="required"/>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="sNumberInput">보호중인 보호소:</label>
                                <select name="SNumber" class="form-control" id="dropdown">
                                    <option value="${modReq.SNumber}">현재 보호소: ${modReq.SNumber}</option>
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="uniquenessInput">특이사항:</label>
                                <input type="text" class="form-control" name="uniqueness" id="uniquenessInput" placeholder="특이사항" value="${modReq.uniqueness}" required="required"/>
                            </div>
                        </div>

                        <hr color="#eee" width="100%">

                        <textarea rows="5" class="form-control" name="description" id="description" placeholder=" 소개글" required="required">${modReq.description}</textarea>

                        <!-- 첨부파일 -->

                        <div class="custom-file form-control-sm mt-3" style="max-width: 300px;">
                            <input type="file" name="imgPath" id="file" accept="image/*">
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" onclick="history.back()">취소</button>
                            <button type="submit" class="btn btn-primary">수정 등록</button>
                        </div>
                    </div>
                </form>

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