
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방방곡곡</title>
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

.content_zone .content_zone_wrap {
	width: 100%;
	height: calc(100vh - 170px);
	max-width: 57rem;
	display: flex;
	justify-content: center;
	margin-top: 90px;
	box-sizing: border-box;
	position: relative;
}

#map {
	width: 100%;
	height: 100%;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 300px; /* 수정된 너비 */
	height: 150px; /* 수정된 높이 */
	margin-left: -150px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 300px; /* 수정된 너비 */
	height: 150px; /* 수정된 높이 */
	border-radius: 5px;
	border: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
	display: flex; /* 플렉스를 사용해 내용 정렬 */
}

.info .img {
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	margin: 5px; /* 여백 추가 */
	overflow: hidden;
}

.info .desc {
	margin: 10px; /* 여백 추가 */
	flex-grow: 1; /* 남은 공간 차지 */
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
}

.info .link {
	color: #5085BB;
}

.content_zone .content_zone_wrap .list_btn {
	position: absolute;
	z-index: 50;
	top: 25px;
	left: 10px;
}

.content_zone .content_zone_wrap .list_btn a {
	color: white;
	background-color: #007bff;
	padding: 10px 20px;
	border-radius: 20px;
}

.content_zone .content_zone_wrap .map_list {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	max-width: 400px;
	height: 100%;
	background-color: white;
	z-index: 100;
	display: none;
}

.content_zone .content_zone_wrap .map_list.active {
	display: block;
	z-index: 150;
}

.content_zone .content_zone_wrap .close_btn {
	position: absolute;
	top: 26px;
	left: 20px;
	color: black;
	padding: 0;
	background: none;
	border: none;
	font-weight: 500;
	cursor: pointer;
}

.content_zone .content_zone_wrap .close_btn span {
	font-size: 28px;
}

.content_zone .content_zone_wrap .list_title {
	text-align: center;
	margin-top: 24px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 15px;
}

.content_zone .content_zone_wrap .list_sub {
	padding: 10px 20px;
	margin: 0px 20px;
	background-color: #007bff;
	border-radius: 20px;
	margin-bottom: 15px;
}

.content_zone .content_zone_wrap .list_sub h1 {
	font-size: 18px;
	font-weight: 500;
	color: white;
	margin-bottom: 10px;
}

