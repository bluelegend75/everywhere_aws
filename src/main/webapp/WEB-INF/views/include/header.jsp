<div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NNPW2C7X');</script>
<!-- End Google Tag Manager -->
<meta charset="UTF-8">
<!-- <title>여행지도 방방곡곡</title> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap" rel="stylesheet">
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

/* 전체 스크롤바의 너비와 높이 */
::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

/* 스크롤바의 트랙 (배경) */
::-webkit-scrollbar-track {
	background: #f1f1f1;
}

/* 스크롤바의 이동 가능한 부분 (Thumb) */
::-webkit-scrollbar-thumb {
	background: #007bff; /* 스크롤바 핸들 색상 */
	border-radius: 10px; /* 핸들 둥글게 */
}



/*해더*/
.header_gnb {
	width: 100%;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.header_gnb .header_wrap {
	width: 100%;
	max-width: 57rem;
	height: 3.5rem;
	padding: 10px 0;
	display: block;
	justify-content: center;
	align-items: center;
	position: fixed;
	background-color: white;
	z-index: 100;
}

.header_gnb .header_container {
	width: 100%;
	padding: 0 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header_container .logo_img a {display:flex; align-items: center; }


.header_container .logo_img img {
	width: 70px;
	
}

.header_container span {
	color: black;
}

.header_container .logo_img span {color: #007bff; 
    font-family: "Jua", sans-serif;
    font-size: 42px;
    font-weight: bold;
    padding-top: 10px;
}


.jump {
    display: inline-block;
    font-size: 2em; /* 텍스트 크기 조절 */
    position: relative;
}

.jumping {
    animation: jump 0.5s ease; /* 점프 애니메이션을 0.5초 동안 적용 */
}

@keyframes jump {
    0%, 100% {
        transform: translateY(0); /* 원래 위치 */
    }
    50% {
        transform: translateY(-20px); /* 위로 20px 이동 */
    }
}
/* .header_container .logo_img img {
	width: 210px;
} */



.header_container .menu_icon {
	cursor: pointer;
}

.header_container .login a {
	font-size: 14px;
}

/* 왼쪽 및 오른쪽 배너 기본 스타일 */
	.side_banner {
		position: fixed;
		top: 0;
		width: 250px; /* 배너 너비 조정 */
		height: 100%; /*100%; */
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		z-index: 0;  /* 10 */
	}
	
	.left_banner {
		left: 5px;
	}

	.right_banner {
		right: 5px;
	}

	.banner_item_header {
		width: 100%; /* 부모 너비에 맞게 설정 */
		height: auto;
		max-width: 250px; /* 이미지 최대 너비 */
    max-height: 500px; /* 이미지 최대 높이 */
		margin: 5px 0;
		background-color: #f2f2f2;
		display: flex;
		align-items: center;
		/* justify-content: center; */
		font-size: 14px;
		color: #333;
		border: 1px solid #ddd;
		overflow: hidden; /* 이미지를 박스 안에 맞추기 위해 오버플로우 숨김 */
	}
	.banner_item_header img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지 비율 유지하면서 박스에 맞춤 */
    display: block;
}
/* .visitor_info {
    display: flex;
    flex-direction: row;  /* 세로로 나열되도록 설정 */
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
} */
@media (max-width: 1300px) {
    .side_banner {
        position: fixed;
        bottom: 0;
        top: auto;
        width: 100%;
        height: auto;
        flex-direction: row;
        justify-content: center;
        padding: 0px 0;
        background-color: #fff; /* 배경색 추가 */
        border-top: 1px solid #ddd; /* 상단 경계선 추가 */
    }

    .banner_item_header {
        width: 30%;/*auto; *//* 배너가 고정 너비를 가지지 않도록 */
        height:280px;/*calc(200px*30% * 1.5); 200px;*/
        margin: 0 5px; /* 배너 간격 설정 */
        align-items: center;
    }
    .left_banner {
    	margin-top: 7rem;
    }

    .left_banner, .right_banner {
        position: static;
    }
    .banner_item_header span { 
    	word-wrap: break-word; 
    	white-space: normal; 
    	overflow-wrap: break-word; 
    	overflow: hidden; 
    	text-overflow: ellipsis;
    }
    .content_zone {
    	margin-top: 1rem;
    }
}

