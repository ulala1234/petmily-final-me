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

<div class="hero-wrap js-fullheight" style="background-image: url('/resources/petsitting-master/images/bg_1.jpg');"
     data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
             data-scrollax-parent="true">
            <div class="col-md-11 ftco-animate text-center">
                <h1 class="mb-4">사지 말고 입양하세요</h1>
                <p><a href="#about-us" class="btn btn-primary mr-md-4 py-3 px-4">수 많은 아이들이 당신을 기다리고 있습니다<span
                        class="ion-ios-arrow-forward"></span></a></p>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light ftco-no-pt ftco-intro">
    <div class="container">
        <div class="row">
            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                <div class="d-block services text-center">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="flaticon-blind"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">유기동물 조회</h3>
                        <p>가족을 찾고 계신가요? 수 많은 아이들이 당신의 가족이 되길 기다리고 있습니다. 아이들에게 희망의 손길을 내밀어 주세요.</p>
                        <a href="/abandoned_animal/list"
                           class="btn-custom d-flex align-items-center justify-content-center"><span
                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                <div class="d-block services text-center">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="flaticon-dog-eating"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">반려동물 찾아요</h3>
                        <p>소중한 가족을 잃어버리셨나요? 반려동물 찾아요 게시판에 정보를 등록해주세요. 당신의 가족을 찾기 위한 도움을 제공합니다.</p>
                        <a href="/findBoard/list"
                           class="btn-custom d-flex align-items-center justify-content-center"><span
                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                <div class="d-block services text-center">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="flaticon-grooming"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">자유 게시판</h3>
                        <p>자유롭게 소통해요!</p>
                        <a href="/board/list?kindOfBoard=자유&sort=bno"
                           class="btn-custom d-flex align-items-center justify-content-center"><span
                                class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                    </div>
                </div>
            </div>
        </div>
        <a name=about-us></a>
    </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb">

    <div class="container">
        <div class="row d-flex no-gutters">
            <div class="col-md-5 d-flex">
                <div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0"
                     style="background-image:url('/resources/petsitting-master/images/about-1.jpg');">
                </div>
            </div>
            <div class="col-md-7 pl-md-5 py-md-5">
                <div class="heading-section pt-md-5">
                    <h2 class="mb-4">반려동물, 이제는 누군가의 가족입니다.</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 services-2 w-100 d-flex">
                        <div class="icon d-flex align-items-center justify-content-center"><span
                                class="flaticon-stethoscope"></span></div>
                        <div class="text pl-3">
                            <h4>about us-1</h4>
                            <p>한 해에 수천마리의 동물이 유기되고 있습니다.</p>
                        </div>
                    </div>
                    <div class="col-md-6 services-2 w-100 d-flex">
                        <div class="icon d-flex align-items-center justify-content-center"><span
                                class="flaticon-customer-service"></span></div>
                        <div class="text pl-3">
                            <h4>about us-2</h4>
                            <p>사이트를 설계한 이유 목적</p>
                        </div>
                    </div>
                    <div class="col-md-6 services-2 w-100 d-flex">
                        <div class="icon d-flex align-items-center justify-content-center"><span
                                class="flaticon-emergency-call"></span></div>
                        <div class="text pl-3">
                            <h4>about us-3</h4>
                            <p>도움 요청</p>
                        </div>
                    </div>
                    <div class="col-md-6 services-2 w-100 d-flex">
                        <div class="icon d-flex align-items-center justify-content-center"><span
                                class="flaticon-veterinarian"></span></div>
                        <div class="text pl-3">
                            <h4>about us-4</h4>
                            <p>글글글</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-counter" id="section-counter">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                    <div class="text">
                        <strong class="number" data-number="214">0</strong>
                    </div>
                    <div class="text">
                        <span>오늘 구조된 동물</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                    <div class="text">
                        <strong class="number" data-number="16721">0</strong>
                    </div>
                    <div class="text">
                        <span>가족을 기다려요</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                    <div class="text">
                        <strong class="number" data-number="158">0</strong>
                    </div>
                    <div class="text">
                        <span>입양</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                    <div class="text">
                        <strong class="number" data-number="14">0</strong>
                    </div>
                    <div class="text">
                        <span>안락사</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light ftco-faqs">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 order-md-last">
                <div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0"
                     style="background-image:url('/resources/petsitting-master/images/about-4.jpg');">
                    <a href="https://vimeo.com/248735074"
                       class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
                        <span class="fa fa-play"></span>
                    </a>
                </div>
                <div class="d-flex mt-3">
                    <div class="img img-2 mr-md-2"
                         style="background-image:url('/resources/petsitting-master/images/about-5.jpg');"></div>
                    <div class="img img-2 ml-md-2"
                         style="background-image:url('/resources/petsitting-master/images/about-6.jpg');"></div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="heading-section mb-5 mt-5 mt-lg-0">
                    <h2 class="mb-3">자주 하는 질문 모음</h2>
                    <p>자주 하는 질문 모음입니다.</p>
                </div>
                <div id="accordion" class="myaccordion w-100" aria-multiselectable="true">
                    <div class="card">
                        <div class="card-header p-0" id="headingOne">
                            <h2 class="mb-0">
                                <button href="#collapseOne"
                                        class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                                        data-parent="#accordion" data-toggle="collapse" aria-expanded="true"
                                        aria-controls="collapseOne">
                                    <p class="mb-0">입양 절차는 어떻게 진행하게 되나요?</p>
                                    <i class="fa" aria-hidden="true"></i>
                                </button>
                            </h2>
                        </div>
                        <div class="collapse show" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
                            <div class="card-body py-3 px-0">
                                <ol>
                                    <li>입양신청서 작성 > 전화상담 및 방문면담 > 입양동의서 작성 후 입양 순으로 진행됩니다.
                                    </li>
                                    <li>입양 자격 심사 등 추가적인 조건이 생길 수 있습니다.</li>
                                    <li>입양 이후 지속해서 기관의 연락이 갈 수 있습니다.</li>

                                </ol>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header p-0" id="headingTwo" role="tab">
                            <h2 class="mb-0">
                                <button href="#collapseTwo"
                                        class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                                        data-parent="#accordion" data-toggle="collapse" aria-expanded="false"
                                        aria-controls="collapseTwo">
                                    <p class="mb-0">후원하던 보호소가 사라졌어요! 제가 후원하던 동물은 어떻게 되나요?</p>
                                    <i class="fa" aria-hidden="true"></i>
                                </button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="card-body py-3 px-0">
                                <ol>
                                    <li>해당 기관의 관리에 따라 다른 보호소로 이동된 뒤 다시 지원하게 됩니다.</li>
                                    <li>보호소가 이동되면 후원자님께 이전된 보호소 정보를 다시 전달드립니다.</li>
                                </ol>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header p-0" id="headingThree" role="tab">
                            <h2 class="mb-0">
                                <button href="#collapseThree"
                                        class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                                        data-parent="#accordion" data-toggle="collapse" aria-expanded="false"
                                        aria-controls="collapseThree">
                                    <p class="mb-0">반려동물 찾아요 게시판에 쓴 글은 언제 결과를 받아볼 수 있나요?</p>
                                    <i class="fa" aria-hidden="true"></i>
                                </button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapseThree" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="card-body py-3 px-0">
                                <ol>
                                    <li>반려동물 찾아요 게시판에 작성해 주신 내용을 바탕으로
                                        유기동물 봤어요 게시판과 실시간으로 매칭하여 그 결과를 마이페이지에 보여드리고 있습니다.</li>
                                    <li>마이페이지 -> 찾아요 매칭 결과 -> 작성한 글 중 '매칭됨' 상태 클릭 -> 매칭된 결과 확인 가능</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section testimony-section" style="background-image: url('/resources/petsitting-master/images/bg_2.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2>보호 기간이 얼마 남지 않은 아이들 </h2>
                <%-- 보호기간이 얼마 남지 않은 안락사 예정인 아이들이 노출됐으면 하는 페이지입니다.--%>
            </div>
        </div>
        <div class="row ftco-animate">
            <div class="col-md-12">
                <div class="carousel-testimony owl-carousel ftco-owl">
                    <div class="item">
                        <div class="testimony-wrap py-4">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fa fa-quote-left"></span></div>
                            <div class="text">
                                <p class="mb-4">얌전하고 잘 짖지 않는 강아지입니다. 사람의 손길을 그리워해서 쓰다듬어주는걸 좋아합니다.</p>
                                <div class="d-flex align-items-center">
                                    <div class="user-img"
                                         style="background-image: url('/resources/petsitting-master/images/abani-01.jpg')"></div>
                                    <div class="pl-3">
                                        <p class="name">바둑이(3년 추정)</p>
                                        <span class="position">강아지 - 비숑</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fa fa-quote-left"></span></div>
                            <div class="text">
                                <p class="mb-4">사람을 좋아하는 수다쟁이에 애교쟁이 고양이입니다. 비 오는 날 안양 동안구 하천 아래에서 발견되었습니다. </p>
                                <div class="d-flex align-items-center">
                                    <div class="user-img"
                                         style="background-image: url('/resources/petsitting-master/images/abani-02.jpg')"></div>
                                    <div class="pl-3">
                                        <p class="name">코코(6개월 추정)</p>
                                        <span class="position">고양이 - 코리안 숏헤어</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fa fa-quote-left"></span></div>
                            <div class="text">
                                <p class="mb-4">얌전하고 잘 짖지 않는 강아지입니다. 사람의 손길을 그리워해서 쓰다듬어주는걸 좋아합니다.</p>
                                <div class="d-flex align-items-center">
                                    <div class="user-img"
                                         style="background-image: url('/resources/petsitting-master/images/abani-03.jpg')"></div>
                                    <div class="pl-3">
                                        <p class="name">몽실이(5년 추정)</p>
                                        <span class="position">강아지 - 삽살견</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fa fa-quote-left"></span></div>
                            <div class="text">
                                <p class="mb-4">사람을 좋아하는 수다쟁이에 애교쟁이 고양이입니다. 비 오는 날 안양 동안구 하천 아래에서 발견되었습니다.</p>
                                <div class="d-flex align-items-center">
                                    <div class="user-img"
                                         style="background-image: url('/resources/petsitting-master/images/abani-04.jpg')"></div>
                                    <div class="pl-3">
                                        <p class="name">시루(1년 추정)</p>
                                        <span class="position">강아지 - 말티즈</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap py-4">
                            <div class="icon d-flex align-items-center justify-content-center"><span
                                    class="fa fa-quote-left"></span></div>
                            <div class="text">
                                <p class="mb-4">사람을 좋아하는 수다쟁이에 애교쟁이 고양이입니다. 비 오는 날 안양 동안구 하천 아래에서 발견되었습니다.</p>
                                <div class="d-flex align-items-center">
                                    <div class="user-img"
                                         style="background-image: url('/resources/petsitting-master/images/abani-05.jpg')"></div>
                                    <div class="pl-3">
                                        <p class="name">치즈(1년 추정)</p>
                                        <span class="position">고양이 - 코리안 숏헤어</span>
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

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2>오늘의 입양 후기</h2>
            </div>
        </div>
        <div class="row d-flex">
            <div class="col-md-4 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20 rounded"
                       style="background-image: url('/resources/petsitting-master/images/image_1.jpg');">
                    </a>
                    <div class="text p-4">
                        <div class="meta mb-2">
                            <div><a href="#">April 07, 2020</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                        </div>
                        <h3 class="heading"><a href="#">저희집 자랑이 된 몽실이를 소개합니다!</a></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20 rounded"
                       style="background-image: url('/resources/petsitting-master/images/gallery-12.jpg');">
                    </a>
                    <div class="text p-4">
                        <div class="meta mb-2">
                            <div><a href="#">April 07, 2020</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                        </div>
                        <h3 class="heading"><a href="#">사랑둥이 치치에요 이 아이가 가져다준 행복이 너무 큽니다</a></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.html" class="block-20 rounded"
                       style="background-image: url('/resources/petsitting-master/images/image_3.jpg');">
                    </a>
                    <div class="text p-4">
                        <div class="meta mb-2">
                            <div><a href="#">April 07, 2020</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                        </div>
                        <h3 class="heading"><a href="#">저희집 고양이가 세상에서 제일 귀여워요</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2>내새끼 자랑해요</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="work mb-4 img d-flex align-items-end"
                     style="background-image: url('/resources/petsitting-master/images/gallery-8.jpg');">
                    <a href="images/gallery-1.jpg"
                       class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="fa fa-expand"></span>
                    </a>
                    <div class="desc w-100 px-4">
                        <div class="text w-100 mb-3">
                            <span>말티즈</span>
                            <h2><a href="work-single.html">몽쉬리</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="work mb-4 img d-flex align-items-end"
                     style="background-image: url('/resources/petsitting-master/images/gallery-9.jpg');">
                    <a href="images/gallery-2.jpg"
                       class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="fa fa-expand"></span>
                    </a>
                    <div class="desc w-100 px-4">
                        <div class="text w-100 mb-3">
                            <span>말티즈</span>
                            <h2><a href="work-single.html">쉬리몽</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="work mb-4 img d-flex align-items-end"
                     style="background-image: url('/resources/petsitting-master/images/gallery-10.jpg');">
                    <a href="images/gallery-3.jpg"
                       class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="fa fa-expand"></span>
                    </a>
                    <div class="desc w-100 px-4">
                        <div class="text w-100 mb-3">
                            <span>강아지</span>
                            <h2><a href="work-single.html">몽실이</a></h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 ftco-animate">
                <div class="work mb-4 img d-flex align-items-end"
                     style="background-image: url('/resources/petsitting-master/images/gallery-11.jpg');">
                    <a href="images/gallery-4.jpg"
                       class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="fa fa-expand"></span>
                    </a>
                    <div class="desc w-100 px-4">
                        <div class="text w-100 mb-3">
                            <span>사실은대형견</span>
                            <h2><a href="work-single.html">시루</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="work mb-4 img d-flex align-items-end"
                     style="background-image: url('/resources/petsitting-master/images/gallery-12.jpg');">
                    <a href="images/gallery-5.jpg"
                       class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="fa fa-expand"></span>
                    </a>
                    <div class="desc w-100 px-4">
                        <div class="text w-100 mb-3">
                            <span>강아지</span>
                            <h2><a href="work-single.html">쉴몽</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="work mb-4 img d-flex align-items-end"
                     style="background-image: url('/resources/petsitting-master/images/gallery-13.jpg');">
                    <a href="images/gallery-6.jpg"
                       class="icon image-popup d-flex justify-content-center align-items-center">
                        <span class="fa fa-expand"></span>
                    </a>
                    <div class="desc w-100 px-4">
                        <div class="text w-100 mb-3">
                            <span>개</span>
                            <h2><a href="work-single.html">권몽실</a></h2>
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