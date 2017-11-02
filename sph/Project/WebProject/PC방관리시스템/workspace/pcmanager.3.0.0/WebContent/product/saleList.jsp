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
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
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
<h3>매출 조회</h3>
<a href="/pcm/pcontroller?action=getSale"><h1>전체매출조회</h1></a>&nbsp;&nbsp;&nbsp;
<form action="/pcm/pcontroller?action=getSaleDaily" method="post">
	<input type="date" name="day" min="1990-01-01" max="2100-12-31">&nbsp;
	<input type="submit" class="btn btn-warning btn-lg" value="일별매출조회" >
</form>

<table>
	<tr>
		<td>
			<table border="1" class="table table-bordered table-striped nanum">
				<!-- 제목행 -->
				<tr class="success">
					<th><h1>사용시간</h1></th>
					<th><h1>이용요금</h1></th>
				</tr>
				
				<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
				<c:forEach var="dto" items="${requestScope.list2}" >
					<tr class="info">
						<td>${dto.useTime}</td>
						<td>${dto.cost}</td>
					</tr>
					
				</c:forEach>
				<%	
					int sumTime = 0;
					int sumCost = 0;
					ArrayList<UseList> list2 = (ArrayList<UseList>)request.getAttribute("list2");
					for (int index = 0 ; index < list2.size(); index++) {
						sumTime += list2.get(index).getUseTime();
						sumCost += list2.get(index).getCost();
					}
				%>
				<tr class="info">
						<td>총 좌석서비스시간<br><%=sumTime%></td>
						<td>총 좌석매출금액<br><%=sumCost%></td>
				</tr>
			</table>
		</td>
		
		<td>
			<table border="1" class="table table-bordered table-striped nanum">
				<!-- 제목행 -->
				<tr class="success">
					<th>판매상품</th>
					<th>판매수량</th>
					<th>판매금액</th>
				</tr>
				
				<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
				
				<c:forEach var="dto" items="${requestScope.list1}" >
					<tr class="info">
						<td>${dto.productName}</td>
						<td>${dto.productCount}</td>
						<td>${dto.price}</td>
					</tr>
				</c:forEach>
				<%	
					int sumPrice = 0;
					ArrayList<OrderSummary> list1 = (ArrayList<OrderSummary>)request.getAttribute("list1");
					for (int index = 0 ; index < list1.size(); index++) {
						sumPrice += list1.get(index).getPrice();
					}
				%>
				<tr class="info">
						<td colspan="2">총 상품판매금액</td>
						<td><%=sumPrice%></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</html>