.content_zone .content_zone_wrap .list_sub .tour_with {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.content_zone .content_zone_wrap .list_sub .tour_with .who {
	border-radius: 50%;
	background-color: white;
	padding: 10px 10px;
	margin-right: 20px;
	color: #007bff;
	font-size: 20px;
	font-weight: bold;
	width: 100px;
	height: 100px;
	display: flex;
	align-items: center;
	text-align: center;
	word-break: keep-all;
	justify-content: center;
}

.left_span {
	margin-right: 10px;
}

.content_zone .content_zone_wrap .list_sub .tour_with .tour_other {
	color: white;
}

.content_zone .content_zone_wrap .list_sub .tour_with .tour_other .tour_age
	{
	margin-bottom: 10px;
}

.content_zone .content_zone_wrap .list_sub .tour_with .tour_other .tag {
	margin-right: 10px;
	border: 1px solid white;
	padding: 5px 10px;
	border-radius: 20px;
}

.content_zone .content_zone_wrap .list_sub .tour_with .tour_other .list_tag
	{
	display: flex;
	margin-bottom: 5px;
}

.content_zone .content_zone_wrap .list_sub .tour_with .tour_other span {
	
}

.content_zone .content_zone_wrap .list_menu {
	margin: 0px 20px;
}
/* 탭 메뉴 스타일 */
.tab_menu {
	list-style: none;
	display: flex;
	justify-content: left;
	margin-bottom: 20px;
	padding: 0;
}

.tab_menu li {
	margin-right: 10px;
}

.tab_item {
	margin: 0;
}

.tab_btn {
	display: block;
	padding: 5px 20px;
	border: 1px solid #007bff;
	background-color: white;
	text-decoration: none;
	color: #007bff;
	cursor: pointer;
	border-radius: 20px;
	transition: 0.3s;
}

.tab_btn:hover {
	background-color: #007bff;
	color: white;
}

.tab_btn.active {
	background-color: #007bff;
	color: white;
}

.tap_list {
	overflow: hidden; /* 전체 탭 리스트에서 스크롤을 숨김 */
	height: 400px; /* 세로 방향 스크롤 허용 */
}
/* 스크롤바 스타일 */
.tap_list .tap_list_wrap {
	height: 100%; /* 전체 높이 설정 */
	overflow-y: auto; /* 스크롤을 여기에서 허용 */
}

/* 기본 스크롤바 스타일 */
.tap_list .tap_list_wrap::-webkit-scrollbar {
	width: 8px; /* 스크롤바의 너비 */
}

/* 스크롤바 배경 */
.tap_list .tap_list_wrap::-webkit-scrollbar-track {
	background: #f1f1f1; /* 스크롤바 트랙 배경색 */
}

/* 스크롤바 핸들 */
.tap_list .tap_list_wrap::-webkit-scrollbar-thumb {
	background: #007bff; /* 스크롤바 핸들 색상 */
	border-radius: 10px; /* 핸들 둥글게 */
}

/* 리스트 콘텐츠 스타일 */
.tap_list .tap_list_wrap {
	height: 100%; /* 전체 높이 설정 */
	overflow-y: auto; /* 스크롤을 여기에서 허용 */
}

.tap_list .tap_list_wrap .tour_list {
	display: none; /* 기본적으로 숨김 */
}

.tap_list .tap_list_wrap .tour_list .tour_list_day {
	font-family: "Black Han Sans", sans-serif;
}

.tap_list .tap_list_wrap .tour_list.active {
	display: block; /* 활성화된 리스트만 보이도록 */
}

.tour_list a {
	color: black; /* 링크 색상 */
	display: block; /* 전체 리스트 항목을 클릭 가능하게 설정 */
}

.tour_list  li {
	margin-bottom: 10px;
}

.tour_list .each_list {
	display: flex;
	width: 100%;
}

.tour_list .list_img {
	width: 50%;
	margin-right: 10px;
	overflow: hidden;
	border-radius: 20px;
	height: 150px; /* 높이 조정 */
    background-size: cover; /* 배경 이미지 크기 조정 */
    background-position: center; /* 배경 이미지 위치 조정 */
    background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
    
    background-image: url('${pageContext.request.contextPath}/resources/img/no_img.jpg'); /* 기본 이미지 */
}

.tour_list .each_list .list_img img {
	width: 100%;
	
}

.tour_list  .each_list .list_cont {
	width: 50%;
	padding: 0px 10px 0px 0px;
}

.tour_list  .tour_day {
	margin-bottom: 10px;
}
/* cont_title 스타일 */
.cont_title {
	font-size: 18px; /* 폰트 크기 */
	color: black; /* 텍스트 색상 */
	margin: 10px 0; /* 위 아래 여백 */
	/* 필수 설정 */
    display: -webkit-box;
    -webkit-line-clamp: 2; /* 표시할 줄 수 */
    -webkit-box-orient: vertical;
    overflow: hidden;

    /* 선택적 설정 */
    text-overflow: ellipsis; /* ...으로 표시 */
    white-space: normal; /* 기본 텍스트 흐름 */
	
}

.cont_tag {
	border: 1px solid #007bff !important;
	
	text-align: center;
	border-radius: 10px;
	color: #007bff;
	font-size: 14px;
}

/* cont_text 스타일 */
.cont_text {
	font-size: 14px; /* 폰트 크기 */
	color: #666; /* 텍스트 색상 */
	line-height: 1.5; /* 줄 간격 */
	margin-top: 5px; /* 위 여백 */
}


/* 상세 정보 스타일 */
.detail {
    position: absolute;
    bottom: 0px;
    right: 0px;
    width: 100%;
    max-width: 520px;
    height: 360px; /* 높이 조정 */
    background: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    display: none; /* 기본적으로 숨김 */
    overflow: auto;
    z-index: 200; /* 지도보다 위에 보이도록 설정 */
}

.detail_close_btn {
    text-align: right;
    padding: 5px 5px 0px 5px;
}

.detail_close_btn span {
    font-size: 24px;
    cursor: pointer;
}

#detail_content {
    padding: 0px 10px;
}

/* 닫기 버튼 */
.detail_close_btn:hover {
    color: #007bff;
}
</style>

