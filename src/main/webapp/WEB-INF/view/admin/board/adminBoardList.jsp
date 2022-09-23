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
  <link rel="stylesheet" href="/css/bootstrap.css">
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
          <h1 class="mb-0 bread">게시판 관리</h1>
      </div>
    </div>
  </div>
</section>

<!-- 게시판 List -->

<section class="ftco-section bg-light">
  <div class="container">
    <div>
      <input type="radio" id="free" name="kind" value="free" onclick="selectKind(this.value)"
      <c:if test="${param.kindOfBoard == '자유'}">
             checked
      </c:if>>
      <label for="free">자유 게시판 관리</label>
      &nbsp;&nbsp;&nbsp;
      <input type="radio" id="inquiry" name="kind" value="inquiry" onclick="selectKind(this.value)"
      <c:if test="${param.kindOfBoard == '문의'}">
             checked
      </c:if>>
      <label for="inquiry">문의 게시판 관리</label>
      &nbsp;&nbsp;&nbsp;
      <input type="radio" id="review" name="kind" value="review" onclick="selectKind(this.value)"
      <c:if test="${param.kindOfBoard == '입양후기'}">
             checked
      </c:if>>
      <label for="review">입양 후기 게시판 관리</label>
      &nbsp;&nbsp;&nbsp;
      <input type="radio" id="find" name="kind" value="find" onclick="selectKind(this.value)"
      <c:if test="${param.kindOfBoard == 'find'}">
             checked
      </c:if>>
      <label for="find">반려 동물 찾아요 게시판 관리</label>
      &nbsp;&nbsp;&nbsp;
      <input type="radio" id="look" name="kind" value="look" onclick="selectKind(this.value)"
      <c:if test="${param.kindOfBoard == 'look'}">
             checked
      </c:if>> <label for="look">유기 동물 봤어요 게시판 관리</label>
    </div>
    <br/>
    <div class="inner-main-body p-2 p-sm-3 collapse forum-content show">
      <!-- 목록 출력 -->
      <div class="row align-items-start">
        <div class="col-lg-12">

          <div>
            <input type="button" id="write" class="btn btn-primary" value="글 등록" style="float: right" onclick="location.href='/admin/board/write?kindOfBoard=${param.kindOfBoard}'">
          </div>

          <table class="table table-hover bg-white">

            <thead>
            <tr class="table table-border">
              <th>글번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>관리 버튼</th>
            </tr>
            </thead>
            <c:forEach var="board" items="${boardForm}">
              <tbody>

              <tr>
                <td class="col-md-1">${board.pk}</td>
                <td class="col-md-3">
                  ${board.title}
                </td>
                <td class="col-md-2">${board.name}</td>
                <td class="col-md-2">${board.wrTime}</td>
                <td class="col-md-2">
                  <input type="button" id="modify" class="btn btn-primary" value="수정" onclick="location.href='/admin/board/modify?kindOfBoard=${param.kindOfBoard}&pk=${board.pk}'">
                  <input type="button" id="delete" class="btn btn-primary" value="삭제" onclick="location.href='/admin/board/delete?kindOfBoard=${param.kindOfBoard}&pk=${board.pk}'">
                </td>
              </tr>

              </tbody>
            </c:forEach>
          </table>
        </div>
      </div>
    </div>
  </div>

</section>
<!-- 게시판 List 끝 -->

<script>
  function selectKind(kind) {
    if(kind == "free") {
      window.location.href = "/admin/board?kindOfBoard=자유";
    } else if(kind == "inquiry") {
      window.location.href = "/admin/board?kindOfBoard=문의";
    } else if(kind == "review") {
      window.location.href = "/admin/board?kindOfBoard=입양후기";
    } else if(kind == "find") {
      window.location.href = "/admin/board?kindOfBoard=find";
    } else if(kind == "look"){
      window.location.href = "/admin/board?kindOfBoard=look";
    }
  }
</script>
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