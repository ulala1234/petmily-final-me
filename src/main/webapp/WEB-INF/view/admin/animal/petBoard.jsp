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
				<h1 class="mb-0 bread">반려동물 관리</h1>
			</div>
		</div>
	</div>
</section>

<!-- 게시판 List -->

<section class="ftco-section bg-light">
	<div class="container">
		<div class="inner-main-body p-2 p-sm-3 collapse forum-content show">

			<!-- 목록 출력 -->
<div class="row align-items-start">
    <div class="col-lg-12">
			<table class="table table-hover bg-white">

				<thead>
				<tr class="table table-border">
					<th>반려동물번호</th>
					<th>회원명</th>
					<th>이름</th>
					<th>종</th>
					<th>품종</th>
					<th>성별</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				</thead>
<c:forEach var="pet" items="${petPage.content}">
				<tbody>

					<tr>
						<td class="col-md-1">${pet.cpNumber}</td>
						<td class="col-md-2">${pet.userId}</td>
						<td class="col-md-2">${pet.name}</td>
						<td class="col-md-1">${pet.species}</td>
						<td class="col-md-2">${pet.kind}</td>
						<td class="col-md-1">${pet.gender}</td>
						<td class="col-md-1"><button type="button" data-cpnumber="${pet.cpNumber}" data-userid="${pet.userId}" data-name="${pet.name}" data-species="${pet.species}" data-kind="${pet.kind}" data-gender="${pet.gender}"  class="updateModalBtn btn btn-primary" data-toggle="modal" data-target="#updatePetModal" >수정</button></td>
						<td class="col-md-1"> <a class="btn btn-danger text-white" onclick="let b = confirm('삭제하시겠습니까?'); if(b){ location.href='/admin/animal/pet/delete/${pet.cpNumber}'}">삭제</a> </td>
					</tr>

				</tbody></c:forEach>
			</table>

</div>
</div>

			<!-- 글쓰기 버튼  -->

			<span class="modal-footer">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#savePetModal" >반려동물 등록</button>
			</span>

			<!-- 페이징 처리 -->

			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<li>
								<c:if test="${petPage.startPage > 5}">
									<a href="/admin/animal/pet?pageNum=${petPage.startPage - 5}">&lt;</a>
								</c:if>
							</li>
							<li>
								<c:forEach var="pbNum" begin="${petPage.startPage}" end="${petPage.endPage}">
									<c:if test="${petPage.currentPage == pbNum}">
							<li class="active">
								<a href="/admin/animal/pet?pageNum=${pbNum}">${pbNum}</a>
							</li>
							</c:if>
							<c:if test="${petPage.currentPage != pbNum}">
								<li>
									<a href="/admin/animal/pet?pageNum=${pbNum}">${pbNum}</a>
								</li>
							</c:if>
							</c:forEach>
							</li>
							<li>
								<c:if test="${petPage.endPage < petPage.totalPages}">
									<a href="/admin/animal/pet?pageNum=${petPage.startPage + 5}">&gt;</a>
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
<%--modal--%>
<div class="modal fade" id="savePetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" >반려동물 추가</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="savePetForm">
					<div class="form-group">
						<label for="1" class="col-form-label">회원아이디:</label>
						<input type="text" data-name="회원아이디" class="form-control" id="1" name="userId">
					</div>
					<div class="form-group">
						<label for="2" class="col-form-label">이름:</label>
						<input type="text" data-name="이름"  class="form-control" id="2" name="name">
					</div>
					<div class="form-group">
						<label for="3" class="col-form-label">종:</label>
						<input type="text"  data-name="종" class="form-control" id="3" name="species">
					</div>
					<div class="form-group">
						<label for="4" class="col-form-label">품종:</label>
						<input type="text" data-name="품종"  class="form-control" id="4" name="kind">
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="male1" name="gender" value="M" class="custom-control-input">
						<label class="custom-control-label" for="male1">수컷</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="female1" name="gender" value="F" class="custom-control-input">
						<label class="custom-control-label" for="female1">암컷</label>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="savePetBtn">저장</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="updatePetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">반려동물 수정</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="updatePetForm">
					<div class="form-group">
						<label for="cpNumber" class="col-form-label">반려동물 번호:</label>
						<input type="text" readonly class="form-control" id="cpNumber" name="cpNumber">
					</div>
					<div class="form-group">
						<label for="userId" class="col-form-label">회원아이디:</label>
						<input type="text" data-name="회원아이디"  class="form-control" id="userId" name="userId">
					</div>
					<div class="form-group">
						<label for="name" class="col-form-label">이름:</label>
						<input type="text"  data-name="이름" class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="species" class="col-form-label">종:</label>
						<input type="text"   data-name="종" class="form-control" id="species" name="species">
					</div>
					<div class="form-group">
						<label for="kind" class="col-form-label">품종:</label>
						<input type="text"  data-name="품종" class="form-control" id="kind" name="kind">
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="male" name="gender"  value="M" class="custom-control-input">
						<label class="custom-control-label" for="male">수컷</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="female" name="gender" value="F" class="custom-control-input">
						<label class="custom-control-label" for="female">암컷</label>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="updatePetBtn">수정</button>
			</div>
		</div>
	</div>
</div>

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
<script type="text/javascript">
	$(document).on('click', '#savePetBtn', function () {
		let inputs = $("#savePetForm input")
		if (validation(inputs)) {
			return;
		}
		let serialize = $("#savePetForm").serialize();
		$.ajax({
			url: "/admin/animal/pet",
			type: 'post',
			data: serialize,
			success: function (data) {
				if (data == "성공") {
					$("#savePetModal").modal("hide");
					location.reload();
				}
				alert(data);
			}
		});
	});

	$(document).on('click', '#updatePetBtn', function () {
		let inputs = $("#updatePetForm input")
		if (validation(inputs)) {
			return;
		}
		let serialize = $("#updatePetForm").serialize();
		$.ajax({
			url: "/admin/animal/pet/update",
			type: 'post',
			data: serialize,
			success: function (data) {
				if (data == "성공") {
					$("#savePetModal").modal("hide");
					location.reload();
				}
				alert(data);
			}
		});
	});

	$(document).on('click', '.updateModalBtn', function () {
		let name = $(this).data("name");
		let cpNumber =$(this).data("cpnumber");
		let userId =$(this).data("userid");
		let species =$(this).data("species");
		let gender =$(this).data("gender");
		let kind =$(this).data("kind");
		$("#name").val(name);
		$("#cpNumber").val(cpNumber);
		$("#userId").val(userId);
		$("#species").val(species);
		$("#kind").val(kind);
		if (gender == "M") {
			$("#male").attr("checked", "checked");
		} else {
			$("#female").attr("checked", "checked");
		}
	});

	function validation(inputs) {
		for (const input of inputs) {
			let val = $(input).val();
			if (val == '' || val == null) {
				alert($(input).data("name") + "은 비워둘수없습니다.");
				return true;
			}
		}
	}

</script>
</html>