@media (max-width: 840px) {
    .banner_item_header {
        width: 30%;
        height:calc(30vw * 0.93);
    }
}
@media (max-width: 768px) {
    .side_banner {
        display: none;
    }
    .content_zone1 {
    	margin-top: 6rem;
    }
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" async></script>
<script>
function toggleSitemap() {
    const sitemap = document.getElementById('sitemap');
    sitemap.classList.toggle('active');
}

function closeSitemap() {
    const sitemap = document.getElementById('sitemap');
    sitemap.classList.remove('active');
}

$(document).ready(function() {
	let totalCnt = 0;//${totalCnt};
	console.log('totalCnt',totalCnt);
	//console.log('banners:',${banners});
	
    function randomJump() {
        $('.jump').each(function() {
            var $el = $(this);
            var delay = Math.floor(Math.random() * 1000); // 무작위로 지연 시간 생성 (0 ~ 1000ms)
            setTimeout(function() {
                $el.addClass('jumping');
                setTimeout(function() {
                    $el.removeClass('jumping');
                }, 500); // 0.5초 후 애니메이션 제거
            }, delay);
        });
    }

    setInterval(randomJump, 2000); // 2초마다 무작위 애니메이션 실행
});

</script>
</head>


<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NNPW2C7X"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
	<header class="header_gnb">
		<div class="header_wrap">
			<div class="header_container">
				<div class="menu_icon" onclick="toggleSitemap()">
					<span class="material-symbols-outlined">menu</span>
				</div>

				<div class="logo_img">
					<a href="/"> 
						<%-- <img src="${pageContext.request.contextPath}/resources/img/header_logo1.png" alt="logo"> --%>
						<img src="${pageContext.request.contextPath}/resources/img/earth_white_70w.gif">
						<span class="jump">방</span>
						<span class="jump">방</span>
						<span class="jump">곡</span>
						<span class="jump">곡</span>
					</a>
				</div>
				<div class="login">
					<a href=""> <span class="material-symbols-outlined">home</span></a>					
				</div>				
			</div>			
	    <!-- 추가된 부분: indexCnt와 nearBolgguriCnt 출력 -->
<%-- 			<div class="visitor_info">
            <span>방문자 수: 
                <fmt:formatNumber value="${indexCnt}" type="number" pattern="#,###" />
            </span>
            <span>주변볼거리 방문: 
                <fmt:formatNumber value="${nearBolgguriCnt}" type="number" pattern="#,###" />
            </span>
        </div> --%>
		</div>

	</header>
	
	<%@ include file="/WEB-INF/views/include/sitemap.jsp"%>
<!-- 왼쪽 배너 광고 -->
<!-- 	<div class="side_banner left_banner">
		<div class="banner_item_header">광고문의 <br>010-67057812</div>
		<div class="banner_item_header">광고 2</div>
		<div class="banner_item_header">광고 3</div>
		<div class="banner_item_header">광고 4</div>
		<div class="banner_item_header">광고 5</div>
	</div> -->

	<!-- 오른쪽 배너 광고 -->
<!-- 	<div class="side_banner right_banner">
		<div class="banner_item_header">광고 6</div>
		<div class="banner_item_header">광고 7</div>
		<div class="banner_item_header">광고 8</div>
		<div class="banner_item_header">광고 9</div>
		<div class="banner_item_header">광고 10</div>
	</div> -->

	<div class="side_banner left_banner">
	    <c:forEach var="leftBanners" items="${leftBanners}">
	        <div class="banner_item_header">
	            <a href="${leftBanners.linkUrl}" target="_blank">
	                <c:choose>
                    <c:when test="${not empty leftBanners.imageUrl}">
                        <img src="${leftBanners.imageUrl}" alt="광고 ${leftBanners.id}">
                    </c:when>
                    <c:otherwise>
                        <span>${leftBanners.content}</span>
                    </c:otherwise>
                </c:choose>
	            </a>
	        </div>
	    </c:forEach>
	</div>
	
	<div class="side_banner right_banner">
	    <c:forEach var="rightBanners" items="${rightBanners}">
	        <div class="banner_item_header">
	            <a href="${rightBanners.linkUrl}" target="_blank">
	                <c:choose>
                    <c:when test="${not empty rightBanners.imageUrl}">
                        <img src="${rightBanners.imageUrl}" alt="광고 ${rightBanners.id}">
                    </c:when>
                    <c:otherwise>
                        <span>${rightBanners.content}</span>
                    </c:otherwise>
                </c:choose>
	            </a>
	        </div>
	    </c:forEach>
	</div>
	
</body>
</html>
</div>