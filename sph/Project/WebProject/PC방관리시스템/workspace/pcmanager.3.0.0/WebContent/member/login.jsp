<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- external css : css/common.css -->
<link rel="stylesheet" href="/pcm/Resources/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/common.css">
<!-- internal js -->

	<style>
	body {
		background-image: url('/pcm/img/pcbackground5.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}
	
	h1, h3 {
		color: white;
	}
	input[type=text], input[type=password] {
	color: black;
    width: 300px;
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
	<div class="txt_error">
	<h1>
		<p>${requestScope.message}
	</h1>
	</div>
	<hr>
</c:if>

<h1>&nbsp;로그인</h1>
<form action="/pcm/controller?action=login" 
	method="post">
	<h3>&nbsp;&nbsp;아이디:</h3> &nbsp;&nbsp;<input type="text" name="memberId" required>
	<h3>&nbsp;&nbsp;비밀번호:</h3> &nbsp;&nbsp;<input type="password" name ="memberPw" required>
	<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-primary btn-lg" type="submit" value="로그인">
</form>



<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>








