<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<meta name="naver-site-verification" content="5d6f842aaac8250df35d9b3407e3c5af1c88f86c" /><!-- https://aws.bluelegend.net -->
<meta name="naver-site-verification" content="1a74d1addf445d0c79b100d93505120017091df9" /><!-- https://www.bluelegend.net -->
<meta name="naver-site-verification" content="a2cccb992db787a9703dbbb67b11cf1a53a8893a" /><!-- https://bluelegend.net -->
<meta name="title" content="방방곡곡 - 여행 지도, 계획, 볼꺼리, 먹꺼리, 잘꺼리">
<meta name="description" content="●여행 정보 사이트 방방곡곡 ●목적지를 몰라도 갈곳을 쉽게 찾고, 여형계획을 세울 수 있는 여행추천 여행지도 방방곡곡 ●어디 갈까? 고민 끝">
<title>여행지도 방방곡곡</title>
<meta property="og:type" content="website"> 
<meta property="og:title" content="어디갈까 몰라도 떠난다, 여행지도 방방곡곡">
<meta property="og:description" content="●목적지를 몰라도 갈곳을 쉽게 찾고, 여형계획을 세울 수 있는 여행추천 여행지도 방방곡곡 ●어디 갈까? 고민 끝">
<meta property="og:image" content="https://www.bluelegend.net/resources/banner/bolgguri_sample.jpg">
<meta property="og:url" content="https://www.bluelegend.net">
<meta id="description" name="description" content="●목적지를 몰라도 갈곳을 쉽게 찾고, 여형계획을 세울 수 있는 여행추천 여행지도 방방곡곡 ●어디 갈까? 고민 끝"/>
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="어디갈까 몰라도 떠난다, 여행지도 방방곡곡">
<meta name="twitter:description" content="●여행 정보 사이트 방방곡곡 ●목적지를 몰라도 갈곳을 쉽게 찾고, 여형계획을 세울 수 있는 여행추천 여행지도 방방곡곡 ●어디 갈까? 고민 끝">
<meta name="twitter:image" content="https://www.bluelegend.net/resources/banner/bolgguri_sample.jpg">
<meta name="twitter:domain" content="방방곡곡">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap')
	;

* {
	margin: 0;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
}

img {
	display: block;
}

ul, li {
	padding: 0;
	list-style: none;
	margin: 0;
}

/*컨텐츠 section*/
.content_zone {
	width: 100%;
	display: flex;
	justify-content: center;
}

.content_zone1 {
	margin-top: 6rem;
}

.content_zone1 .content_zone_wrap {
	width: 100%;
	max-width: 57rem;
	display: flex;
	justify-content: center;
}

