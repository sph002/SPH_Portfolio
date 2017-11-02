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
<title>회원관리</title>
<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">

</head>
<body>
<!-- header area -->
<!-- logo link -->
<a href="/pcm/index.jsp">
<img src="/pcm/img/logo.gif" title="홈페이지 이동">
</a>
<hr>

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
		<a href="/pcm/controller?action=logout">로그아웃</a>&nbsp;|&nbsp;
		<a href="/pcm/controller?action=myInfo">내정보조회</a>&nbsp;|&nbsp;
		<a href="changePassword.jsp">암호변경</a>&nbsp;|&nbsp;
		<a href="/pcm/controller?action=myInfoUpdate">내정보변경</a>&nbsp;|&nbsp;
		
		<!-- 관리자 메뉴 -->
		<c:if test="${sessionScope.grade == 'A'}">
			[관리자]
			<a href="/pcm/controller?action=getMemberAll">전체회원조회</a>
			<a href="/pcm/controller?action=noticeInput">공지관리</a>
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
<h3>상품 전체 정보</h3>
<table border="1">
	<!-- 제목행 -->
	<tr>
		<th>주문번호</th>
		<th>회원아이디</th>
		<th>상품명</th>
		<th>주문수량</th>
		<th>청구금액</th>
	</tr>
	
	<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
	<c:forEach var="dto" items="${requestScope.list}" >
		<tr>
			<td>${dto.orderNo}</td>
			<td>${dto.memberId}</td>
			<td>${dto.productName}</td>
			<td>${dto.productCount}</td>
			<td>${dto.price}</td>
		</tr>
	</c:forEach>
</table>


<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>