<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoApiKey}&libraries=services"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	var map; // 지도 객체
    var markers = []; // 마커 배열
    var polylines = []; // 폴리라인 배열
    var allData = []; // 전체 데이터를 저장할 배열

    // 마커 색상 설정
    var markerColors = {
        "1일차": "#e76f8e",
        "2일차": "#5ab9a8",
        "3일차": "#b59fcf",
        "4일차": "orange"
    };

    // 이미지 로드 및 배경 설정
    $('.list_img').each(function() {
        var $this = $(this);
        var imageUrl = $this.data('image');
        var img = new Image();

        img.onload = function() {
            $this.css('background-image', 'url(' + imageUrl + ')');
        };

        img.onerror = function() {
            // 이미지 로드 실패 시 기본 이미지 유지
            $this.css('background-image', 'url(${pageContext.request.contextPath}/resources/img/no_img.jpg)');
        };

        img.src = imageUrl;
    });

    // 페이지 로드 시 map_list를 보이도록 설정
    $('#map_list').show();

    // 리스트 버튼 클릭 시 map_list를 보이도록 설정
    $('.list_btn').click(function() {
        $('#map_list').show();
    });

    // 닫기 버튼 클릭 시 map_list를 숨김
    $('.close_btn').click(function() {
        $('#map_list').hide();
    });

    // 닫기 버튼 클릭 시 detail을 숨김
    $('.detail_close_btn').click(function() {
        $('#detail').hide();
    });
    
 // 각 .item 요소 클릭 시 처리
    $('.tap_list').on('click', '.item', function() {
        // 현재 클릭한 아이템의 위치 정보 가져오기
        var mapX = $(this).data('map-x');
        var mapY = $(this).data('map-y');

        if (mapX && mapY) {
            // 위치 객체 생성
            var location = new kakao.maps.LatLng(mapY, mapX);

            // 지도 이동
            map.setCenter(location);
            map.setLevel(6); // 필요에 따라 줌 레벨 조정

            // 마커가 있으면 지도 중심으로 이동
            var marker = markers.find(marker => {
                var pos = marker.getPosition();
                return pos.getLat() === mapY && pos.getLng() === mapX;
            });

            if (marker) {
                marker.setMap(map);
            }
        } else {
            console.error('위치 데이터가 없습니다:', $(this));
        }
    });
    

    // 탭 메뉴 기능
    function showTabContent(target) {
        $('.tab_btn').removeClass('active');
        $('.tour_list').removeClass('active');
        $('.tab_btn[data-target="' + target + '"]').addClass('active');
        $('#' + target).addClass('active');
    }

    // 문자열 정규화 함수
    function normalizeString(str) {
        return str ? str.trim() : '';
    }

    // 지도 위의 모든 마커와 선을 제거
    function clearMap() {
        markers.forEach(function(marker) {
            marker.setMap(null);
        });
        polylines.forEach(function(polyline) {
            polyline.setMap(null);
        });
        markers = [];
        polylines = [];
    }

    function createCustomMarkerIcon(content) {
        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');
        canvas.width = 30;
        canvas.height = 30;

        ctx.fillStyle = content.color;
        ctx.beginPath();
        ctx.arc(15, 15, 15, 0, Math.PI * 2, false);
        ctx.fill();

        ctx.fillStyle = 'white';
        ctx.font = 'bold 14px Arial';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText(content.text, 15, 15);

        return canvas.toDataURL(); // 마커 아이콘 이미지 데이터 URL 반환
    }

    function updateMapMarkers(day) {
        if (!map) {
            console.error('지도 객체가 초기화되지 않았습니다.');
            return;
        }

        clearMap();

        var filteredData;
        var normalizedDay = normalizeString(day);

        // "day-all"이 선택된 경우, 모든 데이터 표시
        if (normalizedDay === 'day-all') {
            filteredData = allData; // 모든 데이터를 포함
        } else {
            filteredData = allData.filter(function(location) {
                var normalizedAssignDay = normalizeString(location.assign_day);
                return normalizedAssignDay === normalizedDay.replace('day-', '');
            });
        }

        if (filteredData.length > 0) {
            // 지도 중심을 첫 번째 위치로 설정
            var initialLocation = filteredData[0];
            if (initialLocation.mapX && initialLocation.mapY) {
                map.setCenter(new kakao.maps.LatLng(initialLocation.mapY, initialLocation.mapX));
            } else {
                console.error('위치 데이터에 mapX 또는 mapY가 없습니다:', initialLocation);
            }

            var pathsByDay = {}; // 일차별 경로를 저장할 객체

            // 모든 데이터를 순회하면서 각 일차별로 마커와 폴리라인을 생성
            filteredData.forEach(function(location, index) {
                if (location.mapX && location.mapY) {
                    var position = new kakao.maps.LatLng(location.mapY, location.mapX);
                    var dayKey = normalizeString(location.assign_day);
                    var dayMarkerColor = markerColors[dayKey] || 'black';

                    // 커스텀 마커 아이콘 생성
                    var markerImage = createCustomMarkerIcon({
                        color: dayMarkerColor,
                        text: (index + 1).toString()
                    });

                    var marker = new kakao.maps.Marker({
                        position: position,
                        image: new kakao.maps.MarkerImage(markerImage, new kakao.maps.Size(30, 30))
                    });

                    marker.setMap(map);
                    markers.push(marker); // 마커 배열에 추가

                    var contextPath = '${pageContext.request.contextPath}'; // 실제 context path로 교체
                    var defaultImage = contextPath + '/resources/img/no_img.jpg'; // 기본 이미지 URL

                    // location.firstImage2가 있으면 이를 사용하고, 없으면 defaultImage를 사용
                    var imageUrl = location.firstImage2 ? location.firstImage2 : defaultImage;

                    var detailHtml = '<div style="padding: 0px 10px;">' +
                                     '<div style="width:100%; height:200px; border-radius:20px; margin-bottom:10px; background-image: url(\'' + imageUrl + '\'); ' +
                                     'background-size: cover; ' +
                                     'background-position: center; ' +
                                     'background-repeat: no-repeat; ' +
                                     '"></div>' +
                                     '<h2 style="margin-bottom:5px;">' + (location.title || 'No Title') + '</h2>' +
                                     '<p style="margin-bottom:5px;">' + (location.addr1 || 'No Description') + '</p>' +
                                     '<a href="/detail_view?bolgguri_id=' + (location.bolgguri_id || 'undefined') + '" style="color: #007bff; display:block;  text-align:right;">상세 페이지로 이동</a>' +
                                     '</div>';

                    // kakao.maps.InfoWindow를 사용하여 마커 클릭 시 정보창 표시
                    var infowindow = new kakao.maps.InfoWindow({
                        content: detailHtml,
                        removable: true
                    });

                    kakao.maps.event.addListener(marker, 'click', function() {
                        console.log('Marker clicked:', location); // 콘솔 로그 추가
                        $('#detail_content').html(detailHtml);
                        $('#detail').show(); // detail을 보이도록 설정
                    });

                    // 각 일차별로 경로를 저장
                    if (!pathsByDay[dayKey]) pathsByDay[dayKey] = [];
                    pathsByDay[dayKey].push(position);

                } else {
                    console.error('Location data missing mapX or mapY:', location);
                }
            });

            // 각 일차별로 폴리라인을 추가
            Object.keys(pathsByDay).forEach(function(day) {
                var polyline = new kakao.maps.Polyline({
                    path: pathsByDay[day],
                    strokeWeight: 3,
                    strokeColor: markerColors[day] || 'black',
                    strokeOpacity: 0.8,
                    strokeStyle: 'solid'
                });

                polyline.setMap(map);
                polylines.push(polyline);
            });
        } else {
            console.error('위치 데이터가 없습니다.');
        }
    }

    $('.tab_btn').click(function() {
        var target = $(this).data('target');
        showTabContent(target);
        updateMapMarkers(target);

        // 지도 이동
        var filteredData;
        if (target === 'day-all') {
            filteredData = allData;
        } else {
            filteredData = allData.filter(function(location) {
                var normalizedAssignDay = normalizeString(location.assign_day);
                return normalizedAssignDay === target.replace('day-', '');
            });
        }

        if (filteredData.length > 0) {
            var firstLocation = filteredData[0];
            if (firstLocation.mapX && firstLocation.mapY) {
                map.setCenter(new kakao.maps.LatLng(firstLocation.mapY, firstLocation.mapX));
            }
        }
    });

    // URL 파라미터에서 choice_id 추출
    var urlParams = new URLSearchParams(window.location.search);
    var choice_id = urlParams.get('choice_id');

    if (choice_id) {
        var requestUrl = '/sh/user/getLocations?choice_id=' + encodeURIComponent(choice_id);
        $.ajax({
            url: requestUrl,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                allData = data;

                kakao.maps.load(function() {
                    var mapContainer = document.getElementById('map');
                    if (!mapContainer) {
                        console.error('지도 컨테이너를 찾을 수 없습니다.');
                        return;
                    }

                    var mapOption = {
                        center: new kakao.maps.LatLng(37.5665, 126.978), 
                        level: 12
                    };

                    map = new kakao.maps.Map(mapContainer, mapOption);

                    updateMapMarkers('day-all'); // 초기 로드시 "전체"를 표시
                });
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패:', status, error);
            }
        });
    } else {
        console.error('choice_id가 정의되지 않았습니다.');
    }
});
</script>

