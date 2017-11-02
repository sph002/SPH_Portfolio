<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.*" %>
<%@ page import="java.util.ArrayList" %>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품관리</title>
<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="Resources/css/bootstrap.css">
<style>

body {
		background-image: url('/pcm/img/pcbackground7.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}
/* Full-width input fields */
h1, h3 {
	color: white
}
</style>
</head>
<body>

<!-- 메세지 출력  -->
<c:if test="${not empty requestScope.message}">
	<h3>Message : ${requestScope.message}</h3>
	<hr>
</c:if>

<!-- 로그인 후 메뉴 -->
<div class="menu_area" style="text-align:right;">
	<c:choose>
	<c:when test="${not empty sessionScope.memberId and 
		not empty sessionScope.grade}">
		${sessionScope.memberId}님[${sessionScope.grade}]&nbsp;
		<!-- 관리자 메뉴 -->
		<c:if test="${sessionScope.grade == 'A'}">
			[관리자]
		</c:if>
	</c:when>
	
	<c:when test="${empty sessionScope.memberId or 
		empty sessionScope.grade}">
		<c:set var="message" value="로그인/회원가입 후 사용하시기 바랍니다." />
		<jsp:forward page="/pcm/error.jsp" />
	</c:when>
	</c:choose>
</div>
<hr>

<!-- content area -->
<h1>상품 전체 정보</h1>
<a href="/pcm/pcontroller?action=getProductAll" class="btn btn-danger btn-lg">전체상품조회</a>&nbsp;
<a href="/pcm/pcontroller?action=getCategoryAll&category=라면" class="btn btn-danger btn-lg">라면상품조회</a>&nbsp;
<a href="/pcm/pcontroller?action=getCategoryAll&category=빵류" class="btn btn-danger btn-lg">빵류상품조회</a>&nbsp;
<a href="/pcm/pcontroller?action=getCategoryAll&category=음료" class="btn btn-danger btn-lg">음료상품조회</a>&nbsp;
<table border="1" class="table table-bordered table-striped nanum">
	<!-- 제목행 -->
	<tr class="success">
		<th>상품명</th>
		<th>재고량</th>
		<th>구매가격</th>
		<th>판매가격</th>
		<th>분류</th>
	</tr>
	
	<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
	<c:forEach var="dto" items="${requestScope.list}" >
		<tr class="info">
			<td>${dto.productName}</td>
			<td>${dto.stock}</td>
			<td>${dto.priceBuy}</td>
			<td>${dto.priceSell}</td>
			<td>${dto.category}</td>
		</tr>
	</c:forEach>
</table>

<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>