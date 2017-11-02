<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.Member" %>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 변경</title>
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
<h3>회원정보 변경</h3>
<form action="/pcm/controller?action=updateMemberSave" method="post">
<table border="1">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="memberId"
				value="${requestScope.dto.memberId}"
				readonly>
		</td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="memberPw"
				value="${requestScope.dto.memberPw}">
		</td>
		
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="memberName"
				value="${requestScope.dto.memberName}">
		</td>
	</tr>
	
	<tr>
		<th>연락처</th>
		<td>
			<input type="text" name="mobile"
				value="${requestScope.dto.mobile}">
		</td>
	</tr>

	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="email"
				value="${requestScope.dto.email}">
		</td>
	</tr>

	<!-- 일반/우수 회원 변경 불가 속성 : 관리자 변경 가능 속성 -->
	<tr>
		<th>가입일</th>
		<td>
			<input type="text" name="entryDate"
				value="${requestScope.dto.entryDate}">
	</tr>
	
	<tr>
		<th>등급</th>
		<td>
			<input type="text" name="grade"
				value="${requestScope.dto.grade}">
	</tr>
	
	<tr>
		<th>마일리지</th>
		<td>
			<input type="text" name="mileage"
				value="${requestScope.dto.mileage}">
	</tr>
	
	<tr>
		<th>담당자</th>
		<td>
			<input type="text" name="manager"
				value="${requestScope.dto.manager}">
	</tr>
	 
	<tr>
		<td colspan="2">
			<input type="submit" value="회원정보 변경 저장">
		</td>
	</tr>
	 
</table>
</form>


<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>