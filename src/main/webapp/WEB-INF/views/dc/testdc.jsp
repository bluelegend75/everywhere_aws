<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  ok...
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	<hr>
	<a href="/MwController/selectAll">selectAll</a><br>
	<a href="/upload">Image upload</a><br>
	<a href="/image?id=1">Image view</a><br>
	<hr>
	<a href="/locations">Location</a><br>
	<a href="/testPage">testArray</a><br>
	<a href="/map">map</a><br>
	<a href="/nearBolgguri">주변 볼꺼리 찾기</a><br>
	<a href="/kakao_car">네비게이션 주변 볼꺼리 찾기</a><br>
	<a href="/nearMukgguri">주변 먹꺼리 찾기</a><br>
	<br>
	<a href="/bolgguri">볼꺼리 데이타(file) </a><br>
	<a href="/bolgguri2">볼꺼리 데이타(Proxy) </a><br>
	<a href="/jalgguri">잘꺼리 데이타(file)</a><br>
	<a href="/mukgguri">먹꺼리 데이타(file)</a><br>
	<a href="/cat_code">카테고리 코드(cat_code)</a><br>
	<a href="/area_code">지역코드(area_code)</a><br>
	<a href="/intro12">컨텐츠 소개정보12(content id별) </a><br>
	<a href="/intro14">컨텐츠 소개정보14(content id별) </a><br>
	<a href="/contentImage">컨텐츠 이미지(content id별 이미지 경로) </a><br>
	<a href="/api_common">공통정보(content id별) </a><br>
	<a href="/api_disable">무장애정보(content id별) </a><br>
	<a href="/nearKeyword">주변 키워드 검색</a><br>
	<a href="/personInfoPolicy">개인정보처리방침</a><br>
	
	<h1>App</h1>
	<a href="/nearBolgguriApp">App 볼꺼리</a><br>
	<a href="/nearMukgguriApp">App 먹꺼리</a><br>
	<a href="/nearJalgguriApp">App 잘꺼리</a><br>	
	<a href="/nearKeywordApp">App 키워드</a><br>	
	<a href="/kakao_carApp">App 경로</a><br>	
	<a href="/personInfoPolicyApp">App 개인정보처리방침</a><br>
	
	<br>
</body>
</html>