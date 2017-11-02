<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.Member" %>
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
</c:if>

<!-- 로그인 후 메뉴 -->
<div class="menu_area" style="text-align:right;">
	<c:choose>
	<c:when test="${not empty sessionScope.memberId and 
		not empty sessionScope.grade}">
		${sessionScope.memberId}님[${sessionScope.grade}]&nbsp;
	</c:when>
	
	<c:when test="${empty sessionScope.memberId or 
		empty sessionScope.grade}">
		<c:set var="message" value="로그인/회원가입 후 사용하시기 바랍니다." />
		<jsp:forward page="/pcm/error.jsp" />
	</c:when>
	</c:choose>
</div>

<!-- content area -->
<h1>회원전체정보</h1>
<table border="1" class="table table-bordered table-striped nanum">

	<tr class="success">
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>가입일</th>
		<th>등급</th>
		<th>마일리지</th>
		<th>담당자</th>
		<th>탈퇴</th>
		<th>변경</th>
	</tr>
	
	<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
	<c:forEach var="dto" items="${requestScope.list}" >
		<tr class="info">
			<td>${dto.memberId}</td>
			<td>${dto.memberPw}</td>
			<td>${dto.memberName}</td>
			<td>${dto.gender}</td>
			<td>${dto.birthDate}</td>
			<td>${dto.email}</td>
			<td>${dto.mobile}</td>
			<td>${dto.address}</td>
			<td>${dto.entryDate}</td>
			<td>${dto.grade}</td>
			<td>${dto.mileage}</td>
			<td>
				<a href="/pcm/controller?action=deleteMember&memberId=${dto.memberId}">탈퇴</a>
			</td>
			<td>
				<a href="/pcm/controller?action=updateMember&memberId=${dto.memberId}">변경</a>
			</td>
		</tr>
	</c:forEach>
</table>

<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>