</head>


<body>


	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<section class="content_zone content_zone1">
		<div class="content_zone_wrap">
			<!-- 상세 정보 표시 영역 추가 -->
			<div class="detail" id="detail">
				<div class="detail_close_btn">
					<span class="material-symbols-outlined">close</span>
				</div>
				<div id="detail_content"></div>
			</div>
			<div id="map"></div>
			<div class="list_btn">
				<a href="javascript:void(0);">리스트 보기</a>
			</div>
			<div class="map_list" id="map_list">
				<button class="close_btn">
					<span class="material-symbols-outlined"> keyboard_backspace
					</span>
				</button>
				<div class="list_title">여행 추천 AI</div>
				<div class="list_sub">
					<c:forEach var="listEtc" items="${listEtc}">
						<h1>${listEtc.user_id}님을 위한 추천여행</h1>
					</c:forEach>
					<div class="sub_wrap">
						<div class="tour_with">
							<c:forEach var="listEtc" items="${listEtc}">
								<p class="who">${listEtc.goal_name}</p>
							</c:forEach>
							<div class="tour_other">
								<c:forEach var="listEtc" items="${listEtc}">
									<p>
										<span class="left_span">지역 :</span><span>${listEtc.region_name}</span>
									</p>
									<p class="stay">
										<span class="left_span">일정 :</span><span>${listEtc.period_name}</span>
									</p>
								</c:forEach>
								<div class="tour_age">
									<div class="tour_age_wrap">
										<p>연령대 :</p>
										<c:forEach var="listAge" items="${listAge}">
											<span class="age age1">${listAge}</span>
										</c:forEach>
									</div>
								</div>
								<c:forEach var="listTheme" items="${listTheme}" varStatus="loop">
									<!-- 새 줄을 시작하는 조건 (2개의 아이템마다) -->
									<c:if test="${loop.index % 2 == 0}">
										<div class="list_tag">
									</c:if>

									<div class="tag tag1">${listTheme}</div>

									<!-- 줄 바꿈을 종료하는 조건 (2개의 아이템마다, 마지막 아이템일 때) -->
									<c:if test="${loop.index % 2 == 1 or loop.last}">
							</div>
							<!-- closing list_tag -->
							</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
			<div class="list_menu">
				<ul class="tab_menu">
					<!-- 전체 탭 추가 -->
					<li class="tab_item"><a href="javascript:void(0);"
						class="tab_btn active" data-target="day-all">전체</a></li>
					<c:forEach var="day" items="${listDay}">
						<li class="tab_item"><a href="javascript:void(0);"
							class="tab_btn" data-target="day-${day}">${day}</a></li>
					</c:forEach>
				</ul>

				<div class="tap_list">
					<div class="tap_list_wrap">
						<!-- 전체 데이터 -->
						<div class="tour_list tour_list_day active" id="day-all">
							<ul>
								<!-- 각 날짜별로 상품을 그룹화하여 출력 -->
								<c:forEach var="day" items="${listDay}">
									<h2 class="tour_day">${day}</h2>
									<c:forEach var="product" items="${listProduct}">
										<c:if test="${product.assign_day == day}">
											<li class="item" data-map-x="${product.mapX}" data-map-y="${product.mapY}"><a href="javascript:void(0);">
													<div class="each_list">
														<div class="list_img"
															data-image="${product.firstImage2}"></div>
														<div class="list_cont">
															<p class="cont_tag">${product.theme}</p>
															<h1 class="cont_title">${product.title}</h1>
															<p class="cont_text">${product.addr1}</p>
															<input class="mapX" type="hidden" value="${product.mapX}">
															<input class="mapY" type="hidden" value="${product.mapY}">
															<input class="mLevel" type="hidden"
																value="${product.mLevel}">
														</div>
													</div>
											</a></li>
										</c:if>
									</c:forEach>
								</c:forEach>
							</ul>
						</div>

						<!-- 개별 일차 콘텐츠 -->
						<c:forEach var="day" items="${listDay}">
							<div class="tour_list tour_list_day" id="day-${day}">
								<h1 class="tour_day">${day}</h1>
								<ul>
									<c:forEach var="product" items="${listProduct}">
										<c:if test="${product.assign_day == day}">
											<li class="item" data-map-x="${product.mapX}" data-map-y="${product.mapY}"><a href="javascript:void(0);">
													<div class="each_list">
														<div class="list_img" data-image="${product.firstImage2}"></div>
														<div class="list_cont">
															<p class="cont_tag">${product.theme}</p>
															<h1 class="cont_title">${product.title}</h1>
															<p class="cont_text">${product.addr1}</p>
															<input class="mapX" type="hidden" value="${product.mapX}">
															<input class="mapY" type="hidden" value="${product.mapY}">
															<input class="mLevel" type="hidden"
																value="${product.mLevel}">
														</div>
													</div>
											</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
			
		</div>

	</section>



	<%@ include file="/WEB-INF/views/include/sitemap.jsp"%>

	<%@ include file="/WEB-INF/views/include/quick_footer.jsp"%>


</body>
</html>