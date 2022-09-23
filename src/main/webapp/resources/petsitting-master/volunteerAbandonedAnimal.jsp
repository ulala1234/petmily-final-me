<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Petmily-Don't buy, Do Adopt</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Merriweather"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">

<link rel="stylesheet" href="/petsitting-master/css/animate.css">

<link rel="stylesheet"
	href="/petsitting-master/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/petsitting-master/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/petsitting-master/css/magnific-popup.css">


<link rel="stylesheet"
	href="/petsitting-master/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="/petsitting-master/css/jquery.timepicker.css">

<link rel="stylesheet" href="/petsitting-master/css/flaticon.css">
<link rel="stylesheet" href="/petsitting-master/css/style.css">

<style>
.checkboxlabel {
	display: flex;
	justify-content: space-between;
	text-align: justify;
}

.message {
	display: flex;
	justify-content: space-between;
}

textarea {
	width: 82%;
}

.radiobuttons {
	display: flex;
}

.survey {
	font-family: 'Raleway', sans-serif;
	margin-top: 25px;
}

h1 {
	font-weight: 400;
	font-family: 'Merriweather', serif
}

#description {
	font-family: 'Merriweather', serif
}

@media ( max-width :500px) {
	.checkboxlabel {
		display: block;
	}
}
</style>

</head>

<%@ include file="/WEB-INF/view/include/header.jspf"%>

