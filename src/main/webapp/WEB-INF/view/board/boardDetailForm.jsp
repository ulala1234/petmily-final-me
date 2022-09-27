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
<script src="https://twitter.github.io/typeahead.js/js/handlebars.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

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
                        <span class="mr-2"><span>Free Board - Detail<i class="ion-ios-arrow-forward"></i></span></span>
                    </p>
                    <h1 class="mb-0 bread">자유 게시판 - 상세보기</h1>
                </c:if>
                <c:if test="${param.kindOfBoard eq '문의'}">
                    <p class="breadcrumbs mb-2">
                        <span class="mr-2"><span>Inquiry Board - Detail<i
                                class="ion-ios-arrow-forward"></i></span></span>
                    </p>
                    <h1 class="mb-0 bread">문의 게시판 - 상세보기</h1>
                </c:if>
            </div>
        </div>
    </div>
</section>

<!-- content 상세보기 -->

<section class="ftco-section bg-light">
    <div class="container">

        <!-- content 내용 출력 -->

        <div class="card mb-2">
            <div class="card-body">
                <div class="media forum-item">

                    <!-- content title, name, wrTime, checkPublic -->

                    <div class="media-body ml-3">
                        <b> <span style="font-size: 2em;">${detailForm.title}</span> </b>
                        <h6 class="mt-1"></h6>
                        <small><a href="javascript:void(0)">${detailForm.name}</a></small>
                        <small><i class="far fa-comment ml-2"></i> date ${detailForm.wrTime} </small>
                        <small><i class="far fa-comment ml-2"></i> 조회수: ${detailForm.viewCount} </small>

                        <c:if test="${param.kindOfBoard eq '문의'}">
                            <c:if test="${detailForm.checkPublic eq 'Y'}">
                                <span><small><i class="far fa-comment ml-2"></i> 공개</small></span>
                            </c:if>
                            <c:if test="${detailForm.checkPublic eq 'N'}">
                                <span><small><i class="far fa-comment ml-2"></i> 비공개</small></span>
                            </c:if>
                        </c:if>

                        <div class="modal-footer"></div>

                        <!-- content 내용 -->

                        <div class="mt-3 font-size-lg">${detailForm.content}</div>
                        <h1 class="mt-1"></h1>

                        <div class="modal-header"></div>
                        <div class="modal-footer">

                            <!-- content 수정, 삭제 -->

                            <c:if test="${authUser.getMNumber() == detailForm.getMNumber()}">
                                <button type="button" class="btn btn-light"
                                        onclick="location.href='/board/auth/modify?kindOfBoard=${param.kindOfBoard}&bNumber=${detailForm.getBNumber()}'">
                                    수정
                                </button>

                                <button type="button" class="btn btn-light"
                                        onclick="if(confirm('정말로 삭제하시겠습니까?'))
                                                {return location.href='/board/auth/delete?kindOfBoard=${param.kindOfBoard}&bNumber=${detailForm.getBNumber()}';}">
                                    삭제
                                </button>
                            </c:if>

                            <!-- content 목록 이동 버튼 -->

                            <span>
								<button type="button" class="btn btn-primary"
                                    <c:if test="${authUser.grade == '일반'}">
                                        onclick="location.href='/board/list?kindOfBoard=${param.kindOfBoard}&sort=bno'"
                                    </c:if>
                                    <c:if test="${authUser.grade == '관리자'}">
                                        onclick="location.href='/admin/board?kindOfBoard=${param.kindOfBoard}'"
                                    </c:if>>목록으로</button>
							</span>

                            <!-- 댓글 작성하기 버튼 -->

                            <div class="media forum-item">
                                <button type="button" class="btn btn-primary" onclick="location.href='#message'">댓글 작성
                                </button>
                            </div>
                        </div>

                        <div id="replyListDiv" style="list-style: non">
                            <ul class="timeline">
                                <!-- timeline time label -->
                                <li class="time-label" id="repliesDiv" style="list-style-type: none">

                                </li>
                            </ul>
                        </div>

                        <!-- 댓글 작성 -->
                        <div class="card mb-2" id="message">
                            <div class="card-body">
                                <div class="col-md-8 col-lg-12">
                                    <div class="comment-wrapper">
                                        <div class="panel panel-info">
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label for="message">댓글</label>
                                                    <textarea name="reply" id="message1" cols="30" rows="3"
                                                              class="form-control"
                                                              placeholder="댓글을 작성해주세요."></textarea>
                                                </div>

                                                <div class="modal-footer">
                                                    <button id="replyAddBtn" class="btn btn-primary addBtn">
                                                        댓글 등록
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