.content_zone1 .content_menu {
	width: 100%;
	max-width: 45rem;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.content_zone1 .menu_item {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.content_zone1 .menu_container {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.content_zone1 .menu_container a {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	text-decoration: none;
	/* 추가: 링크 밑줄 제거 */
}

.content_zone1 .menu_container img {
	width: 50px;
}

.content_zone1 .menu_container p {
	font-size: 14px;
	color: black;
	margin-top: 0.5rem;
	/* 이미지와 텍스트 사이 간격 조정 */
}

/*검색존*/
.content_zone2 {
	margin-top: 2rem;
}

.content_zone2 .content_zone_wrap {
	width: 100%;
	max-width: 57rem;
	display: flex;
	justify-content: center;
	/* flex-direction: column; */
}

.content_zone2 .content_zone_wrap .search_box {
	width: 100%;
	max-width: 45rem;
	position: relative;
}

.content_zone2 .content_zone_wrap .search_container {
	width: 100%;
	max-width: 45rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.content_zone2 .content_zone_wrap .search_box input {
	border-radius: 10px;
	border: 2px solid #007bff;
	padding: 15px 10px;
	width: 100%;
	max-width: 1000px;
	font-size: 16px;
	box-sizing : border-box;
}

.content_zone2 .content_zone_wrap .search_box .search_img {
	position: absolute;
	top: 30%;
	right: 5%;
	color: #007bff;
}
.search_img{
	background: none;
  border: none;
  padding: 0;
  margin: 0;
  cursor: pointer;
}

/*이미지 슬라이드 존*/
.content_zone3 {
	margin-top: 2rem;
}

.content_zone3 .content_zone_wrap {
	width: 100%;
	max-width: 57rem;
	display: flex;
	justify-content: center;
}

.content_zone3 .content_zone_wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.content_zone3 .content_zone_wrap .image_slide_container {
	width: 100%;
	max-width: 1000px;
	border-radius: 30px;
	position: relative;
	overflow: hidden;
}

.content_zone3 .content_zone_wrap .image_slide_container .slide {
	display: none;
	width: 100%;
}

.content_zone3 .content_zone_wrap .image_slide_container .slide img {
	width: 100%;
	height: auto;
}

/* 섹션 4 */
.content_zone4 {
	margin-top: 2rem;
}

.content_zone4 .content_zone_wrap {
	width: 100%;
	max-width: 57rem;
	display: flex;
	justify-content: center;
}

.content_zone4 .image_slide_container {
	width: 100%;
	max-width: 1000px;
	overflow: hidden;
	/* overflow: hidden 추가 */
	position: relative;
}

.content_zone4 .content_zone_wrap .image_slide_container .image_slide_title
	{
	margin-bottom: 20px;
}

.content_zone4 .content_zone_wrap .image_slide_container .image_slide_title h2
	{
	color: #007bff;
	font-weight: 500;
	font-size: 20px;
}

.content_zone4 .image_slide_container .image_wrapper {
	border-radius: 30px;
	margin-bottom : 10px;
	overflow: hidden;
}

.content_zone4 .slide_group {
	display: flex;
	transition: transform 0.5s ease;
}

.content_zone4 .slide_item {
	min-width: calc(33.33%);
	/* Adjust for margin */
	box-sizing: border-box;
	margin-right: 60px;
	/* Add margin-right for spacing */
}

.content_zone4 .slide_item a {color:#007bff;}

.content_zone4 .slide_item a span {

    border: 1px solid #007bff;
    border-radius: 10px;
    padding: 0px 15px;
    box-sizing: border-box;

}

.content_zone4 .slide_item img {
	width: 100%;
	max-width: 300px;
	height: 200px;
}

.content_zone4 .slide_item h2 {
	font-size: 20px;
	color: black;
	font-weight: 500;
	margin-top: 0.5rem;
	text-align: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.content_zone4 .slide_item p {
	font-size: 14px;
	color: black;
	margin-top: 0.5rem;
	text-align: left;
}

/* 섹션 5 */
.content_zone5 {
	margin-top: 2rem;
	margin-bottom: 10px;
}
.content_zone6 {
	margin-top: 0rem;
	margin-bottom: 0px;
}

.content_zone5 .content_zone_wrap {
	width: 100%;
	max-width: 57rem;
	display: flex;
	justify-content: center;
}

.content_zone5 .image_slide_container {
	width: 100%;
	max-width: 1000px;
	overflow: hidden;
	/* overflow: hidden 추가 */
	position: relative;
}

.content_zone5 .content_zone_wrap .image_slide_container .image_slide_title
	{
	margin-bottom: 20px;
}

.content_zone5 .content_zone_wrap .image_slide_container .image_slide_title h2
	{
	color: #007bff;
	font-weight: 500;
	font-size: 20px;
}

.content_zone5 .image_slide_container .image_wrapper {
	border-radius: 30px;
	margin-bottom : 10px;
	overflow: hidden;
}

.content_zone5 .slide_group {
	display: flex;
	transition: transform 0.5s ease;
}

.content_zone5 .slide_item {
	min-width: calc(33.33%);
	/* Adjust for margin */
	box-sizing: border-box;
	margin-right: 60px;
	/* Add margin-right for spacing */
}

.content_zone5 .slide_item a {color:#007bff;}

.content_zone5 .slide_item a span {

    border: 1px solid #007bff;
    border-radius: 10px;
    padding: 0px 15px;
    box-sizing: border-box;

}

.content_zone5 .slide_item img {
	width: 100%;
	max-width: 300px;
	height: 200px;
}

.content_zone5 .slide_item h2 {
	font-size: 20px;
	color: black;
	font-weight: 500;
	margin-top: 0.5rem;
	text-align: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.content_zone5 .slide_item p {
	font-size: 14px;
	color: black;
	margin-top: 0.5rem;
	text-align: left;
}

/**/
.content_zone6 {
	margin-top: 2rem;/*50px;*/
}

.content_zone6 .content_zone_wrap {
	width: 100%;
	max-width: 900px;
}

.content_zone6 .content_menu {
	width: 100%;
}

.content_zone6 .content_zone_wrap .local_title {
	margin-bottom: 20px;
}

.content_zone6 .content_zone_wrap .local_title h1 {
	color: #007bff;
	font-weight: 500;
	font-size: 20px;
}

.content_zone6 .content_menu .content_container {
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.content_zone6 .content_menu .content_container .maps_bg {
	width: 100%;
	max-width: 400px;
	height: 600px;
	background-image: url(${pageContext.request.contextPath}/resources/img/maps.png);
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	transition: background-image 0.5s ease-in-out;
}

.content_zone6 .content_menu .content_container .maps_bg ul {
	width: 100%;
	height: 100%;
	position: relative;
}

.content_zone6 .content_menu .content_container .maps_bg ul li {
	position: absolute;
}

.content_zone6 .content_menu .content_container .maps_bg ul li a {
	color: white;
	transition: all 0.4s ease;
}

.content_zone6 .content_menu .content_container .maps_bg ul li a:hover {
/* 	border-radius: 10px;
	padding: 5px 20px;
	background-color: white;
	color: #007bff; */
	
	font-size: 20px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_39 {
	
	background-color : #007bff;
	border-radius: 10px;
	padding: 5px 20px;
	
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_39:hover {
	
	
	background-color : #003366;
	
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_1 { /* 서울 */
	top: 110px;
	left: 120px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_2 { /* 인천 */
	top: 102px;
	left: 83px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_6 { /* 부산 */
	bottom: 155px;
	right: 70px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_7 { /* 울산 */
	bottom: 195px;
	right: 50px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_3 { /* 대전 */
	top: 280px;
	left: 130px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_4 { /* 대구 */
	bottom: 230px;
	right: 110px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_5 { /* 광주 */
	bottom: 160px;
	left: 70px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_8 { /* 세종 */
	top: 240px;
	left: 110px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_31 { /* 경기도 */
	top: 150px;
	left: 120px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_32 { /* 강원도 */
	top: 100px;
	right: 120px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_33 { /* 충북 */
	top: 200px;
	left: 180px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_34 { /* 충남 */
	top: 230px;
	left: 70px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_37 { /* 전북 */
	bottom: 240px;
	left: 100px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_38 { /* 전남 */
	bottom: 140px;
	left: 110px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_35 { /* 경북 */
	bottom: 310px;
	right: 80px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_36 { /* 경남 */
	bottom: 180px;
	right: 140px;
}

.content_zone6 .content_menu .content_container .maps_bg ul .areaCode_39 { /* 39 */
	bottom: 8px;
	left: 30px;
}

.content_zone6 .content_menu .content_container .maps_menu {
	width: 100%;
	flex: 0.7;
}

.content_zone6 .content_menu .content_container .maps_menu h1 {
	text-align: center;
	font-weight: 500;
	font-size: 18px;
	margin-bottom: 20px;
}

.content_zone6 .content_menu .content_container .maps_menu ul {
	display: flex;

	margin-bottom: 15px;
}

.content_zone6 .content_menu .content_container .maps_menu .recommend_ai
	{
	width: 100%;
	height: 200px;
	position: relative;
	border-radius: 10px;
	overflow: hidden;
    margin-top: 30px;
	
}

.content_zone6 .content_menu .content_container .maps_menu .recommend_ai a
	{
	color: white;
	font-weight: bold;
	font-size: 24px;
}

.content_zone6 .content_menu .content_container .maps_menu .recommend_ai img
	{
	width: 100%;
}

.content_zone6 .content_menu .content_container .maps_menu .recommend_ai p
	{
	position: absolute;
	top: 25%;
	left: 5%;
}

.content_zone6 .content_menu .content_container .maps_menu li {
	width: 100%;
	max-width: 100px;
	border-radius: 10px;
	border: 1px solid #007bff;
	transition: all 0.4s ease;
	margin-right: 15px;
}

.content_zone6 .content_menu .content_container .maps_menu li:hover {
	background-color: #007bff;
}

.content_zone6 .content_menu .content_container .maps_menu li:hover a {
	color: white;
}

.content_zone6 .content_menu .content_container .maps_menu li a {
	display: block;
	width: 100%;
	color: #007bff;
	text-align: center;
	font-weight: 500;
	box-sizing: border-box;
	padding: 10px 20px; /* li 태그의 패딩을 a 태그로 이동 */
	transition: all 0.4s ease;
}
.visitor_info {
    display: flex;
    /* flex-direction: row; */  /* 세로로 나열되도록 설정 */
    margin-top: 0px;  /* 필요에 따라 간격 추가 */
    justify-content: right;
   /*  justify-content: center;
    align-items: center;
    font-size: 14px;
    color: #333;
    margin-top: 10px; */
}

.visitor_info span {
    margin-right: 20px;
    font-size: 16px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(document).ready(function() {
    // 이미지 URL 설정
    var imageUrls = {
        'areaCode_1': '${pageContext.request.contextPath}/resources/img/map_seoul.png', // 서울
        'areaCode_2': '${pageContext.request.contextPath}/resources/img/map_incheon.png', // 인천
        'areaCode_3': '${pageContext.request.contextPath}/resources/img/map_deajeon.png', // 대전
        'areaCode_4': '${pageContext.request.contextPath}/resources/img/map_daegu.png', // 대구
        'areaCode_5': '${pageContext.request.contextPath}/resources/img/map_gwangju.png', // 광주
        'areaCode_6': '${pageContext.request.contextPath}/resources/img/map_busan.png', // 부산
        'areaCode_7': '${pageContext.request.contextPath}/resources/img/map_ulsan.png', // 울산
        'areaCode_8': '${pageContext.request.contextPath}/resources/img/map_sejong.png', // 세종
        'areaCode_31': '${pageContext.request.contextPath}/resources/img/map_gyeonggi.png', // 경기도
        'areaCode_32': '${pageContext.request.contextPath}/resources/img/map_gangwondo.png', // 강원도
        'areaCode_33': '${pageContext.request.contextPath}/resources/img/map_chungcheongbukdo.png', // 충북
        'areaCode_34': '${pageContext.request.contextPath}/resources/img/map_chungcheongnamdo.png', // 충남
        'areaCode_35': '${pageContext.request.contextPath}/resources/img/map_gyeongsangbukdo.png', // 경북
        'areaCode_36': '${pageContext.request.contextPath}/resources/img/map_gyeongsangnamdo.png', // 경남
        'areaCode_37': '${pageContext.request.contextPath}/resources/img/map_Jeollabukdo.png', // 전북
        'areaCode_38': '${pageContext.request.contextPath}/resources/img/map_Jeollanamdo.png', // 전남
        'areaCode_39': '${pageContext.request.contextPath}/resources/img/map_jeju.png' // 제주
    };

    // 이미지 URL 배열 생성
    var urls = Object.values(imageUrls);

    // 프리로딩 이미지 함수
    function preloadImages(urls) {
	    urls.forEach(function(url) {
	        var img = new Image();
	        img.src = url;
	        // 이미지를 DOM에 추가하여 브라우저가 강제로 로드하게 만듭니다.
	        document.body.appendChild(img);
	        img.style.display = 'none'; // 숨깁니다.
	    });
	}

    // 이미지 프리로딩
    preloadImages(urls);

    // 각 areaCode에 대해 hover 이벤트 처리
    $('[class^=areaCode_]').hover(function() {
        var className = $(this).attr('class').split(' ')[0]; // 첫 번째 클래스를 가져옵니다
        var imageUrl = imageUrls[className];
        $('.maps_bg').css('background-image', 'url(' + imageUrl + ')');
    }, function() {
        // 기본 배경 이미지로 복원
        $('.maps_bg').css('background-image', 'url(resources/img/maps.png)');
    });
	
});
	
	
	

	let slideIndex = 0;

	function showSlides() {
		let slides = document.getElementsByClassName("slide");
		for (let i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";
		setTimeout(showSlides, 2000); // Change image every 2 seconds
	};

	let slideIndex2 = 0; // 초기 인덱스

	function showSlides2() {
		let slides = document.querySelectorAll('.content_zone4 .slide_item');
		let slideGroup = document.querySelector('.content_zone4 .slide_group');
		let slideWidth = slides[0].offsetWidth + 60; // Adjusting for margin (20px added)

		// 현재 슬라이드를 표시
		slideGroup.style.transform = 'translateX('
				+ (-slideWidth * slideIndex2) + 'px)';

		// 슬라이드 인덱스 증가
		slideIndex2++;

		// 무한 루프를 위해 슬라이드 그룹이 원래 위치로 돌아오도록 설정
		if (slideIndex2 >= slides.length - 2) {
			slideIndex2 = 0; // 슬라이드를 처음으로 돌아감
		}

		// 슬라이드 전환 효과 적용
		slideGroup.style.transition = 'transform 0.5s ease';
		slideGroup.style.transform = 'translateX('
				+ (-slideWidth * slideIndex2) + 'px)';

		// 슬라이드 전환 주기 설정
		setTimeout(showSlides2, 3000); // Change slide every 3 seconds
	}

	let slideIndex3 = 0; // 초기 인덱스

	function showSlides3() {
		let slides = document.querySelectorAll('.content_zone5 .slide_item');
		let slideGroup = document.querySelector('.content_zone5 .slide_group');
		let slideWidth = slides[0].offsetWidth + 60; // Adjusting for margin (20px added)

		// 현재 슬라이드를 표시
		slideGroup.style.transform = 'translateX('
				+ (-slideWidth * slideIndex3) + 'px)';

		// 슬라이드 인덱스 증가
		slideIndex3++;

		// 무한 루프를 위해 슬라이드 그룹이 원래 위치로 돌아오도록 설정
		if (slideIndex3 >= slides.length - 2) {
			slideIndex3 = 0; // 슬라이드를 처음으로 돌아감
		}

		// 슬라이드 전환 효과 적용
		slideGroup.style.transition = 'transform 0.5s ease';
		slideGroup.style.transform = 'translateX('
				+ (-slideWidth * slideIndex3) + 'px)';

		// 슬라이드 전환 주기 설정
		setTimeout(showSlides3, 3000); // Change slide every 3 seconds
	}

	document.addEventListener("DOMContentLoaded", function() {
		showSlides();
		showSlides2();
		showSlides3();
	});
</script>
</head>


<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="content_zone content_zone1">
		<div class="content_zone_wrap">
			<div class="content_menu">
				<div class="menu_item menu_item1">
					<div class="menu_container">
						<a href="/mw/bolgguriMain">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/view_icon.png" alt="볼거리">
							</div>
							<p>볼꺼리</p>
						</a>
					</div>
				</div>
				<div class="menu_item menu_item3">
					<div class="menu_container">
						<a href="/nearMukgguriApp">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/food_icon.png" alt="먹거리">
							</div>
							<p>먹꺼리</p>
						</a>
					</div>
				</div>
				<div class="menu_item menu_item4">
					<div class="menu_container">
						<a href="/nearJalgguriApp">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/hotel_icon.png" alt="숙박업">
							</div>
							<p>잘꺼리</p>
						</a>
					</div>
				</div>
				<div class="menu_item menu_item2">
					<div class="menu_container">
						<a href="javascript:void(0);"  onclick="alert('서비스 예정입니다.')">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/play_icon.png" alt="놀거리">
							</div>
							<p>놀꺼리</p>
						</a>
					</div>
				</div>
				<div class="menu_item menu_item5">
					<div class="menu_container">
						<a href="/sh/user/referenceAi">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/ai_icon2.png" alt="여행추천 AI">
							</div>
							<p>여행추천 AI</p>
						</a>
					</div>
				</div>
				<div class="menu_item menu_item6">
					<div class="menu_container">
						<a href="/kakao_car">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/car_icon.png" alt="여행추천 AI">
							</div>
							<p>경로 볼거리</p>
						</a>
					</div>
				</div>
				<div class="menu_item menu_item7">
					<div class="menu_container">
						<a href="/UNoticeBoard">
							<div class="menu_icon">
								<img src="${pageContext.request.contextPath}/resources/img/help_icon.png" alt="고객센터">
							</div>
							<p>고객센터</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content_zone content_zone2">	
		<div class="content_zone_wrap">		
			<div class="search_container">
				<form action="/mw/bolgguriMain" method="GET" class="search_box">
					<input type="text" name="keyword" placeholder="키워드를 입력해주세요.">
					<button class="search_img">
						<span class="material-symbols-outlined" > search </span>
					</button>
				</form>
			</div>
		</div>
	</section>

	<section class="content_zone content_zone6">

		<div class="content_zone_wrap">

			<div class="content_menu">

				<div class="local_title">
					<h1>지역별 여행 정보</h1>
				</div>
				<div class="content_container">
					<div class="maps_bg">
						<ul>
						<c:forEach var="mwBolgguriRegionDto" items="${mwBolgguriRegionDtos }" varStatus="status">
						    <li class="areaCode_${mwBolgguriRegionDto.areaCode }"><a href="/mw/bolgguriMain?areaCode=${mwBolgguriRegionDto.areaCode }">${mwBolgguriRegionDto.name }</a></li>
						</c:forEach>
						</ul>

					</div>
					<div class="maps_menu">
						<!-- <h2>가고 싶은 여행지 선택</h2> -->
						<c:forEach var="mwBolgguriRegionDto" items="${mwBolgguriRegionDtos }" varStatus="status">
							<c:if test="${status.first || (status.index % 3) == 0}">
						        <ul>
						    </c:if>
						    <li><a href="/mw/bolgguriMain?areaCode=${mwBolgguriRegionDto.areaCode }">${mwBolgguriRegionDto.name }</a></li>
						    <c:if test="${(status.index + 1) % 3 == 0 || status.last}">
						        </ul>
						    </c:if>
						</c:forEach>
						<div class="recommend_ai">
							<a href="/sh/user/referenceAi">
								 <img src="${pageContext.request.contextPath}/resources/img/robot_banner.png">
							</a>	
						</div>
						
					</div>
				</div>
			</div>

		</div>

		</div>
	</section>


	<section class="content_zone content_zone3">
		<div class="content_zone_wrap">
			<div class="image_slide_container">
				<div class="slide">
					<a href="/kakao_car"> <img src="${pageContext.request.contextPath}/resources/img/robot_banner3.png" alt="Slide 1">
					</a>
				</div>
				<div class="slide">
					<a href="/sh/user/referenceAi"> <img src="${pageContext.request.contextPath}/resources/img/robot_banner2.png" alt="Slide 2">
					</a>
				</div>
				<div class="slide">
					<a href="/nearBolgguri"> <img src="${pageContext.request.contextPath}/resources/img/robot_banner5.png" alt="Slide 3">
					</a>
				</div>
				<%-- <div class="slide">
					<a href="#"> <img src="${pageContext.request.contextPath}/resources/img/banner_img4.png" alt="Slide 4">
					</a>
				</div> --%>
			</div>
		</div>
	</section>

	<section class="content_zone content_zone4">
		<div class="content_zone_wrap">

			<div class="image_slide_container">
				<div class="image_slide_title">
					<h2>볼거리 TOP 10</h2>
				</div>
				<div class="slide_group">
					<c:forEach var="mwBolgguriDto" items="${mwBolgguriDtos }" varStatus="index">
						<div class="slide_item">
							<a href="/detail_view?bolgguri_id=${mwBolgguriDto.bolgguri_id }">
								<div class="image_wrapper">
									<!-- Added wrapper div -->
									<img src="${mwBolgguriDto.firstImage2}" alt="Item ${index.index + 1 }">
								</div>
								<span>${mwBolgguriDto.catTitle}</span>
								<h2>${mwBolgguriDto.title }</h2>
								<p>상품관련한 상세내용이 해당란에 입력됩니다. 상품관련한 상세내용이 해당란에 입력됩니다.</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>


	<section class="content_zone content_zone5">
		<div class="content_zone_wrap">

			<div class="image_slide_container">
				<div class="image_slide_title">
					<h2>즐길거리 TOP 10</h2>
				</div>
				<div class="slide_group">
					<c:forEach var="mwBolgguriDto2" items="${mwBolgguriDtos2 }" varStatus="index">
						<div class="slide_item">
							<a href="/detail_view?bolgguri_id=${mwBolgguriDto2.bolgguri_id }">
								<div class="image_wrapper">
									<!-- Added wrapper div -->
									<img src="${mwBolgguriDto2.firstImage2}" alt="Item ${index.index + 1 }">
								</div>
								<span>${mwBolgguriDto2.catTitle}</span>
								<h2>${mwBolgguriDto2.title }</h2>
								<p>상품관련한 상세내용이 해당란에 입력됩니다. 상품관련한 상세내용이 해당란에 입력됩니다.</p>
							</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</section>
	<section class="content_zone content_zone6">
		<div class="content_zone_wrap">
			<div class="visitor_info">
			  <span>방문자 수: 
			      <fmt:formatNumber value="${indexCnt}" type="number" pattern="#,###" />
			  </span>
			  <span>주변볼거리 방문: 
			      <fmt:formatNumber value="${nearBolgguriCnt}" type="number" pattern="#,###" />
			  </span>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/normal_footer.jsp"%>
	
	<%@ include file="/WEB-INF/views/include/sitemap.jsp"%>
	
	<%@ include file="/WEB-INF/views/include/quick_footer.jsp"%>

</body>
</html>