<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<%--                <p class="breadcrumbs mb-2"><span class="mr-2">--%>
					<%--                    <a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Veterinarian <i class="ion-ios-arrow-forward"></i></span></p>--%>
					<h1 class="mb-0 bread">봉사 신청서</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- servey form -->
	<div class="container survey">
		<h1 id="title" class="text-center">봉사 신청서</h1>
		<p id="description" class="text-center">해당 유기동물 봉사 신청 폼입니다.</p>

		<form id="survey-form">
			<div class="form-row">
				<div class="col">
					<label id="name-label">유기동물 이름</label> <input id="name" type="name"
						class="form-control" placeholder="값 가져오기" required>
				</div>
				<div class="col">
					<label for="formGroupExampleInput">보호소명</label> <input
						id="last-name" type="name" class="form-control"
						placeholder="값 가져오기" required>
				</div>
				<div class="col">
					<label for="formGroupExampleInput">봉사활동 기간</label> <input
						id="last-name" type="name" class="form-control"
						placeholder="값 가져오기" required>
				</div>
				<div class="col">
					<label for="formGroupExampleInput">활동분야</label> <input
						id="last-name" type="name" class="form-control"
						placeholder="ex. 시설봉사 - 산책 및 유기견 케어" required>
				</div>

			</div>
			<br />
			<div class="form-row">
				<div class="col">
					<label for="formGroupExampleInput">봉사지역</label> <input
						id="last-name" type="name" class="form-control"
						placeholder="서울특별시 중랑구" required>
				</div>
				<div class="col">
					<label for="formGroupExampleInput">봉사장소</label> <input
						id="last-name" type="name" class="form-control"
						placeholder="서울 유기동물 입양센터" required>
				</div>
				<div class="col">
					<label for="formGroupExampleInput">봉사대상</label> <input
						id="last-name" type="name" class="form-control"
						placeholder="성인[대학생]" required>
				</div>
				<div class="col">
					<label for="formGroupExampleInput">필요인원</label> <input
						id="last-name" type="name" class="form-control" placeholder="3"
						required>
				</div>

			</div>

			<br />
			<div class="radiobuttons">
				<p>구분</p>
				<ul style="list-style: none;">
					<li class="radio"><input name="radio-buttons" value="3"
						type="radio" class="userRatings"><label>개인</label></li>
					<li class="radio"><input name="radio-buttons" value="3"
						type="radio" class="userRatings"><label>단체</label></li>
				</ul>
			</div>
			
			<div class="form-group">
				<label id="email-label">이름</label> <input id="email" type="email"
					class="form-control" aria-describedby="emailHelp"
					placeholder="성함을 입력해주세요." required> <small id="form-control"
					class="form-text text-muted">※ 자원봉사희망자 정보는 신청자와 관리센터만 볼 수 있습니다.</small>
			</div>
			
			<div class="form-group">
				<label id="number-label">나이</label> <input id="number" type="number"
					min="15" max="125" class="form-control" id="number"
					placeholder="나이를 입력해주세요." required><small id="form-control"
					class="form-text text-muted">※ 자원봉사희망자 정보는 신청자와 관리센터만 볼 수 있습니다.</small>
			</div>
			
			<div class="form-group">
				<label id="email-label">연락처</label> <input id="email"
					type="email" class="form-control" aria-describedby="emailHelp"
					placeholder="연락받으실 번호를 입력해주세요." required> <small id="form-control"
					class="form-text text-muted">※ 자원봉사희망자 정보는 신청자와 관리센터만 볼 수 있습니다.</small>
			</div>
			
			<div class="form-group">
				<label id="email-label">이메일</label> <input id="email"
					type="email" class="form-control" aria-describedby="emailHelp"
					placeholder="연락받으실 이메일 주소를 입력해주세요." required> <small id="emailHelp"
					class="form-text text-muted">※ 자원봉사희망자 정보는 신청자와 관리센터만 볼 수 있습니다.</small>
			</div>
			
			
			<br />
			<div>
				<button id="submit" type="submit" class="btn btn-secondary"
					style="float: center">봉사 신청하기</button>
			</div>
		</form>

		<br />
			<%-- <div class="form-group">
				<label for="exampleFormControlSelect2">Qualification</label> <select
					class="form-control" id="dropdown">
					<option>Primary Education</option>
					<option>Secondary Eduction</option>
					<option>Bachelors Degree</option>
					<option>Masters</option>
					<option>PHd</option>
				</select>
			</div>

			<div>
				<p>What would you like us to change?</p>
				<ul class="checkboxlabel">
					<li class="checkbox" style="list-style: none;"><label>
							<input name="prefer" value="1" type="checkbox"
							class="userRatings">Front-end Projects
					</label></li>
					<li class="checkbox" style="list-style: none;"><label>
							<input name="prefer" value="1" type="checkbox"
							class="userRatings">Back-end Projects
					</label></li>
					<li class="checkbox" style="list-style: none;"><label>
							<input name="prefer" value="1" type="checkbox"
							class="userRatings">Website Layout
					</label></li>
					<li class="checkbox" style="list-style: none;"><label>
							<input name="prefer" value="1" type="checkbox"
							class="userRatings">Easier challenges
					</label></li>
				</ul>
			</div>
			<div class="message">
				<p>Message to us</p>
				<textarea name="comment" id="comments" cols="30" rows="5"
					placeholder="What would you like to tell us?" optional></textarea>
			</div>
			<br />
			
</div> --%>
		
		
		<!-- servey form end -->

		<%@ include file="/WEB-INF/view/include/footer.jspf"%>

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>


		<script src="/petsitting-master/js/jquery.min.js"></script>
		<script src="/petsitting-master/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="/petsitting-master/js/popper.min.js"></script>
		<script src="/petsitting-master/js/bootstrap.min.js"></script>
		<script src="/petsitting-master/js/jquery.easing.1.3.js"></script>
		<script src="/petsitting-master/js/jquery.waypoints.min.js"></script>
		<script src="/petsitting-master/js/jquery.stellar.min.js"></script>
		<script src="/petsitting-master/js/jquery.animateNumber.min.js"></script>
		<script src="/petsitting-master/js/bootstrap-datepicker.js"></script>
		<script src="/petsitting-master/js/jquery.timepicker.min.js"></script>
		<script src="/petsitting-master/js/owl.carousel.min.js"></script>
		<script src="/petsitting-master/js/jquery.magnific-popup.min.js"></script>
		<script src="/petsitting-master/js/scrollax.min.js"></script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="/petsitting-master/js/google-map.js"></script>
		<script src="/petsitting-master/js/main.js"></script>
</body>
</html>