<script id="template" type="text/x-handlebars-template">
    {{#each .}}
    <li class="replyLi" data-brNumber={{brNumber}} style="list-style-type: none">
        <div class="timeline-item">
            <div class="timeline-header"><strong>{{writer}}</strong> - {{wrTime}}</div>
            <h5 class="timeline-body">{{reply}}</h5>
            <div class="timeline-footer">
                {{#if sameWriter}}
                <button data-toggle="modal" data-target="#modifyModal" class="btn btn-light"> 수정 및 삭제</button>
                {{/if}}
            </div>
        </div>
    </li>
    {{/each}}
</script>

<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body" data-rno>
                <p><input type="text" id="reply" class="form-control"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
                <button type="button" class="btn btn-info" id="replyDelBtn">삭제</button>
            </div>
        </div>
    </div>
</div>

<script>
    var bNumber = ${detailForm.getBNumber()};
    var replyPage = 1;

    window.onload = function () {
        getPage("/replies/" + bNumber);
    }

    function getPage(pageInfo) {
        $.getJSON(pageInfo, function (data) {
            printData(data, $("#repliesDiv"), $('#template'));

            $("#modifyModal").modal('hide');
        });
    }

    var printData = function (replyArr, target, templateObject) {
        var template = Handlebars.compile(templateObject.html());
        var html = template(replyArr);
        $(".replyLi").remove();
        target.after(html);
    }

    //작성
    $("#replyAddBtn").on("click", function () {
        var mNumber = "${authUser.getMNumber()}";
        console.log(mNumber);
        var replytextObj = $("#message1");
        var reply = replytextObj.val();

        $.ajax({
            type: 'post',
            url: '/replies/' + bNumber,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            data: JSON.stringify({bNumber: bNumber, mNumber: mNumber, reply: reply}),
            success: function (result) {
                console.log("result: " + result);

                if (result == 'SUCCESS') {
                    replyPage = 1;
                    getPage("/replies/" + bNumber);
                    replytextObj.val("");
                }
            }
        });
    });

    //수정
    $("#replyModBtn").on("click", function () {
        var brNumber = $(".modal-title").html();
        var reply = $("#reply").val();

        console.log()

        $.ajax({
            type: 'patch',
            url: '/replies/' + bNumber,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "PATCH"
            },
            data: JSON.stringify({brNumber: brNumber, reply: reply}),
            dataType: 'text',
            success: function (result) {
                console.log("result: " + result);
                if (result == 'SUCCESS') {
                    alert("수정 되었습니다.");
                    getPage("/replies/" + bNumber);
                }
            }
        });
    });

    $(".timeline").on("click", ".replyLi", function (event) {
        var reply = $(this);

        $("#reply").val(reply.find('.timeline-body').text());
        $(".modal-title").html(reply.attr("data-brNumber"));
    });

    //삭제
    $("#replyDelBtn").on("click", function () {
        var brNumber = $(".modal-title").html();

        $.ajax({
            type: 'delete',
            url: '/replies/' + brNumber,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            dataType: 'text',
            success: function (result) {
                console.log("result: " + result);
                if (result == 'SUCCESS') {
                    alert("삭제 되었습니다.");
                    getPage("/replies/" + bNumber);
                }
            }
        });
    });
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